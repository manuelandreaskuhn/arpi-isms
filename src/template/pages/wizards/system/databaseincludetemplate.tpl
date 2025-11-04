<div class="entry-content">
    <!-- Basis-Informationen -->
    <div class="subsection-header">Basis-Informationen</div>
    <div class="form-row">
        <div class="form-group">
            <label>
                Datenbankname <span class="required">*</span>
                <span class="help-icon" data-tooltip="db-name">?</span>
            </label>
            <input type="text" name="dbname" class="db-field" placeholder="z.B. KIS_PROD, PACS_DB" required>
        </div>
        <div class="form-group">
            <label>
                Datenbank-Typ
                <span class="help-icon" data-tooltip="db-type">?</span>
            </label>
            {{include:pages/wizards/system/dbtypecombobox.tpl}}
        </div>
    </div>

    <div class="form-row">
        <div class="form-group">
            <label>
                Version
                <span class="help-icon" data-tooltip="db-version">?</span>
            </label>
            <input type="text" name="dbversion" class="db-field" placeholder="z.B. 19c, 2022, 8.0.35">
        </div>
        <div class="form-group">
            <label>
                Zeichensatz / Charset
                <span class="help-icon" data-tooltip="db-charset">?</span>
            </label>
            <input type="text" name="charset" class="db-field" placeholder="z.B. UTF8, AL32UTF8, utf8mb4">
        </div>
    </div>

    <div class="form-row">
        <div class="form-group">
            <label>
                Port
                <span class="help-icon" data-tooltip="db-port">?</span>
            </label>
            <input type="number" name="dbport" class="db-field" placeholder="z.B. 1521, 1433, 3306, 5432">
        </div>
        <div class="form-group">
            <label>
                Tablespace / Schema
                <span class="help-icon" data-tooltip="db-tablespace">?</span>
            </label>
            <input type="text" name="tablespace" class="db-field" placeholder="z.B. USERS, dbo">
        </div>
    </div>

    <!-- Cluster-Konfiguration -->
    <div class="subsection-header">High Availability & Cluster</div>
    <div class="form-group">
        <label class="cluster-label">
            <input type="checkbox" class="db-cluster-check">
            <span>Datenbank-Cluster / High Availability</span>
            <span class="help-icon" data-tooltip="db-cluster-check">?</span>
        </label>
    </div>

    <div class="cluster-config">
        <div class="form-row">
            <div class="form-group">
                <label>
                    Cluster-Typ
                    <span class="help-icon" data-tooltip="cluster-type">?</span>
                </label>
                {{include:pages/wizards/system/dbclustertypecombobox.tpl}}
            </div>
            <div class="form-group">
                <label>
                    Cluster-Name
                    <span class="help-icon" data-tooltip="cluster-name">?</span>
                </label>
                <input type="text" name="clustername" class="db-field" placeholder="z.B. KIS-DB-CLUSTER-01">
            </div>
        </div>
        <div class="form-row">
            <div class="form-group">
                <label>
                    Anzahl Knoten
                    <span class="help-icon" data-tooltip="cluster-nodes">?</span>
                </label>
                <input type="number" name="clusternodes" class="db-field" placeholder="z.B. 2, 3, 5" min="2">
            </div>
            <div class="form-group">
                <label>
                    Failover-Modus
                    <span class="help-icon" data-tooltip="failover-mode">?</span>
                </label>
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
    <div class="subsection-header">
        Host-Zuordnung
        <span class="help-icon" data-tooltip="db-host-assignment">?</span>
    </div>
    <div class="form-group host-assignment-box">
        <div class="help-text">Wählen Sie die VM(s) und/oder Hardware-Server aus, auf denen diese Datenbank betrieben wird.</div>
        <div class="host-assignment" data-hostlist>
            <div class="help-text">Keine Hosts verfügbar. Fügen Sie zuerst VMs oder Hardware Server hinzu.</div>
        </div>
    </div>

    <!-- Größe & Performance -->
    <div class="subsection-header">Größe & Performance</div>
    <div class="form-row">
        <div class="form-group">
            <label>
                Datenbankgröße (GB)
                <span class="help-icon" data-tooltip="db-size">?</span>
            </label>
            <input type="number" name="dbsize" class="db-field" placeholder="z.B. 500">
        </div>
        <div class="form-group">
            <label>
                Max. Verbindungen
                <span class="help-icon" data-tooltip="max-connections">?</span>
            </label>
            <input type="number" name="maxconnections" class="db-field" placeholder="z.B. 100">
        </div>
    </div>

    <!-- Sicherheit -->
    <div class="subsection-header">Sicherheit & Authentifizierung</div>
    <div class="form-row">
        <div class="form-group">
            <label>
                Verschlüsselung
                <span class="help-icon" data-tooltip="db-encryption">?</span>
            </label>
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
            <label>
                Authentifizierung
                <span class="help-icon" data-tooltip="db-authentication">?</span>
            </label>
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

    <!-- Notizen -->
    <div class="subsection-header">Zusätzliche Informationen</div>
    <div class="form-group">
        <label>
            Notizen / Besonderheiten
            <span class="help-icon" data-tooltip="db-notes">?</span>
        </label>
        <textarea name="dbnotes" class="db-field" rows="3" placeholder="Zusätzliche Informationen zur Datenbank, Besonderheiten der Konfiguration..."></textarea>
    </div>
</div>

<!-- Include help tooltips -->
{{include:pages/wizards/system/help/databasehelp.tpl}}