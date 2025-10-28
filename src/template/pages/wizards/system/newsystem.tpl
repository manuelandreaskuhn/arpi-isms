<aside>
    <p>Assetmanagement</p>
    <i>›</i>
    <p>Systeme</p>
    <i>›</i>
    <p>Neues System anlegen</p>
</aside>


<form id="newSystemForm">

    <!-- Basis Informationen -->
    <div class="form-section">
        <div class="section-title">
            <span>Basis-Informationen</span>
            <span class="section-badge">Pflicht</span>
            <span class="section-counter">0/1</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="form-group">
                <label>Systemname <span class="required">*</span></label>
                <input type="text" id="systemName" required placeholder="z.B. KIS-Produktiv, Radiologie-PACS">
                <div class="help-text">Eindeutiger Name zur Identifikation des Systems</div>
            </div>
        </div>
    </div>

    <!-- Software-Informationen -->
    <div class="form-section collapsed">
        <div class="section-title">
            <span>Software-Informationen</span>
            <span class="section-counter">0/4</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="form-row">
                <div class="form-group">
                    <label>Software / Produkt</label>
                    <input type="text" id="software" placeholder="z.B. SAP ERP, Orbis KIS">
                </div>
                <div class="form-group">
                    <label>Hersteller</label>
                    <input type="text" id="vendor" placeholder="z.B. Dedalus, Siemens">
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label>Version</label>
                    <input type="text" id="version" placeholder="z.B. 2024.1">
                </div>
                <div class="form-group">
                    <label>Lizenztyp</label>
                    <div class="custom-select" data-name="licenseType">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="commercial">Kommerziell</div>
                                <div class="select-option" data-value="subscription">Subscription</div>
                                <div class="select-option" data-value="opensource">Open Source</div>
                                <div class="select-option" data-value="inhouse">Eigenentwicklung</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!-- Kategorisierung -->
    <div class="form-section collapsed">
        <div class="section-title">
            <span>Kategorisierung</span>
            <span class="section-counter">0/5</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="form-row">
                <div class="form-group">
                    <label>Fachbereich</label>
                    {{include:pages/wizards/system/departmentcombobox.tpl}}
                </div>
                <div class="form-group">
                    <label>Kritikalität</label>
                    <div class="custom-select" data-name="criticality">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="critical">Kritisch (24/7)</div>
                                <div class="select-option" data-value="high">Hoch</div>
                                <div class="select-option" data-value="medium">Mittel</div>
                                <div class="select-option" data-value="low">Niedrig</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label>Umgebung</label>
                    <div class="custom-select" data-name="environment">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="production">Produktion</div>
                                <div class="select-option" data-value="staging">Test/Staging</div>
                                <div class="select-option" data-value="development">Entwicklung</div>
                                <div class="select-option" data-value="training">Schulung</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>Hosting / Standort</label>
                    <div class="custom-select" data-name="hosting">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="onpremise">On-Premise (eigenes RZ)</div>
                                <div class="select-option" data-value="datacenter">Dienstleister-Rechenzentrum</div>
                                <div class="select-option" data-value="cloud">Cloud (Public Cloud)</div>
                                <div class="select-option" data-value="hybrid">Hybrid (On-Premise + Cloud)</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group" id="cloudProviderGroup">
                <label>Cloud-Anbieter</label>
                <input type="text" id="cloudProvider" placeholder="z.B. Microsoft Azure, AWS, Google Cloud">
            </div>
        </div>
    </div>


    <!-- IT-Sicherheit -->
    <div class="form-section collapsed">
        <div class="section-title">
            <span>IT-Sicherheit & Compliance</span>
            <span class="section-counter">0/5</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="form-row">
                <div class="form-group">
                    <label>Datenschutz-Klassifizierung</label>
                    <div class="custom-select" data-name="dataClassification">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="patient">Patientendaten (DSGVO)</div>
                                <div class="select-option" data-value="personal">Personenbezogene Daten</div>
                                <div class="select-option" data-value="internal">Interne Daten</div>
                                <div class="select-option" data-value="public">Öffentlich</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>Verschlüsselung</label>
                    <div class="custom-select" data-name="encryption">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="both">In Transit & At Rest</div>
                                <div class="select-option" data-value="transit">Nur in Transit (TLS/SSL)</div>
                                <div class="select-option" data-value="rest">Nur At Rest</div>
                                <div class="select-option" data-value="none">Keine</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label>Authentifizierung</label>
                    <div class="custom-select" data-name="authentication">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="mfa">Multi-Faktor (MFA)</div>
                                <div class="select-option" data-value="sso">Single Sign-On (SSO)</div>
                                <div class="select-option" data-value="ad">Active Directory</div>
                                <div class="select-option" data-value="local">Lokale Benutzer</div>
                                <div class="select-option" data-value="cert">Zertifikatsbasiert</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <label>Compliance & Zertifizierungen</label>
            <div class="checkbox-group">
                <div class="checkbox-item">
                    <input type="checkbox" id="dsgvo" name="compliance" value="dsgvo">
                    <label for="dsgvo">DSGVO-konform</label>
                </div>
                <div class="checkbox-item">
                    <input type="checkbox" id="bsi" name="compliance" value="bsi">
                    <label for="bsi">BSI-Grundschutz</label>
                </div>
                <div class="checkbox-item">
                    <input type="checkbox" id="b3s" name="compliance" value="b3s">
                    <label for="b3s">B3S: Medizinische Versorgung</label>
                </div>
                <div class="checkbox-item">
                    <input type="checkbox" id="iso27001" name="compliance" value="iso27001">
                    <label for="iso27001">ISO 27001</label>
                </div>
                <div class="checkbox-item">
                    <input type="checkbox" id="kritis" name="compliance" value="kritis">
                    <label for="kritis">KRITIS-relevant</label>
                </div>
                <div class="checkbox-item">
                    <input type="checkbox" id="medizinprodukt" name="compliance" value="medizinprodukt">
                    <label for="medizinprodukt">Medizinprodukt</label>
                </div>
            </div>
            <div class="form-group">
                <label>Letzte Sicherheitsüberprüfung</label>
                <input type="text" id="lastAudit" placeholder="z.B. Q2 2024, oder Datum">
            </div>
        </div>
    </div>


    <!-- IT-Objekte -->
    <div class="form-section collapsed">
        <div class="section-title">
            <span>IT-Komponenten</span>
            <span class="section-counter">0/1</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <label>Zugehörige IT-Objekte</label>
            <div class="help-text">Wählen Sie die IT-Komponenten aus, aus denen das System besteht oder mit denen es verbunden ist.</div>
            <div class="checkbox-group">
                <div class="checkbox-item">
                    <input type="checkbox" id="vm" name="components" value="vm">
                    <label for="vm">Virtuelle Maschinen</label>
                </div>
                <div class="checkbox-item">
                    <input type="checkbox" id="hardware" name="components" value="hardware">
                    <label for="hardware">Hardware Server</label>
                </div>
                <div class="checkbox-item">
                    <input type="checkbox" id="network" name="components" value="network">
                    <label for="network">Netzwerk-Komponenten</label>
                </div>
                <div class="checkbox-item">
                    <input type="checkbox" id="storage" name="components" value="storage">
                    <label for="storage">Storage / SAN</label>
                </div>
                <div class="checkbox-item">
                    <input type="checkbox" id="database" name="components" value="database">
                    <label for="database">Datenbank</label>
                </div>
                <div class="checkbox-item">
                    <input type="checkbox" id="backup" name="components" value="backup">
                    <label for="backup">Backup-System</label>
                </div>
                <div class="checkbox-item">
                    <input type="checkbox" id="loadbalancer" name="components" value="loadbalancer">
                    <label for="loadbalancer">Load Balancer</label>
                </div>
                <div class="checkbox-item">
                    <input type="checkbox" id="firewall" name="components" value="firewall">
                    <label for="firewall">Firewall</label>
                </div>
                <div class="checkbox-item">
                    <input type="checkbox" id="client" name="components" value="client">
                    <label for="client">Client-Arbeitsplätze</label>
                </div>
                <div class="checkbox-item">
                    <input type="checkbox" id="meddevice" name="components" value="meddevice">
                    <label for="meddevice">Medizingeräte</label>
                </div>
                <div class="checkbox-item">
                    <input type="checkbox" id="gematicti" name="components" value="gematicti">
                    <label for="gematicti">TI-Infrastruktur</label>
                </div>
            </div>

        </div>
    </div>


    <!-- Virtuelle Maschinen -->
    <div class="form-section collapsed" data-name="virtualmachines">
        <div class="section-title">
            <span>Virtuelle Maschinen</span>
            <span class="section-counter">0/0</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="help-text">Fügen Sie virtuelle Maschinen hinzu, die zu diesem System gehören.</div>
            
            <div id="vmList" class="dynamic-list">
                <!-- VM entries will be added here -->
            </div>
            
            <div class="buttonlist">
                <button type="button" class="btn-add-item" onclick="addVMEntry()">
                    <span>+</span> Virtuelle Maschine hinzufügen
                </button>

                <button type="button" class="btn-search-cmdb" onclick="openCMDBSearch('vm')">
                    <span></span> Suche existierende Virtuelle Maschinen
                </button>
            </div>
        </div>
    </div>

    <!-- Hardware Server -->
    <div class="form-section collapsed" data-name="hardwareservers">
        <div class="section-title">
            <span>Hardware Server</span>
            <span class="section-counter">0/0</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="help-text">Fügen Sie physische Server hinzu, die zu diesem System gehören.</div>
            
            <div id="hardwareList" class="dynamic-list">
                <!-- Hardware entries will be added here -->
            </div>
            
            <button type="button" class="btn-add-item" onclick="addHardwareEntry()">
                <span>+</span> Hardware Server hinzufügen
            </button>
        </div>
    </div>

    <!-- Datenbanken -->
    <div class="form-section collapsed" data-name="databases">
        <div class="section-title">
            <span>Datenbanken</span>
            <span class="section-counter">0/0</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="help-text">
                Dokumentieren Sie Datenbanken mit ihren Eigenschaften, Cluster-Konfiguration und Host-Zuordnung.
            </div>
            
            <div id="databaseList" class="dynamic-list">
                <!-- Database entries will be added here -->
            </div>
            
            <button type="button" class="btn-add-item" onclick="addDatabaseEntry()">
                <span>+</span> Datenbank hinzufügen
            </button>
        </div>
    </div>

    <!-- Backup-Systeme -->
    <div class="form-section collapsed" data-name="backups">
        <div class="section-title">
            <span>Backup-Systeme</span>
            <span class="section-counter">0/0</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="help-text">
                Dokumentieren Sie Backup-Konfigurationen mit Strategien, Zeitplänen, Aufbewahrungsfristen und Wiederherstellungszielen.
            </div>
            
            <div id="backupList" class="dynamic-list">
                <!-- Backup entries will be added here -->
            </div>
            
            <button type="button" class="btn-add-item" onclick="addBackupEntry()">
                <span>+</span> Backup-Konfiguration hinzufügen
            </button>
        </div>
    </div>

    <!-- Load Balancer -->
    <div class="form-section collapsed" data-name="loadbalancers">
        <div class="section-title">
            <span>Load Balancer</span>
            <span class="section-counter">0/0</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="help-text">
                Konfigurieren Sie zentrale Load Balancer für dieses System. Dokumentieren Sie Frontend-IPs, Backend-Pools, Health Checks und Routing-Regeln.
            </div>
            
            <div id="loadbalancerList" class="dynamic-list">
                <!-- Load balancer entries will be added here -->
            </div>
            
            <button type="button" class="btn-add-item" onclick="addLoadBalancerEntry()">
                <span>+</span> Load Balancer Konfiguration hinzufügen
            </button>
        </div>
    </div>

</form>

<!-- Templates for dynamic entries -->
<template id="vmEntryTemplate">
    <div class="dynamic-entry" data-type="vm">
        <div class="entry-header">
            <span class="entry-title">VM #<span class="entry-number"></span></span>
            <button type="button" class="btn-remove-entry" onclick="removeEntry(this, 'vm')">×</button>
        </div>
        {{include:pages/wizards/system/vmincludetemplate.tpl}}
    </div>
</template>

<template id="hardwareEntryTemplate">
    <div class="dynamic-entry" data-type="hardware">
        <div class="entry-header">
            <span class="entry-title">Server #<span class="entry-number"></span></span>
            <button type="button" class="btn-remove-entry" onclick="removeEntry(this, 'hardware')">×</button>
        </div>
        {{include:pages/wizards/system/hardwareincludetemplate.tpl}}
    </div>
</template>

<template id="databaseEntryTemplate">
    <div class="dynamic-entry" data-type="database">
        <div class="entry-header">
            <span class="entry-title">Datenbank #<span class="entry-number"></span></span>
            <button type="button" class="btn-remove-entry" onclick="removeEntry(this, 'database')">×</button>
        </div>
        {{include:pages/wizards/system/databaseincludetemplate.tpl}}
    </div>
</template>

<template id="backupEntryTemplate">
    <div class="dynamic-entry" data-type="backup">
        <div class="entry-header">
            <span class="entry-title">Backup #<span class="entry-number"></span></span>
            <button type="button" class="btn-remove-entry" onclick="removeEntry(this, 'backup')">×</button>
        </div>
        {{include:pages/wizards/system/backupincludetemplate.tpl}}
    </div>
</template>

<template id="loadbalancerEntryTemplate">
    <div class="dynamic-entry" data-type="loadbalancer">
        <div class="entry-header">
            <span class="entry-title">Load Balancer #<span class="entry-number"></span></span>
            <button type="button" class="btn-remove-entry" onclick="removeEntry(this, 'loadbalancer')">×</button>
        </div>
        {{include:pages/wizards/system/loadbalancerincludetemplate.tpl}}
    </div>
</template>
