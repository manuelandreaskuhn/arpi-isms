# Unit of Work Implementation für MongoODM

## Übersicht

Die Unit of Work Implementierung bietet speichersparende Änderungsverfolgung mit Multi-Session-Unterstützung für den MongoODM. Die Lösung verwendet moderne PHP-Features wie WeakMap und SplObjectStorage für automatische Speicherverwaltung.

## Kernkonzepte

### 1. Speichersparende Änderungsverfolgung

- **WeakMap für Entity-Hashes**: Entities werden automatisch aus dem Speicher entfernt, wenn keine anderen Referenzen existieren
- **Hash-basiertes Dirty Checking**: Schnelle Erkennung von Änderungen durch xxh3-Hash-Vergleich
- **Externe Snapshot-Speicherung**: Original-Zustände werden nur bei Bedarf extern gespeichert

### 2. Multi-Session Support

- **Session-IDs**: Jede Unit of Work hat eine eindeutige Session-ID
- **Pluggable Snapshot-Storage**: Interface für verschiedene Speicher-Backends (File, Redis, Memcached)
- **Session-übergreifende Wiederherstellung**: Änderungen überleben Prozess-Neustarts

### 3. Transaction-Safety

- **MongoDB Transactions**: Alle flush-Operationen laufen in MongoDB-Transaktionen
- **Rollback-Unterstützung**: Automatisches Rollback bei Fehlern
- **Batch-Operationen**: Optimiert für große Datenmengen

## Architektur-Diagramm

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   EntityManager │────│   UnitOfWork    │────│   MongoODM      │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                       │                       │
         │                       ├─── WeakMap<Entity, Hash>
         │                       ├─── WeakMap<Entity, State>
         │                       ├─── SplObjectStorage (New)
         │                       ├─── SplObjectStorage (Removed)
         │                       │
         │                       ▼
         │              ┌─────────────────┐
         │              │ SnapshotStorage │
         │              └─────────────────┘
         │                       ├─── FileSnapshotStorage
         │                       ├─── RedisSnapshotStorage
         │                       └─── MemcachedSnapshotStorage
         │
         ▼
┌─────────────────┐
│ MongoDB Client  │
│   + Session     │
│   + Transaction │
└─────────────────┘
```

## Implementierungsdetails

### UnitOfWork Klasse

**Speicherverwaltung:**
- `WeakMap<object, string> $entityHashes` - Aktuelle Entity-Hashes für Dirty Checking
- `WeakMap<object, array> $originalStates` - Original-Zustände nur bei Änderungen
- `SplObjectStorage $newEntities` - Neue Entities (werden eingefügt)
- `SplObjectStorage $removedEntities` - Gelöschte Entities

**Dirty Checking:**
```php
public function isEntityDirty(object $entity): bool
{
    $currentHash = $this->computeEntityHash($entity);
    $originalHash = $this->entityHashes[$entity];
    return $currentHash !== $originalHash;
}
```

**Hash-Berechnung:**
- Verwendet xxh3-Algorithmus für schnelle Hash-Berechnung
- Berücksichtigt nur relevante Felder (keine eingebetteten Objekte für Performance)
- Normalisiert Referenzen auf IDs

### SnapshotStorage Interface

Ermöglicht verschiedene Speicher-Backends:

```php
interface SnapshotStorage
{
    public function saveSnapshot(string $sessionId, string $entityId, array $state): void;
    public function loadSnapshot(string $sessionId, string $entityId): ?array;
    public function clearSession(string $sessionId): void;
}
```

**Implementierungen:**
- `FileSnapshotStorage` - Einfache Datei-basierte Speicherung für Entwicklung
- `RedisSnapshotStorage` - Produktions-taugliche Redis-Speicherung mit TTL
- `MemcachedSnapshotStorage` - Alternative für Memcached-basierte Umgebungen

### EntityManager Wrapper

Vereinfacht die API und kombiniert MongoODM mit UnitOfWork:

```php
$em = new EntityManager('mongodb://localhost:27017', 'mydb', 'session_123');
$user = $em->find(User::class, $id);
$user->setName('New Name');
$em->flush(); // Transaction-safe
```

## Verwendungsszenarien

### 1. Standardverwendung

```php
$em = new EntityManager('mongodb://localhost:27017', 'mydb');
$user = $em->find(User::class, $id);
$user->setEmail('new@email.com');
if ($em->isEntityDirty($user)) {
    $em->flush();
}
```

### 2. Multi-Session Support

```php
// Session 1
$em1 = new EntityManager('mongodb://localhost:27017', 'mydb', 'session_abc');
$user = $em1->find(User::class, $id);
$user->setName('Changed');
// Kein flush - Session wird unterbrochen

// Session 2 (neuer Prozess/Request)
$em2 = new EntityManager('mongodb://localhost:27017', 'mydb', 'session_abc');
$dirtyEntities = $em2->getDirtyEntities(); // Findet ausstehende Änderungen
$em2->rollback(); // Oder $em2->flush()
```

### 3. Batch-Operationen

```php
$em = new EntityManager('mongodb://localhost:27017', 'mydb');
$em->setDirtyCheckingEnabled(false); // Performance-Optimierung

for ($i = 0; $i < 10000; $i++) {
    $entity = new MyEntity();
    $em->persist($entity);
    
    if ($i % 1000 === 0) {
        $em->flush();
        $em->clear(); // Speicher freigeben
    }
}
$em->flush();
```

### 4. Redis-basierte Speicherung

```php
$redis = new Redis();
$redis->connect('localhost', 6379);

$em = new EntityManager('mongodb://localhost:27017', 'mydb');
$em->setSnapshotStorage(new RedisSnapshotStorage($redis, 'myapp:', 7200));
```

## Performance-Optimierungen

### 1. Hash-basiertes Dirty Checking
- Schneller als Deep-Object-Vergleich
- xxh3-Algorithmus optimiert für Geschwindigkeit
- Nur relevante Felder werden gehashed

### 2. WeakMap für automatische Garbage Collection
- Entities werden automatisch freigegeben
- Kein manuelles Speichermanagement erforderlich
- Reduziert Memory Leaks

### 3. Externe Snapshot-Speicherung
- Original-Zustände werden nur bei Änderungen gespeichert
- Snapshots werden extern gespeichert (nicht im PHP-Memory)
- TTL für automatische Bereinigung

### 4. Konfigurierbare Features
- Dirty Checking kann deaktiviert werden
- Batch-Size konfigurierbar
- Verschiedene Snapshot-Backends

## Erweiterte Features

### 1. Rollback-Unterstützung

```php
try {
    $em->flush();
} catch (Exception $e) {
    $em->rollback(); // Automatische Wiederherstellung
}
```

### 2. Dirty Entity Detection

```php
$dirtyEntities = $em->getDirtyEntities();
foreach ($dirtyEntities as $entity) {
    echo "Entity wurde geändert: " . get_class($entity);
}
```

### 3. Session-Management

```php
$sessionId = $em->getSessionId();
$em->clear(); // Leert Session
```

## Sicherheitsaspekte

1. **Isolation**: Sessions sind vollständig isoliert
2. **Transaktionen**: Alle Operationen sind ACID-konform
3. **Cleanup**: Automatische Bereinigung alter Sessions
4. **Validierung**: Entity-Validierung vor Speicherung
