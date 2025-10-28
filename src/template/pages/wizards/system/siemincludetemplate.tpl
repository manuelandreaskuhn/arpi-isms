<div class="entry-content">
    <!-- SIEM-Integration -->
    <div class="subsection-header">SIEM-Integration</div>
    <div class="form-group">
        <label class="cluster-label">
            <input type="checkbox" class="siem-enabled-check">
            <span>System ist an SIEM angebunden</span>
        </label>
    </div>

    <div class="siem-config" style="display:none;">
        <div class="form-group">
            <label>SIEM-System Komponente <span class="required">*</span></label>
            <div class="custom-select" data-name="siemid" data-index="0" data-category="siem">
                <div class="select-trigger">
                    <span class="placeholder">Bitte wählen</span>
                    <span class="arrow">▼</span>
                </div>
                <div class="select-dropdown">
                    <div class="select-options">
                        <div class="select-option" data-value="">Bitte wählen</div>
                        <div class="select-option" data-value="siem-1">SIEM-Prod (Splunk Enterprise Security)</div>
                        <div class="select-option" data-value="siem-2">Security-Monitoring (IBM QRadar)</div>
                    </div>
                </div>
            </div>
            <div class="help-text">Wird aus angelegten SIEM-Komponenten befüllt</div>
        </div>

        <div class="subsection-header">An SIEM angeschlossene Komponenten</div>
        <div class="form-group">
            <label>Welche VMs / Server senden Logs an das SIEM?</label>
            <div class="help-text">Wählen Sie die Komponenten aus, die Logs an das SIEM senden</div>
            <div class="host-assignment-box">
                <div class="siem-host-assignment" data-siem-hostlist>
                    <div class="help-text">Keine Hosts verfügbar. Fügen Sie zuerst VMs oder Hardware Server hinzu.</div>
                </div>
            </div>
        </div>

        <div class="subsection-header">Log-Quellen für dieses System</div>
        <label>Welche Logs werden an das SIEM gesendet?</label>
        <div class="checkbox-group">
            <div class="checkbox-item">
                <input type="checkbox" name="siemlogs" value="system-logs">
                <label>System-Logs (Syslog, Event Log)</label>
            </div>
            <div class="checkbox-item">
                <input type="checkbox" name="siemlogs" value="application-logs">
                <label>Application-Logs</label>
            </div>
            <div class="checkbox-item">
                <input type="checkbox" name="siemlogs" value="security-logs">
                <label>Security-Logs (Auth, Access)</label>
            </div>
            <div class="checkbox-item">
                <input type="checkbox" name="siemlogs" value="audit-logs">
                <label>Audit-Logs</label>
            </div>
            <div class="checkbox-item">
                <input type="checkbox" name="siemlogs" value="database-logs" class="siem-database-logs-check">
                <label>Datenbank-Logs</label>
            </div>
            <div class="checkbox-item">
                <input type="checkbox" name="siemlogs" value="network-logs">
                <label>Netzwerk-Logs</label>
            </div>
            <div class="checkbox-item">
                <input type="checkbox" name="siemlogs" value="firewall-logs">
                <label>Firewall-Logs</label>
            </div>
            <div class="checkbox-item">
                <input type="checkbox" name="siemlogs" value="web-logs">
                <label>Web-Server-Logs</label>
            </div>
        </div>

        <!-- Database Log Selection (conditional) -->
        <div class="siem-database-selection" style="display:none;">
            <div class="subsection-header">Datenbanken mit Log-Übertragung</div>
            <div class="form-group">
                <label>Welche Datenbanken senden Logs an das SIEM?</label>
                <div class="help-text">Wählen Sie die Datenbanken aus, deren Logs gesammelt werden</div>
                <div class="host-assignment-box">
                    <div class="siem-database-assignment" data-siem-dblist>
                        <div class="help-text">Keine Datenbanken verfügbar. Fügen Sie zuerst Datenbanken hinzu.</div>
                    </div>
                </div>
            </div>
        </div>

        <div class="subsection-header">Log-Übertragung</div>
        <div class="form-row">
            <div class="form-group">
                <label>Log-Transport-Protokoll</label>
                <div class="custom-select" data-name="siemlogprotocol" data-index="0" data-category="siem">
                    <div class="select-trigger">
                        <span class="placeholder">Bitte wählen</span>
                        <span class="arrow">▼</span>
                    </div>
                    <div class="select-dropdown">
                        <div class="select-options">
                            <div class="select-option" data-value="">Bitte wählen</div>
                            <div class="select-option" data-value="syslog">Syslog (UDP/TCP)</div>
                            <div class="select-option" data-value="syslog-tls">Syslog über TLS</div>
                            <div class="select-option" data-value="forwarder">SIEM Forwarder/Agent</div>
                            <div class="select-option" data-value="api">REST API</div>
                            <div class="select-option" data-value="file-collection">File Collection</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label>SIEM Collector / Forwarder</label>
                <input type="text" name="siemcollector" class="siem-field" placeholder="z.B. siem-forwarder-01, Heavy Forwarder">
            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <label>Log-Volume (täglich)</label>
                <input type="text" name="siemlogvolume" class="siem-field" placeholder="z.B. 500 MB/Tag, 5 GB/Tag">
            </div>
            <div class="form-group">
                <label>Events per Second (EPS)</label>
                <input type="number" name="siemeps" class="siem-field" placeholder="z.B. 10, 100, 1000">
            </div>
        </div>

        <div class="subsection-header">Detection & Use Cases</div>
        <div class="form-group">
            <label>Aktive Use Cases für dieses System</label>
            <textarea name="siemusecases" class="siem-field" rows="3" placeholder="z.B. Failed Login Detection, Privilege Escalation, Data Exfiltration, Anomaly Detection..."></textarea>
            <div class="help-text">Welche Detection Rules/Use Cases sind für dieses System konfiguriert?</div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <label>MITRE ATT&CK Coverage</label>
                <input type="text" name="siemmitrecoverage" class="siem-field" placeholder="z.B. Initial Access, Persistence, Lateral Movement">
                <div class="help-text">Abgedeckte MITRE ATT&CK Taktiken</div>
            </div>
            <div class="form-group">
                <label>Alert-Priorität</label>
                <div class="custom-select" data-name="siemalertpriority" data-index="0" data-category="siem">
                    <div class="select-trigger">
                        <span class="placeholder">Bitte wählen</span>
                        <span class="arrow">▼</span>
                    </div>
                    <div class="select-dropdown">
                        <div class="select-options">
                            <div class="select-option" data-value="">Bitte wählen</div>
                            <div class="select-option" data-value="critical">Critical (P1)</div>
                            <div class="select-option" data-value="high">High (P2)</div>
                            <div class="select-option" data-value="medium">Medium (P3)</div>
                            <div class="select-option" data-value="low">Low (P4)</div>
                            <div class="select-option" data-value="info">Informational</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="subsection-header">Alerting & Response</div>
        <div class="form-row">
            <div class="form-group">
                <label>Alert-Empfänger</label>
                <input type="text" name="siemalertrecipients" class="siem-field" placeholder="z.B. soc@example.com, security-team@example.com">
            </div>
            <div class="form-group">
                <label>Durchschnittliche Alert-Anzahl</label>
                <input type="text" name="siemalertcount" class="siem-field" placeholder="z.B. 5/Tag, 50/Woche">
            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <label>Incident Response Zeit (SLA)</label>
                <input type="text" name="siemresponsesla" class="siem-field" placeholder="z.B. 15min (Critical), 1h (High), 4h (Medium)">
            </div>
            <div class="form-group">
                <label>SOAR Integration</label>
                <div class="custom-select" data-name="siemsoar" data-index="0" data-category="siem">
                    <div class="select-trigger">
                        <span class="placeholder">Bitte wählen</span>
                        <span class="arrow">▼</span>
                    </div>
                    <div class="select-dropdown">
                        <div class="select-options">
                            <div class="select-option" data-value="">Bitte wählen</div>
                            <div class="select-option" data-value="integrated">Integriert</div>
                            <div class="select-option" data-value="manual">Manuelle Response</div>
                            <div class="select-option" data-value="none">Keine SOAR</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="subsection-header">Compliance & Retention</div>
        <div class="form-row">
            <div class="form-group">
                <label>Log-Retention für dieses System</label>
                <input type="text" name="siemretention" class="siem-field" placeholder="z.B. 90 Tage, 1 Jahr, 7 Jahre">
                <div class="help-text">Aufbewahrungsdauer der Logs im SIEM</div>
            </div>
            <div class="form-group">
                <label>Compliance-Anforderungen</label>
                <div class="checkbox-group">
                    <div class="checkbox-item">
                        <input type="checkbox" name="siemcompliance" value="dsgvo">
                        <label>DSGVO</label>
                    </div>
                    <div class="checkbox-item">
                        <input type="checkbox" name="siemcompliance" value="pci-dss">
                        <label>PCI DSS</label>
                    </div>
                    <div class="checkbox-item">
                        <input type="checkbox" name="siemcompliance" value="hipaa">
                        <label>HIPAA</label>
                    </div>
                    <div class="checkbox-item">
                        <input type="checkbox" name="siemcompliance" value="kritis">
                        <label>KRITIS</label>
                    </div>
                </div>
            </div>
        </div>

        <div class="subsection-header">Dashboard & Reporting</div>
        <div class="form-row">
            <div class="form-group">
                <label>SIEM-Dashboard URL</label>
                <input type="text" name="siemdashboard" class="siem-field" placeholder="z.B. https://siem.example.com/dashboard/kis-prod">
            </div>
            <div class="form-group">
                <label>Reporting-Frequenz</label>
                <div class="custom-select" data-name="siemreporting" data-index="0" data-category="siem">
                    <div class="select-trigger">
                        <span class="placeholder">Bitte wählen</span>
                        <span class="arrow">▼</span>
                    </div>
                    <div class="select-dropdown">
                        <div class="select-options">
                            <div class="select-option" data-value="">Bitte wählen</div>
                            <div class="select-option" data-value="real-time">Echtzeit</div>
                            <div class="select-option" data-value="daily">Täglich</div>
                            <div class="select-option" data-value="weekly">Wöchentlich</div>
                            <div class="select-option" data-value="monthly">Monatlich</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="subsection-header">Zusätzliche Informationen</div>
        <div class="form-group">
            <label>Systemspezifische SIEM-Notizen</label>
            <textarea name="siemnotes" class="siem-field" rows="3" placeholder="Besonderheiten der SIEM-Integration für dieses System, spezielle Filterregeln, bekannte False Positives..."></textarea>
        </div>
    </div>
</div>
