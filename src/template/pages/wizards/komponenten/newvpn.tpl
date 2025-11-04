<aside>
    <p>Assetmanagement</p>
    <i>›</i>
    <p>Komponenten</p>
    <i>›</i>
    <p>Neues VPN anlegen</p>
</aside>

<form id="newVPNForm">

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
                        VPN-Name <span class="required">*</span>
                        <span class="help-icon" data-tooltip="vpn-name">?</span>
                    </label>
                    <input type="text" id="vpnname" required placeholder="z.B. Corporate-VPN, Site-to-Site-Berlin">
                </div>
                <div class="form-group">
                    <label>
                        VPN-Typ <span class="required">*</span>
                        <span class="help-icon" data-tooltip="vpn-type">?</span>
                    </label>
                    <div class="custom-select" data-name="vpntype">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="remote-access">Remote Access VPN (Client-to-Site)</div>
                                <div class="select-option" data-value="site-to-site">Site-to-Site VPN</div>
                                <div class="select-option" data-value="mobile-vpn">Mobile VPN</div>
                                <div class="select-option" data-value="ssl-vpn">SSL VPN / Web VPN</div>
                                <div class="select-option" data-value="clientless">Clientless VPN / Portal</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>VPN-Zweck</label>
                    <div class="custom-select" data-name="vpnpurpose">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="employee-access">Mitarbeiter-Zugang</div>
                                <div class="select-option" data-value="admin-access">Administrator-Zugang</div>
                                <div class="select-option" data-value="partner-access">Partner/Lieferanten-Zugang</div>
                                <div class="select-option" data-value="site-connection">Standort-Verbindung</div>
                                <div class="select-option" data-value="cloud-connection">Cloud-Anbindung</div>
                                <div class="select-option" data-value="datacenter-connection">Rechenzentrum-Verbindung</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>Standort</label>
                    <input type="text" id="vpnlocation" placeholder="z.B. Hauptstandort, RZ1, AWS eu-central-1">
                </div>
            </div>
        </div>
    </div>

    <!-- VPN-Gateway & Infrastruktur -->
    <div class="form-section collapsed">
        <div class="section-title">
            <span>VPN-Gateway & Infrastruktur</span>
            <span class="section-counter">0/6</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="form-row">
                <div class="form-group">
                    <label>VPN-Gateway / Concentrator <span class="required">*</span></label>
                    <div class="custom-select" data-name="vpngatewayid" data-component-type="vm,hardware,firewall">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen (VM/Hardware/Firewall)</span>
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
                                <div class="select-group-header">Firewall-Komponenten</div>
                                <!-- Dynamic Firewall entries -->
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group" id="vpn-gateway-manual" style="display:none;">
                    <label>VPN-Gateway (manuell)</label>
                    <input type="text" id="vpngateway" required placeholder="z.B. vpn.example.com, vpn-gw-01">
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Gateway-Typ</label>
                    <div class="custom-select" data-name="gatewaytype">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="dedicated-appliance">Dedizierte Appliance</div>
                                <div class="select-option" data-value="firewall-integrated">Firewall-integriert</div>
                                <div class="select-option" data-value="software-gateway">Software Gateway</div>
                                <div class="select-option" data-value="cloud-gateway">Cloud VPN Gateway</div>
                                <div class="select-option" data-value="virtual-appliance">Virtual Appliance</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>
                        VPN-Software / Lösung
                        <span class="help-icon" data-tooltip="vpn-software">?</span>
                    </label>
                    <div class="custom-select" data-name="vpnsoftware">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-group-header">Enterprise VPN</div>
                                <div class="select-option" data-value="cisco-anyconnect">Cisco AnyConnect</div>
                                <div class="select-option" data-value="palo-alto-globalprotect">Palo Alto GlobalProtect</div>
                                <div class="select-option" data-value="fortinet-forticlient">Fortinet FortiClient VPN</div>
                                <div class="select-option" data-value="checkpoint">Check Point VPN</div>
                                <div class="select-option" data-value="sonicwall">SonicWall VPN</div>
                                <div class="select-option" data-value="juniper-pulse">Juniper Pulse Secure</div>
                                <div class="select-group-header">Cloud VPN</div>
                                <div class="select-option" data-value="aws-vpn">AWS VPN</div>
                                <div class="select-option" data-value="azure-vpn">Azure VPN Gateway</div>
                                <div class="select-option" data-value="gcp-vpn">Google Cloud VPN</div>
                                <div class="select-group-header">Open Source</div>
                                <div class="select-option" data-value="openvpn">OpenVPN</div>
                                <div class="select-option" data-value="wireguard">WireGuard</div>
                                <div class="select-option" data-value="strongswan">StrongSwan / IPsec</div>
                                <div class="select-option" data-value="softether">SoftEther VPN</div>
                                <div class="select-group-header">Windows / Microsoft</div>
                                <div class="select-option" data-value="windows-rras">Windows RRAS</div>
                                <div class="select-option" data-value="always-on-vpn">Always On VPN</div>
                                <div class="select-option" data-value="other">Sonstige</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>Version</label>
                    <input type="text" id="vpnversion" placeholder="z.B. 4.10, 2024.1">
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Öffentliche IP-Adresse</label>
                    <input type="text" id="vpnpublicip" placeholder="z.B. 203.0.113.10">
                </div>
                <div class="form-group">
                    <label>Management-URL</label>
                    <input type="text" id="vpnmgmturl" placeholder="z.B. https://vpn-admin.example.com">
                </div>
            </div>
        </div>
    </div>

    <!-- VPN-Protokoll & Verschlüsselung -->
    <div class="form-section collapsed">
        <div class="section-title">
            <span>VPN-Protokoll & Verschlüsselung</span>
            <span class="section-counter">0/6</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="form-row">
                <div class="form-group">
                    <label>
                        VPN-Protokoll <span class="required">*</span>
                        <span class="help-icon" data-tooltip="vpn-protocol">?</span>
                    </label>
                    <div class="custom-select" data-name="vpnprotocol">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="ipsec">IPsec (IKEv2)</div>
                                <div class="select-option" data-value="ipsec-ikev1">IPsec (IKEv1)</div>
                                <div class="select-option" data-value="ssl-tls">SSL/TLS VPN</div>
                                <div class="select-option" data-value="openvpn-tcp">OpenVPN (TCP)</div>
                                <div class="select-option" data-value="openvpn-udp">OpenVPN (UDP)</div>
                                <div class="select-option" data-value="wireguard">WireGuard</div>
                                <div class="select-option" data-value="l2tp-ipsec">L2TP/IPsec</div>
                                <div class="select-option" data-value="pptp">PPTP (unsicher!)</div>
                                <div class="select-option" data-value="sstp">SSTP</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>VPN-Port(s)</label>
                    <input type="text" id="vpnports" placeholder="z.B. UDP/500, UDP/4500, TCP/443">
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>
                        Verschlüsselungs-Algorithmus
                        <span class="help-icon" data-tooltip="vpn-encryption">?</span>
                    </label>
                    <div class="custom-select" data-name="encryptionalgo">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="aes-256-gcm">AES-256-GCM</div>
                                <div class="select-option" data-value="aes-256-cbc">AES-256-CBC</div>
                                <div class="select-option" data-value="aes-128-gcm">AES-128-GCM</div>
                                <div class="select-option" data-value="aes-128-cbc">AES-128-CBC</div>
                                <div class="select-option" data-value="chacha20-poly1305">ChaCha20-Poly1305</div>
                                <div class="select-option" data-value="3des">3DES (veraltet)</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>Hash-Algorithmus</label>
                    <div class="custom-select" data-name="hashalgo">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="sha-512">SHA-512</div>
                                <div class="select-option" data-value="sha-384">SHA-384</div>
                                <div class="select-option" data-value="sha-256">SHA-256</div>
                                <div class="select-option" data-value="sha-1">SHA-1 (schwach)</div>
                                <div class="select-option" data-value="md5">MD5 (unsicher)</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Diffie-Hellman Group</label>
                    <div class="custom-select" data-name="dhgroup">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="group-21">Group 21 (521-bit ECP)</div>
                                <div class="select-option" data-value="group-20">Group 20 (384-bit ECP)</div>
                                <div class="select-option" data-value="group-19">Group 19 (256-bit ECP)</div>
                                <div class="select-option" data-value="group-14">Group 14 (2048-bit)</div>
                                <div class="select-option" data-value="group-5">Group 5 (1536-bit)</div>
                                <div class="select-option" data-value="group-2">Group 2 (1024-bit, schwach)</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>Perfect Forward Secrecy (PFS)</label>
                    <div class="custom-select" data-name="pfs">
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

    <!-- Authentifizierung & Zugriffskontrolle -->
    <div class="form-section collapsed">
        <div class="section-title">
            <span>Authentifizierung & Zugriffskontrolle</span>
            <span class="section-counter">0/7</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="form-row">
                <div class="form-group">
                    <label>
                        Authentifizierungs-Methode <span class="required">*</span>
                        <span class="help-icon" data-tooltip="vpn-auth">?</span>
                    </label>
                    <div class="custom-select" data-name="authmethod">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="certificate">Zertifikat-basiert</div>
                                <div class="select-option" data-value="username-password">Benutzername/Passwort</div>
                                <div class="select-option" data-value="cert-and-password">Zertifikat + Passwort</div>
                                <div class="select-option" data-value="mfa">Multi-Faktor (MFA)</div>
                                <div class="select-option" data-value="psk">Pre-Shared Key (PSK)</div>
                                <div class="select-option" data-value="smartcard">Smartcard / PKI</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>MFA-Provider</label>
                    <input type="text" id="mfaprovider" placeholder="z.B. Duo Security, Microsoft Authenticator">
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Authentifizierungs-Backend</label>
                    <div class="custom-select" data-name="authbackend">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="ad">Active Directory</div>
                                <div class="select-option" data-value="ldap">LDAP</div>
                                <div class="select-option" data-value="radius">RADIUS</div>
                                <div class="select-option" data-value="saml">SAML / SSO</div>
                                <div class="select-option" data-value="local">Lokale Datenbank</div>
                                <div class="select-option" data-value="azure-ad">Azure AD / Entra ID</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>RADIUS-Server</label>
                    <input type="text" id="radiusserver" placeholder="z.B. radius.example.com, 192.168.1.50">
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Zertifizierungsstelle (CA)</label>
                    <input type="text" id="vpnca" placeholder="z.B. Corporate-CA, Let's Encrypt">
                </div>
                <div class="form-group">
                    <label>Zertifikat-Gültigkeit</label>
                    <input type="text" id="certvalidity" placeholder="z.B. 1 Jahr, 2 Jahre">
                </div>
            </div>

            <div class="subsection-header">Benutzergruppen & Rollen</div>
            <div class="form-group">
                <label>Definierte Benutzergruppen</label>
                <textarea id="usergroups" rows="3" placeholder="z.B. VPN-Admins, VPN-Standard-Users, VPN-Partner, VPN-Developers"></textarea>
                <div class="help-text">Listen Sie die konfigurierten Benutzergruppen auf (eine pro Zeile oder kommagetrennt)</div>
            </div>
        </div>
    </div>

    <!-- IP-Adressierung & Routing -->
    <div class="form-section collapsed">
        <div class="section-title">
            <span>IP-Adressierung & Routing</span>
            <span class="section-counter">0/5</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="form-row">
                <div class="form-group">
                    <label>VPN-IP-Pool (CIDR) <span class="required">*</span></label>
                    <input type="text" id="vpnippool" required placeholder="z.B. 10.8.0.0/24, 172.20.0.0/16">
                </div>
                <div class="form-group">
                    <label>IP-Pool Größe</label>
                    <input type="text" id="ippoolsize" placeholder="z.B. 254 IPs, 1024 IPs">
                    <div class="help-text">Anzahl verfügbarer IP-Adressen</div>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>DNS-Server (Primary)</label>
                    <input type="text" id="vpndns1" placeholder="z.B. 10.0.0.10, 8.8.8.8">
                </div>
                <div class="form-group">
                    <label>DNS-Server (Secondary)</label>
                    <input type="text" id="vpndns2" placeholder="z.B. 10.0.0.11, 8.8.4.4">
                </div>
            </div>

            <div class="subsection-header">Routing-Konfiguration</div>
            <div class="form-row">
                <div class="form-group">
                    <label>
                        Routing-Modus
                        <span class="help-icon" data-tooltip="vpn-routing-mode">?</span>
                    </label>
                    <div class="custom-select" data-name="routingmode">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="full-tunnel">Full Tunnel (gesamter Traffic)</div>
                                <div class="select-option" data-value="split-tunnel">Split Tunnel (nur Firmen-Traffic)</div>
                                <div class="select-option" data-value="inverse-split">Inverse Split Tunnel</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>Erlaubte Netzwerke / Routen</label>
                    <input type="text" id="allowednetworks" placeholder="z.B. 10.0.0.0/8, 172.16.0.0/12">
                </div>
            </div>

            <div class="form-group">
                <label>DNS-Suffix / Suchdomänen</label>
                <input type="text" id="dnssuffix" placeholder="z.B. internal.example.com, corp.example.com">
            </div>
        </div>
    </div>

    <!-- Kapazität & Performance -->
    <div class="form-section collapsed">
        <div class="section-title">
            <span>Kapazität & Performance</span>
            <span class="section-counter">0/4</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="form-row">
                <div class="form-group">
                    <label>Maximale gleichzeitige Verbindungen</label>
                    <input type="number" id="maxconnections" placeholder="z.B. 50, 100, 500, 1000">
                </div>
                <div class="form-group">
                    <label>Lizenzierte Verbindungen</label>
                    <input type="number" id="licensedconnections" placeholder="z.B. 100, 250, 1000">
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Durchschnittliche aktive Nutzer</label>
                    <input type="number" id="avgactiveusers" placeholder="z.B. 30, 80, 200">
                </div>
                <div class="form-group">
                    <label>Peak-Nutzung (Spitzenlast)</label>
                    <input type="number" id="peakusers" placeholder="z.B. 45, 120, 350">
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Bandbreite pro Verbindung</label>
                    <input type="text" id="bandwidthperconnection" placeholder="z.B. 10 Mbit/s, unbegrenzt">
                </div>
                <div class="form-group">
                    <label>Gesamte VPN-Bandbreite</label>
                    <input type="text" id="totalbandwidth" placeholder="z.B. 1 Gbit/s, 100 Mbit/s">
                </div>
            </div>
        </div>
    </div>

    <!-- Sicherheits-Features -->
    <div class="form-section collapsed">
        <div class="section-title">
            <span>Sicherheits-Features</span>
            <span class="section-counter">0/8</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="subsection-header">Session-Sicherheit</div>
            <div class="form-row">
                <div class="form-group">
                    <label>Session Timeout (Idle)</label>
                    <input type="text" id="sessiontimeout" placeholder="z.B. 30 Minuten, 2 Stunden">
                </div>
                <div class="form-group">
                    <label>Maximale Session-Dauer</label>
                    <input type="text" id="maxsessionduration" placeholder="z.B. 8 Stunden, 24 Stunden">
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Automatische Trennung</label>
                    <div class="custom-select" data-name="autodisconnect">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="enabled">Aktiviert (bei Inaktivität)</div>
                                <div class="select-option" data-value="disabled">Deaktiviert</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>Reconnect erlaubt</label>
                    <div class="custom-select" data-name="reconnect">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="automatic">Automatisch</div>
                                <div class="select-option" data-value="manual">Nur manuell</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="subsection-header">Endpoint-Sicherheit</div>
            <div class="form-row">
                <div class="form-group">
                    <label>
                        Endpoint Compliance Check
                        <span class="help-icon" data-tooltip="vpn-compliance-check">?</span>
                    </label>
                    <div class="custom-select" data-name="compliancecheck">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="enabled">Aktiviert (Posture Check)</div>
                                <div class="select-option" data-value="disabled">Deaktiviert</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>Antivirus-Prüfung erforderlich</label>
                    <div class="custom-select" data-name="antiviruscheck">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="required">Erforderlich</div>
                                <div class="select-option" data-value="optional">Optional</div>
                                <div class="select-option" data-value="disabled">Nicht geprüft</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Firewall-Anforderung</label>
                    <div class="custom-select" data-name="firewallrequirement">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="required">Erforderlich</div>
                                <div class="select-option" data-value="optional">Optional</div>
                                <div class="select-option" data-value="disabled">Nicht geprüft</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>OS-Patch-Level Prüfung</label>
                    <div class="custom-select" data-name="ospatchcheck">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="strict">Strikt (aktuell erforderlich)</div>
                                <div class="select-option" data-value="moderate">Moderat (Warnung)</div>
                                <div class="select-option" data-value="disabled">Nicht geprüft</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="subsection-header">Traffic-Kontrolle</div>
            <div class="form-row">
                <div class="form-group">
                    <label>
                        Kill Switch / Drop-on-Disconnect
                        <span class="help-icon" data-tooltip="vpn-kill-switch">?</span>
                    </label>
                    <div class="custom-select" data-name="killswitch">
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
                    <label>
                        Always-On VPN
                        <span class="help-icon" data-tooltip="vpn-always-on">?</span>
                    </label>
                    <div class="custom-select" data-name="alwayson">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="enabled">Aktiviert</div>
                                <div class="select-option" data-value="optional">Optional</div>
                                <div class="select-option" data-value="disabled">Deaktiviert</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Traffic-Inspection / DPI</label>
                    <div class="custom-select" data-name="trafficinspection">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="enabled">Aktiviert (DPI)</div>
                                <div class="select-option" data-value="basic">Basic Inspection</div>
                                <div class="select-option" data-value="disabled">Deaktiviert</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>IPS/IDS Integration</label>
                    <div class="custom-select" data-name="ipsids">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="ips">IPS (Prevention)</div>
                                <div class="select-option" data-value="ids">IDS (Detection only)</div>
                                <div class="select-option" data-value="none">Keine</div>
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
            <span class="section-counter">0/5</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="form-row">
                <div class="form-group">
                    <label>
                        Logging-Level
                        <span class="help-icon" data-tooltip="vpn-logging">?</span>
                    </label>
                    <div class="custom-select" data-name="logginglevel">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="detailed">Detailliert (alle Events)</div>
                                <div class="select-option" data-value="normal">Normal (Connect/Disconnect)</div>
                                <div class="select-option" data-value="minimal">Minimal (nur Fehler)</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>Log-Retention</label>
                    <input type="text" id="logretention" placeholder="z.B. 90 Tage, 1 Jahr">
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>SIEM-Integration</label>
                    <input type="text" id="siemintegration" placeholder="z.B. Splunk, QRadar, Microsoft Sentinel">
                </div>
                <div class="form-group">
                    <label>Syslog-Server</label>
                    <input type="text" id="syslogserver" placeholder="z.B. syslog.example.com, 192.168.1.100">
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Monitoring-Tool</label>
                    <input type="text" id="monitoringtool" placeholder="z.B. PRTG, Nagios, Zabbix">
                </div>
                <div class="form-group">
                    <label>Geloggte Events</label>
                    <div class="checkbox-group">
                        <div class="checkbox-item">
                            <input type="checkbox" id="log-auth" value="authentication">
                            <label for="log-auth">Authentifizierung</label>
                        </div>
                        <div class="checkbox-item">
                            <input type="checkbox" id="log-connect" value="connections">
                            <label for="log-connect">Verbindungen</label>
                        </div>
                        <div class="checkbox-item">
                            <input type="checkbox" id="log-traffic" value="traffic">
                            <label for="log-traffic">Traffic</label>
                        </div>
                        <div class="checkbox-item">
                            <input type="checkbox" id="log-errors" value="errors">
                            <label for="log-errors">Fehler</label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Redundanz & Hochverfügbarkeit -->
    <div class="form-section collapsed">
        <div class="section-title">
            <span>Redundanz & Hochverfügbarkeit</span>
            <span class="section-counter">0/4</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="form-row">
                <div class="form-group">
                    <label>
                        Hochverfügbarkeit (HA)
                        <span class="help-icon" data-tooltip="vpn-ha">?</span>
                    </label>
                    <div class="custom-select" data-name="havpn">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="active-active">Active-Active</div>
                                <div class="select-option" data-value="active-passive">Active-Passive</div>
                                <div class="select-option" data-value="cluster">Cluster</div>
                                <div class="select-option" data-value="none">Keine HA</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>Sekundäres VPN-Gateway</label>
                    <div class="custom-select" data-name="secondarygatewayid" data-component-type="vm,hardware,firewall">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen oder manuell eingeben</span>
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
                                <div class="select-group-header">Firewall-Komponenten</div>
                                <!-- Dynamic Firewall entries -->
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group" id="secondary-gateway-manual" style="display:none;">
                    <label>Sekundäres Gateway (manuell)</label>
                    <input type="text" id="secondarygateway" placeholder="z.B. vpn-backup.example.com">
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Failover-Zeit</label>
                    <input type="text" id="failovertime" placeholder="z.B. < 30 Sekunden, < 2 Minuten">
                </div>
                <div class="form-group">
                    <label>Load Balancing</label>
                    <div class="custom-select" data-name="loadbalancing">
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

    <!-- Compliance & Richtlinien -->
    <div class="form-section collapsed">
        <div class="section-title">
            <span>Compliance & Richtlinien</span>
            <span class="section-counter">0/3</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="form-row">
                <div class="form-group">
                    <label>Compliance-Anforderungen</label>
                    <div class="checkbox-group">
                        <div class="checkbox-item">
                            <input type="checkbox" id="comp-dsgvo" value="dsgvo">
                            <label for="comp-dsgvo">DSGVO</label>
                        </div>
                        <div class="checkbox-item">
                            <input type="checkbox" id="comp-hipaa" value="hipaa">
                            <label for="comp-hipaa">HIPAA</label>
                        </div>
                        <div class="checkbox-item">
                            <input type="checkbox" id="comp-pci" value="pci-dss">
                            <label for="comp-pci">PCI DSS</label>
                        </div>
                        <div class="checkbox-item">
                            <input type="checkbox" id="comp-iso27001" value="iso27001">
                            <label for="comp-iso27001">ISO 27001</label>
                        </div>
                        <div class="checkbox-item">
                            <input type="checkbox" id="comp-kritis" value="kritis">
                            <label for="comp-kritis">KRITIS</label>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Letzte Sicherheitsprüfung</label>
                    <input type="text" id="lastsecurityaudit" placeholder="z.B. Q3 2024, 15.09.2024">
                </div>
                <div class="form-group">
                    <label>Nächste geplante Prüfung</label>
                    <input type="text" id="nextsecurityaudit" placeholder="z.B. Q1 2025, 15.03.2025">
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
                    <label>VPN-Administrator</label>
                    <input type="text" id="vpnadmin" placeholder="z.B. Network-Team, VPN-Admins">
                </div>
                <div class="form-group">
                    <label>Support-Kontakt</label>
                    <input type="text" id="vpnsupport" placeholder="z.B. vpn-support@example.com, Tel: +49...">
                </div>
            </div>

            <div class="form-group">
                <label>Notfall-Kontakt (24/7)</label>
                <input type="text" id="emergencycontact" placeholder="z.B. +49-XXX-XXXX (On-Call)">
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
                    Notizen / VPN-Besonderheiten
                    <span class="help-icon" data-tooltip="vpn-notes">?</span>
                </label>
                <textarea id="vpnnotes" rows="4" placeholder="Zusätzliche Informationen zum VPN, spezielle Konfigurationen, bekannte Probleme, geplante Änderungen..."></textarea>
            </div>
        </div>
    </div>

</form>

<!-- Include help tooltips -->
{{include:pages/wizards/komponenten/help/vpn-help.tpl}}
