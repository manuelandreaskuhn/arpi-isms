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

            <!-- Backup & Recovery -->
            <div class="form-row">
                <div class="form-group">
                    <label>Backup-Strategie</label>
                    <div class="custom-select" data-name="backupstrategy" data-index="0" data-category="database">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="full-daily">Full Backup täglich</div>
                                <div class="select-option" data-value="full-incremental">Full + Incremental</div>
                                <div class="select-option" data-value="full-differential">Full + Differential</div>
                                <div class="select-option" data-value="continuous">Continuous Backup / WAL</div>
                                <div class="select-option" data-value="snapshot">Snapshot-basiert</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>Backup Retention (Tage)</label>
                    <input type="number" name="backupretention" class="db-field" placeholder="z.B. 30, 90">
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
