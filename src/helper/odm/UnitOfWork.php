<?php
namespace ARPI\Helper\ODM;

use ARPI\Helper\ODM\Exception\UnitOfWorkException;
use ARPI\Helper\ODM\Snapshots\FileSnapshotStorage;
use ARPI\Helper\ODM\Snapshots\SnapshotStorage;
use MongoDB\BSON\ObjectId;
use SplObjectStorage;
use WeakMap;

/**
 * Unit of Work verwaltet Entity-Änderungen speichersparend und session-übergreifend.
 * Verwendet WeakMap für automatische Garbage Collection und externe Snapshots.
 */
class UnitOfWork
{
    private EntityRepository $repo;
    private string $sessionId;
    
    /** @var WeakMap<object, string> Aktuelle Entities -> Entity Hash */
    private WeakMap $entityHashes;
    
    /** @var WeakMap<object, array> Entities -> Original State (nur bei Änderungen) */
    private WeakMap $originalStates;
    
    /** @var SplObjectStorage Entities, die als neu markiert sind */
    private SplObjectStorage $newEntities;
    
    /** @var SplObjectStorage Entities, die zum Löschen markiert sind */
    private SplObjectStorage $removedEntities;
    
    /** @var SnapshotStorage Interface für externe Snapshot-Speicherung */
    private SnapshotStorage $snapshotStorage;
    
    /** @var bool Ob dirty checking aktiviert ist */
    private bool $dirtyCheckingEnabled = true;

    public function __construct(EntityRepository $repo, ?string $sessionId = null)
    {
        $this->repo = $repo;
        $this->sessionId = $sessionId ?? uniqid('session_', true);
        $this->entityHashes = new WeakMap();
        $this->originalStates = new WeakMap();
        $this->newEntities = new SplObjectStorage();
        $this->removedEntities = new SplObjectStorage();
        $this->snapshotStorage = new FileSnapshotStorage(); // Default implementation
    }

    /**
     * Registriert ein Entity zur Verfolgung.
     */
    public function attach(object $entity): void
    {
        if (!isset($this->entityHashes[$entity])) {
            $this->entityHashes[$entity] = $this->computeEntityHash($entity);
        }
    }

    /**
     * Markiert ein Entity als neu (wird bei flush eingefügt).
     */
    public function persist(object $entity): void
    {
        $this->newEntities->attach($entity);
        $this->attach($entity);
    }

    /**
     * Markiert ein Entity zum Löschen.
     */
    public function remove(object $entity): void
    {
        $this->removedEntities->attach($entity);
        
        // Entfernen aus anderen Collections
        if ($this->newEntities->contains($entity)) {
            $this->newEntities->detach($entity);
        }
        
        unset($this->entityHashes[$entity]);
        unset($this->originalStates[$entity]);
    }

    /**
     * Überprüft, ob ein Entity geändert wurde (Dirty Checking).
     */
    public function isEntityDirty(object $entity): bool
    {
        if (!$this->dirtyCheckingEnabled || $this->newEntities->contains($entity)) {
            return false;
        }

        if (!isset($this->entityHashes[$entity])) {
            return false;
        }

        $currentHash = $this->computeEntityHash($entity);
        $originalHash = $this->entityHashes[$entity];
        
        return $currentHash !== $originalHash;
    }

    /**
     * Sammelt alle geänderten Entities.
     */
    public function getDirtyEntities(): array
    {
        $dirty = [];
        
        foreach ($this->entityHashes as $entity => $originalHash) {
            if ($this->isEntityDirty($entity)) {
                $dirty[] = $entity;
            }
        }
        
        return $dirty;
    }

    /**
     * Schreibt alle ausstehenden Änderungen in die Datenbank.
     * Verwendet Transaktionen wenn verfügbar (Replica Set).
     */
    public function flush(): void
    {
        $dirtyEntities = $this->getDirtyEntities();
        
        if (count($this->newEntities) === 0 && count($dirtyEntities) === 0 && count($this->removedEntities) === 0) {
            return;
        }

        // Prüfe ob Transaktionen unterstützt werden
        if ($this->repo->supportsTransactions()) {
            $this->flushWithTransaction($dirtyEntities);
        } else {
            $this->flushWithoutTransaction($dirtyEntities);
        }

        // Nach erfolgreichem Flush: UnitOfWork aufräumen
        $this->newEntities = new SplObjectStorage();
        $this->removedEntities = new SplObjectStorage();
        $this->originalStates = new WeakMap();
    }

    /**
     * Flush mit Transaktion
     */
    private function flushWithTransaction(array $dirtyEntities): void
    {
        $session = $this->repo->getClient()->startSession();
        
        try {
            $session->startTransaction();
            $this->executeFlush($session, $dirtyEntities);
            $session->commitTransaction();
        } catch (\Exception $e) {
            $session->abortTransaction();
            throw new UnitOfWorkException("Transaction failed: " . $e->getMessage(), 0, $e);
        }
        finally {
            $session->endSession();
        }
    }

    /**
     * Flush ohne Transaktion (Fallback für Standalone MongoDB)
     */
    private function flushWithoutTransaction(array $dirtyEntities): void
    {
        try {
            $this->executeFlush(null, $dirtyEntities);
        } catch (\Exception $e) {
            throw new UnitOfWorkException("Flush failed: " . $e->getMessage(), 0, $e);
        }
    }

    /**
     * Führt die eigentlichen Datenbank-Operationen aus
     */
    private function executeFlush(?\MongoDB\Driver\Session $session, array $dirtyEntities): void
    {
        // Inserts
        foreach ($this->newEntities as $entity) {
            $this->repo->insert($entity, $session);
            $this->entityHashes[$entity] = $this->computeEntityHash($entity);
        }

        // Updates
        foreach ($dirtyEntities as $entity) {
            $this->saveOriginalState($entity);
            $this->repo->update($entity, $session);
            $this->entityHashes[$entity] = $this->computeEntityHash($entity);
        }

        // Deletes
        foreach ($this->removedEntities as $entity) {
            $this->repo->delete($entity, $session);
            unset($this->entityHashes[$entity]);
        }
    }

    /**
     * Rollback aller Änderungen zur letzten flush().
     */
    public function rollback(): void
    {
        // Restore original states from external storage if available
        foreach ($this->originalStates as $entity => $originalState) {
            $this->restoreEntityState($entity, $originalState);
        }
        
        // Clear change tracking
        $this->newEntities = new SplObjectStorage();
        $this->removedEntities = new SplObjectStorage();
        $this->originalStates = new WeakMap();
        
        // Reload hashes
        foreach ($this->entityHashes as $entity => $hash) {
            $this->entityHashes[$entity] = $this->computeEntityHash($entity);
        }
    }

    /**
     * Leert die Unit of Work.
     */
    public function clear(): void
    {
        $this->newEntities = new SplObjectStorage();
        $this->removedEntities = new SplObjectStorage();
        $this->entityHashes = new WeakMap();
        $this->originalStates = new WeakMap();
        $this->snapshotStorage->clearSession($this->sessionId);
    }

    /**
     * Berechnet einen Hash für ein Entity (schnelles Dirty Checking).
     */
    private function computeEntityHash(object $entity): string
    {
        $meta = EntityMetadata::fromEntity($entity);
        $serialized = $this->repo->getSerializer()->serializeEntityForHash($entity, $meta);
        return hash('xxh3', serialize($serialized));
    }

    /**
     * Speichert den ursprünglichen Zustand eines Entity extern.
     */
    private function saveOriginalState(object $entity): void
    {
        if (!isset($this->originalStates[$entity])) {
            $state = $this->captureEntityState($entity);
            $this->originalStates[$entity] = $state;
            
            // Optional: Externe Speicherung für Multi-Session Support
            $entityId = $this->getEntityId($entity);
            if ($entityId) {
                $this->snapshotStorage->saveSnapshot($this->sessionId, $entityId, $state);
            }
        }
    }

    /**
     * Erfasst den aktuellen Zustand eines Entity.
     */
    private function captureEntityState(object $entity): array
    {
        $meta = EntityMetadata::fromEntity($entity);
        return $this->repo->getSerializer()->serializeEntity($entity, $meta);
    }

    /**
     * Stellt den Zustand eines Entity wieder her.
     */
    private function restoreEntityState(object $entity, array $state): void
    {
        $meta = EntityMetadata::fromEntity($entity);
        $this->repo->getSerializer()->deserializeEntity($entity, $state, $meta);
    }

    /**
     * Ermittelt die ID eines Entity.
     */
    private function getEntityId(object $entity): ?string
    {
        $meta = EntityMetadata::fromEntity($entity);
        if ($meta->idField) {
            $id = $meta->idField->getValue($entity);
            return $id instanceof ObjectId ? (string)$id : $id;
        }
        return null;
    }

    /**
     * Aktiviert/deaktiviert Dirty Checking.
     */
    public function setDirtyCheckingEnabled(bool $enabled): void
    {
        $this->dirtyCheckingEnabled = $enabled;
    }

    /**
     * Setzt einen benutzerdefinierten Snapshot-Storage.
     */
    public function setSnapshotStorage(SnapshotStorage $storage): void
    {
        $this->snapshotStorage = $storage;
    }

    public function getSessionId(): string
    {
        return $this->sessionId;
    }
}