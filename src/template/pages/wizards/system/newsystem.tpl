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

</form>

<!-- Templates for dynamic entries -->
<template id="vmEntryTemplate">
    <div class="dynamic-entry" data-type="vm">
        <div class="entry-header">
            <span class="entry-title">VM #<span class="entry-number"></span></span>
            <button type="button" class="btn-remove-entry" onclick="removeEntry(this, 'vm')">×</button>
        </div>
        <div class="entry-content">
            <div class="form-row">
                <div class="form-group">
                    <label>Hostname <span class="required">*</span></label>
                    <input type="text" name="hostname" class="vm-field" placeholder="z.B. srv-kis-prod-01" required>
                </div>
                <div class="form-group">
                    <label>IP-Adresse</label>
                    <input type="text" name="ipaddress" class="vm-field" placeholder="z.B. 192.168.1.10">
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label>Betriebssystem</label>
                    {{include:pages/wizards/system/operatingsystemcombobox.tpl|with:category:vm}}
                </div>
                <div class="form-group">
                    <label>Rolle / Funktion</label>
                    {{include:pages/wizards/system/serverrolecombobox.tpl|with:category:vm}}
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label>vCPU</label>
                    <input type="number" name="vcpu" class="vm-field" placeholder="z.B. 4">
                </div>
                <div class="form-group">
                    <label>RAM (GB)</label>
                    <input type="number" name="ramingb" class="vm-field" placeholder="z.B. 16">
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label>Storage (GB)</label>
                    <input type="number" name="storageingb" class="vm-field" placeholder="z.B. 500">
                </div>
                <div class="form-group">
                    <label>Hypervisor</label>
                    {{include:pages/wizards/system/hypervisorcombobox.tpl}}
                </div>
            </div>
        </div>
    </div>
</template>

<template id="hardwareEntryTemplate">
    <div class="dynamic-entry" data-type="hardware">
        <div class="entry-header">
            <span class="entry-title">Server #<span class="entry-number"></span></span>
            <button type="button" class="btn-remove-entry" onclick="removeEntry(this, 'hardware')">×</button>
        </div>
        <div class="entry-content">
            <div class="form-row">
                <div class="form-group">
                    <label>Hostname <span class="required">*</span></label>
                    <input type="text" name="hostname" class="hw-field" placeholder="z.B. srv-db-prod-01" required>
                </div>
                <div class="form-group">
                    <label>IP-Adresse</label>
                    <input type="text" name="ipaddress" class="hw-field" placeholder="z.B. 192.168.1.20">
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label>Hersteller & Modell</label>
                    <input type="text" name="model" class="hw-field" placeholder="z.B. Dell PowerEdge R750">
                </div>
                <div class="form-group">
                    <label>Seriennummer</label>
                    <input type="text" name="serialnumber" class="hw-field" placeholder="z.B. SN123456789">
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label>Betriebssystem</label>
                    {{include:pages/wizards/system/operatingsystemcombobox.tpl|with:category:hardware}}
                </div>
                <div class="form-group">
                    <label>Rolle / Funktion</label>
                    {{include:pages/wizards/system/serverrolecombobox.tpl|with:category:hardware}}
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label>CPU</label>
                    <input type="text" name="cpu" class="hw-field" placeholder="z.B. 2x Intel Xeon Gold 6248R">
                </div>
                <div class="form-group">
                    <label>RAM (GB)</label>
                    <input type="number" name="ramingb" class="hw-field" placeholder="z.B. 128">
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label>Storage</label>
                    <input type="text" name="storage" class="hw-field" placeholder="z.B. 4x 960GB SSD RAID 10">
                </div>
                <div class="form-group">
                    <label>Standort / Rack</label>
                    <input type="text" name="location" class="hw-field" placeholder="z.B. RZ1-Rack-A12-U10">
                </div>
            </div>
            <div class="form-group">
                <label>Garantie / Support bis</label>
                <input type="text" name="warranty" class="hw-field" placeholder="z.B. 12/2027">
            </div>
        </div>
    </div>
</template>

<template id="databaseEntryTemplate">
    <div class="dynamic-entry" data-type="database">
        <div class="entry-header">
            <span class="entry-title">Datenbank #<span class="entry-number"></span></span>
            <button type="button" class="btn-remove-entry" onclick="removeEntry(this, 'database')">×</button>
        </div>
        <div class="entry-content">
            <!-- Basis-Informationen -->
            <div class="form-row">
                <div class="form-group">
                    <label>Datenbankname <span class="required">*</span></label>
                    <input type="text" name="dbname" class="db-field" placeholder="z.B. KIS_PROD, PACS_DB" required>
                </div>
                <div class="form-group">
                    <label>Datenbank-Typ</label>
                    {{include:pages/wizards/system/dbtypecombobox.tpl}}
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Version</label>
                    <input type="text" name="dbversion" class="db-field" placeholder="z.B. 19c, 2022, 8.0.35">
                </div>
                <div class="form-group">
                    <label>Zeichensatz / Charset</label>
                    <input type="text" name="charset" class="db-field" placeholder="z.B. UTF8, AL32UTF8, utf8mb4">
                </div>
            </div>

            <!-- Cluster-Konfiguration -->
            <div class="form-group">
                <label class="cluster-label">
                    <input type="checkbox" class="db-cluster-check">
                    <span>Datenbank-Cluster / High Availability</span>
                </label>
            </div>

            <div class="cluster-config">
                <div class="form-row">
                    <div class="form-group">
                        <label>Cluster-Typ</label>
                        {{include:pages/wizards/system/dbclustertypecombobox.tpl}}
                    </div>
                    <div class="form-group">
                        <label>Cluster-Name</label>
                        <input type="text" name="clustername" class="db-field" placeholder="z.B. KIS-DB-CLUSTER-01">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <label>Anzahl Knoten</label>
                        <input type="number" name="clusternodes" class="db-field" placeholder="z.B. 2, 3, 5" min="2">
                    </div>
                    <div class="form-group">
                        <label>Failover-Modus</label>
                        <div class="custom-select" data-name="failovermode" data-index="0" data-category="database">
                            <div class="select-trigger">
                                <span class="placeholder">Bitte wählen</span>
                                <span class="arrow">▼</span>
                            </div>
                            <div class="select-dropdown">
                                <div class="select-options">
                                    <div class="select-option" data-value="">Bitte wählen</div>
                                    <div class="select-option" data-value="automatic">Automatisch</div>
                                    <div class="select-option" data-value="manual">Manuell</div>
                                    <div class="select-option" data-value="semiautomatic">Semi-Automatisch</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Host-Zuordnung -->
            <div class="form-group host-assignment-box">
                <label>Läuft auf folgenden Hosts</label>
                <div class="help-text">Wählen Sie die VM(s) und/oder Hardware-Server aus, auf denen diese Datenbank betrieben wird.</div>
                <div class="host-assignment" data-hostlist>
                    <div class="help-text">Keine Hosts verfügbar. Fügen Sie zuerst VMs oder Hardware Server hinzu.</div>
                </div>
            </div>

            <!-- Größe & Performance -->
            <div class="form-row">
                <div class="form-group">
                    <label>Datenbankgröße (GB)</label>
                    <input type="number" name="dbsize" class="db-field" placeholder="z.B. 500">
                </div>
                <div class="form-group">
                    <label>Max. Verbindungen</label>
                    <input type="number" name="maxconnections" class="db-field" placeholder="z.B. 100">
                </div>
            </div>

            <!-- Sicherheit -->
            <div class="form-row">
                <div class="form-group">
                    <label>Verschlüsselung</label>
                    <div class="custom-select" data-name="dbencryption" data-index="0" data-category="database">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="tde">Transparent Data Encryption (TDE)</div>
                                <div class="select-option" data-value="column">Column-Level Encryption</div>
                                <div class="select-option" data-value="connection">Nur Verbindungsverschlüsselung (TLS)</div>
                                <div class="select-option" data-value="none">Keine</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>Authentifizierung</label>
                    <div class="custom-select" data-name="dbauthentication" data-index="0" data-category="database">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="integrated">Integrierte Windows Auth</div>
                                <div class="select-option" data-value="ldap">LDAP / Active Directory</div>
                                <div class="select-option" data-value="native">Native Datenbank-Auth</div>
                                <div class="select-option" data-value="kerberos">Kerberos</div>
                                <div class="select-option" data-value="certificate">Zertifikatsbasiert</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Port & Notizen -->
            <div class="form-row">
                <div class="form-group">
                    <label>Port</label>
                    <input type="number" name="dbport" class="db-field" placeholder="z.B. 1521, 1433, 3306, 5432">
                </div>
                <div class="form-group">
                    <label>Tablespace / Schema</label>
                    <input type="text" name="tablespace" class="db-field" placeholder="z.B. USERS, dbo">
                </div>
            </div>

            <div class="form-group">
                <label>Notizen / Besonderheiten</label>
                <textarea name="dbnotes" class="db-field" rows="3" placeholder="Zusätzliche Informationen zur Datenbank, Besonderheiten der Konfiguration..."></textarea>
            </div>
        </div>
    </div>
</template>

<template id="backupEntryTemplate">
    <div class="dynamic-entry" data-type="backup">
        <div class="entry-header">
            <span class="entry-title">Backup #<span class="entry-number"></span></span>
            <button type="button" class="btn-remove-entry" onclick="removeEntry(this, 'backup')">×</button>
        </div>
        <div class="entry-content">
            <!-- Basis-Informationen -->
            <div class="subsection-header">Basis-Informationen</div>
            <div class="form-row">
                <div class="form-group">
                    <label>Backup-Name / ID <span class="required">*</span></label>
                    <input type="text" name="backupname" class="backup-field" placeholder="z.B. KIS-Daily-Backup, PACS-Archive" required>
                </div>
                <div class="form-group">
                    <label>Backup-Software</label>
                    <div class="custom-select" data-name="backupsoftware" data-index="0" data-category="backup">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="veeam">Veeam Backup & Replication</div>
                                <div class="select-option" data-value="commvault">Commvault</div>
                                <div class="select-option" data-value="rubrik">Rubrik</div>
                                <div class="select-option" data-value="veritas">Veritas NetBackup</div>
                                <div class="select-option" data-value="acronis">Acronis Cyber Backup</div>
                                <div class="select-option" data-value="bacula">Bacula</div>
                                <div class="select-option" data-value="ibm-spectrum">IBM Spectrum Protect</div>
                                <div class="select-option" data-value="arcserve">Arcserve UDP</div>
                                <div class="select-option" data-value="cohesity">Cohesity</div>
                                <div class="select-option" data-value="nakivo">Nakivo</div>
                                <div class="select-option" data-value="other">Sonstige</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Version</label>
                    <input type="text" name="backupversion" class="backup-field" placeholder="z.B. 12.1, 2024 Q2">
                </div>
                <div class="form-group">
                    <label>Backup-Agent</label>
                    <div class="custom-select" data-name="backupagent" data-index="0" data-category="backup">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="veeam-agent">Veeam Agent</div>
                                <div class="select-option" data-value="native-vm">Native VM-Tools (VMware/Hyper-V)</div>
                                <div class="select-option" data-value="native-db">Native DB-Tools (mysqldump, pg_dump)</div>
                                <div class="select-option" data-value="file-agent">Datei-basierter Agent</div>
                                <div class="select-option" data-value="application-aware">Application-aware Agent</div>
                                <div class="select-option" data-value="agentless">Agentlos</div>
                                <div class="select-option" data-value="other">Sonstige</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Backup-Strategie -->
            <div class="subsection-header">Backup-Strategie & Zeitplan</div>
            <div class="form-row">
                <div class="form-group">
                    <label>Backup-Typ</label>
                    <div class="custom-select" data-name="backuptype" data-index="0" data-category="backup">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="full">Full Backup</div>
                                <div class="select-option" data-value="incremental">Incremental</div>
                                <div class="select-option" data-value="differential">Differential</div>
                                <div class="select-option" data-value="snapshot">Snapshot</div>
                                <div class="select-option" data-value="continuous">Continuous / CDP</div>
                                <div class="select-option" data-value="synthetic">Synthetic Full</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>Backup-Methode</label>
                    <div class="custom-select" data-name="backupmethod" data-index="0" data-category="backup">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="image">Image-basiert (VM)</div>
                                <div class="select-option" data-value="file">Datei-basiert</div>
                                <div class="select-option" data-value="database">Datenbank-Dump</div>
                                <div class="select-option" data-value="application">Application-aware</div>
                                <div class="select-option" data-value="block">Block-Level</div>
                                <div class="select-option" data-value="container">Container-basiert</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Zeitplan -->
            <div class="form-row">
                <div class="form-group">
                    <label>Backup-Zeitplan</label>
                    <div class="custom-select" data-name="backupschedule" data-index="0" data-category="backup">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="continuous">Kontinuierlich</div>
                                <div class="select-option" data-value="hourly">Stündlich</div>
                                <div class="select-option" data-value="daily">Täglich</div>
                                <div class="select-option" data-value="weekly">Wöchentlich</div>
                                <div class="select-option" data-value="monthly">Monatlich</div>
                                <div class="select-option" data-value="custom">Individuell</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>Backup-Zeit</label>
                    <input type="text" name="backuptime" class="backup-field" placeholder="z.B. 02:00 Uhr, 22:00-06:00">
                </div>
            </div>

            <!-- Aufbewahrung & Speicherort -->
            <div class="subsection-header">Retention & Speicherorte</div>
            <div class="form-row">
                <div class="form-group">
                    <label>Retention / Aufbewahrung (Tage)</label>
                    <input type="number" name="retention" class="backup-field" placeholder="z.B. 30, 90, 365">
                </div>
                <div class="form-group">
                    <label>GFS-Schema aktiviert</label>
                    <div class="custom-select" data-name="gfsenabled" data-index="0" data-category="backup">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="yes">Ja</div>
                                <div class="select-option" data-value="no">Nein</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- GFS Schema Details -->
            <div class="form-row">
                <div class="form-group">
                    <label>GFS - Täglich (Sohn)</label>
                    <input type="number" name="gfsdaily" class="backup-field" placeholder="z.B. 7">
                    <div class="help-text">Anzahl täglicher Backups</div>
                </div>
                <div class="form-group">
                    <label>GFS - Wöchentlich (Father)</label>
                    <input type="number" name="gfsweekly" class="backup-field" placeholder="z.B. 4">
                    <div class="help-text">Anzahl wöchentlicher Backups</div>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>GFS - Monatlich (Grandfather)</label>
                    <input type="number" name="gfsmonthly" class="backup-field" placeholder="z.B. 12">
                    <div class="help-text">Anzahl monatlicher Backups</div>
                </div>
                <div class="form-group">
                    <label>GFS - Jährlich (optional)</label>
                    <input type="number" name="gfsyearly" class="backup-field" placeholder="z.B. 5">
                    <div class="help-text">Anzahl jährlicher Backups</div>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Primärer Speicherort</label>
                    <div class="custom-select" data-name="primarystorage" data-index="0" data-category="backup">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="local">Lokaler Storage / NAS</div>
                                <div class="select-option" data-value="san">SAN</div>
                                <div class="select-option" data-value="tape">Tape Library</div>
                                <div class="select-option" data-value="cloud">Cloud Storage</div>
                                <div class="select-option" data-value="repository">Backup Repository</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>Speicherkapazität (TB)</label>
                    <input type="number" name="storagecapacity" class="backup-field" step="0.1" placeholder="z.B. 5.0, 10.5">
                </div>
            </div>

            <!-- 3-2-1 Regel & Offsite -->
            <div class="subsection-header">3-2-1 Backup-Regel</div>
            <div class="form-group">
                <label class="backup-321-label">
                    <input type="checkbox" class="backup-321-check">
                    <span>3-2-1 Backup-Regel implementiert</span>
                </label>
                <div class="help-text">3 Kopien, 2 verschiedene Medien, 1 Kopie offsite</div>
            </div>

            <div class="backup-321-config">
                <div class="form-row">
                    <div class="form-group">
                        <label>Sekundärer Speicherort (2. Medium)</label>
                        <div class="custom-select" data-name="secondarystorage" data-index="0" data-category="backup">
                            <div class="select-trigger">
                                <span class="placeholder">Bitte wählen</span>
                                <span class="arrow">▼</span>
                            </div>
                            <div class="select-dropdown">
                                <div class="select-options">
                                    <div class="select-option" data-value="">Bitte wählen</div>
                                    <div class="select-option" data-value="tape">Tape</div>
                                    <div class="select-option" data-value="nas">NAS</div>
                                    <div class="select-option" data-value="cloud">Cloud</div>
                                    <div class="select-option" data-value="objectstorage">Object Storage</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Tertiärer Speicherort (3. Kopie)</label>
                        <div class="custom-select" data-name="tertiarystorage" data-index="0" data-category="backup">
                            <div class="select-trigger">
                                <span class="placeholder">Bitte wählen</span>
                                <span class="arrow">▼</span>
                            </div>
                            <div class="select-dropdown">
                                <div class="select-options">
                                    <div class="select-option" data-value="">Bitte wählen</div>
                                    <div class="select-option" data-value="tape-offsite">Tape (Offsite)</div>
                                    <div class="select-option" data-value="cloud-archive">Cloud Archive (Glacier, Cool Tier)</div>
                                    <div class="select-option" data-value="secondary-datacenter">Sekundäres Rechenzentrum</div>
                                    <div class="select-option" data-value="cloud-replication">Cloud-Replikation</div>
                                    <div class="select-option" data-value="external-storage">Externe Storage-Lösung</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <label>Offsite-Standort</label>
                        <input type="text" name="offsitelocation" class="backup-field" placeholder="z.B. Ausweich-RZ, Azure Germany West, Iron Mountain">
                    </div>
                    <div class="form-group">
                        <label>Offsite-Übertragung</label>
                        <div class="custom-select" data-name="offsitetransfer" data-index="0" data-category="backup">
                            <div class="select-trigger">
                                <span class="placeholder">Bitte wählen</span>
                                <span class="arrow">▼</span>
                            </div>
                            <div class="select-dropdown">
                                <div class="select-options">
                                    <div class="select-option" data-value="">Bitte wählen</div>
                                    <div class="select-option" data-value="network">Netzwerk-Replikation</div>
                                    <div class="select-option" data-value="physical">Physischer Transport (Tape)</div>
                                    <div class="select-option" data-value="cloud">Cloud-Sync</div>
                                    <div class="select-option" data-value="wan">WAN-Accelerator</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Sicherheit & Verschlüsselung -->
            <div class="subsection-header">Sicherheit & Verschlüsselung</div>
            <div class="form-row">
                <div class="form-group">
                    <label>Verschlüsselung In Transit</label>
                    <div class="custom-select" data-name="encryptionintransit" data-index="0" data-category="backup">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="tls13">TLS 1.3</div>
                                <div class="select-option" data-value="tls12">TLS 1.2</div>
                                <div class="select-option" data-value="ssl">SSL/TLS</div>
                                <div class="select-option" data-value="none">Keine</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>Verschlüsselung At Rest</label>
                    <div class="custom-select" data-name="encryptionatrest" data-index="0" data-category="backup">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="aes256">AES-256</div>
                                <div class="select-option" data-value="aes128">AES-128</div>
                                <div class="select-option" data-value="hardware">Hardware-Verschlüsselung</div>
                                <div class="select-option" data-value="none">Keine</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Immutability / WORM</label>
                    <div class="custom-select" data-name="immutability" data-index="0" data-category="backup">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="enabled">Aktiviert</div>
                                <div class="select-option" data-value="partial">Teilweise (z.B. nur Cloud)</div>
                                <div class="select-option" data-value="disabled">Nicht aktiviert</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>Immutability Zeitraum (Tage)</label>
                    <input type="number" name="immutabilityperiod" class="backup-field" placeholder="z.B. 14, 30, 90">
                    <div class="help-text">Zeitraum, in dem Backup nicht gelöscht/geändert werden kann</div>
                </div>
            </div>

            <!-- Recovery-Ziele (RTO/RPO) -->
            <div class="subsection-header">Recovery-Ziele (RTO/RPO)</div>
            <div class="form-row">
                <div class="form-group">
                    <label>RTO (Recovery Time Objective)</label>
                    <input type="text" name="rto" class="backup-field" placeholder="z.B. 4 Stunden, 24 Stunden">
                    <div class="help-text">Maximale Wiederherstellungszeit</div>
                </div>
                <div class="form-group">
                    <label>RPO (Recovery Point Objective)</label>
                    <input type="text" name="rpo" class="backup-field" placeholder="z.B. 1 Stunde, 24 Stunden">
                    <div class="help-text">Maximaler Datenverlust</div>
                </div>
            </div>

            <!-- Tests & Verifizierung -->
            <div class="subsection-header">Verifizierung & Tests</div>
            <div class="form-row">
                <div class="form-group">
                    <label>Backup-Verifizierung - Methode</label>
                    <div class="custom-select" data-name="verificationmethod" data-index="0" data-category="backup">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="checksum">Checksum-Prüfung</div>
                                <div class="select-option" data-value="restore-test">Restore-Test</div>
                                <div class="select-option" data-value="file-verification">Datei-Verifizierung</div>
                                <div class="select-option" data-value="boot-test">Boot-Test (VM)</div>
                                <div class="select-option" data-value="none">Keine</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>Verifizierung - Zeitpunkt</label>
                    <div class="custom-select" data-name="verificationtiming" data-index="0" data-category="backup">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="immediate">Sofort nach Backup</div>
                                <div class="select-option" data-value="scheduled">Planmäßig</div>
                                <div class="select-option" data-value="manual">Manuell</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Letzter Restore-Test</label>
                    <input type="text" name="lastrestoretest" class="backup-field" placeholder="z.B. 15.03.2024, Q1 2024">
                </div>
                <div class="form-group">
                    <label>Test-Häufigkeit</label>
                    <div class="custom-select" data-name="testfrequency" data-index="0" data-category="backup">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="monthly">Monatlich</div>
                                <div class="select-option" data-value="quarterly">Vierteljährlich</div>
                                <div class="select-option" data-value="halfyearly">Halbjährlich</div>
                                <div class="select-option" data-value="yearly">Jährlich</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Zuständigkeiten & Monitoring -->
            <div class="subsection-header">Zuständigkeiten & Monitoring</div>
            <div class="form-row">
                <div class="form-group">
                    <label>Verantwortlicher</label>
                    <input type="text" name="responsible" class="backup-field" placeholder="z.B. Team Storage, Max Mustermann">
                </div>
                <div class="form-group">
                    <label>Monitoring / Alerting</label>
                    <input type="text" name="monitoring" class="backup-field" placeholder="z.B. E-Mail bei Fehler, SIEM-Integration">
                </div>
            </div>

            <!-- Host-Zuordnung -->
            <div class="subsection-header">Gesicherte Komponenten</div>
            <div class="form-group host-assignment-box">
                <div class="help-text">Wählen Sie die VMs, Server oder Datenbanken aus, die durch dieses Backup gesichert werden.</div>
                <div class="host-assignment" data-hostlist>
                    <div class="help-text">Keine Hosts verfügbar. Fügen Sie zuerst VMs, Hardware Server oder Datenbanken hinzu.</div>
                </div>
            </div>

            <!-- Notizen -->
            <div class="subsection-header">Zusätzliche Informationen</div>
            <div class="form-group">
                <label>Notizen / Besonderheiten</label>
                <textarea name="backupnotes" class="backup-field" rows="3" placeholder="Zusätzliche Informationen zum Backup, Besonderheiten, Einschränkungen, Disaster-Recovery-Szenarien..."></textarea>
            </div>
        </div>
    </div>
</template>
