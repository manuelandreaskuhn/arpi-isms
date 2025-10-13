<?php
namespace ARPI\Helper\ODM\Snapshots;

/**
 * Redis-basierte Implementierung für Snapshot-Speicherung (Produktionsumgebung).
 */
class RedisSnapshotStorage implements SnapshotStorage
{
    private \Redis $redis;
    private string $keyPrefix;
    private int $ttl;

    public function __construct(\Redis $redis, string $keyPrefix = 'mongo_odm:', int $ttl = 3600)
    {
        $this->redis = $redis;
        $this->keyPrefix = $keyPrefix;
        $this->ttl = $ttl;
    }

    public function saveSnapshot(string $sessionId, string $entityId, array $state): void
    {
        $key = $this->buildKey($sessionId, $entityId);
        $this->redis->setex($key, $this->ttl, json_encode($state, JSON_UNESCAPED_UNICODE));
    }

    public function loadSnapshot(string $sessionId, string $entityId): ?array
    {
        $key = $this->buildKey($sessionId, $entityId);
        $content = $this->redis->get($key);
        
        if ($content === false) {
            return null;
        }

        return json_decode($content, true);
    }

    public function deleteSnapshot(string $sessionId, string $entityId): void
    {
        $key = $this->buildKey($sessionId, $entityId);
        $this->redis->del($key);
    }

    public function clearSession(string $sessionId): void
    {
        $pattern = $this->keyPrefix . $sessionId . ':*';
        $keys = $this->redis->keys($pattern);
        
        if (!empty($keys)) {
            $this->redis->del($keys);
        }
    }

    public function hasSnapshot(string $sessionId, string $entityId): bool
    {
        $key = $this->buildKey($sessionId, $entityId);
        return $this->redis->exists($key) > 0;
    }

    private function buildKey(string $sessionId, string $entityId): string
    {
        return $this->keyPrefix . $sessionId . ':' . $entityId;
    }
}