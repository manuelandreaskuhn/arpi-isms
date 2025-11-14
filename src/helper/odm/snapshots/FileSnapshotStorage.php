<?php
namespace ARPI\Helper\ODM\Snapshots;

/**
 * File-basierte Implementierung für Snapshot-Speicherung.
 * Für Produktionsumgebungen sollte Redis/Memcached verwendet werden.
 */
class FileSnapshotStorage implements SnapshotStorage
{
    private string $basePath;

    public function __construct(?string $basePath = null)
    {
        $this->basePath = $basePath ?? sys_get_temp_dir() . '/mongo_odm_snapshots';
        if (!is_dir($this->basePath)) {
            mkdir($this->basePath, 0755, true);
        }
    }

    public function saveSnapshot(string $sessionId, string $entityId, array $state): void
    {
        $sessionDir = $this->getSessionDir($sessionId);
        if (!is_dir($sessionDir)) {
            mkdir($sessionDir, 0755, true);
        }

        $filePath = $sessionDir . '/' . $this->sanitizeEntityId($entityId) . '.json';
        file_put_contents($filePath, json_encode($state, JSON_UNESCAPED_UNICODE));
    }

    public function loadSnapshot(string $sessionId, string $entityId): ?array
    {
        $filePath = $this->getSessionDir($sessionId) . '/' . $this->sanitizeEntityId($entityId) . '.json';
        
        if (!file_exists($filePath)) {
            return null;
        }

        $content = file_get_contents($filePath);
        return $content ? json_decode($content, true) : null;
    }

    public function deleteSnapshot(string $sessionId, string $entityId): void
    {
        $filePath = $this->getSessionDir($sessionId) . '/' . $this->sanitizeEntityId($entityId) . '.json';
        if (file_exists($filePath)) {
            unlink($filePath);
        }
    }

    public function clearSession(string $sessionId): void
    {
        $sessionDir = $this->getSessionDir($sessionId);
        if (is_dir($sessionDir)) {
            $files = glob($sessionDir . '/*.json');
            foreach ($files as $file) {
                unlink($file);
            }
            rmdir($sessionDir);
        }
    }

    public function hasSnapshot(string $sessionId, string $entityId): bool
    {
        $filePath = $this->getSessionDir($sessionId) . '/' . $this->sanitizeEntityId($entityId) . '.json';
        return file_exists($filePath);
    }

    private function getSessionDir(string $sessionId): string
    {
        return $this->basePath . '/' . $this->sanitizeSessionId($sessionId);
    }

    private function sanitizeSessionId(string $sessionId): string
    {
        return preg_replace('/[^a-zA-Z0-9_-]/', '_', $sessionId);
    }

    private function sanitizeEntityId(string $entityId): string
    {
        return preg_replace('/[^a-zA-Z0-9_-]/', '_', $entityId);
    }
}