# Kundenspezifische Wizard-Konfiguration — Implementierungsplan

**Stand:** 12.04.2026  
**Ziel:** GUI in den Einstellungen der WebApp, mit der Wizard-Konfigurationen instanzspezifisch angepasst werden können. Anpassungen überschreiben die Default-Configs und bleiben persistent.

---

## Architektur-Überblick

```
src/config/
├── elements/catalog.json         ← Default (read-only)
├── groups/catalog.json           ← Default (read-only)
├── wizards/*.json                ← Default (read-only)
└── custom/
    └── wizards/
        ├── firewall.json         ← Kundenspez. Override (optionale Datei)
        ├── system.json           ← Kundenspez. Override (optionale Datei)
        └── ...
```

**Prioritätsregel:** `custom/wizards/{id}.json` wird gegenüber `wizards/{id}.json` bevorzugt.  
Liegt keine Custom-Datei vor, wird transparent die Default-Config verwendet.

---

## Datenfluss

```
ConfigLoader::getWizardConfig($id)
  ├─ custom/wizards/{id}.json vorhanden? → Custom-Config laden
  └─ sonst                              → Default-Config laden

ConfigAPI GET /api/config/wizard/{id}
  → Gibt aktive Config zurück (custom oder default) + Flag "isCustom"

ConfigAPI PUT /api/config/wizard/{id}
  → Validiert, schreibt nach custom/wizards/{id}.json

ConfigAPI DELETE /api/config/wizard/{id}
  → Löscht custom/wizards/{id}.json (Reset auf Default)
```

---

## Todos

### Phase 1 — Backend

- [x] **T-01** `ConfigLoader::getWizardConfig()` erweitern  
- [x] **T-02** Verzeichnis `src/config/custom/wizards/` anlegen (mit `.gitkeep`)
- [x] **T-03** Neue API-Klasse `src/api/ConfigAPI.php`
- [x] **T-04** API-Router in `src/sites/API.php` um `/api/config/` erweitern
- [ ] **T-05** `SchemaValidator.php` für Wizard-Config-Validierung nutzen/erweitern  

---

### Phase 2 — Settings-Seite (PHP + HTML)

- [x] **T-06** `src/sites/Settings.php` erstellen
- [x] **T-07** `src/template/pages/settings.html` erstellen
- [x] **T-08** Navigation in `src/template/partials/header.html` erweitern

---

### Phase 3 — Config-Editor (JavaScript)

- [x] **T-09** `src/template/js/config-editor.js` erstellen
- [x] **T-10** `src/template/css/pages/settings.css` erstellen

---

### Phase 4 — Qualitätssicherung

- [ ] **T-11** PHPUnit-Tests: `tests/helper/ConfigLoaderCustomTest.php`
- [ ] **T-12** Manuelle Integrationstests

---

## Komponentenübersicht nach Implementierung

| Datei | Typ | Beschreibung |
|-------|-----|--------------|
| `src/config/custom/wizards/*.json` | JSON | Kundenspez. Wizard-Configs |
| `src/helper/ConfigLoader.php` | PHP | Erweitert um Custom-Config-Lookup |
| `src/api/ConfigAPI.php` | PHP | REST-API für Config-Lesen/-Schreiben |
| `src/sites/Settings.php` | PHP | Settings-Seiten-Controller |
| `src/template/pages/settings.html` | HTML | Settings-Seitentemplate |
| `src/template/partials/header.html` | HTML | Navigation-Update |
| `src/template/js/config-editor.js` | JS | Interaktiver Konfig-Editor |
| `src/template/css/pages/settings.css` | CSS | Styling für Settings/Editor |

---

## Technische Entscheidungen

### Kein Deep-Merge — vollständige Datei-Override
Die Custom-Config ersetzt die gesamte Default-Config (kein feld-weises Mergen).  
→ Einfacheres Datenmodell, kein Merge-Konflikt-Problem, GUI zeigt immer den vollständigen Zustand.

### Atomares Schreiben
```php
$tmp = tempnam(dirname($path), '.tmp');
file_put_contents($tmp, $json);
rename($tmp, $path);  // atomisch auf Linux
```

### Drag & Drop — Native HTML5
Kein externes DnD-Framework. `draggable="true"` + `dragstart/dragover/drop`-Events.  
→ Keine neue JavaScript-Abhängigkeit.

### JSON-Validierung
Vor dem Schreiben wird die Config gegen das Wizard-Schema validiert:
- `wizard_id` muss mit der angeforderten ID übereinstimmen
- `pages` muss Array sein, jede Page muss `id` und `label` haben
- `fields` muss Array sein
- Maximale Tiefe: 3 Ebenen (wizard → page → field)

---

## URL-Routing

Da `SiteRouter` Site-Namen aus dem Query-Parameter `site` liest und in PascalCase umwandelt:

- Einstellungen: `/?site=Settings` → lädt `src/sites/Settings.php`
- API: Bestehender API-Mechanismus analysieren und ConfigAPI einklinken

