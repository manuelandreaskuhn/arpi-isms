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