<?php
namespace ARPI\Helper\ODM\Snapshots;

/**
 * Interface für externe Snapshot-Speicherung (Multi-Session Support).
 */
interface SnapshotStorage
{
    /**
     * Speichert einen Entity-Snapshot.
     */
    public function saveSnapshot(string $sessionId, string $entityId, array $state): void;

    /**
     * Lädt einen Entity-Snapshot.
     */
    public function loadSnapshot(string $sessionId, string $entityId): ?array;

    /**
     * Löscht einen Entity-Snapshot.
     */
    public function deleteSnapshot(string $sessionId, string $entityId): void;

    /**
     * Löscht alle Snapshots einer Session.
     */
    public function clearSession(string $sessionId): void;

    /**
     * Prüft, ob ein Snapshot existiert.
     */
    public function hasSnapshot(string $sessionId, string $entityId): bool;
}