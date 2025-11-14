# Component Linking System - Dokumentation

## Inhaltsverzeichnis
1. [Konzept & Architektur](#konzept--architektur)
2. [Vorteile](#vorteile)
3. [Implementierung](#implementierung)
4. [Verwendung](#verwendung)
5. [API-Referenz](#api-referenz)
6. [Beispiele](#beispiele)
7. [Best Practices](#best-practices)

---

## Konzept & Architektur

### Grundidee

Das **Component Linking System** ist ein zentrales Framework zur Verwaltung von Beziehungen zwischen IT-Komponenten in ARPI-ISMS. Statt Komponenten-Namen manuell einzutippen, können Benutzer aus bereits angelegten Komponenten auswählen.

### Architektur-Übersicht

```
┌─────────────────────────────────────────────────────────────┐
│                    Component Linking System                  │
├─────────────────────────────────────────────────────────────┤
│                                                               │
│  ┌──────────────────┐      ┌──────────────────┐            │
│  │  componentCache  │◄─────┤  Data Sources   │            │
│  │  - vm[]          │      │  - Page Collector│            │
│  │  - hardware[]    │      │  - API/Database │            │
│  │  - firewall[]    │      │  - Cache        │            │
│  │  - backup[]      │      └──────────────────┘            │
│  │  - siem[]        │                                       │
│  │  - vpn[]         │                                       │
│  │  - proxy[]       │                                       │
│  │  - network[]     │                                       │
│  └──────────────────┘                                       │
│           │                                                  │
│           ▼                                                  │
│  ┌──────────────────────────────────────────┐              │
│  │  Dynamic Select Population               │              │
│  │  - Auto-fill dropdowns                   │              │
│  │  - Group by component type               │              │
│  │  - Format labels (name + IP/type)        │              │
│  │  - Handle "manual" option                │              │
│  └──────────────────────────────────────────┘              │
│           │                                                  │
│           ▼                                                  │
│  ┌──────────────────────────────────────────┐              │
│  │  UI Components                           │              │
│  │  - Custom Select Dropdowns               │              │
│  │  - Manual Input Toggle                   │              │
│  │  - Real-time Updates                     │              │
│  └──────────────────────────────────────────┘              │
│                                                               │
└─────────────────────────────────────────────────────────────┘
```

### Datenfluss

```
1. User Action (z.B. VM hinzufügen)
   │
   ▼
2. Component wird zu Page/Cache hinzugefügt
   │
   ▼
3. refreshAllComponentSelects() wird aufgerufen
   │
   ▼
4. Alle Selects mit data-component-type werden aktualisiert
   │
   ▼
5. Dropdown-Optionen werden neu generiert
   │
   ▼
6. User sieht aktualisierte Auswahl
```

---

## Vorteile

### 1. **Datenintegrität**
- ✅ Keine Duplikate durch Tippfehler
- ✅ Konsistente Namensgebung
- ✅ Referenzielle Integrität zwischen Komponenten

### 2. **Benutzerfreundlichkeit**
- ✅ Schnellere Dateneingabe (Auswahl statt Tippen)
- ✅ Übersichtliche Gruppierung nach Typ
- ✅ Zusätzliche Informationen (IP, Typ) im Label
- ✅ Fallback auf manuelle Eingabe möglich

### 3. **Wartbarkeit**
- ✅ Zentrale Datenverwaltung
- ✅ Automatische Updates bei Änderungen
- ✅ Nachvollziehbare Beziehungen
- ✅ Einfache Erweiterbarkeit

### 4. **Konsistenz**
- ✅ Einheitliche Darstellung über alle Wizards
- ✅ Standardisierte Datenstrukturen
- ✅ Wiederverwendbare Komponenten

---

## Implementierung

### Dateistruktur

```
src/template/js/wizards/
├── componentlinking.js          # Kern-Modul
├── wizards.js                   # Integration mit Custom Selects
├── systemwizard.js              # System Wizard Integration
├── backupwizard.js              # Backup Wizard Integration
├── networkwizard.js             # Network Wizard Integration
├── vpnwizard.js                 # VPN Wizard Integration
├── tiwizard.js                  # TI-Infrastruktur Wizard Integration
├── meddevicewizard.js           # Medizingeräte Wizard Integration
└── system/
    ├── vmhardware.js            # Trigger für VM/Hardware Updates
    ├── database.js
    ├── ti.js                    # TI-Infrastruktur Conditional Fields
    ├── meddevice.js             # Medizingeräte Funktionen
    └── ...
```

### Kern-Komponenten

#### 1. Component Cache
```javascript
const componentCache = {
    vm: [],
    hardware: [],
    firewall: [],
    hypervisor: [],
    backup: [],
    siem: [],
    vpn: [],
    proxy: [],
    network: []
};
```

#### 2. Data Collectors
```javascript
function collectVMsFromPage() {
    const vmEntries = document.querySelectorAll('#vmList .dynamic-entry[data-type="vm"]');
    return Array.from(vmEntries).map((e) => {
        const id = e.dataset.id;
        const hostInput = e.querySelector('input[name="hostname"]');
        const hostname = (hostInput && hostInput.value.trim()) || `VM #${id}`;
        const ipInput = e.querySelector('input[name="ipaddress"]');
        const ip = ipInput ? ipInput.value.trim() : '';
        return { id, hostname, ip };
    });
}
```

#### 3. Dynamic Population
```javascript
function populateComponentSelect(selectElement, componentTypes) {
    const dropdown = selectElement.querySelector('.select-options');
    
    componentTypes.forEach(type => {
        const components = getComponentsByType(type);
        
        if (components.length > 0) {
            // Add group header
            const groupHeader = document.createElement('div');
            groupHeader.className = 'select-group-header';
            groupHeader.textContent = getComponentTypeLabel(type);
            dropdown.appendChild(groupHeader);
            
            // Add component options
            components.forEach(component => {
                const option = document.createElement('div');
                option.className = 'select-option';
                option.dataset.value = `${type}-${component.id}`;
                option.textContent = formatComponentLabel(component, type);
                dropdown.appendChild(option);
            });
        }
    });
}
```

---

## Verwendung

### Template-Syntax

#### Einfache Komponenten-Verlinkung (Ein Typ)

```html
<div class="form-group">
    <label>Backup-Server <span class="required">*</span></label>
    <div class="custom-select" 
         data-name="backupserverid" 
         data-component-type="vm,hardware">
        <div class="select-trigger">
            <span class="placeholder">Bitte wählen</span>
            <span class="arrow">▼</span>
        </div>
        <div class="select-dropdown">
            <div class="select-options">
                <div class="select-option" data-value="">Bitte wählen</div>
                <div class="select-option" data-value="manual">Manuell eingeben</div>
                <!-- Wird automatisch befüllt -->
            </div>
        </div>
    </div>
</div>
```

#### Multi-Type Komponenten-Verlinkung

```html
<div class="custom-select" 
     data-name="vpngatewayid" 
     data-component-type="vm,hardware,firewall">
    <!-- VPN-Gateway kann VM, Hardware oder Firewall sein -->
</div>
```

#### Mit Manual-Input Fallback

```html
<div class="form-group">
    <label>SIEM-Server</label>
    <div class="custom-select" 
         data-name="siemserverid" 
         data-component-type="vm,hardware">
        <!-- Custom Select -->
    </div>
</div>

<!-- Manual Input (wird bei "manual" Auswahl angezeigt) -->
<div class="form-group" id="siem-server-manual" style="display:none;">
    <label>SIEM-Server (manuell)</label>
    <input type="text" id="siemservername" placeholder="Server-Name eingeben">
</div>
```

### JavaScript-Integration

#### In Wizard-Initialisierung

```javascript
// filepath: /path/to/yourwizard.js
import { initializeAllComponentSelects } from './componentlinking.js';

document.addEventListener('DOMContentLoaded', function() {
    // Initialize component linking
    initializeAllComponentSelects();
    
    // Rest of your wizard initialization
});
```

#### Manuelle Aktualisierung nach Änderungen

```javascript
// Wenn eine neue VM hinzugefügt wird
export function addVMEntry() {
    // ...existing code to add VM...
    
    // Trigger refresh of all component selects
    if (window.refreshAllComponentSelects) {
        window.refreshAllComponentSelects();
    }
}
```

---

## API-Referenz

### Funktionen

#### `initializeComponentSelect(selectElement)`
Initialisiert ein einzelnes Custom-Select-Element mit Component Linking.

**Parameter:**
- `selectElement` (HTMLElement): Das `.custom-select` Element

**Beispiel:**
```javascript
const select = document.querySelector('.custom-select[data-component-type]');
initializeComponentSelect(select);
```

---

#### `initializeAllComponentSelects()`
Initialisiert alle Custom-Select-Elemente auf der Seite, die `data-component-type` haben.

**Beispiel:**
```javascript
import { initializeAllComponentSelects } from './componentlinking.js';

document.addEventListener('DOMContentLoaded', function() {
    initializeAllComponentSelects();
});
```

---

#### `refreshAllComponentSelects()`
Aktualisiert alle Component-Linked Selects mit den neuesten Daten.

**Beispiel:**
```javascript
// Nach Hinzufügen einer neuen VM
addVMEntry();
refreshAllComponentSelects(); // Alle Selects werden aktualisiert
```

---

#### `updateComponentCache(type, components)`
Aktualisiert den Cache für einen bestimmten Komponententyp.

**Parameter:**
- `type` (string): Komponententyp ('vm', 'hardware', 'firewall', etc.)
- `components` (Array): Array von Komponenten-Objekten

**Beispiel:**
```javascript
// Von API geladene Komponenten in Cache speichern
const firewalls = await fetchFirewallsFromAPI();
updateComponentCache('firewall', firewalls);
```

---

### Datenstrukturen

#### Komponenten-Objekt (VM/Hardware)
```javascript
{
    id: "1",              // Eindeutige ID
    hostname: "srv-01",   // Hostname
    ip: "192.168.1.10"    // IP-Adresse (optional)
}
```

#### Komponenten-Objekt (Firewall/Named Components)
```javascript
{
    id: "fw-1",                    // Eindeutige ID
    name: "FW-DMZ-01",             // Name
    type: "Palo Alto PA-5220"      // Typ/Modell (optional)
}
```

---

## Beispiele

### Beispiel 1: Backup-Server Auswahl

**Template:**
```html
<div class="form-group">
    <label>Backup-Server</label>
    <div class="custom-select" 
         data-name="backupserverid" 
         data-component-type="vm,hardware">
        <div class="select-trigger">
            <span class="placeholder">Bitte wählen</span>
            <span class="arrow">▼</span>
        </div>
        <div class="select-dropdown">
            <div class="select-options">
                <div class="select-option" data-value="">Bitte wählen</div>
                <div class="select-option" data-value="manual">Manuell eingeben</div>
            </div>
        </div>
    </div>
</div>
```

**Resultat im Browser:**
```
Bitte wählen
Manuell eingeben
─────────────────────
Virtuelle Maschinen
─────────────────────
  ☐ backup-vm-01 (192.168.1.50)
  ☐ backup-vm-02 (192.168.1.51)
─────────────────────
Hardware Server
─────────────────────
  ☐ backup-srv-01 (192.168.1.60)
  ☐ backup-srv-02 (192.168.1.61)
```

---

### Beispiel 2: VPN-Gateway mit Firewall-Option

**Template:**
```html
<div class="form-group">
    <label>VPN-Gateway</label>
    <div class="custom-select" 
         data-name="vpngatewayid" 
         data-component-type="vm,hardware,firewall">
        <!-- Custom Select Structure -->
    </div>
</div>
```

**Resultat:**
```
Bitte wählen
Manuell eingeben
─────────────────────
Virtuelle Maschinen
─────────────────────
  ☐ vpn-vm-01 (10.0.1.100)
─────────────────────
Hardware Server
─────────────────────
  ☐ vpn-appliance-01 (10.0.1.10)
─────────────────────
Firewall-Komponenten
─────────────────────
  ☐ FW-Perimeter-01 (Palo Alto PA-5220)
  ☐ FW-VPN-Gateway (Cisco ASA)
```

---

### Beispiel 3: Netzwerk-Switch Auswahl

**Template:**
```html
<div class="form-group">
    <label>Core Switch</label>
    <div class="custom-select" 
         data-name="coreswitchid" 
         data-component-type="hardware">
        <!-- Custom Select Structure -->
    </div>
</div>

<!-- Manual Input Fallback -->
<div class="form-group" id="coreswitch-manual" style="display:none;">
    <label>Core Switch (manuell)</label>
    <input type="text" id="coreswitch" placeholder="Switch-Name eingeben">
</div>
```

**JavaScript (automatisch):**
```javascript
// Wenn User "Manuell eingeben" wählt
handleManualInputToggle(selectElement);
// → #coreswitch-manual wird angezeigt
```

---

### Beispiel 4: Integration in neuen Wizard

**Schritt 1: Template erstellen**
```html
<!-- filepath: /path/to/newwizard.tpl -->
<form id="newComponentForm">
    <div class="form-group">
        <label>Related Server</label>
        <div class="custom-select" 
             data-name="relatedserverid" 
             data-component-type="vm,hardware">
            <div class="select-trigger">
                <span class="placeholder">Bitte wählen</span>
                <span class="arrow">▼</span>
            </div>
            <div class="select-dropdown">
                <div class="select-options">
                    <div class="select-option" data-value="">Bitte wählen</div>
                    <div class="select-option" data-value="manual">Manuell eingeben</div>
                </div>
            </div>
        </div>
    </div>
</form>
```

**Schritt 2: JavaScript erstellen**
```javascript
// filepath: /path/to/newwizard.js
import { initializeAllComponentSelects } from './componentlinking.js';

document.addEventListener('DOMContentLoaded', function() {
    // Initialize component linking
    initializeAllComponentSelects();
    
    console.log('New Wizard initialized with component linking');
});
```

**Fertig!** Das Component Linking funktioniert automatisch.

---

## Best Practices

### 1. **Immer Manual-Option anbieten**
```html
<div class="select-option" data-value="manual">Manuell eingeben</div>
```
- Erlaubt Fallback wenn Komponente noch nicht angelegt ist
- Vermeidet Blockierung des Workflows

---

### 2. **Naming Convention für IDs**
```html
<!-- Select ID endet mit 'id' -->
<div class="custom-select" data-name="backupserverid">

<!-- Manual Input ID endet mit '-manual' -->
<div id="backupserver-manual">
```
- Ermöglicht automatisches Toggle zwischen Select und Input

---

### 3. **Refresh nach Komponenten-Änderungen**
```javascript
export function addVMEntry() {
    // VM hinzufügen
    vmList.appendChild(vmEntry);
    
    // WICHTIG: Refresh triggern
    if (window.refreshAllComponentSelects) {
        window.refreshAllComponentSelects();
    }
}
```

---

### 4. **Multi-Type mit sinnvoller Reihenfolge**
```html
<!-- Häufigste/wahrscheinlichste Typen zuerst -->
data-component-type="vm,hardware,firewall"
```

---

### 5. **Help-Text für Benutzer**
```html
<div class="help-text">Wird aus angelegten Komponenten befüllt</div>
```
- Informiert User über dynamische Befüllung
- Erklärt Herkunft der Daten

---

## Erweiterung & API-Integration

### Phase 1: Page-Based (Aktuell)
```javascript
function collectVMsFromPage() {
    // Sammelt VMs von der aktuellen Seite
    const vmEntries = document.querySelectorAll('#vmList .dynamic-entry');
    return Array.from(vmEntries).map(...);
}
```

**Vorteil:** Sofort funktionsfähig, keine Backend-Änderungen nötig

---

### Phase 2: API-Integration (Zukünftig)

```javascript
async function fetchComponentsFromAPI(type) {
    try {
        const response = await fetch(`/api/components/${type}`);
        const components = await response.json();
        
        // Update cache
        updateComponentCache(type, components);
        
        return components;
    } catch (error) {
        console.error(`Error fetching ${type} components:`, error);
        // Fallback to page collection
        return getComponentsByType(type);
    }
}
```

**Migration Path:**
```javascript
function getComponentsByType(type) {
    // Prüfe zuerst API
    if (window.useComponentAPI) {
        return fetchComponentsFromAPI(type);
    }
    
    // Fallback: Page Collection
    switch(type) {
        case 'vm':
            return collectVMsFromPage();
        case 'hardware':
            return collectHardwareFromPage();
        // ...
    }
}
```

---

## Troubleshooting

### Problem: Dropdown bleibt leer
**Ursache:** `data-component-type` fehlt oder ist falsch
**Lösung:**
```html
<!-- Falsch -->
<div class="custom-select" data-name="serverid">

<!-- Richtig -->
<div class="custom-select" data-name="serverid" data-component-type="vm,hardware">
```

---

### Problem: Manual Input wird nicht angezeigt
**Ursache:** ID-Naming stimmt nicht mit Convention überein
**Lösung:**
```html
<!-- Select: data-name="backupserverid" -->
<div class="custom-select" data-name="backupserverid">

<!-- Manual Input: id muss "backupserver-manual" sein -->
<div id="backupserver-manual">  <!-- NICHT "backupserverid-manual" -->
```

---

### Problem: Selects werden nicht aktualisiert
**Ursache:** `refreshAllComponentSelects()` wird nicht aufgerufen
**Lösung:**
```javascript
export function addVMEntry() {
    // ...add VM code...
    
    // Diese Zeile hinzufügen:
    if (window.refreshAllComponentSelects) {
        window.refreshAllComponentSelects();
    }
}
```

---

## Zusammenfassung

Das **Component Linking System** bietet:

✅ **Zentrale Verwaltung** von Komponenten-Beziehungen  
✅ **Automatische Befüllung** von Select-Feldern  
✅ **Datenintegrität** durch Vermeidung von Duplikaten  
✅ **Benutzerfreundlichkeit** durch schnelle Auswahl  
✅ **Erweiterbarkeit** für zukünftige API-Integration  
✅ **Konsistenz** über alle Wizards hinweg  

**Einsatzbereiche:**
- System Wizard (VMs, Hardware, Datenbanken)
- Backup Wizard (Backup-Server, Backup-Systeme)
- Network Wizard (Switches, Router, Firewalls)
- VPN Wizard (VPN-Gateways)
- SIEM Wizard (SIEM-Server)
- Proxy Wizard (Proxy-Server)

**Nächste Schritte:**
1. Template mit `data-component-type` annotieren
2. JavaScript-Wizard mit `initializeAllComponentSelects()` initialisieren
3. Bei Komponenten-Änderungen `refreshAllComponentSelects()` aufrufen

---

**Weitere Ressourcen:**
- componentlinking.js - Kern-Implementierung
- wizards.js - Custom Select Integration
- newbackup.tpl - Beispiel-Template

**Support:** Bei Fragen oder Problemen → Issue erstellen oder Entwickler-Team kontaktieren
