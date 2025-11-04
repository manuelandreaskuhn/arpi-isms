<aside>
    <p>Assetmanagement</p>
    <i>›</i>
    <p>Komponenten</p>
    <i>›</i>
    <p>Neues SIEM-System anlegen</p>
</aside>

<form id="newSIEMForm">

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
                    <label>
                        SIEM-System Name <span class="required">*</span>
                        <span class="help-icon" data-tooltip="siem-name">?</span>
                    </label>
                    <input type="text" id="siemname" required placeholder="z.B. SIEM-Prod, Security-Monitoring">
                </div>
                <div class="form-group">
                    <label>
                        SIEM-Software <span class="required">*</span>
                        <span class="help-icon" data-tooltip="siem-software">?</span>
                    </label>
                    <div class="custom-select" data-name="siemsoftware">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-group-header">Enterprise SIEM</div>
                                <div class="select-option" data-value="splunk">Splunk Enterprise Security</div>
                                <div class="select-option" data-value="qradar">IBM QRadar</div>
                                <div class="select-option" data-value="arcsight">Micro Focus ArcSight</div>
                                <div class="select-option" data-value="sentinel">Microsoft Sentinel</div>
                                <div class="select-option" data-value="logrhythm">LogRhythm</div>
                                <div class="select-option" data-value="securonix">Securonix</div>
                                <div class="select-group-header">Open Source SIEM</div>
                                <div class="select-option" data-value="elastic-siem">Elastic Security (SIEM)</div>
                                <div class="select-option" data-value="wazuh">Wazuh</div>
                                <div class="select-option" data-value="ossec">OSSEC</div>
                                <div class="select-option" data-value="alienvault">AlienVault OSSIM</div>
                                <div class="select-group-header">Cloud SIEM</div>
                                <div class="select-option" data-value="sumo-logic">Sumo Logic</div>
                                <div class="select-option" data-value="datadog">Datadog Security</div>
                                <div class="select-option" data-value="rapid7">Rapid7 InsightIDR</div>
                                <div class="select-option" data-value="other">Sonstige</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Version</label>
                    <input type="text" id="siemversion" placeholder="z.B. 9.1, 2024.1">
                </div>
                <div class="form-group">
                    <label>
                        Lizenzmodell
                        <span class="help-icon" data-tooltip="siem-license">?</span>
                    </label>
                    <div class="custom-select" data-name="siemlicensemodel">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="per-eps">Per EPS (Events per Second)</div>
                                <div class="select-option" data-value="per-gb">Per GB/Tag</div>
                                <div class="select-option" data-value="per-device">Per Device/Log Source</div>
                                <div class="select-option" data-value="per-user">Per User</div>
                                <div class="select-option" data-value="subscription">Subscription / SaaS</div>
                                <div class="select-option" data-value="perpetual">Perpetual</div>
                                <div class="select-option" data-value="free">Open Source / Kostenlos</div>
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
            <span>Infrastruktur & Deployment</span>
            <span class="section-counter">0/6</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="form-row">
                <div class="form-group">
                    <label>
                        Deployment-Typ
                        <span class="help-icon" data-tooltip="siem-deployment">?</span>
                    </label>
                    <div class="custom-select" data-name="siemdeployment">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="on-premise">On-Premise</div>
                                <div class="select-option" data-value="cloud">Cloud / SaaS</div>
                                <div class="select-option" data-value="hybrid">Hybrid</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>SIEM-Server <span class="required">*</span></label>
                    <div class="custom-select" data-name="siemserverid" data-component-type="vm,hardware">
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
                </div>
                <div class="form-group" id="siem-server-manual" style="display:none;">
                    <label>SIEM-Server (manuell)</label>
                    <input type="text" id="siemserver" placeholder="z.B. siem-01.example.com">
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Management-URL</label>
                    <input type="text" id="siemmgmturl" placeholder="z.B. https://siem.example.com">
                </div>
                <div class="form-group">
                    <label>IP-Adresse</label>
                    <input type="text" id="siemip" placeholder="z.B. 192.168.50.10">
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Betriebssystem</label>
                    <input type="text" id="siemos" placeholder="z.B. Linux RHEL 8, Windows Server 2022">
                </div>
                <div class="form-group">
                    <label>Standort</label>
                    <input type="text" id="siemlocation" placeholder="z.B. RZ1, SOC, Cloud">
                </div>
            </div>
        </div>
    </div>

    <!-- Log-Quellen & Integration -->
    <div class="form-section collapsed">
        <div class="section-title">
            <span>Log-Quellen & Integration</span>
            <span class="section-counter">0/4</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="form-row">
                <div class="form-group">
                    <label>Anzahl Log-Quellen</label>
                    <input type="number" id="siemlogsources" placeholder="z.B. 50, 200, 1000">
                </div>
                <div class="form-group">
                    <label>
                        Events per Second (EPS)
                        <span class="help-icon" data-tooltip="siem-eps">?</span>
                    </label>
                    <input type="number" id="siemeps" placeholder="z.B. 1000, 5000, 10000">
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Log-Volume pro Tag</label>
                    <input type="text" id="siemlogvolume" placeholder="z.B. 100 GB/Tag, 1 TB/Tag">
                </div>
                <div class="form-group">
                    <label>Storage-Kapazität</label>
                    <input type="text" id="siemstorage" placeholder="z.B. 10 TB, 50 TB">
                </div>
            </div>

            <div class="subsection-header">Log-Quellen Typen</div>
            <label>
                Integrierte Log-Quellen
                <span class="help-icon" data-tooltip="siem-logsources">?</span>
            </label>
            <div class="checkbox-group">
                <div class="checkbox-item">
                    <input type="checkbox" id="source-firewalls" name="logsources" value="firewalls">
                    <label for="source-firewalls">Firewalls</label>
                </div>
                <div class="checkbox-item">
                    <input type="checkbox" id="source-ids-ips" name="logsources" value="ids-ips">
                    <label for="source-ids-ips">IDS/IPS</label>
                </div>
                <div class="checkbox-item">
                    <input type="checkbox" id="source-servers" name="logsources" value="servers">
                    <label for="source-servers">Server (Windows/Linux)</label>
                </div>
                <div class="checkbox-item">
                    <input type="checkbox" id="source-ad" name="logsources" value="ad">
                    <label for="source-ad">Active Directory</label>
                </div>
                <div class="checkbox-item">
                    <input type="checkbox" id="source-databases" name="logsources" value="databases">
                    <label for="source-databases">Datenbanken</label>
                </div>
                <div class="checkbox-item">
                    <input type="checkbox" id="source-applications" name="logsources" value="applications">
                    <label for="source-applications">Anwendungen</label>
                </div>
                <div class="checkbox-item">
                    <input type="checkbox" id="source-network" name="logsources" value="network">
                    <label for="source-network">Netzwerkgeräte</label>
                </div>
                <div class="checkbox-item">
                    <input type="checkbox" id="source-endpoints" name="logsources" value="endpoints">
                    <label for="source-endpoints">Endpoints (EDR)</label>
                </div>
                <div class="checkbox-item">
                    <input type="checkbox" id="source-cloud" name="logsources" value="cloud">
                    <label for="source-cloud">Cloud Services</label>
                </div>
                <div class="checkbox-item">
                    <input type="checkbox" id="source-email" name="logsources" value="email">
                    <label for="source-email">E-Mail Security</label>
                </div>
            </div>
        </div>
    </div>

    <!-- Detection & Analytics -->
    <div class="form-section collapsed">
        <div class="section-title">
            <span>Detection & Analytics</span>
            <span class="section-counter">0/5</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="form-row">
                <div class="form-group">
                    <label>
                        Anzahl aktiver Use Cases
                        <span class="help-icon" data-tooltip="siem-usecases">?</span>
                    </label>
                    <input type="number" id="siemusecases" placeholder="z.B. 50, 100, 200">
                    <div class="help-text">Anzahl der konfigurierten Detection Rules / Use Cases</div>
                </div>
                <div class="form-group">
                    <label>Correlation Rules</label>
                    <input type="number" id="siemcorrelationrules" placeholder="z.B. 100, 500">
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>
                        Machine Learning / UEBA
                        <span class="help-icon" data-tooltip="siem-ueba">?</span>
                    </label>
                    <div class="custom-select" data-name="siemueba">
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
                        Threat Intelligence Integration
                        <span class="help-icon" data-tooltip="siem-threatintel">?</span>
                    </label>
                    <div class="custom-select" data-name="siemthreatintel">
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

            <div class="form-group">
                <label>Threat Intelligence Feeds</label>
                <input type="text" id="siemthreatfeeds" placeholder="z.B. MISP, AlienVault OTX, Commercial Feeds">
                <div class="help-text">Verwendete Threat Intelligence Quellen</div>
            </div>

            <div class="subsection-header">Detection Frameworks</div>
            <label>
                Verwendete Frameworks
                <span class="help-icon" data-tooltip="siem-mitre">?</span>
            </label>
            <div class="checkbox-group">
                <div class="checkbox-item">
                    <input type="checkbox" id="framework-mitre" name="frameworks" value="mitre">
                    <label for="framework-mitre">MITRE ATT&CK</label>
                </div>
                <div class="checkbox-item">
                    <input type="checkbox" id="framework-killchain" name="frameworks" value="killchain">
                    <label for="framework-killchain">Cyber Kill Chain</label>
                </div>
                <div class="checkbox-item">
                    <input type="checkbox" id="framework-nist" name="frameworks" value="nist">
                    <label for="framework-nist">NIST CSF</label>
                </div>
                <div class="checkbox-item">
                    <input type="checkbox" id="framework-sigma" name="frameworks" value="sigma">
                    <label for="framework-sigma">Sigma Rules</label>
                </div>
            </div>
        </div>
    </div>

    <!-- Incident Response & SOAR -->
    <div class="form-section collapsed">
        <div class="section-title">
            <span>Incident Response & SOAR</span>
            <span class="section-counter">0/4</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="form-row">
                <div class="form-group">
                    <label>Incident Management</label>
                    <input type="text" id="siemincidentmgmt" placeholder="z.B. Integriert, ServiceNow, TheHive">
                </div>
                <div class="form-group">
                    <label>Ticketing-System Integration</label>
                    <input type="text" id="siemticketing" placeholder="z.B. ServiceNow, Jira, TheHive">
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>
                        SOAR Integration
                        <span class="help-icon" data-tooltip="siem-soar">?</span>
                    </label>
                    <div class="custom-select" data-name="siemsoar">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="integrated">Integriert</div>
                                <div class="select-option" data-value="external">Externes SOAR</div>
                                <div class="select-option" data-value="none">Keine SOAR</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>SOAR-Plattform</label>
                    <input type="text" id="siemsoarplatform" placeholder="z.B. Splunk SOAR, Palo Alto XSOAR">
                </div>
            </div>
        </div>
    </div>

    <!-- Compliance & Reporting -->
    <div class="form-section collapsed">
        <div class="section-title">
            <span>Compliance & Reporting</span>
            <span class="section-counter">0/3</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="form-row">
                <div class="form-group">
                    <label>
                        Log-Retention (Tage)
                        <span class="help-icon" data-tooltip="siem-retention">?</span>
                    </label>
                    <input type="number" id="siemretention" placeholder="z.B. 90, 365, 2555">
                    <div class="help-text">Aufbewahrungsdauer der Logs in Tagen</div>
                </div>
                <div class="form-group">
                    <label>Archivierung</label>
                    <div class="custom-select" data-name="siemarchiving">
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

            <div class="subsection-header">Compliance-Frameworks</div>
            <label>Unterstützte Compliance-Standards</label>
            <div class="checkbox-group">
                <div class="checkbox-item">
                    <input type="checkbox" id="compliance-pci-dss" name="compliance" value="pci-dss">
                    <label for="compliance-pci-dss">PCI DSS</label>
                </div>
                <div class="checkbox-item">
                    <input type="checkbox" id="compliance-hipaa" name="compliance" value="hipaa">
                    <label for="compliance-hipaa">HIPAA</label>
                </div>
                <div class="checkbox-item">
                    <input type="checkbox" id="compliance-gdpr" name="compliance" value="gdpr">
                    <label for="compliance-gdpr">DSGVO / GDPR</label>
                </div>
                <div class="checkbox-item">
                    <input type="checkbox" id="compliance-iso27001" name="compliance" value="iso27001">
                    <label for="compliance-iso27001">ISO 27001</label>
                </div>
                <div class="checkbox-item">
                    <input type="checkbox" id="compliance-nist" name="compliance" value="nist">
                    <label for="compliance-nist">NIST</label>
                </div>
                <div class="checkbox-item">
                    <input type="checkbox" id="compliance-sox" name="compliance" value="sox">
                    <label for="compliance-sox">SOX</label>
                </div>
                <div class="checkbox-item">
                    <input type="checkbox" id="compliance-kritis" name="compliance" value="kritis">
                    <label for="compliance-kritis">KRITIS</label>
                </div>
            </div>
        </div>
    </div>

    <!-- Alerting & Notification -->
    <div class="form-section collapsed">
        <div class="section-title">
            <span>Alerting & Notification</span>
            <span class="section-counter">0/4</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="form-row">
                <div class="form-group">
                    <label>
                        Alert-Empfänger (E-Mail)
                        <span class="help-icon" data-tooltip="siem-alerting">?</span>
                    </label>
                    <input type="text" id="siemalertmail" placeholder="z.B. soc@example.com, security-team@example.com">
                </div>
                <div class="form-group">
                    <label>Alert-Frequenz (durchschnittlich)</label>
                    <input type="text" id="siemalertfreq" placeholder="z.B. 50/Tag, 200/Tag">
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Notification-Kanäle</label>
                    <div class="checkbox-group">
                        <div class="checkbox-item">
                            <input type="checkbox" id="notif-email" name="notifications" value="email">
                            <label for="notif-email">E-Mail</label>
                        </div>
                        <div class="checkbox-item">
                            <input type="checkbox" id="notif-sms" name="notifications" value="sms">
                            <label for="notif-sms">SMS</label>
                        </div>
                        <div class="checkbox-item">
                            <input type="checkbox" id="notif-slack" name="notifications" value="slack">
                            <label for="notif-slack">Slack</label>
                        </div>
                        <div class="checkbox-item">
                            <input type="checkbox" id="notif-teams" name="notifications" value="teams">
                            <label for="notif-teams">MS Teams</label>
                        </div>
                        <div class="checkbox-item">
                            <input type="checkbox" id="notif-webhook" name="notifications" value="webhook">
                            <label for="notif-webhook">Webhook</label>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>Dashboard-URL</label>
                    <input type="text" id="siemdashboard" placeholder="z.B. https://siem.example.com/dashboard">
                </div>
            </div>
        </div>
    </div>

    <!-- SOC Integration -->
    <div class="form-section collapsed">
        <div class="section-title">
            <span>SOC Integration & Team</span>
            <span class="section-counter">0/4</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="form-row">
                <div class="form-group">
                    <label>
                        SOC-Typ
                        <span class="help-icon" data-tooltip="siem-soc">?</span>
                    </label>
                    <div class="custom-select" data-name="soctype">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="internal">Internes SOC</div>
                                <div class="select-option" data-value="external">Externes SOC / MSSP</div>
                                <div class="select-option" data-value="hybrid">Hybrid</div>
                                <div class="select-option" data-value="none">Kein SOC</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>SOC-Betriebszeiten</label>
                    <div class="custom-select" data-name="sochours">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="24-7">24/7</div>
                                <div class="select-option" data-value="business">Business Hours (8x5)</div>
                                <div class="select-option" data-value="extended">Extended Hours</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>SOC-Verantwortlicher</label>
                    <input type="text" id="socresponsible" placeholder="z.B. Security-Team, CISO">
                </div>
                <div class="form-group">
                    <label>MSSP / Dienstleister</label>
                    <input type="text" id="mssp" placeholder="z.B. Externer SOC-Provider">
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
                    <label>SIEM-Administrator</label>
                    <input type="text" id="siemadmin" placeholder="z.B. Security-Team, SOC-Admin">
                </div>
                <div class="form-group">
                    <label>Support-Vertrag</label>
                    <div class="custom-select" data-name="siemsupport">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="24-7">24/7 Support</div>
                                <div class="select-option" data-value="business">Business Hours</div>
                                <div class="select-option" data-value="basic">Basic Support</div>
                                <div class="select-option" data-value="none">Kein Support</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label>Support-Kontakt</label>
                <input type="text" id="siemsupportcontact" placeholder="z.B. support@siem-vendor.com, Tel: +49...">
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
                <label>
                    Notizen / SIEM-Besonderheiten
                    <span class="help-icon" data-tooltip="siem-notes">?</span>
                </label>
                <textarea id="siemnotes" rows="4" placeholder="Zusätzliche Informationen zum SIEM-System, spezielle Konfigurationen, bekannte Limitierungen, geplante Erweiterungen..."></textarea>
            </div>
        </div>
    </div>

</form>

<!-- Include help tooltips -->
{{include:pages/wizards/komponenten/help/siem-help.tpl}}
