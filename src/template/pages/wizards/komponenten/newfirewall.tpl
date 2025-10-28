<aside>
    <p>Assetmanagement</p>
    <i>›</i>
    <p>Komponenten</p>
    <i>›</i>
    <p>Neue Firewall anlegen</p>
</aside>

<form id="newFirewallForm">

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
                    <label>Firewall Name <span class="required">*</span></label>
                    <input type="text" id="fwname" required placeholder="z.B. FW-DMZ-01, Perimeter-Firewall">
                </div>
                <div class="form-group">
                    <label>Typ / Hersteller</label>
                    <div class="custom-select" data-name="fwtype">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="palo-alto">Palo Alto Networks</div>
                                <div class="select-option" data-value="fortinet">Fortinet FortiGate</div>
                                <div class="select-option" data-value="checkpoint">Check Point</div>
                                <div class="select-option" data-value="cisco-asa">Cisco ASA</div>
                                <div class="select-option" data-value="cisco-firepower">Cisco Firepower</div>
                                <div class="select-option" data-value="sophos">Sophos XG/XGS</div>
                                <div class="select-option" data-value="watchguard">WatchGuard</div>
                                <div class="select-option" data-value="juniper">Juniper SRX</div>
                                <div class="select-option" data-value="pfsense">pfSense</div>
                                <div class="select-option" data-value="opnsense">OPNsense</div>
                                <div class="select-option" data-value="azure-firewall">Azure Firewall</div>
                                <div class="select-option" data-value="aws-firewall">AWS Network Firewall</div>
                                <div class="select-option" data-value="other">Sonstige</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Modell / Version</label>
                    <input type="text" id="fwmodel" placeholder="z.B. PA-3220, FortiGate 200F, v9.1">
                </div>
                <div class="form-group">
                    <label>Seriennummer</label>
                    <input type="text" id="serialnumber" placeholder="z.B. SN123456789">
                </div>
            </div>
        </div>
    </div>

    <!-- Netzwerk-Konfiguration -->
    <div class="form-section collapsed">
        <div class="section-title">
            <span>Netzwerk-Konfiguration</span>
            <span class="section-counter">0/5</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="form-row">
                <div class="form-group">
                    <label>Management IP <span class="required">*</span></label>
                    <input type="text" id="fwmgmtip" required placeholder="z.B. 192.168.10.1">
                </div>
                <div class="form-group">
                    <label>Standort / Zone</label>
                    <input type="text" id="fwlocation" placeholder="z.B. Perimeter, DMZ, Internal">
                </div>
            </div>

            <div class="form-group">
                <label>Funktion</label>
                <div class="custom-select" data-name="fwfunction">
                    <div class="select-trigger">
                        <span class="placeholder">Bitte wählen</span>
                        <span class="arrow">▼</span>
                    </div>
                    <div class="select-dropdown">
                        <div class="select-options">
                            <div class="select-option" data-value="">Bitte wählen</div>
                            <div class="select-option" data-value="perimeter">Perimeter Firewall</div>
                            <div class="select-option" data-value="internal">Internal Segmentation</div>
                            <div class="select-option" data-value="dmz">DMZ Firewall</div>
                            <div class="select-option" data-value="datacenter">Datacenter Firewall</div>
                            <div class="select-option" data-value="ngfw">Next-Gen Firewall (NGFW)</div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="subsection-header">Netzwerk-Interfaces & Zonen</div>
            <div class="form-row">
                <div class="form-group">
                    <label>Externe Interface / IP</label>
                    <input type="text" id="externalif" placeholder="z.B. WAN, 203.0.113.1">
                    <div class="help-text">Public/Internet-facing Interface</div>
                </div>
                <div class="form-group">
                    <label>Interne Interface / IP</label>
                    <input type="text" id="internalif" placeholder="z.B. LAN, 10.0.0.1">
                    <div class="help-text">Internes Netzwerk Interface</div>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>DMZ Interface / IP</label>
                    <input type="text" id="dmzif" placeholder="z.B. DMZ, 172.16.0.1">
                </div>
                <div class="form-group">
                    <label>Weitere Zonen</label>
                    <input type="text" id="otherzones" placeholder="z.B. Guest, Management, VPN">
                </div>
            </div>
        </div>
    </div>

    <!-- Security Features -->
    <div class="form-section collapsed">
        <div class="section-title">
            <span>Security Features</span>
            <span class="section-counter">0/6</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="form-row">
                <div class="form-group">
                    <label>IPS/IDS</label>
                    <div class="custom-select" data-name="ips">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="enabled">Aktiviert (IPS)</div>
                                <div class="select-option" data-value="ids-only">IDS Only (Detection)</div>
                                <div class="select-option" data-value="disabled">Nicht aktiviert</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>Application Control</label>
                    <div class="custom-select" data-name="appcontrol">
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
                    <label>URL Filtering</label>
                    <div class="custom-select" data-name="urlfilter">
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
                    <label>Anti-Malware / Virus Scan</label>
                    <div class="custom-select" data-name="antimalware">
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
                    <label>SSL/TLS Inspection</label>
                    <div class="custom-select" data-name="sslinspection">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="full">Full Inspection</div>
                                <div class="select-option" data-value="partial">Partial (Outbound only)</div>
                                <div class="select-option" data-value="disabled">Nicht aktiviert</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>DDoS Protection</label>
                    <div class="custom-select" data-name="ddos">
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
        </div>
    </div>

    <!-- High Availability -->
    <div class="form-section collapsed">
        <div class="section-title">
            <span>High Availability & Redundanz</span>
            <span class="section-counter">0/3</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="form-group">
                <label class="cluster-label">
                    <input type="checkbox" id="fw-ha-check">
                    <span>High Availability / Clustering aktiviert</span>
                </label>
            </div>

            <div id="fw-ha-config" style="display:none;">
                <div class="form-row">
                    <div class="form-group">
                        <label>HA-Modus</label>
                        <div class="custom-select" data-name="hamode">
                            <div class="select-trigger">
                                <span class="placeholder">Bitte wählen</span>
                                <span class="arrow">▼</span>
                            </div>
                            <div class="select-dropdown">
                                <div class="select-options">
                                    <div class="select-option" data-value="">Bitte wählen</div>
                                    <div class="select-option" data-value="active-passive">Active-Passive</div>
                                    <div class="select-option" data-value="active-active">Active-Active</div>
                                    <div class="select-option" data-value="cluster">Full Mesh Cluster</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Partner/Standby Firewall</label>
                        <input type="text" id="partnerfirewall" placeholder="z.B. FW-DMZ-02">
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Logging & Monitoring -->
    <div class="form-section collapsed">
        <div class="section-title">
            <span>Logging & Monitoring</span>
            <span class="section-counter">0/4</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="form-row">
                <div class="form-group">
                    <label>Log Level</label>
                    <div class="custom-select" data-name="loglevel">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="all">All Traffic (Allow + Deny)</div>
                                <div class="select-option" data-value="deny-only">Deny Only</div>
                                <div class="select-option" data-value="security-events">Security Events Only</div>
                                <div class="select-option" data-value="minimal">Minimal</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>SIEM Integration</label>
                    <input type="text" id="siem" placeholder="z.B. Splunk, QRadar, Syslog-Server">
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Log Retention (Tage)</label>
                    <input type="number" id="logretention" placeholder="z.B. 90, 365">
                </div>
                <div class="form-group">
                    <label>Monitoring / Alerting</label>
                    <input type="text" id="monitoring" placeholder="z.B. SNMP, Prometheus, E-Mail">
                </div>
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
                <textarea id="fwnotes" rows="4" placeholder="Zusätzliche Informationen zur Firewall, allgemeine Konfiguration, Change-Prozesse..."></textarea>
            </div>
        </div>
    </div>

</form>