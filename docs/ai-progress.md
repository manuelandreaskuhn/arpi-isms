# KI-Fortschrittsdokumentation — Konfigurierbares ISMS-System

**Zweck:** Diese Datei dient als Gedächtnis für KI-Assistenten über Session-Grenzen hinweg.
**Letzter Stand:** Alle 11 Wizard-Konfigurationsdateien erstellt + Dokumentation abgeschlossen.

---

## Was wurde bisher umgesetzt

### Analyse (abgeschlossen)
- [x] Alle 11 Wizard-PHP-Klassen analysiert (`src/sites/wizards/New*.php`)
- [x] Alle 11 Entity-Klassen analysiert (`src/entities/documents/`)
- [x] Alle HTML-Template-Seiten analysiert (`src/template/pages/wizards/`)
- [x] Element/Gruppen/Wizard-JSON-Architektur entworfen

### Konfigurationsdateien (alle erstellt)
- [x] `src/config/elements/catalog.json` — 42 atomare Elemente
- [x] `src/config/groups/catalog.json` — 17 Gruppen-Definitionen
- [x] `src/config/wizards/backup.json` — 7 Seiten
- [x] `src/config/wizards/comserver.json` — 7 Seiten
- [x] `src/config/wizards/firewall.json` — 6 Seiten
- [x] `src/config/wizards/hypervisor.json` — 7 Seiten
- [x] `src/config/wizards/medicaldevice.json` — 9 Seiten
- [x] `src/config/wizards/network.json` — 11 Seiten
- [x] `src/config/wizards/proxy.json` — 10 Seiten
- [x] `src/config/wizards/siem.json` — 10 Seiten
- [x] `src/config/wizards/system.json` — 19 Seiten (inkl. alle dynamischen Komponenten)
- [x] `src/config/wizards/tiinfrastruktur.json` — 8 Seiten
- [x] `src/config/wizards/vpn.json` — 12 Seiten

### Dokumentation (erstellt)
- [x] `docs/config-system.md` — Architektur-Dokumentation, Schema, Gruppen-Tabelle, Implementierungsplan
- [x] `docs/ai-progress.md` — Diese Datei

---

## Architektur-Zusammenfassung

```
elements/catalog.json  ──→  Atomare Felder (ip-address, hostname, ...)
       ↓
groups/catalog.json    ──→  Gruppen (firewall-zones, ha-config, ...)
       ↓
wizards/*.json         ──→  Wizard-Seiten referenzieren Elemente & Gruppen
```

**Wichtig `system.json`:** Einziger Wizard ohne UUID (nutzt MongoDB ObjectId). Pages 6–19 sind typisierte Komponentenabschnitte (`type: dynamic-list` oder `type: embedded-one`) mit `condition`-Steuerung über `componenttypes`-Checkboxen. Diese Seiten verweisen auf `include_template`-Pfade (die separaten System-Inklude-Templates).

---

## Nächste Schritte (Phase 2 — PHP-Implementierung)

### Priorität: Hoch
1. **`src/helper/ConfigLoader.php` erstellen**
   - Lädt und parsed Wizard-JSONs aus `src/config/wizards/`
   - Löst Element-Referenzen → `elements/catalog.json` auf
   - Löst Gruppen-Referenzen → `groups/catalog.json` auf
   - `field_overrides` und `condition` anwenden

2. **`src/helper/WizardConfigRenderer.php` erstellen**
   - Rendert Wizard-Seiten aus der aufgelösten Konfiguration
   - Generiert Validierungsregeln aus `validation`-Definitionen
   - Bedingte Felder via `condition`-Prüfung aus-/einblenden

3. **Schema-Validierung**
   - Erweitern von `src/helper/SchemaValidator.php`
   - Validierungsregeln dynamisch aus Wizard-JSON generieren statt hardcoden

### Priorität: Mittel
4. **Template-Partials für Gruppen**
   - Für jede Gruppe in `groups/catalog.json` ein HTML-Partial erstellen
   - Pfade entsprechend `template_file` in `groups/catalog.json`
   - Bestehende `{{include:...}}`-Syntax nutzen

5. **Custom HTML-Tags registrieren**
   - Template-Engine um `isms-*`-Tag-Verarbeitung erweitern
   - Tags aus `html_tag`-Feldern in Catalog-Definitionen ableiten

### Priorität: Niedrig (Phase 3)
6. **Bestehende Wizards migrieren**
   - Schritt für Schritt statische HTML durch config-rendered HTML ersetzen
   - Beginnen mit einfachsten Wizards (Backup, Firewall)
   - System-Wizard zuletzt (komplexeste Struktur)

---

## Wichtige Designentscheidungen (nicht ändern ohne Grund!)

| Entscheidung | Begründung |
|---|---|
| `element` vs. `group` als Feld-Keys | `element` = Referenz auf atomic element; `group` = Referenz auf Gruppe |
| `field_overrides` in Gruppen-Referenzen | Labels/Felder in Gruppen können pro Verwendung überschrieben werden |
| `condition.operator`: `eq/neq/in/contains` | `in` = Wert in Array; `contains` = Array enthält Wert |
| `html_tag` schema `isms-*` | Registriert als Custom Elements, kein Konflikt mit Standard-HTML |
| `storage-tier` als separate Gruppen (primary/secondary/tertiary) | Jede Tier hat eigene Felder; Backend behandelt sie getrennt |
| System.json mit `type: dynamic-list` und `type: embedded-one` | Unterscheidung zwischen N-Lists und 1-zu-1-Einbettungen |
| Groups-Felder haben `element_ref` (nicht `element`) | Semantischer Unterschied: Gruppen-intern vs. Wizard-seitig |

---

## Bekannte Einschränkungen und offene Fragen

- **System-Inklude-Templates** für dynamische Komponentenabschnitte existieren als Referenz in system.json, müssen aber noch als HTML-Partials implementiert werden
- **`department` Combobox** in system.json referenziert `data-source: department-combobox` — Quelle dieses Dropdowns muss noch verifiziert werden
- **Software-Select Info-Panel** ist im Catalog als `type: software-select` definiert aber Rendering-Logik (welche Daten werden angezeigt?) muss noch implementiert werden
- **Dynamic Lists** (system.json pages 6–18): Felder innerhalb der Sub-Entities (z.B. SystemVirtualMachine) sind noch nicht explizit in system.json definiert — werden aktuell aus Include-Templates geladen

---

## Datei-Referenzen für schnellen Zugriff

| Was | Wo |
|---|---|
| Alle Wizard-PHP-Klassen | `src/sites/wizards/New*.php` |
| Alle Entity-Klassen | `src/entities/documents/*.php` |
| Statische HTML-Templates | `src/template/pages/wizards/` |
| Config-Dateien | `src/config/` |
| Architektur-Doku | `docs/config-system.md` |
| Software-Datenlisten | `src/data/*-software.json` |
