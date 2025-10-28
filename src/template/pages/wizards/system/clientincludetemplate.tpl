<div class="entry-content">
    <!-- Client-Typ -->
    <div class="subsection-header">Client-Typ & Zugriffsbeschreibung</div>
    <div class="form-row">
        <div class="form-group">
            <label>Zugriffsbezeichnung <span class="required">*</span></label>
            <input type="text" name="clientaccessname" class="client-field" placeholder="z.B. Ärzte-Arbeitsplätze, Admin-Zugriff, Patient-Portal" required>
        </div>
        <div class="form-group">
            <label>Client-Typ <span class="required">*</span></label>
            <div class="custom-select" data-name="clienttype" data-index="0" data-category="client">
                <div class="select-trigger">
                    <span class="placeholder">Bitte wählen</span>
                    <span class="arrow">▼</span>
                </div>
                <div class="select-dropdown">
                    <div class="select-options">
                        <div class="select-option" data-value="">Bitte wählen</div>
                        <div class="select-group-header">Web-basiert</div>
                        <div class="select-option" data-value="web-browser">Web Browser (HTML5)</div>
                        <div class="select-option" data-value="mobile-browser">Mobile Browser (Responsive)</div>
                        <div class="select-option" data-value="pwa">Progressive Web App (PWA)</div>
                        <div class="select-group-header">Native Desktop</div>
                        <div class="select-option" data-value="windows-client">Windows Client (Native)</div>
                        <div class="select-option" data-value="macos-client">macOS Client (Native)</div>
                        <div class="select-option" data-value="linux-client">Linux Client (Native)</div>
                        <div class="select-option" data-value="cross-platform">Cross-Platform Desktop (Electron, etc.)</div>
                        <div class="select-group-header">Mobile Apps</div>
                        <div class="select-option" data-value="ios-app">iOS App (Native)</div>
                        <div class="select-option" data-value="android-app">Android App (Native)</div>
                        <div class="select-option" data-value="mobile-hybrid">Mobile Hybrid App</div>
                        <div class="select-group-header">Spezielle Clients</div>
                        <div class="select-option" data-value="thick-client">Thick Client / Fat Client</div>
                        <div class="select-option" data-value="thin-client">Thin Client / Zero Client</div>
                        <div class="select-option" data-value="citrix">Citrix Virtual Apps</div>
                        <div class="select-option" data-value="rdp">Remote Desktop (RDP)</div>
                        <div class="select-option" data-value="terminal-services">Terminal Services</div>
                        <div class="select-option" data-value="api-client">API Client / Integration</div>
                        <div class="select-option" data-value="embedded">Embedded Client (Medizingerät, etc.)</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="form-row">
        <div class="form-group">
            <label>Betriebssystem(e)</label>
            <input type="text" name="clientos" class="client-field" placeholder="z.B. Windows 10/11, macOS 13+, iOS 16+">
        </div>
        <div class="form-group">
            <label>Anzahl Clients (ca.)</label>
            <input type="number" name="clientcount" class="client-field" placeholder="z.B. 50, 200, 1000">
        </div>
    </div>

    <!-- Zugriffsmethode & Protokoll -->
    <div class="subsection-header">Zugriffsmethode & Protokoll</div>
    <div class="form-row">
        <div class="form-group">
            <label>Zugriffsprotokoll <span class="required">*</span></label>
            <div class="custom-select" data-name="accessprotocol" data-index="0" data-category="client">
                <div class="select-trigger">
                    <span class="placeholder">Bitte wählen</span>
                    <span class="arrow">▼</span>
                </div>
                <div class="select-dropdown">
                    <div class="select-options">
                        <div class="select-option" data-value="">Bitte wählen</div>
                        <div class="select-group-header">Web-Protokolle</div>
                        <div class="select-option" data-value="https">HTTPS / HTTP (Web)</div>
                        <div class="select-option" data-value="websocket">WebSocket / WSS</div>
                        <div class="select-option" data-value="webrtc">WebRTC</div>
                        <div class="select-group-header">Netzwerk-Protokolle</div>
                        <div class="select-option" data-value="tcp-custom">TCP (Custom Protocol)</div>
                        <div class="select-option" data-value="udp-custom">UDP (Custom Protocol)</div>
                        <div class="select-option" data-value="grpc">gRPC</div>
                        <div class="select-option" data-value="soap">SOAP / XML-RPC</div>
                        <div class="select-option" data-value="rest-api">REST API</div>
                        <div class="select-option" data-value="graphql">GraphQL</div>
                        <div class="select-group-header">Remote Access</div>
                        <div class="select-option" data-value="rdp">RDP (Remote Desktop Protocol)</div>
                        <div class="select-option" data-value="ica">ICA (Citrix)</div>
                        <div class="select-option" data-value="vnc">VNC</div>
                        <div class="select-option" data-value="ssh">SSH / SSH Tunnel</div>
                        <div class="select-group-header">Datenbank</div>
                        <div class="select-option" data-value="odbc">ODBC</div>
                        <div class="select-option" data-value="jdbc">JDBC</div>
                        <div class="select-option" data-value="db-native">Native DB Protocol (TDS, OCI, etc.)</div>
                        <div class="select-group-header">Messaging</div>
                        <div class="select-option" data-value="mqtt">MQTT</div>
                        <div class="select-option" data-value="amqp">AMQP / RabbitMQ</div>
                        <div class="select-option" data-value="stomp">STOMP</div>
                        <div class="select-group-header">Medizinische Protokolle</div>
                        <div class="select-option" data-value="hl7">HL7 / MLLP</div>
                        <div class="select-option" data-value="dicom">DICOM</div>
                        <div class="select-option" data-value="fhir">FHIR (REST)</div>
                        <div class="select-option" data-value="other">Sonstige</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label>Port(s)</label>
            <input type="text" name="clientport" class="client-field" placeholder="z.B. 443, 8080, 3389, 1433">
        </div>
    </div>

    <div class="form-row">
        <div class="form-group">
            <label>Verschlüsselung</label>
            <div class="custom-select" data-name="clientencryption" data-index="0" data-category="client">
                <div class="select-trigger">
                    <span class="placeholder">Bitte wählen</span>
                    <span class="arrow">▼</span>
                </div>
                <div class="select-dropdown">
                    <div class="select-options">
                        <div class="select-option" data-value="">Bitte wählen</div>
                        <div class="select-option" data-value="tls13">TLS 1.3</div>
                        <div class="select-option" data-value="tls12">TLS 1.2</div>
                        <div class="select-option" data-value="ssl-tls">SSL/TLS (gemischt)</div>
                        <div class="select-option" data-value="vpn">VPN-verschlüsselt</div>
                        <div class="select-option" data-value="ssh">SSH-verschlüsselt</div>
                        <div class="select-option" data-value="application">Application-Level Encryption</div>
                        <div class="select-option" data-value="none">Keine / Unverschlüsselt</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label>Authentifizierung</label>
            <div class="custom-select" data-name="clientauth" data-index="0" data-category="client">
                <div class="select-trigger">
                    <span class="placeholder">Bitte wählen</span>
                    <span class="arrow">▼</span>
                </div>
                <div class="select-dropdown">
                    <div class="select-options">
                        <div class="select-option" data-value="">Bitte wählen</div>
                        <div class="select-option" data-value="sso">Single Sign-On (SSO)</div>
                        <div class="select-option" data-value="saml">SAML 2.0</div>
                        <div class="select-option" data-value="oauth">OAuth 2.0 / OpenID Connect</div>
                        <div class="select-option" data-value="ad">Active Directory / LDAP</div>
                        <div class="select-option" data-value="mfa">Multi-Faktor-Authentifizierung</div>
                        <div class="select-option" data-value="cert">Zertifikatsbasiert</div>
                        <div class="select-option" data-value="smartcard">Smartcard / eGK</div>
                        <div class="select-option" data-value="kerberos">Kerberos</div>
                        <div class="select-option" data-value="basic">Username / Password</div>
                        <div class="select-option" data-value="api-key">API Key / Token</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Verbindungsziel -->
    <div class="subsection-header">Verbindungsziel & Routing</div>
    <div class="form-group">
        <label>Verbindungsziel <span class="required">*</span></label>
        <div class="custom-select" data-name="connectiontarget" data-index="0" data-category="client">
            <div class="select-trigger">
                <span class="placeholder">Bitte wählen</span>
                <span class="arrow">▼</span>
            </div>
            <div class="select-dropdown">
                <div class="select-options">
                    <div class="select-option" data-value="">Bitte wählen</div>
                    <div class="select-option" data-value="loadbalancer">Load Balancer (HA)</div>
                    <div class="select-option" data-value="vm-direct">Direkt zu VM(s)</div>
                    <div class="select-option" data-value="hardware-direct">Direkt zu Hardware Server(n)</div>
                    <div class="select-option" data-value="reverse-proxy">Reverse Proxy</div>
                    <div class="select-option" data-value="api-gateway">API Gateway</div>
                    <div class="select-option" data-value="cloud-service">Cloud Service Endpoint</div>
                </div>
            </div>
        </div>
    </div>

    <!-- Load Balancer Selection (conditional) -->
    <div class="client-lb-config">
        <div class="form-group">
            <label>Verwendeter Load Balancer</label>
            <div class="custom-select" data-name="targetloadbalancer" data-index="0" data-category="client">
                <div class="select-trigger">
                    <span class="placeholder">Wählen Sie einen Load Balancer</span>
                    <span class="arrow">▼</span>
                </div>
                <div class="select-dropdown">
                    <div class="select-options">
                        <div class="select-option" data-value="">Bitte wählen</div>
                        <!-- Will be populated dynamically from loadbalancer entries -->
                    </div>
                </div>
            </div>
            <div class="help-text">Wird automatisch aus angelegten Load Balancern befüllt</div>
        </div>
    </div>

    <!-- VM/Server Selection (conditional) -->
    <div class="client-server-config">
        <div class="form-group">
            <label>Ziel VMs / Server</label>
            <div class="help-text">Wählen Sie die VMs oder Server aus, zu denen direkt verbunden wird</div>
            <div class="host-assignment-box">
                <div class="host-assignment" data-hostlist>
                    <div class="help-text">Keine Hosts verfügbar. Fügen Sie zuerst VMs oder Hardware Server hinzu.</div>
                </div>
            </div>
        </div>
    </div>

    <div class="form-row">
        <div class="form-group">
            <label>Zugriffs-URL / Adresse</label>
            <input type="text" name="accessurl" class="client-field" placeholder="z.B. https://kis.klinik.de, kis-client.local">
        </div>
        <div class="form-group">
            <label>DNS Name</label>
            <input type="text" name="dnsname" class="client-field" placeholder="z.B. kis.klinik.de">
        </div>
    </div>

    <!-- Software & Installation -->
    <div class="subsection-header">Client-Software & Installation</div>
    <div class="form-row">
        <div class="form-group">
            <label>Client-Software / App</label>
            <input type="text" name="clientsoftware" class="client-field" placeholder="z.B. KIS Client 5.2, Google Chrome, Orbis App">
        </div>
        <div class="form-group">
            <label>Installations-Methode</label>
            <div class="custom-select" data-name="installmethod" data-index="0" data-category="client">
                <div class="select-trigger">
                    <span class="placeholder">Bitte wählen</span>
                    <span class="arrow">▼</span>
                </div>
                <div class="select-dropdown">
                    <div class="select-options">
                        <div class="select-option" data-value="">Bitte wählen</div>
                        <div class="select-option" data-value="no-install">Keine Installation (Browser)</div>
                        <div class="select-option" data-value="msi">MSI Paket (Windows)</div>
                        <div class="select-option" data-value="exe">EXE Installer</div>
                        <div class="select-option" data-value="dmg">DMG / PKG (macOS)</div>
                        <div class="select-option" data-value="deb-rpm">DEB / RPM (Linux)</div>
                        <div class="select-option" data-value="appstore">App Store / Play Store</div>
                        <div class="select-option" data-value="sccm">SCCM / Intune</div>
                        <div class="select-option" data-value="group-policy">Group Policy Deployment</div>
                        <div class="select-option" data-value="citrix">Citrix Published App</div>
                        <div class="select-option" data-value="portable">Portable / No Installation</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="form-row">
        <div class="form-group">
            <label>Update-Mechanismus</label>
            <div class="custom-select" data-name="updatemechanism" data-index="0" data-category="client">
                <div class="select-trigger">
                    <span class="placeholder">Bitte wählen</span>
                    <span class="arrow">▼</span>
                </div>
                <div class="select-dropdown">
                    <div class="select-options">
                        <div class="select-option" data-value="">Bitte wählen</div>
                        <div class="select-option" data-value="auto">Automatische Updates</div>
                        <div class="select-option" data-value="manual">Manuelle Updates</div>
                        <div class="select-option" data-value="centralized">Zentral gesteuert (SCCM, etc.)</div>
                        <div class="select-option" data-value="browser">Browser-basiert (keine Updates)</div>
                        <div class="select-option" data-value="app-update">App Store Updates</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label>Lizenzierung</label>
            <div class="custom-select" data-name="clientlicensing" data-index="0" data-category="client">
                <div class="select-trigger">
                    <span class="placeholder">Bitte wählen</span>
                    <span class="arrow">▼</span>
                </div>
                <div class="select-dropdown">
                    <div class="select-options">
                        <div class="select-option" data-value="">Bitte wählen</div>
                        <div class="select-option" data-value="named-user">Named User</div>
                        <div class="select-option" data-value="concurrent">Concurrent User</div>
                        <div class="select-option" data-value="device">Device-basiert</div>
                        <div class="select-option" data-value="subscription">Subscription / SaaS</div>
                        <div class="select-option" data-value="site-license">Site License</div>
                        <div class="select-option" data-value="free">Kostenlos / Open Source</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Netzwerk & Performance -->
    <div class="subsection-header">Netzwerk & Performance</div>
    <div class="form-row">
        <div class="form-group">
            <label>Netzwerk-Segment</label>
            <input type="text" name="networksegment" class="client-field" placeholder="z.B. Intern (LAN), VPN, DMZ, Internet">
        </div>
        <div class="form-group">
            <label>Bandbreiten-Anforderung</label>
            <input type="text" name="bandwidth" class="client-field" placeholder="z.B. > 10 Mbit/s, 100 Mbit/s empfohlen">
        </div>
    </div>

    <div class="form-row">
        <div class="form-group">
            <label>Offline-Fähigkeit</label>
            <div class="custom-select" data-name="offlinecapability" data-index="0" data-category="client">
                <div class="select-trigger">
                    <span class="placeholder">Bitte wählen</span>
                    <span class="arrow">▼</span>
                </div>
                <div class="select-dropdown">
                    <div class="select-options">
                        <div class="select-option" data-value="">Bitte wählen</div>
                        <div class="select-option" data-value="full">Vollständig offline-fähig</div>
                        <div class="select-option" data-value="partial">Teilweise offline (Read-Only)</div>
                        <div class="select-option" data-value="cache">Caching / Sync</div>
                        <div class="select-option" data-value="none">Nur online nutzbar</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label>Session-Verwaltung</label>
            <div class="custom-select" data-name="sessionmanagement" data-index="0" data-category="client">
                <div class="select-trigger">
                    <span class="placeholder">Bitte wählen</span>
                    <span class="arrow">▼</span>
                </div>
                <div class="select-dropdown">
                    <div class="select-options">
                        <div class="select-option" data-value="">Bitte wählen</div>
                        <div class="select-option" data-value="persistent">Persistent (Keep-Alive)</div>
                        <div class="select-option" data-value="timeout">Timeout-basiert</div>
                        <div class="select-option" data-value="stateless">Stateless (Token-basiert)</div>
                        <div class="select-option" data-value="heartbeat">Heartbeat / Ping</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Besonderheiten & Anforderungen -->
    <div class="subsection-header">Besonderheiten & Anforderungen</div>
    <div class="form-row">
        <div class="form-group">
            <label>Benutzergruppe</label>
            <input type="text" name="usergroup" class="client-field" placeholder="z.B. Ärzte, Pflegepersonal, Verwaltung, IT-Support">
        </div>
        <div class="form-group">
            <label>Arbeitszeiten</label>
            <input type="text" name="workinghoursaccess" class="client-field" placeholder="z.B. 24/7, Mo-Fr 07:00-20:00">
        </div>
    </div>

    <div class="form-group">
        <label>System-Anforderungen (Client)</label>
        <textarea name="systemrequirements" class="client-field" rows="2" placeholder="z.B. Min. 8GB RAM, Windows 10, Browser: Chrome 90+, Bildschirmauflösung mind. 1920x1080"></textarea>
    </div>

    <div class="form-group">
        <label>Besondere Anforderungen</label>
        <textarea name="specialrequirements" class="client-field" rows="2" placeholder="z.B. Kartenleser für eGK, Barcode-Scanner, Drucker-Integration, Signatur-Pad"></textarea>
    </div>

    <!-- Notizen -->
    <div class="subsection-header">Zusätzliche Informationen</div>
    <div class="form-group">
        <label>Notizen / Zugriffsdetails</label>
        <textarea name="clientnotes" class="client-field" rows="3" placeholder="Zusätzliche Informationen zum Client-Zugriff, bekannte Probleme, Supporthinweise..."></textarea>
    </div>
</div>
