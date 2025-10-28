<aside>
    <p>Assetmanagement</p>
    <i>›</i>
    <p>Komponenten</p>
    <i>›</i>
    <p>Neuen Proxy-Server anlegen</p>
</aside>

<form id="newProxyForm">

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
                    <label>Proxy-Server Name <span class="required">*</span></label>
                    <input type="text" id="proxyname" required placeholder="z.B. Proxy-01, Corporate-Proxy">
                </div>
                <div class="form-group">
                    <label>Proxy-Server <span class="required">*</span></label>
                    <input type="text" id="proxyserver" required placeholder="z.B. proxy.example.com, 192.168.1.100">
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Proxy-Port <span class="required">*</span></label>
                    <input type="number" id="proxyport" required placeholder="z.B. 8080, 3128">
                </div>
                <div class="form-group">
                    <label>Standort</label>
                    <input type="text" id="proxylocation" placeholder="z.B. RZ1, DMZ, Cloud">
                </div>
            </div>
        </div>
    </div>

    <!-- Proxy-Typ & Protokoll -->
    <div class="form-section collapsed">
        <div class="section-title">
            <span>Proxy-Typ & Protokoll</span>
            <span class="section-counter">0/3</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="form-row">
                <div class="form-group">
                    <label>Proxy-Typ <span class="required">*</span></label>
                    <div class="custom-select" data-name="proxytype">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="http">HTTP Proxy</div>
                                <div class="select-option" data-value="https">HTTPS Proxy</div>
                                <div class="select-option" data-value="socks4">SOCKS4</div>
                                <div class="select-option" data-value="socks5">SOCKS5</div>
                                <div class="select-option" data-value="transparent">Transparent Proxy</div>
                                <div class="select-option" data-value="reverse">Reverse Proxy</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>Proxy-Protokoll</label>
                    <div class="custom-select" data-name="proxyprotocol">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="http-https">HTTP/HTTPS</div>
                                <div class="select-option" data-value="all">Alle Protokolle</div>
                                <div class="select-option" data-value="ftp">FTP</div>
                                <div class="select-option" data-value="custom">Benutzerdefiniert</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label>Proxy-Software</label>
                <div class="custom-select" data-name="proxysoftware">
                    <div class="select-trigger">
                        <span class="placeholder">Bitte wählen</span>
                        <span class="arrow">▼</span>
                    </div>
                    <div class="select-dropdown">
                        <div class="select-options">
                            <div class="select-option" data-value="">Bitte wählen</div>
                            <div class="select-option" data-value="squid">Squid Proxy</div>
                            <div class="select-option" data-value="nginx">Nginx</div>
                            <div class="select-option" data-value="haproxy">HAProxy</div>
                            <div class="select-option" data-value="apache">Apache mod_proxy</div>
                            <div class="select-option" data-value="bluecoat">Blue Coat ProxySG</div>
                            <div class="select-option" data-value="fortigate">Fortigate Web Proxy</div>
                            <div class="select-option" data-value="cisco-wsa">Cisco WSA</div>
                            <div class="select-option" data-value="zscaler">Zscaler</div>
                            <div class="select-option" data-value="other">Sonstige</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Authentifizierung -->
    <div class="form-section collapsed">
        <div class="section-title">
            <span>Authentifizierung</span>
            <span class="section-counter">0/3</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="form-row">
                <div class="form-group">
                    <label>Authentifizierung erforderlich</label>
                    <div class="custom-select" data-name="proxyauth">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="none">Keine</div>
                                <div class="select-option" data-value="basic">Basic Authentication</div>
                                <div class="select-option" data-value="ntlm">NTLM</div>
                                <div class="select-option" data-value="kerberos">Kerberos</div>
                                <div class="select-option" data-value="digest">Digest Authentication</div>
                                <div class="select-option" data-value="ldap">LDAP</div>
                                <div class="select-option" data-value="radius">RADIUS</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>Authentifizierungs-Backend</label>
                    <input type="text" id="proxyauthbackend" placeholder="z.B. Active Directory, LDAP-Server">
                </div>
            </div>

            <div class="form-group">
                <label>Dienstkonto / Service Account</label>
                <input type="text" id="proxyserviceaccount" placeholder="z.B. DOMAIN\proxy-service">
            </div>
        </div>
    </div>

    <!-- Proxy-Ausnahmen -->
    <div class="form-section collapsed">
        <div class="section-title">
            <span>Proxy-Ausnahmen (No Proxy)</span>
            <span class="section-counter">0/1</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="form-group">
                <label>Standard Ausnahmen / Bypass-Liste</label>
                <textarea id="proxyexceptions" rows="4" placeholder="z.B. localhost, 127.0.0.1, *.local, 10.0.0.0/8, internal.example.com"></textarea>
                <div class="help-text">Hosts oder Netzwerke, die den Proxy standardmäßig umgehen (kommagetrennt oder zeilenweise)</div>
            </div>
        </div>
    </div>

    <!-- Erweiterte Konfiguration -->
    <div class="form-section collapsed">
        <div class="section-title">
            <span>Erweiterte Konfiguration</span>
            <span class="section-counter">0/5</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="form-row">
                <div class="form-group">
                    <label>PAC-Datei (Proxy Auto-Config)</label>
                    <input type="text" id="proxypac" placeholder="z.B. http://proxy.example.com/proxy.pac">
                    <div class="help-text">URL zur automatischen Proxy-Konfigurationsdatei</div>
                </div>
                <div class="form-group">
                    <label>WPAD (Web Proxy Auto-Discovery)</label>
                    <div class="custom-select" data-name="proxywpad">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="enabled">Aktiviert</div>
                                <div class="select-option" data-value="disabled">Deaktiviert</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>SSL-Interception / HTTPS-Inspection</label>
                    <div class="custom-select" data-name="proxysslinterception">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="enabled">Aktiviert</div>
                                <div class="select-option" data-value="partial">Teilweise (Whitelist)</div>
                                <div class="select-option" data-value="disabled">Deaktiviert</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>SSL-Zertifikat</label>
                    <input type="text" id="proxysslcert" placeholder="z.B. Corporate-CA-Cert">
                    <div class="help-text">Für SSL-Interception erforderlich</div>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Proxy-Cache</label>
                    <div class="custom-select" data-name="proxycache">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="enabled">Aktiviert</div>
                                <div class="select-option" data-value="disabled">Deaktiviert</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>Cache-Größe</label>
                    <input type="text" id="proxycachesize" placeholder="z.B. 10GB, 50GB">
                </div>
            </div>
        </div>
    </div>

    <!-- Failover & Redundanz -->
    <div class="form-section collapsed">
        <div class="section-title">
            <span>Failover & Redundanz</span>
            <span class="section-counter">0/3</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="form-group">
                <label class="cluster-label">
                    <input type="checkbox" id="proxy-failover-check">
                    <span>Failover / Sekundärer Proxy konfiguriert</span>
                </label>
            </div>

            <div id="proxy-failover-config" style="display:none;">
                <div class="form-row">
                    <div class="form-group">
                        <label>Sekundärer Proxy-Server</label>
                        <input type="text" id="proxysecondary" placeholder="z.B. proxy-backup.example.com">
                    </div>
                    <div class="form-group">
                        <label>Sekundärer Proxy-Port</label>
                        <input type="number" id="proxysecondaryport" placeholder="z.B. 8080">
                    </div>
                </div>

                <div class="form-group">
                    <label>Failover-Mechanismus</label>
                    <div class="custom-select" data-name="proxyfailovermechanism">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="automatic">Automatisch</div>
                                <div class="select-option" data-value="manual">Manuell</div>
                                <div class="select-option" data-value="load-balanced">Load Balanced</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Filtering & Sicherheit -->
    <div class="form-section collapsed">
        <div class="section-title">
            <span>Filtering & Sicherheit</span>
            <span class="section-counter">0/4</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="form-row">
                <div class="form-group">
                    <label>URL-Filtering</label>
                    <div class="custom-select" data-name="proxyurlfiltering">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="enabled">Aktiviert</div>
                                <div class="select-option" data-value="disabled">Deaktiviert</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>Content-Filtering</label>
                    <div class="custom-select" data-name="proxycontentfiltering">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="enabled">Aktiviert</div>
                                <div class="select-option" data-value="disabled">Deaktiviert</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Malware-Scanning</label>
                    <div class="custom-select" data-name="proxymalwarescanning">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="enabled">Aktiviert</div>
                                <div class="select-option" data-value="disabled">Deaktiviert</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>DLP (Data Loss Prevention)</label>
                    <div class="custom-select" data-name="proxydlp">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="enabled">Aktiviert</div>
                                <div class="select-option" data-value="disabled">Deaktiviert</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Logging & Monitoring -->
    <div class="form-section collapsed">
        <div class="section-title">
            <span>Logging & Monitoring</span>
            <span class="section-counter">0/3</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="form-row">
                <div class="form-group">
                    <label>Access Logging</label>
                    <div class="custom-select" data-name="proxyaccesslog">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="full">Vollständig</div>
                                <div class="select-option" data-value="minimal">Minimal</div>
                                <div class="select-option" data-value="disabled">Deaktiviert</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>Log-Aufbewahrung</label>
                    <input type="text" id="proxylogretention" placeholder="z.B. 90 Tage, 1 Jahr">
                </div>
            </div>

            <div class="form-group">
                <label>Monitoring-Integration</label>
                <input type="text" id="proxymonitoring" placeholder="z.B. PRTG, Zabbix, Nagios">
            </div>
        </div>
    </div>

    <!-- Verantwortlichkeiten -->
    <div class="form-section collapsed">
        <div class="section-title">
            <span>Verantwortlichkeiten & Support</span>
            <span class="section-counter">0/2</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="form-row">
                <div class="form-group">
                    <label>Proxy-Administrator</label>
                    <input type="text" id="proxyadmin" placeholder="z.B. Netzwerk-Team, IT-Security">
                </div>
                <div class="form-group">
                    <label>Support-Kontakt</label>
                    <input type="text" id="proxysupport" placeholder="z.B. network-team@example.com">
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
                <label>Notizen / Proxy-Besonderheiten</label>
                <textarea id="proxynotes" rows="4" placeholder="Zusätzliche Informationen zum Proxy-Server, bekannte Probleme, spezielle Konfigurationen..."></textarea>
            </div>
        </div>
    </div>

</form>
