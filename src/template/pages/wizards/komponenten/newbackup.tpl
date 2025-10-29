<aside>
    <p>Assetmanagement</p>
    <i>›</i>
    <p>Komponenten</p>
    <i>›</i>
    <p>Neues Backup-System anlegen</p>
</aside>

<form id="newBackupSystemForm">

    <!-- Basis-Informationen -->
    <div class="form-section">
        <div class="section-title">
            <span>Basis-Informationen</span>
            <span class="section-badge">Pflicht</span>
            <span class="section-counter">0/4</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="form-row">
                <div class="form-group">
                    <label>Backup-System Name <span class="required">*</span></label>
                    <input type="text" id="backupsystemname" required placeholder="z.B. Veeam-Prod, Backup-Server-01">
                </div>
                <div class="form-group">
                    <label>Backup-Software <span class="required">*</span></label>
                    <div class="custom-select" data-name="backupsoftware">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-group-header">Enterprise Backup</div>
                                <div class="select-option" data-value="veeam">Veeam Backup & Replication</div>
                                <div class="select-option" data-value="commvault">Commvault</div>
                                <div class="select-option" data-value="veritas-netbackup">Veritas NetBackup</div>
                                <div class="select-option" data-value="ibm-spectrum">IBM Spectrum Protect</div>
                                <div class="select-option" data-value="dell-emc-avamar">Dell EMC Avamar</div>
                                <div class="select-group-header">VMware / Virtualisierung</div>
                                <div class="select-option" data-value="veeam-vmware">Veeam für VMware</div>
                                <div class="select-option" data-value="altaro">Altaro VM Backup</div>
                                <div class="select-option" data-value="vmware-data-protection">VMware Data Protection (VDP)</div>
                                <div class="select-option" data-value="nakivo">Nakivo Backup</div>
                                <div class="select-group-header">Windows / Microsoft</div>
                                <div class="select-option" data-value="windows-server-backup">Windows Server Backup</div>
                                <div class="select-option" data-value="azure-backup">Azure Backup</div>
                                <div class="select-option" data-value="dpm">System Center DPM</div>
                                <div class="select-group-header">Open Source / Linux</div>
                                <div class="select-option" data-value="bacula">Bacula</div>
                                <div class="select-option" data-value="bareos">Bareos</div>
                                <div class="select-option" data-value="amanda">Amanda</div>
                                <div class="select-option" data-value="duplicity">Duplicity</div>
                                <div class="select-option" data-value="restic">Restic</div>
                                <div class="select-group-header">Cloud Backup</div>
                                <div class="select-option" data-value="aws-backup">AWS Backup</div>
                                <div class="select-option" data-value="acronis">Acronis Cyber Backup</div>
                                <div class="select-option" data-value="rubrik">Rubrik</div>
                                <div class="select-option" data-value="cohesity">Cohesity</div>
                                <div class="select-option" data-value="other">Sonstige</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Version</label>
                    <input type="text" id="backupversion" placeholder="z.B. v12.1, 2024 Update 2">
                </div>
                <div class="form-group">
                    <label>Lizenzmodell</label>
                    <div class="custom-select" data-name="backuplicensemodel">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="per-socket">Per Socket / CPU</div>
                                <div class="select-option" data-value="per-vm">Per VM / Instance</div>
                                <div class="select-option" data-value="per-tb">Per TB</div>
                                <div class="select-option" data-value="per-host">Per Host / Agent</div>
                                <div class="select-option" data-value="subscription">Subscription / SaaS</div>
                                <div class="select-option" data-value="perpetual">Perpetual (einmalig)</div>
                                <div class="select-option" data-value="free">Kostenlos / Community</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Infrastruktur -->
    <div class="form-section collapsed">
        <div class="section-title">
            <span>Infrastruktur & Server</span>
            <span class="section-counter">0/5</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="form-row">
                <div class="form-group">
                    <label>Backup-Server / Hostname</label>
                    <div class="custom-select" data-name="backupserverid" data-component-type="vm,hardware">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen (VM/Hardware)</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="manual">Manuell eingeben</div>
                                <div class="select-group-header">Virtuelle Maschinen</div>
                                <!-- Dynamic VM entries -->
                                <div class="select-group-header">Hardware Server</div>
                                <!-- Dynamic Hardware entries -->
                            </div>
                        </div>
                    </div>
                    <div class="help-text">Wählen Sie den Server aus oder geben Sie manuell ein</div>
                </div>
                <div class="form-group" id="backup-server-manual" style="display:none;">
                    <label>Server-Name (manuell)</label>
                    <input type="text" id="backupservername" placeholder="z.B. backup-srv-01.example.com">
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>IP-Adresse</label>
                    <input type="text" id="backupserverip" placeholder="z.B. 192.168.50.10">
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Betriebssystem</label>
                    <input type="text" id="backupos" placeholder="z.B. Windows Server 2022, Linux Ubuntu 22.04">
                </div>
                <div class="form-group">
                    <label>Standort</label>
                    <input type="text" id="backuplocation" placeholder="z.B. RZ1, Backup-Raum, Cloud">
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>CPU / RAM</label>
                    <input type="text" id="backupresources" placeholder="z.B. 8 vCPU, 32GB RAM">
                </div>
                <div class="form-group">
                    <label>Management-URL</label>
                    <input type="text" id="backupmgmturl" placeholder="z.B. https://backup.example.com:9443">
                </div>
            </div>
        </div>
    </div>

    <!-- Storage-Konfiguration -->
    <div class="form-section collapsed">
        <div class="section-title">
            <span>Storage-Konfiguration</span>
            <span class="section-counter">0/6</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="subsection-header">Backup-Architektur</div>
            <div class="form-group">
                <label>Storage-Stufen</label>
                <div class="custom-select" data-name="storagelevels">
                    <div class="select-trigger">
                        <span class="placeholder">Bitte wählen</span>
                        <span class="arrow">▼</span>
                    </div>
                    <div class="select-dropdown">
                        <div class="select-options">
                            <div class="select-option" data-value="">Bitte wählen</div>
                            <div class="select-option" data-value="2-tier">2-Stufig (Primär + Sekundär)</div>
                            <div class="select-option" data-value="3-tier">3-Stufig (Primär + Sekundär + Archiv)</div>
                        </div>
                    </div>
                </div>
                <div class="help-text">Wählen Sie die Anzahl der Backup-Stufen für Ihre Architektur</div>
            </div>

            <div class="subsection-header">Stufe 1: Primärer Backup-Storage</div>
            <div class="form-row">
                <div class="form-group">
                    <label>Storage-Typ (Primär)</label>
                    <div class="custom-select" data-name="primarystoragetype">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="local-disk">Lokale Festplatten</div>
                                <div class="select-option" data-value="nas">NAS (Network Attached Storage)</div>
                                <div class="select-option" data-value="san">SAN (Storage Area Network)</div>
                                <div class="select-option" data-value="dedup-appliance">Deduplizierungs-Appliance</div>
                                <div class="select-option" data-value="object-storage">Object Storage (S3-kompatibel)</div>
                                <div class="select-option" data-value="tape">Tape Library</div>
                                <div class="select-option" data-value="cloud">Cloud Storage</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>Kapazität (TB)</label>
                    <input type="number" id="primarystoragecapacity" step="0.1" placeholder="z.B. 50, 100">
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Storage-Pfad / Repository</label>
                    <input type="text" id="primarystoragepath" placeholder="z.B. \\NAS01\Backups, /mnt/backup">
                </div>
                <div class="form-group">
                    <label>Deduplizierung</label>
                    <div class="custom-select" data-name="primarydeduplication">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="enabled">Aktiviert</div>
                                <div class="select-option" data-value="disabled">Nicht aktiviert</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="subsection-header">Stufe 2: Sekundärer Storage / Replikation</div>
            <div id="secondary-storage-config">
                <div class="form-row">
                    <div class="form-group">
                        <label>Storage-Typ (Sekundär)</label>
                        <div class="custom-select" data-name="secondarystoragetype">
                            <div class="select-trigger">
                                <span class="placeholder">Bitte wählen</span>
                                <span class="arrow">▼</span>
                            </div>
                            <div class="select-dropdown">
                                <div class="select-options">
                                    <div class="select-option" data-value="">Bitte wählen</div>
                                    <div class="select-option" data-value="nas-offsite">NAS (Offsite)</div>
                                    <div class="select-option" data-value="tape-offsite">Tape (Offsite / Iron Mountain)</div>
                                    <div class="select-option" data-value="cloud-s3">Cloud (AWS S3)</div>
                                    <div class="select-option" data-value="cloud-azure">Cloud (Azure Blob)</div>
                                    <div class="select-option" data-value="cloud-gcp">Cloud (Google Cloud Storage)</div>
                                    <div class="select-option" data-value="cloud-other">Cloud (andere)</div>
                                    <div class="select-option" data-value="external-datacenter">Externes Rechenzentrum</div>
                                    <div class="select-option" data-value="dedup-appliance">Deduplizierungs-Appliance</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Kapazität (TB)</label>
                        <input type="number" id="secondarystoragecapacity" step="0.1" placeholder="z.B. 50, 100">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label>Storage-Pfad / Cloud-Bucket</label>
                        <input type="text" id="secondarystoragepath" placeholder="z.B. s3://backup-bucket, \\offsite-nas\backup">
                    </div>
                    <div class="form-group">
                        <label>Deduplizierung</label>
                        <div class="custom-select" data-name="secondarydeduplication">
                            <div class="select-trigger">
                                <span class="placeholder">Bitte wählen</span>
                                <span class="arrow">▼</span>
                            </div>
                            <div class="select-dropdown">
                                <div class="select-options">
                                    <div class="select-option" data-value="">Bitte wählen</div>
                                    <div class="select-option" data-value="enabled">Aktiviert</div>
                                    <div class="select-option" data-value="disabled">Nicht aktiviert</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label>Replikationsfrequenz</label>
                        <div class="custom-select" data-name="secondaryreplicationfreq">
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
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Immutability (Unveränderbarkeit)</label>
                        <div class="custom-select" data-name="secondaryimmutability">
                            <div class="select-trigger">
                                <span class="placeholder">Bitte wählen</span>
                                <span class="arrow">▼</span>
                            </div>
                            <div class="select-dropdown">
                                <div class="select-options">
                                    <div class="select-option" data-value="">Bitte wählen</div>
                                    <div class="select-option" data-value="enabled">Aktiviert</div>
                                    <div class="select-option" data-value="disabled">Nicht aktiviert</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-group" id="secondary-immutability-period" style="display:none;">
                    <label>Immutability Periode</label>
                    <input type="text" id="secondaryimmutabilityperiod" placeholder="z.B. 14 Tage, 30 Tage, 90 Tage">
                    <div class="help-text">Zeitraum, in dem Backups nicht gelöscht/geändert werden können</div>
                </div>
            </div>

            <div class="subsection-header" id="tertiary-storage-header" style="display:none;">Stufe 3: Archiv / Langzeit-Storage</div>
            <div id="tertiary-storage-config" style="display:none;">
                <div class="form-row">
                    <div class="form-group">
                        <label>Storage-Typ (Archiv)</label>
                        <div class="custom-select" data-name="tertiarystoragetype">
                            <div class="select-trigger">
                                <span class="placeholder">Bitte wählen</span>
                                <span class="arrow">▼</span>
                            </div>
                            <div class="select-dropdown">
                                <div class="select-options">
                                    <div class="select-option" data-value="">Bitte wählen</div>
                                    <div class="select-option" data-value="tape-archive">Tape Archiv (LTO)</div>
                                    <div class="select-option" data-value="cloud-glacier">AWS Glacier</div>
                                    <div class="select-option" data-value="cloud-archive">Azure Archive Storage</div>
                                    <div class="select-option" data-value="cloud-coldline">Google Coldline/Archive</div>
                                    <div class="select-option" data-value="object-storage-archive">Object Storage (Archiv-Tier)</div>
                                    <div class="select-option" data-value="external-vault">Externer Tresor / Iron Mountain</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Kapazität (TB)</label>
                        <input type="number" id="tertiarystoragecapacity" step="0.1" placeholder="z.B. 100, 500">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label>Storage-Pfad / Archive-Bucket</label>
                        <input type="text" id="tertiarystoragepath" placeholder="z.B. glacier://backup-archive, Tape-Library-03">
                    </div>
                    <div class="form-group">
                        <label>Archivierungsfrequenz</label>
                        <div class="custom-select" data-name="tertiaryarchivefreq">
                            <div class="select-trigger">
                                <span class="placeholder">Bitte wählen</span>
                                <span class="arrow">▼</span>
                            </div>
                            <div class="select-dropdown">
                                <div class="select-options">
                                    <div class="select-option" data-value="">Bitte wählen</div>
                                    <div class="select-option" data-value="weekly">Wöchentlich</div>
                                    <div class="select-option" data-value="monthly">Monatlich</div>
                                    <div class="select-option" data-value="quarterly">Quartalsweise</div>
                                    <div class="select-option" data-value="yearly">Jährlich</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label>Aufbewahrungsdauer</label>
                        <input type="text" id="tertiaryretention" placeholder="z.B. 7 Jahre, 10 Jahre, unbegrenzt">
                    </div>
                    <div class="form-group">
                        <label>Immutability (Unveränderbarkeit)</label>
                        <div class="custom-select" data-name="tertiaryimmutability">
                            <div class="select-trigger">
                                <span class="placeholder">Bitte wählen</span>
                                <span class="arrow">▼</span>
                            </div>
                            <div class="select-dropdown">
                                <div class="select-options">
                                    <div class="select-option" data-value="">Bitte wählen</div>
                                    <div class="select-option" data-value="enabled">Aktiviert</div>
                                    <div class="select-option" data-value="disabled">Nicht aktiviert</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-group" id="tertiary-immutability-period" style="display:none;">
                    <label>Immutability Periode</label>
                    <input type="text" id="tertiaryimmutabilityperiod" placeholder="z.B. 90 Tage, 1 Jahr, 7 Jahre">
                    <div class="help-text">Zeitraum, in dem Archiv-Backups nicht gelöscht/geändert werden können</div>
                </div>
            </div>
        </div>
    </div>

    <!-- Backup-Features & Konfiguration -->
    <div class="form-section collapsed">
        <div class="section-title">
            <span>Backup-Features & Konfiguration</span>
            <span class="section-counter">0/5</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="form-row">
                <div class="form-group">
                    <label>Unterstützte Backup-Typen</label>
                    <div class="checkbox-group">
                        <div class="checkbox-item">
                            <input type="checkbox" id="feature-full" value="full">
                            <label for="feature-full">Full Backup</label>
                        </div>
                        <div class="checkbox-item">
                            <input type="checkbox" id="feature-incremental" value="incremental">
                            <label for="feature-incremental">Incremental</label>
                        </div>
                        <div class="checkbox-item">
                            <input type="checkbox" id="feature-differential" value="differential">
                            <label for="feature-differential">Differential</label>
                        </div>
                        <div class="checkbox-item">
                            <input type="checkbox" id="feature-forever-incremental" value="forever-incremental">
                            <label for="feature-forever-incremental">Forever Incremental</label>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Kompression</label>
                    <div class="custom-select" data-name="compression">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="high">Hoch</div>
                                <div class="select-option" data-value="medium">Mittel</div>
                                <div class="select-option" data-value="low">Niedrig</div>
                                <div class="select-option" data-value="none">Keine</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>Verschlüsselung</label>
                    <div class="custom-select" data-name="backupencryption">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="aes-256">AES-256</div>
                                <div class="select-option" data-value="aes-128">AES-128</div>
                                <div class="select-option" data-value="other">Andere</div>
                                <div class="select-option" data-value="none">Keine</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Application-Aware Backup</label>
                    <div class="custom-select" data-name="applicationaware">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="yes">Ja (VSS, Quiesce)</div>
                                <div class="select-option" data-value="no">Nein (Crash-Consistent)</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>Instant Recovery / VM</label>
                    <div class="custom-select" data-name="instantrecovery">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="supported">Unterstützt</div>
                                <div class="select-option" data-value="not-supported">Nicht unterstützt</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label>Weitere Features</label>
                <div class="checkbox-group">
                    <div class="checkbox-item">
                        <input type="checkbox" id="feature-replication" value="replication">
                        <label for="feature-replication">Backup-Replikation</label>
                    </div>
                    <div class="checkbox-item">
                        <input type="checkbox" id="feature-archiving" value="archiving">
                        <label for="feature-archiving">Langzeit-Archivierung</label>
                    </div>
                    <div class="checkbox-item">
                        <input type="checkbox" id="feature-cdp" value="cdp">
                        <label for="feature-cdp">CDP (Continuous Data Protection)</label>
                    </div>
                    <div class="checkbox-item">
                        <input type="checkbox" id="feature-cloud-tier" value="cloud-tier">
                        <label for="feature-cloud-tier">Cloud-Tiering</label>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Monitoring & Alerting -->
    <div class="form-section collapsed">
        <div class="section-title">
            <span>Monitoring & Alerting</span>
            <span class="section-counter">0/4</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="form-row">
                <div class="form-group">
                    <label>Monitoring-Integration</label>
                    <input type="text" id="monitoringintegration" placeholder="z.B. PRTG, Zabbix, Prometheus, E-Mail">
                </div>
                <div class="form-group">
                    <label>Reporting</label>
                    <div class="custom-select" data-name="reporting">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="daily">Täglich</div>
                                <div class="select-option" data-value="weekly">Wöchentlich</div>
                                <div class="select-option" data-value="monthly">Monatlich</div>
                                <div class="select-option" data-value="on-failure">Nur bei Fehlern</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Alarm-E-Mail Empfänger</label>
                    <input type="text" id="alertemail" placeholder="z.B. backup-admins@example.com">
                </div>
                <div class="form-group">
                    <label>Log-Aufbewahrung</label>
                    <input type="text" id="logretention" placeholder="z.B. 90 Tage, 1 Jahr">
                </div>
            </div>
        </div>
    </div>

    <!-- Verantwortlichkeiten -->
    <div class="form-section collapsed">
        <div class="section-title">
            <span>Verantwortlichkeiten & Support</span>
            <span class="section-counter">0/3</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="form-row">
                <div class="form-group">
                    <label>Backup-Administrator</label>
                    <input type="text" id="backupadmin" placeholder="z.B. IT-Team, Max Mustermann">
                </div>
                <div class="form-group">
                    <label>Support-Vertrag</label>
                    <div class="custom-select" data-name="supportcontract">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="24-7">24/7 Support</div>
                                <div class="select-option" data-value="business-hours">Business Hours</div>
                                <div class="select-option" data-value="basic">Basic Support</div>
                                <div class="select-option" data-value="none">Kein Support</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label>Support-Vertragsende</label>
                <input type="text" id="supportend" placeholder="z.B. 31.12.2025">
            </div>
        </div>
    </div>

    <!-- Notizen -->
    <div class="form-section collapsed">
        <div class="section-title">
            <span>Zusätzliche Informationen</span>
            <span class="section-counter">0/1</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="form-group">
                <label>Notizen / Besonderheiten</label>
                <textarea id="backupsystemnotes" rows="4" placeholder="Zusätzliche Informationen zum Backup-System, spezielle Konfigurationen, bekannte Einschränkungen..."></textarea>
            </div>
        </div>
    </div>

</form>
