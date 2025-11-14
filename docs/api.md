# ARPI ISMS - API Dokumentation

## Übersicht

Die ARPI ISMS API ist eine RESTful API, die es ermöglicht, IT-Assets und Komponenten programmatisch zu verwalten. Die API basiert auf einem generischen Wizard-System, das automatisch CRUD-Operationen für verschiedene Entitäten bereitstellt.

## Architektur

### Komponenten

```
┌─────────────────┐
│   Client (JS)   │
│  (Browser/App)  │
└────────┬────────┘
         │ HTTP Request
         ▼
┌─────────────────┐
│   .htaccess     │
│ Rewrite Rules   │
└────────┬────────┘
         │ /api/* → index.php?site=API&path=*
         ▼
┌─────────────────┐
│   API.php       │
│ (Entry Point)   │
└────────┬────────┘
         │ handleRequest()
         ▼
┌─────────────────┐
│  WizardAPI.php  │
│ (Router/Disp.)  │
└────────┬────────┘
         │ Route zu Wizard
         ▼
┌─────────────────┐
│  NewBackup.php  │
│  (Controller)   │
└────────┬────────┘
         │ create()/update()/delete()
         ▼
┌─────────────────┐
│ SchemaValidator │
│  EntityHydrator │
└────────┬────────┘
         │ Validierung & Hydratierung
         ▼
┌─────────────────┐
│ BackupSystem    │
│   (Entity)      │
└────────┬────────┘
         │ persist()
         ▼
┌─────────────────┐
│   MongoDB       │
│  (Datenbank)    │
└─────────────────┘
```

## API-Endpunkte

### Base URL

```
https://your-domain.com/api/
```

### Verfügbare Ressourcen

| Ressource | Endpoint | Wizard-Klasse |
|-----------|----------|---------------|
| Backup-Systeme | `/api/backup-systems` | `NewBackup` |
| Hypervisoren | `/api/hypervisors` | `NewHypervisor` |
| Firewalls | `/api/firewalls` | `NewFirewall` |
| Netzwerke | `/api/networks` | `NewNetwork` |
| Proxies | `/api/proxies` | `NewProxy` |
| SIEM-Systeme | `/api/siems` | `NewSIEM` |
| TI-Infrastrukturen | `/api/ti-infrastructures` | `NewTIInfrastruktur` |
| Kommunikationsserver | `/api/communication-servers` | `NewComServer` |
| IT-Systeme | `/api/systems` | `NewSystem` |

## HTTP-Methoden

Die API unterstützt folgende RESTful HTTP-Methoden:

| Methode | Aktion | Beschreibung |
|---------|--------|--------------|
| `POST` | Create | Erstellt eine neue Ressource |
| `GET` | Read | Liest eine oder mehrere Ressourcen |
| `PUT/PATCH` | Update | Aktualisiert eine bestehende Ressource |
| `DELETE` | Delete | Löscht eine Ressource |

## Request-Format

### Headers

Alle API-Requests müssen folgende Header enthalten:

```http
Content-Type: application/json
Accept: application/json
```

Für authentifizierte Requests (wenn implementiert):

```http
Authorization: Bearer {token}
```

### Request Body

Der Request-Body muss gültiges JSON sein:

```json
{
  "field1": "value1",
  "field2": "value2"
}
```

## Response-Format

### Erfolgreiche Responses

#### Create (201 Created)

```json
{
  "success": true,
  "id": "backup_abc123",
  "message": "Backup-System erfolgreich erstellt",
  "data": {
    "uuid": "backup_abc123",
    "name": "Veeam-Prod",
    "software": "veeam",
    "version": "12.1",
    "createdat": "2024-01-15T10:30:00Z"
  }
}
```

#### Update (200 OK)

```json
{
  "success": true,
  "id": "backup_abc123",
  "message": "Backup-System erfolgreich aktualisiert",
  "data": {
    "uuid": "backup_abc123",
    "name": "Veeam-Prod-Updated",
    "updatedat": "2024-01-15T11:45:00Z"
  }
}
```

#### Delete (200 OK)

```json
{
  "success": true,
  "message": "Backup-System erfolgreich gelöscht"
}
```

#### Get (200 OK)

```json
{
  "success": true,
  "data": {
    "uuid": "backup_abc123",
    "name": "Veeam-Prod",
    "software": "veeam",
    "version": "12.1",
    "licensemodel": "per-socket",
    "createdat": "2024-01-15T10:30:00Z",
    "updatedat": "2024-01-15T11:45:00Z"
  }
}
```

#### List (200 OK)

```json
{
  "success": true,
  "count": 2,
  "data": [
    {
      "uuid": "backup_abc123",
      "name": "Veeam-Prod"
    },
    {
      "uuid": "backup_def456",
      "name": "Commvault-Test"
    }
  ]
}
```

### Fehler-Responses

#### Validierungsfehler (400 Bad Request)

```json
{
  "success": false,
  "errors": [
    "Required field 'name' is missing",
    "Field 'licensemodel' must be one of: per-socket, per-vm, per-tb"
  ]
}
```

#### Ressource nicht gefunden (404 Not Found)

```json
{
  "success": false,
  "errors": [
    "Resource 'backup-systems' not found"
  ]
}
```

#### Methode nicht erlaubt (405 Method Not Allowed)

```json
{
  "success": false,
  "errors": [
    "Method not allowed"
  ]
}
```

#### Interner Serverfehler (500 Internal Server Error)

```json
{
  "success": false,
  "errors": [
    "Internal error: Database connection failed"
  ]
}
```

## Beispiele

### Backup-System erstellen

**Request:**

```http
POST /api/backup-systems HTTP/1.1
Host: your-domain.com
Content-Type: application/json

{
  "name": "Veeam-Prod",
  "software": "veeam",
  "version": "12.1",
  "licensemodel": "per-socket",
  "serverid": null,
  "serverhostname": "backup-srv-01.example.com",
  "serverip": "192.168.1.100",
  "serveroperatingystem": "Windows Server 2022",
  "serverlocation": "RZ1 - Rack 5",
  "backupmanagementurl": "https://backup-srv-01.example.com:9443",
  "storagelevels": "2-tier",
  "primarystoragetype": "nas",
  "primarystoragecapacity": 50.0,
  "primarystoragepath": "\\\\nas01\\backups",
  "primarydeduplication": "enabled",
  "secondarystoragetype": "cloud-s3",
  "secondarystoragecapacity": 100.0,
  "secondarystoragepath": "s3://backup-bucket",
  "secondarydeduplication": "enabled",
  "secondaryreplicationfreq": "daily",
  "secondaryimmutability": "enabled",
  "secondaryimmutabilityperiod": "14 Tage",
  "tertiarystoragetype": "",
  "tertiarystoragecapacity": 0,
  "tertiarystoragepath": "",
  "tertiaryarchivefreq": "",
  "tertiaryretention": "",
  "tertiaryimmutability": "",
  "tertiaryimmutabilityperiod": "",
  "backuptypes": ["full", "incremental"],
  "compression": "medium",
  "backupencryption": "aes-256",
  "applicationaware": "yes",
  "instantrecovery": "supported",
  "additionalfeatures": ["replication", "cloud-tier"],
  "monitoringintegration": "PRTG",
  "reporting": "daily",
  "alertemail": "backup-admins@example.com",
  "logretention": "90 Tage",
  "backupadmin": "IT-Team",
  "supportcontract": "24-7",
  "supportend": "31.12.2025",
  "backupsystemnotes": "Produktiv-Backup für alle kritischen Systeme"
}
```

**Response (201 Created):**

```json
{
  "success": true,
  "id": "backup_67890abcdef",
  "message": "Backup-System erfolgreich erstellt",
  "data": {
    "uuid": "backup_67890abcdef",
    "name": "Veeam-Prod",
    "software": "veeam",
    "version": "12.1",
    "createdat": "2024-01-15T10:30:00+01:00",
    "updatedat": "2024-01-15T10:30:00+01:00"
  }
}
```

### Backup-System aktualisieren

**Request:**

```http
PUT /api/backup-systems/backup_67890abcdef HTTP/1.1
Host: your-domain.com
Content-Type: application/json

{
  "version": "12.2",
  "backupsystemnotes": "Upgrade auf Version 12.2 durchgeführt am 15.01.2024"
}
```

**Response (200 OK):**

```json
{
  "success": true,
  "id": "backup_67890abcdef",
  "message": "Backup-System erfolgreich aktualisiert",
  "data": {
    "uuid": "backup_67890abcdef",
    "name": "Veeam-Prod",
    "version": "12.2",
    "updatedat": "2024-01-15T14:20:00+01:00"
  }
}
```

### Backup-System löschen

**Request:**

```http
DELETE /api/backup-systems/backup_67890abcdef HTTP/1.1
Host: your-domain.com
```

**Response (200 OK):**

```json
{
  "success": true,
  "message": "Backup-System erfolgreich gelöscht"
}
```

### Backup-System abrufen

**Request:**

```http
GET /api/backup-systems/backup_67890abcdef HTTP/1.1
Host: your-domain.com
```

**Response (200 OK):**

```json
{
  "success": true,
  "data": {
    "uuid": "backup_67890abcdef",
    "name": "Veeam-Prod",
    "software": "veeam",
    "version": "12.2",
    "licensemodel": "per-socket",
    "serverhostname": "backup-srv-01.example.com",
    "createdat": "2024-01-15T10:30:00+01:00",
    "updatedat": "2024-01-15T14:20:00+01:00"
  }
}
```

### Alle Backup-Systeme auflisten

**Request:**

```http
GET /api/backup-systems HTTP/1.1
Host: your-domain.com
```

**Response (200 OK):**

```json
{
  "success": true,
  "count": 3,
  "data": [
    {
      "uuid": "backup_67890abcdef",
      "name": "Veeam-Prod",
      "software": "veeam"
    },
    {
      "uuid": "backup_11111222222",
      "name": "Commvault-Test",
      "software": "commvault"
    },
    {
      "uuid": "backup_33333444444",
      "name": "Azure-Backup-Cloud",
      "software": "azure-backup"
    }
  ]
}
```

## JavaScript Client-Beispiel

### Backup-System erstellen

```javascript
async function createBackupSystem(data) {
  try {
    const response = await fetch('/api/backup-systems', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(data)
    });
    
    const result = await response.json();
    
    if (result.success) {
      console.log('Erstellt:', result.id);
      return result.data;
    } else {
      console.error('Fehler:', result.errors);
      throw new Error(result.errors.join(', '));
    }
  } catch (error) {
    console.error('API-Fehler:', error);
    throw error;
  }
}

// Verwendung
const backupData = {
  name: 'Veeam-Prod',
  software: 'veeam',
  version: '12.1',
  // ... weitere Felder
};

createBackupSystem(backupData)
  .then(data => console.log('Erfolg:', data))
  .catch(error => console.error('Fehler:', error));
```

### Backup-System aktualisieren

```javascript
async function updateBackupSystem(id, data) {
  try {
    const response = await fetch(`/api/backup-systems/${id}`, {
      method: 'PUT',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(data)
    });
    
    const result = await response.json();
    
    if (!result.success) {
      throw new Error(result.errors.join(', '));
    }
    
    return result.data;
  } catch (error) {
    console.error('Update-Fehler:', error);
    throw error;
  }
}

// Verwendung
updateBackupSystem('backup_67890abcdef', {
  version: '12.2',
  backupsystemnotes: 'Update durchgeführt'
});
```

### Backup-System löschen

```javascript
async function deleteBackupSystem(id) {
  try {
    const response = await fetch(`/api/backup-systems/${id}`, {
      method: 'DELETE'
    });
    
    const result = await response.json();
    
    if (!result.success) {
      throw new Error(result.errors.join(', '));
    }
    
    return true;
  } catch (error) {
    console.error('Delete-Fehler:', error);
    throw error;
  }
}

// Verwendung
deleteBackupSystem('backup_67890abcdef')
  .then(() => console.log('Gelöscht'))
  .catch(error => alert('Fehler beim Löschen'));
```

## Schema-Validierung

Die API verwendet JSON-Schema-basierte Validierung für alle eingehenden Daten.

### BackupSystem Schema (Auszug)

```php
[
    'type' => 'object',
    'required' => ['name', 'software', 'version'],
    'properties' => [
        'name' => [
            'type' => 'string',
            'minLength' => 1,
            'maxLength' => 255
        ],
        'software' => [
            'type' => 'string',
            'minLength' => 1
        ],
        'version' => [
            'type' => 'string',
            'minLength' => 1
        ],
        'licensemodel' => [
            'type' => 'string',
            'enum' => [
                'per-socket', 
                'per-vm', 
                'per-tb', 
                'per-host', 
                'subscription', 
                'perpetual', 
                'free'
            ]
        ],
        'primarystoragecapacity' => [
            'type' => 'number',
            'minimum' => 0
        ],
        'backuptypes' => [
            'type' => 'array',
            'items' => [
                'type' => 'string',
                'enum' => [
                    'full', 
                    'incremental', 
                    'differential', 
                    'forever-incremental'
                ]
            ]
        ]
        // ... weitere Felder
    ]
]
```

### Validierungsregeln

- **Required Fields**: Felder in `required` müssen vorhanden sein
- **Type Checking**: Typ-Validierung (string, number, boolean, array)
- **Enum Validation**: Wert muss in erlaubter Liste sein
- **String Length**: `minLength` und `maxLength` für Strings
- **Numeric Ranges**: `minimum` und `maximum` für Zahlen
- **Email Format**: `format: 'email'` für E-Mail-Adressen
- **Array Items**: Validierung von Array-Elementen

## Entity Hydration

Der `EntityHydrator` konvertiert automatisch Array-Daten in Entity-Properties:

### Typ-Konvertierung

```php
// String → int
$entity->port = 8080;  // von "8080"

// String → float
$entity->capacity = 50.5;  // von "50.5"

// String → bool
$entity->enabled = true;  // von "true", "1", "yes"

// String → DateTime
$entity->date = new \DateTime('2024-01-15');  // von "2024-01-15"

// Array → array
$entity->types = ['full', 'incremental'];  // bleibt Array

// String → ObjectId
$entity->id = new ObjectId($value);  // MongoDB ID
```

### Reverse Extraction

Der Hydrator kann auch Entities zurück in Arrays konvertieren:

```php
$data = EntityHydrator::extract($backupSystem);
// Result:
[
    'uuid' => 'backup_67890abcdef',
    'name' => 'Veeam-Prod',
    'createdat' => '2024-01-15T10:30:00+01:00',
    // ... alle Properties
]
```

## Fehlerbehandlung

### Client-Fehler (4xx)

| Code | Bedeutung | Lösung |
|------|-----------|--------|
| 400 | Bad Request | Request-Daten prüfen, Validierungsfehler beheben |
| 404 | Not Found | Ressource oder ID existiert nicht |
| 405 | Method Not Allowed | HTTP-Methode wird nicht unterstützt |

### Server-Fehler (5xx)

| Code | Bedeutung | Lösung |
|------|-----------|--------|
| 500 | Internal Server Error | Server-Logs prüfen, Administrator kontaktieren |
| 501 | Not Implemented | Methode noch nicht implementiert |

### Best Practices

1. **Immer `success`-Flag prüfen**
   ```javascript
   if (!result.success) {
     // Fehlerbehandlung
   }
   ```

2. **Fehler-Array iterieren**
   ```javascript
   result.errors.forEach(error => {
     console.error('Validierungsfehler:', error);
   });
   ```

3. **Try-Catch verwenden**
   ```javascript
   try {
     const data = await apiCall();
   } catch (error) {
     // Fehlerbehandlung
   }
   ```

## Erweiterung für neue Ressourcen

### 1. Entity erstellen

```php
// /src/entities/documents/NewEntity.php
namespace ARPI\Entities\Documents;

use ARPI\ODM\Mapping\Annotations as ODM;

/**
 * @ODM\Document(collection="new_entities")
 */
class NewEntity {
    /**
     * @ODM\Id
     */
    public ObjectId $id;
    
    /**
     * @ODM\Field(type="string")
     */
    public string $name;
    
    // ... weitere Properties
}
```

### 2. Schema erstellen

```php
// /src/schemas/NewEntitySchema.php
namespace ARPI\Schemas;

class NewEntitySchema {
    public static function getSchema(): array {
        return [
            'type' => 'object',
            'required' => ['name'],
            'properties' => [
                'name' => [
                    'type' => 'string',
                    'minLength' => 1
                ]
                // ... weitere Felder
            ]
        ];
    }
}
```

### 3. Wizard-Klasse erstellen

```php
// /src/sites/wizards/NewEntityWizard.php
namespace ARPI\Sites\Wizards;

use ARPI\Helper\SchemaValidator;
use ARPI\Helper\EntityHydrator;
use ARPI\Schemas\NewEntitySchema;
use ARPI\Entities\Documents\NewEntity;

class NewEntityWizard extends BaseSite {
    public function create(array $data): array {
        $validator = new SchemaValidator();
        $schema = NewEntitySchema::getSchema();
        
        if (!$validator->validate($data, $schema)) {
            return [
                'success' => false,
                'errors' => $validator->getErrors()
            ];
        }
        
        $entity = new NewEntity();
        EntityHydrator::hydrate($entity, $data);
        
        // ... speichern
        
        return [
            'success' => true,
            'id' => $entity->uuid
        ];
    }
    
    // update(), delete(), get(), list()
}
```

### 4. In WizardAPI registrieren

```php
// /src/api/WizardAPI.php
private const RESOURCE_MAP = [
    // ... existing
    'new-entities' => \ARPI\Sites\Wizards\NewEntityWizard::class,
];
```

**Fertig!** Die neue Ressource ist unter `/api/new-entities` verfügbar.

## Performance-Tipps

### 1. Pagination bei Listen

```javascript
// GET /api/backup-systems?page=1&limit=20
const response = await fetch('/api/backup-systems?page=1&limit=20');
```

### 2. Partielle Updates (PATCH)

```javascript
// Nur geänderte Felder senden
await fetch(`/api/backup-systems/${id}`, {
  method: 'PATCH',
  body: JSON.stringify({
    version: '12.2'  // nur Version update
  })
});
```

### 3. Caching

```javascript
// Browser-Cache nutzen
const response = await fetch('/api/backup-systems', {
  headers: {
    'Cache-Control': 'max-age=300'  // 5 Minuten
  }
});
```

## Sicherheit

### Authentifizierung (TODO)

```php
// Zukünftig: JWT oder Session-basiert
if (!$this->isAuthenticated()) {
    return ['success' => false, 'errors' => ['Unauthorized']];
}
```

### Autorisierung (TODO)

```php
// Zukünftig: Rollen-basierte Zugriffskontrolle
if (!$this->hasPermission('backup-systems.create')) {
    return ['success' => false, 'errors' => ['Forbidden']];
}
```

### Input-Sanitization

- Alle Inputs werden durch Schema-Validator geprüft
- SQL-Injection nicht möglich (MongoDB ODM)
- XSS-Schutz durch JSON-Responses
