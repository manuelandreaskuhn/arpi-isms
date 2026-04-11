# Konfigurierbares Element- und Wizard-System

## Überblick

Das konfigurierbare System ersetzt statisch kodierte HTML-Templates und PHP-Wizard-Klassen durch datengetriebene JSON-Konfigurationsdateien. Ziel ist es, Felder, Gruppen und komplette Wizard-Typen deklarativ zu definieren, ohne PHP- oder HTML-Code zu ändern.

---

## Ordnerstruktur

```
src/config/
├── elements/
│   └── catalog.json          # Katalog aller atomaren Beispiel-Elemente
├── groups/
│   └── catalog.json          # Katalog aller Gruppen-Definitionen
└── wizards/
    ├── backup.json
    ├── comserver.json
    ├── firewall.json
    ├── hypervisor.json
    ├── medicaldevice.json
    ├── network.json
    ├── proxy.json
    ├── siem.json
    ├── system.json
    ├── tiinfrastruktur.json
    └── vpn.json
```

---

## Konzept: Drei Ebenen

### Ebene 1 — Atomare Elemente (`elements/catalog.json`)

Ein Element ist das kleinste Baustein-Objekt. Es definiert einen einzelnen Datentyp (z.B. IP-Adresse, Hostname, E-Mail) mit:
- `id` — eindeutiger Bezeichner
- `type` — Eingabetyp: `text`, `textarea`, `number`, `url`, `email`, `select`, `radio`, `checkbox`, `checkbox-group`, `range`, `component-ref`, `software-select`
- `html_tag` — Custom HTML-Tag (z.B. `isms-ip`, `isms-hostname`) für späteres Template-Rendering
- `label` — Standard-Beschriftung (überschreibbar pro Verwendung)
- `placeholder` — Platzhaltertext
- `validation` — Validierungsregeln (`pattern`, `min`, `max`, `message`)
- `description` — Beschreibung des Elements
- `attributes` — Zusätzliche HTML-Datenattribute (`data-*`)
- `options` — Optionen für selects, radios, checkbox-groups

**Beispiel:**
```json
{
  "id": "ip-address",
  "type": "text",
  "html_tag": "isms-ip",
  "label": "IP-Adresse",
  "placeholder": "192.168.1.1",
  "validation": {
    "pattern": "^((25[0-5]|...",
    "message": "Bitte eine gültige IPv4-Adresse eingeben"
  }
}
```

### Ebene 2 — Gruppen (`groups/catalog.json`)

Eine Gruppe ist eine logische Zusammenfassung von Feldern, die gemeinsam auftreten (z.B. Firewall-Zonen: External/Internal/DMZ). Gruppen haben:
- `id` — eindeutiger Bezeichner
- `label` — Gruppenbezeichnung
- `description` — Beschreibung der Gruppe
- `html_tag` — Custom HTML-Tag für die gesamte Gruppe (z.B. `isms-firewall-zones`)
- `template_file` — Pfad zu einem zukünftigen Partial-Template
- `fields` — Array von Feld-Referenzen mit `element_ref`, `name`, `label`, `placeholder`-Überschreibungen

**Beispiel:**
```json
{
  "id": "firewall-zones",
  "html_tag": "isms-firewall-zones",
  "fields": [
    { "element_ref": "ip-address", "name": "externalif", "label": "External (WAN)" },
    { "element_ref": "ip-address", "name": "internalif", "label": "Internal (LAN)" },
    { "element_ref": "ip-address", "name": "dmzif", "label": "DMZ Interface" }
  ]
}
```

### Ebene 3 — Wizard-Konfigurationen (`wizards/*.json`)

Eine Wizard-Konfiguration definiert vollständig alle Seiten (Schritte) eines Wizard-Typs. Felder in den Seiten können:
1. **Element-Referenzen** sein: `{"name": "...", "element": "element_id", "label": "..."}` — verweist auf Katalog-Element
2. **Inline-Definitionen** verwenden: `{"name": "...", "type": "select", "label": "...", "options": [...]}` — direkt definierte Felder
3. **Gruppen einbetten**: `{"group": "group_id", "field_overrides": {...}}` — verweist auf Gruppen-Katalog
4. **Bedingt erscheinen**: `"condition": {"field": "...", "operator": "in|contains|eq|neq", "value": "..."}`

---

## Wizard-Konfigurationsschema

```json
{
  "wizard_id": "firewall",
  "label": "Neue Firewall",
  "entity_class": "Firewall",
  "collection": "firewalls",
  "uuid_prefix": "firewall_",
  "icon": "firewall",
  "template_path": "pages/wizards/komponenten/new-firewall.html",
  "php_wizard": "sites/wizards/NewFirewall",
  "pages": [
    {
      "id": "basic",
      "label": "Basis-Informationen",
      "badge": "Pflicht",
      "order": 1,
      "fields": [
        {
          "name": "name",
          "element": "text-name",
          "required": true
        },
        {
          "name": "type",
          "element": "software-select",
          "label": "Firewall Software",
          "attributes": { "data-category": "firewall" }
        },
        {
          "name": "serialnumber",
          "element": "serial-number"
        },
        {
          "group": "ha-config",
          "label_override": "Hochverfügbarkeit",
          "field_overrides": {
            "hapartner": { "label": "Partner Firewall" }
          }
        }
      ]
    }
  ]
}
```

---

## Spezielle Feld-Typen

### `software-select`
Das Software-Auswahl-Feld mit Info-Panel (zeigt Software-Details nach Auswahl). Gepflegt über `src/data/*.json` (z.B. `firewall-software.json`). Wird im Element mit `attributes.data-category` gesteuert.

### `component-ref`
Referenz auf eine andere Komponente aus der MongoDB. Wird über `attributes.component-type` auf einen oder mehrere Typen eingeschränkt, z.B.:
- `"component-type": "siem"` — nur SIEM-Systeme
- `"component-type": "vm,hardware"` — VMs und Hardware-Server

### Bedingte Felder (`condition`)
Felder und Gruppen können abhängig vom Wert anderer Felder ein- oder ausgeblendet werden:
```json
"condition": {
  "field": "storagelevels",
  "operator": "eq",
  "value": "3-tier"
}
```
Unterstützte Operatoren: `eq`, `neq`, `in`, `contains`

---

## Definierte Gruppen (catalog.json)

| Gruppen-ID | html_tag | Verwendung |
|---|---|---|
| `firewall-zones` | `isms-firewall-zones` | Firewall: External/Internal/DMZ |
| `dhcp-config` | `isms-dhcp-config` | Netzwerk: DHCP-Konfiguration |
| `siem-integration` | `isms-siem-integration` | Firewall/Backup/Proxy: SIEM-Anbindung |
| `ha-config` | `isms-ha-config` | Mehrere: HA-Modus und Partner |
| `storage-tier-primary` | `isms-storage-tier-primary` | Backup: Primärspeicher |
| `storage-tier-secondary` | `isms-storage-tier-secondary` | Backup: Sekundärspeicher |
| `storage-tier-tertiary` | `isms-storage-tier-tertiary` | Backup: Tertiärspeicher (3-Tier) |
| `monitoring-alerting` | `isms-monitoring` | Allgemein: Monitoring & Alerting |
| `responsibility` | `isms-responsibility` | Allgemein: Admin + Support |
| `gateway-device` | `isms-gateway-device` | Medicaldevice: DICOM/Protokoll-Gateway |
| `dns-config` | `isms-dns-config` | Netzwerk/VPN: DNS-Server |
| `server-reference` | `isms-server-ref` | Backup/Proxy/etc: VM/HW-Referenz |
| `compliance-standards` | `isms-compliance` | Netzwerk/SIEM/VPN: Standards |
| `vpn-encryption` | `isms-vpn-encryption` | VPN: Verschlüsselung |
| `vpn-auth` | `isms-vpn-auth` | VPN: Authentifizierung |
| `ti-konnektor` | `isms-ti-konnektor` | TI-Infrastruktur: Konnektor-Daten |
| `ti-smcb` | `isms-ti-smcb` | TI-Infrastruktur: SMC-B Karte |

---

## Defined Wizard Configs (alle 11 Typen)

| Wizard | Datei | Seiten | Entity | Collection |
|---|---|---|---|---|
| Backup-System | backup.json | 7 | BackupSystem | backup_systems |
| Kommunikationsserver | comserver.json | 7 | CommunicationServer | comm_servers |
| Firewall | firewall.json | 6 | Firewall | firewalls |
| Hypervisor | hypervisor.json | 7 | Hypervisor | hypervisors |
| Medizingerät | medicaldevice.json | 9 | MedicalDevice | medicaldevices |
| Netzwerk | network.json | 11 | Network | networks |
| Proxy-Server | proxy.json | 10 | ProxyServer | proxies |
| SIEM-System | siem.json | 10 | SIEMSystem | siems |
| System | system.json | 19 | System | systems |
| TI-Infrastruktur | tiinfrastruktur.json | 8 | TIInfrastructure | tiinfrastrukturen |
| VPN | vpn.json | 12 | Vpn | vpns |

**Hinweis System:** Nutzt MongoDB ObjectId (`$id`) statt UUID. Pages 6–19 sind dynamische Komponenten-Abschnitte die per `componenttypes`-Checkbox gesteuert werden.

---

## HTML-Tag-Konvention

Alle Custom HTML-Tags folgen dem Schema `isms-[name]`:
- Atomare Elemente: `isms-ip`, `isms-hostname`, `isms-version`, `isms-notes`, ...
- Gruppen: `isms-firewall-zones`, `isms-ha-config`, `isms-siem-integration`, ...

Diese Tags werden in einem künftigen Template-Rendering-System durch echte HTML-Strukturen ersetzt.

---

## Zukünftige Implementierungsschritte

### Phase 2 — PHP Config-Loader
- `ConfigLoader.php` — Lädt und cached Wizard-Konfiguration aus JSON
- `ElementResolver.php` — Löst Element-Referenzen gegen Kataog auf
- `GroupResolver.php` — Löst Gruppen-Referenzen auf und wendet field_overrides an
- Validierungslogik aus JSON-Schemas generieren

### Phase 3 — Template-Engine-Integration
- Erweiterung des bestehenden Template-Systems für `isms-*` Custom-Tags
- HTML-Partials für jede Gruppe erstellen (`template/partials/elements/groups/`)
- Bestehende `{{include:...}}`-Syntax nutzen um Gruppen einzubetten

### Phase 4 — Wizard-Migration
- Schrittweise bestehende statische HTML-Templates durch config-driven Rendering ersetzen
- PHP-Wizard-Klassen vereinfachen (Konfiguration lesen statt hardcoden)
- Validierung clientseitig und serverseitig aus JSON-Schema generieren
