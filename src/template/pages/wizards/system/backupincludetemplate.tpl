<div class="entry-content">
    <!-- Backup-System Auswahl -->
    <div class="subsection-header">Backup-System Auswahl</div>
    <div class="form-group">
        <label>
            Backup-System <span class="required">*</span>
            <span class="help-icon" data-tooltip="backup-system">?</span>
        </label>
        <div class="custom-select" data-name="backupsystemid" data-index="0" data-category="backup">
            <div class="select-trigger">
                <span class="placeholder">Bitte wählen</span>
                <span class="arrow">▼</span>
            </div>
            <div class="select-dropdown">
                <div class="select-options">
                    <div class="select-option" data-value="">Bitte wählen</div>
                    <!-- Will be populated dynamically from backup system components -->
                    <div class="select-option" data-value="backup-1">Veeam-Prod (Veeam B&R)</div>
                    <div class="select-option" data-value="backup-2">Backup-Server-01 (Commvault)</div>
                </div>
            </div>
        </div>
        <div class="help-text">Wird aus angelegten Backup-System-Komponenten befüllt</div>
    </div>

    <!-- Backup-Job Konfiguration -->
    <div class="subsection-header">Backup-Job Konfiguration</div>
    <div class="form-row">
        <div class="form-group">
            <label>
                Job-Name
                <span class="help-icon" data-tooltip="job-name">?</span>
            </label>
            <input type="text" name="jobname" class="backup-field" placeholder="z.B. KIS-Daily-Backup, DB-Backup-Job">
        </div>
        <div class="form-group">
            <label>
                Backup-Typ
                <span class="help-icon" data-tooltip="backup-type">?</span>
            </label>
            <div class="custom-select" data-name="backuptype" data-index="0" data-category="backup">
                <div class="select-trigger">
                    <span class="placeholder">Bitte wählen</span>
                    <span class="arrow">▼</span>
                </div>
                <div class="select-dropdown">
                    <div class="select-options">
                        <div class="select-option" data-value="">Bitte wählen</div>
                        <div class="select-option" data-value="vm-image">VM Image Backup</div>
                        <div class="select-option" data-value="file-level">File-Level Backup</div>
                        <div class="select-option" data-value="database">Database Backup</div>
                        <div class="select-option" data-value="application">Application Backup</div>
                        <div class="select-option" data-value="bare-metal">Bare Metal Backup</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Zeitplan -->
    <div class="subsection-header">Backup-Zeitplan</div>
    <div class="form-row">
        <div class="form-group">
            <label>
                Frequenz
                <span class="help-icon" data-tooltip="frequency">?</span>
            </label>
            <div class="custom-select" data-name="frequency" data-index="0" data-category="backup">
                <div class="select-trigger">
                    <span class="placeholder">Bitte wählen</span>
                    <span class="arrow">▼</span>
                </div>
                <div class="select-dropdown">
                    <div class="select-options">
                        <div class="select-option" data-value="">Bitte wählen</div>
                        <div class="select-option" data-value="hourly">Stündlich</div>
                        <div class="select-option" data-value="daily">Täglich</div>
                        <div class="select-option" data-value="weekly">Wöchentlich</div>
                        <div class="select-option" data-value="monthly">Monatlich</div>
                        <div class="select-option" data-value="on-demand">On-Demand / Manuell</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label>
                Backup-Zeit
                <span class="help-icon" data-tooltip="backup-time">?</span>
            </label>
            <input type="text" name="backuptime" class="backup-field" placeholder="z.B. 02:00, 23:00-01:00">
        </div>
    </div>

    <div class="form-row">
        <div class="form-group">
            <label>
                Backup-Fenster (Stunden)
                <span class="help-icon" data-tooltip="backup-window">?</span>
            </label>
            <input type="number" name="backupwindow" class="backup-field" placeholder="z.B. 4, 8">
            <div class="help-text">Maximale Dauer für den Backup-Job</div>
        </div>
        <div class="form-group">
            <label>
                Backup-Tage
                <span class="help-icon" data-tooltip="backup-days">?</span>
            </label>
            <input type="text" name="backupdays" class="backup-field" placeholder="z.B. Mo-Fr, täglich, 1./15. des Monats">
        </div>
    </div>

    <!-- Aufbewahrungsrichtlinien -->
    <div class="subsection-header">
        Aufbewahrungsrichtlinien (Retention)
        <span class="help-icon" data-tooltip="retention-info">?</span>
    </div>
    <div class="form-row">
        <div class="form-group">
            <label>
                Retention - Täglich
                <span class="help-icon" data-tooltip="retention-daily">?</span>
            </label>
            <input type="number" name="retentiondaily" class="backup-field" placeholder="z.B. 7, 14, 30">
            <div class="help-text">Anzahl Tage</div>
        </div>
        <div class="form-group">
            <label>
                Retention - Wöchentlich
                <span class="help-icon" data-tooltip="retention-weekly">?</span>
            </label>
            <input type="number" name="retentionweekly" class="backup-field" placeholder="z.B. 4, 8, 12">
            <div class="help-text">Anzahl Wochen</div>
        </div>
    </div>

    <div class="form-row">
        <div class="form-group">
            <label>
                Retention - Monatlich
                <span class="help-icon" data-tooltip="retention-monthly">?</span>
            </label>
            <input type="number" name="retentionmonthly" class="backup-field" placeholder="z.B. 6, 12, 24">
            <div class="help-text">Anzahl Monate</div>
        </div>
        <div class="form-group">
            <label>
                Retention - Jährlich
                <span class="help-icon" data-tooltip="retention-yearly">?</span>
            </label>
            <input type="number" name="retentionyearly" class="backup-field" placeholder="z.B. 5, 7, 10">
            <div class="help-text">Anzahl Jahre</div>
        </div>
    </div>

    <!-- GFS Schema -->
    <div class="subsection-header">
        GFS (Grandfather-Father-Son) Schema
        <span class="help-icon" data-tooltip="gfs-schema">?</span>
    </div>
    <div class="form-group">
        <label>
            GFS Schema aktiviert
            <span class="help-icon" data-tooltip="gfs-enabled">?</span>
        </label>
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

    <div class="form-row">
        <div class="form-group">
            <label>
                GFS - Daily (Son)
                <span class="help-icon" data-tooltip="gfs-daily">?</span>
            </label>
            <input type="number" name="gfsdaily" class="backup-field" placeholder="z.B. 7">
        </div>
        <div class="form-group">
            <label>
                GFS - Weekly (Father)
                <span class="help-icon" data-tooltip="gfs-weekly">?</span>
            </label>
            <input type="number" name="gfsweekly" class="backup-field" placeholder="z.B. 4">
        </div>
    </div>

    <div class="form-row">
        <div class="form-group">
            <label>
                GFS - Monthly (Grandfather)
                <span class="help-icon" data-tooltip="gfs-monthly">?</span>
            </label>
            <input type="number" name="gfsmonthly" class="backup-field" placeholder="z.B. 12">
        </div>
        <div class="form-group">
            <label>
                GFS - Yearly
                <span class="help-icon" data-tooltip="gfs-yearly">?</span>
            </label>
            <input type="number" name="gfsyearly" class="backup-field" placeholder="z.B. 7">
        </div>
    </div>

    <!-- Recovery-Ziele -->
    <div class="subsection-header">
        Recovery-Ziele (SLA)
        <span class="help-icon" data-tooltip="recovery-sla">?</span>
    </div>
    <div class="form-row">
        <div class="form-group">
            <label>
                RPO (Recovery Point Objective)
                <span class="help-icon" data-tooltip="rpo">?</span>
            </label>
            <input type="text" name="rpo" class="backup-field" placeholder="z.B. 24h, 4h, 1h">
            <div class="help-text">Maximaler akzeptabler Datenverlust</div>
        </div>
        <div class="form-group">
            <label>
                RTO (Recovery Time Objective)
                <span class="help-icon" data-tooltip="rto">?</span>
            </label>
            <input type="text" name="rto" class="backup-field" placeholder="z.B. 4h, 8h, 24h">
            <div class="help-text">Maximale Wiederherstellungszeit</div>
        </div>
    </div>

    <!-- Backup-Verifizierung -->
    <div class="subsection-header">Backup-Verifizierung & Testing</div>
    <div class="form-row">
        <div class="form-group">
            <label>
                Automatische Verifizierung
                <span class="help-icon" data-tooltip="verification">?</span>
            </label>
            <div class="custom-select" data-name="verification" data-index="0" data-category="backup">
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
        <div class="form-group">
            <label>
                Letzter Restore-Test
                <span class="help-icon" data-tooltip="restore-test">?</span>
            </label>
            <input type="text" name="lastrestoretest" class="backup-field" placeholder="z.B. 15.11.2024, Q4 2024">
        </div>
    </div>

    <div class="form-group">
        <label>
            Test-Frequenz
            <span class="help-icon" data-tooltip="test-frequency">?</span>
        </label>
        <input type="text" name="testfrequency" class="backup-field" placeholder="z.B. quartalsweise, halbjährlich">
    </div>

    <!-- Betroffene Hosts -->
    <div class="subsection-header">Betroffene Hosts / Datenbanken</div>
    <div class="form-group">
        <label>Zugeordnete VMs / Server / Datenbanken</label>
        <div class="help-text">Wählen Sie die Komponenten aus, die von diesem Backup-Job gesichert werden</div>
        <div class="host-assignment-box">
            <div class="host-assignment" data-hostlist>
                <div class="help-text">Keine Hosts verfügbar. Fügen Sie zuerst VMs, Hardware Server oder Datenbanken hinzu.</div>
            </div>
        </div>
    </div>

    <!-- Notizen -->
    <div class="subsection-header">Zusätzliche Informationen</div>
    <div class="form-group">
        <label>Notizen / Backup-Details</label>
        <textarea name="backupnotes" class="backup-field" rows="3" placeholder="Zusätzliche Informationen zu diesem Backup-Job, Ausnahmen, spezielle Anforderungen..."></textarea>
    </div>
</div>

{{include:pages/wizards/system/help/backuphelp.tpl}}