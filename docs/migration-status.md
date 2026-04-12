# Config-System Migration: Status

Stand: April 2026 — **Migration vollständig abgeschlossen.**

---

## Alle Wizards: Vollständig dynamisch

| Wizard           | Status             | Seiten | Felder |
|------------------|--------------------|--------|--------|
| backup           | ✅ Vollständig dynamisch | 7  | —      |
| comserver        | ✅ Vollständig dynamisch | 7  | —      |
| firewall         | ✅ Vollständig dynamisch | 6  | —      |
| medicaldevice    | ✅ Vollständig dynamisch | 9  | —      |
| network          | ✅ Vollständig dynamisch | 11 | —      |
| proxy            | ✅ Vollständig dynamisch | 10 | —      |
| siem             | ✅ Vollständig dynamisch | 10 | —      |
| tiinfrastruktur  | ✅ Vollständig dynamisch | 8  | —      |
| vpn              | ✅ Vollständig dynamisch | 12 | —      |
| **system**       | ✅ Vollständig dynamisch | 19 | 272    |
| **hypervisor**   | ✅ Vollständig dynamisch | 7  | 41     |

Kein Wizard hat noch ein `template_path`. Alle 11 Wizards werden durch
`WizardRenderer` generiert.

---

## Gelöschte Templates

### Komponenten-Wizard-Templates (10 Dateien)
```
src/template/pages/wizards/komponenten/new-backup.html
src/template/pages/wizards/komponenten/new-comserver.html
src/template/pages/wizards/komponenten/new-firewall.html
src/template/pages/wizards/komponenten/new-medicaldevice.html
src/template/pages/wizards/komponenten/new-network.html
src/template/pages/wizards/komponenten/new-proxy.html
src/template/pages/wizards/komponenten/new-siem.html
src/template/pages/wizards/komponenten/new-tiinfrastruktur.html
src/template/pages/wizards/komponenten/new-vpn.html
src/template/pages/wizards/komponenten/new-hypervisor.html
```

### System-Wizard-Templates (21 Dateien)
```
src/template/pages/wizards/system/new-system.html
src/template/pages/wizards/system/vm-include-template.html
src/template/pages/wizards/system/hardware-include-template.html
src/template/pages/wizards/system/database-include-template.html
src/template/pages/wizards/system/backup-include-template.html
src/template/pages/wizards/system/loadbalancer-include-template.html
src/template/pages/wizards/system/firewall-include-template.html
src/template/pages/wizards/system/client-include-template.html
src/template/pages/wizards/system/meddevice-include-template.html
src/template/pages/wizards/system/tiinfrastruktur-include-template.html
src/template/pages/wizards/system/proxy-include-template.html
src/template/pages/wizards/system/siem-include-template.html
src/template/pages/wizards/system/vpn-include-template.html
src/template/pages/wizards/system/medinterface-include-template.html
src/template/pages/wizards/system/container-include-template.html
src/template/pages/wizards/system/department-combobox.html
src/template/pages/wizards/system/operatingsystem-combobox.html
src/template/pages/wizards/system/serverrole-combobox.html
src/template/pages/wizards/system/dbtype-combobox.html
src/template/pages/wizards/system/dbclustertype-combobox.html
src/template/pages/wizards/system/hypervisor-combobox.html
```

---

## Beibehaltene Templates (aktiv genutzt)

- `src/template/pages/wizards/system/help/` — System-Hilfe (via `help_template`)
- `src/template/pages/wizards/komponenten/help/` — Komponenten-Hilfe (via `help_template`)
- `src/template/js/wizards/system/` — JS-Module für dynamic-list (addVMEntry etc.)
- `src/template/js/wizards/*.js` — Alle anderen Wizard-JS-Dateien

---

## WizardRenderer — Unterstützte Seitentypen

| Typ            | Beschreibung                                                     |
|----------------|------------------------------------------------------------------|
| `fields`       | Normale Formularsektion mit 1-2-spaltigem Layout                 |
| `dynamic-list` | Leere Liste + Add-Button + `<template>`-Block für JS-Cloning     |
| `embedded-one` | Eingebettetes Objekt-Formular direkt in der Sektion              |

---

## Abgeschlossene Nacharbeiten

### Bugfixes (WizardRenderer.php)
- **`renderComponentRef`**: Falscher Attributschlüssel `component-type` → korrigiert auf `data-component-type`
- **`buildConditionAttr`**: PHP `(string)true = "1"` statt JS-erwartetem `"true"` → explizite bool-Konvertierung
- **`section_name`**: 9 Seiten in `system.json` hatten Mismatch zwischen `entity_property` und JS-erwartetem `data-name`-Attribut (z.B. `backupsystems` vs. `"backups"`) → `section_name`-Property ergänzt

### hypervisorwizard.js (Totcode-Bereinigung)
- 272 Zeilen toten Code entfernt: `setupClusterToggle`, `setupStorageType`, `setupHostManagement`, `updateHostNumbers`, `updateHostCount`, `updateRemoveButtons`, `updateClusterDiagram`, `updateClusterResourceSummary`
- `import { initConditionalFields }` ergänzt; wird in `DOMContentLoaded` aufgerufen
- Cluster/Storage-Sichtbarkeit wird jetzt vollständig durch `conditional-fields.js` via `data-condition-*`-Attribute gesteuert

### ODM-Schema-Abgleich (systemwizard.js)
- `handleSystemSubmit`: Die 4 `embedded-one`-Sektionen (TI, Proxy, SIEM, VPN) wurden flach als Top-Level-Keys übermittelt → Daten werden jetzt korrekt als verschachtelte Objekte unter `tiinfrastructure`, `proxyconfiguration`, `siemintegration`, `vpnaccess` gesammelt (entspricht `SystemHelper::hasComponent`)

---

## Alle Schritte abgeschlossen ✅

Ziel erreicht: Alle statischen HTML-Wizard-Templates wurden durch das dynamische JSON-Config-System ersetzt. Render-Pipeline und Datenübertragung sind vollständig korrekt.

---
