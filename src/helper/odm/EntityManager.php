<?php
namespace ARPI\Helper\ODM;

use ARPI\Helper\ODM\Snapshots\SnapshotStorage;

/**
 * EntityManager vereint EntityRepository und Unit of Work für eine einfachere API.
 */
class EntityManager
{
    private EntityRepository $repository;
    private UnitOfWork $unitOfWork;

    public function __construct(string $mongoUri, string $dbName, ?string $sessionId = null)
    {
        $this->repository = new EntityRepository($mongoUri, $dbName);
        $this->unitOfWork = new UnitOfWork($this->repository, $sessionId);
        $this->repository->setUnitOfWork($this->unitOfWork);
    }

    /**
     * Lädt ein Entity anhand seiner ID.
     */
    public function find(string $entityClass, $id): ?object
    {
        return $this->repository->find($entityClass, $id);
    }

    /**
     * Markiert ein Entity als neu (wird bei flush eingefügt).
     */
    public function persist(object $entity): void
    {
        $this->unitOfWork->persist($entity);
    }

    /**
     * Markiert ein Entity zum Löschen.
     */
    public function remove(object $entity): void
    {
        $this->unitOfWork->remove($entity);
    }

    /**
     * Führt alle Änderungen durch (Transaction-safe).
     */
    public function flush(): void
    {
        $this->unitOfWork->flush();
    }

    /**
     * Rollback aller Änderungen zur letzten flush().
     */
    public function rollback(): void
    {
        $this->unitOfWork->rollback();
    }

    /**
     * Leert die Unit of Work.
     */
    public function clear(): void
    {
        $this->unitOfWork->clear();
    }

    /**
     * Prüft, ob ein Entity geändert wurde.
     */
    public function isEntityDirty(object $entity): bool
    {
        return $this->unitOfWork->isEntityDirty($entity);
    }

    /**
     * Sammelt alle geänderten Entities.
     */
    public function getDirtyEntities(): array
    {
        return $this->unitOfWork->getDirtyEntities();
    }

    /**
     * Aktiviert/deaktiviert Dirty Checking.
     */
    public function setDirtyCheckingEnabled(bool $enabled): void
    {
        $this->unitOfWork->setDirtyCheckingEnabled($enabled);
    }

    /**
     * Setzt einen benutzerdefinierten Snapshot-Storage.
     */
    public function setSnapshotStorage(SnapshotStorage $storage): void
    {
        $this->unitOfWork->setSnapshotStorage($storage);
    }

    /**
     * Gibt die Session-ID zurück.
     */
    public function getSessionId(): string
    {
        return $this->unitOfWork->getSessionId();
    }

    /**
     * Gibt die Unit of Work zurück.
     */
    public function getUnitOfWork(): UnitOfWork
    {
        return $this->unitOfWork;
    }

    /**
     * Gibt das EntityRepository zurück.
     */
    public function getRepository(): EntityRepository
    {
        return $this->repository;
    }
}