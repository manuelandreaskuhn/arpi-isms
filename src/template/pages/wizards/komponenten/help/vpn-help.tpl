<div class="tooltip-definitions" style="display: none;">
    <div data-tooltip-id="vpn-name">
        <strong>VPN-Name</strong>
        <p>Ein eindeutiger Name für Ihre VPN-Verbindung.</p>
        <p><strong>Was ist ein VPN?</strong> Virtual Private Network - ein verschlüsselter Tunnel durch unsichere Netzwerke (meist Internet).</p>
        <p><strong>Warum VPN wichtig ist:</strong></p>
        <ul>
            <li><strong>Sicherer Remote-Zugriff:</strong> Mitarbeiter im Home Office, unterwegs</li>
            <li><strong>Standort-Verbindung:</strong> Zweigstellen sicher mit Hauptstandort verbinden</li>
            <li><strong>Verschlüsselung:</strong> Daten geschützt über Internet übertragen</li>
            <li><strong>Zugriff auf interne Ressourcen:</strong> Als wäre man vor Ort im Büro</li>
        </ul>
        <p><strong>Namens-Beispiele:</strong></p>
        <ul>
            <li>"Corporate-VPN" - Mitarbeiter-VPN</li>
            <li>"Site-to-Site-Berlin" - Verbindung zum Standort Berlin</li>
            <li>"Admin-VPN" - VPN nur für Admins</li>
            <li>"Partner-VPN-Supplier-X" - VPN für externen Partner</li>
        </ul>
        <em>VPN ist essentiell für sicheres mobiles Arbeiten!</em>
    </div>

    <div data-tooltip-id="vpn-type">
        <strong>VPN-Typ</strong>
        <p>Die Art der VPN-Verbindung.</p>
        <p><strong>VPN-Typen erklärt:</strong></p>
        <ul>
            <li><strong>Remote Access VPN (Client-to-Site):</strong>
                <ul>
                    <li>Einzelne Benutzer verbinden sich</li>
                    <li>VPN-Client auf Laptop/PC nötig</li>
                    <li>Für Home Office, Außendienst</li>
                    <li><em>Häufigster Typ!</em></li>
                </ul>
            </li>
            <li><strong>Site-to-Site VPN:</strong>
                <ul>
                    <li>Verbindet zwei Standorte/Netzwerke</li>
                    <li>Immer aktiv (permanent)</li>
                    <li>Transparent für Endbenutzer</li>
                    <li>Z.B. Hauptsitz ↔ Zweigstelle</li>
                </ul>
            </li>
            <li><strong>Mobile VPN:</strong>
                <ul>
                    <li>Speziell für mobile Geräte</li>
                    <li>Hält Verbindung bei Netzwechsel</li>
                    <li>WLAN → Mobilfunk ohne Abbruch</li>
                </ul>
            </li>
            <li><strong>SSL VPN / Web VPN:</strong>
                <ul>
                    <li>Zugriff über Browser</li>
                    <li>Kein Client nötig</li>
                    <li>Gut für Partner/externe Nutzer</li>
                </ul>
            </li>
            <li><strong>Clientless VPN / Portal:</strong>
                <ul>
                    <li>Nur Web-Applikationen</li>
                    <li>Browser-basiert</li>
                    <li>Eingeschränkter Zugriff</li>
                </ul>
            </li>
        </ul>
        <em>Remote Access = für Benutzer, Site-to-Site = für Standorte</em>
    </div>

    <div data-tooltip-id="vpn-software">
        <strong>VPN-Software / Lösung</strong>
        <p>Welche VPN-Technologie wird verwendet?</p>
        <p><strong>VPN-Lösungen erklärt:</strong></p>
        <ul>
            <li><strong>Enterprise VPN (Commercial):</strong>
                <ul>
                    <li><strong>Cisco AnyConnect:</strong> Marktführer, sehr verbreitet</li>
                    <li><strong>Palo Alto GlobalProtect:</strong> Integriert mit Firewall</li>
                    <li><strong>Fortinet FortiClient:</strong> Teil von FortiGate</li>
                    <li><strong>Check Point, SonicWall:</strong> Etablierte Anbieter</li>
                    <li>Teuer, aber Enterprise-Support</li>
                </ul>
            </li>
            <li><strong>Cloud VPN:</strong>
                <ul>
                    <li><strong>AWS VPN, Azure VPN, Google Cloud VPN:</strong> Für Cloud-Anbindung</li>
                    <li>Managed Service</li>
                    <li>Gut für Hybrid Cloud</li>
                </ul>
            </li>
            <li><strong>Open Source:</strong>
                <ul>
                    <li><strong>OpenVPN:</strong> Sehr verbreitet, flexibel</li>
                    <li><strong>WireGuard:</strong> Modern, schnell, einfach</li>
                    <li><strong>StrongSwan:</strong> IPsec-Implementation</li>
                    <li>Kostenlos, aber selbst betreiben</li>
                </ul>
            </li>
            <li><strong>Windows / Microsoft:</strong>
                <ul>
                    <li><strong>Windows RRAS:</strong> In Windows Server eingebaut</li>
                    <li><strong>Always On VPN:</strong> Nachfolger von DirectAccess</li>
                    <li>Gut in Microsoft-Umgebungen</li>
                </ul>
            </li>
        </ul>
        <em>Cisco AnyConnect = Industrie-Standard, OpenVPN = flexible Alternative</em>
    </div>

    <div data-tooltip-id="vpn-protocol">
        <strong>VPN-Protokoll</strong>
        <p>Das verwendete Verschlüsselungs- und Tunneling-Protokoll.</p>
        <p><strong>VPN-Protokolle erklärt:</strong></p>
        <ul>
            <li><strong>IPsec (IKEv2):</strong>
                <ul>
                    <li>Moderner Standard</li>
                    <li>Sehr sicher</li>
                    <li>Gut für mobile Geräte (reconnect)</li>
                    <li><em>Empfohlen!</em></li>
                </ul>
            </li>
            <li><strong>IPsec (IKEv1):</strong>
                <ul>
                    <li>Ältere Version</li>
                    <li>Noch weit verbreitet</li>
                    <li>Weniger Features als IKEv2</li>
                </ul>
            </li>
            <li><strong>SSL/TLS VPN:</strong>
                <ul>
                    <li>Browser-basiert möglich</li>
                    <li>Läuft über HTTPS (Port 443)</li>
                    <li>Gut durch Firewalls</li>
                </ul>
            </li>
            <li><strong>OpenVPN:</strong>
                <ul>
                    <li>TCP oder UDP möglich</li>
                    <li>Sehr flexibel</li>
                    <li>Open Source</li>
                </ul>
            </li>
            <li><strong>WireGuard:</strong>
                <ul>
                    <li>Sehr modern, sehr schnell</li>
                    <li>Einfacher Code (weniger Bugs)</li>
                    <li>Zukunft des VPN</li>
                </ul>
            </li>
            <li><strong>L2TP/IPsec:</strong>
                <ul>
                    <li>Kombination aus L2TP + IPsec</li>
                    <li>Gut für ältere Systeme</li>
                    <li>Windows-nativ unterstützt</li>
                </ul>
            </li>
            <li><strong>PPTP:</strong>
                <ul>
                    <li>ALT und UNSICHER!</li>
                    <li>NICHT mehr verwenden</li>
                    <li>Nur für Legacy-Systeme</li>
                </ul>
            </li>
        </ul>
        <em>IPsec IKEv2 oder WireGuard = moderne Wahl, PPTP = niemals!</em>
    </div>

    <div data-tooltip-id="vpn-encryption">
        <strong>Verschlüsselungs-Algorithmus</strong>
        <p>Der Algorithmus zum Verschlüsseln der VPN-Daten.</p>
        <p><strong>Verschlüsselung erklärt:</strong></p>
        <ul>
            <li><strong>AES-256-GCM:</strong>
                <ul>
                    <li>Stärkste Verschlüsselung</li>
                    <li>GCM = Authentifizierung eingebaut</li>
                    <li>Sehr schnell (Hardware-beschleunigt)</li>
                    <li><em>Best Practice!</em></li>
                </ul>
            </li>
            <li><strong>AES-128-GCM:</strong>
                <ul>
                    <li>Auch sehr sicher</li>
                    <li>Etwas schneller als 256</li>
                    <li>Ausreichend für die meisten Fälle</li>
                </ul>
            </li>
            <li><strong>AES-CBC:</strong>
                <ul>
                    <li>Älterer Modus</li>
                    <li>Langsamer als GCM</li>
                    <li>Noch weit verbreitet</li>
                </ul>
            </li>
            <li><strong>ChaCha20-Poly1305:</strong>
                <ul>
                    <li>Alternative zu AES</li>
                    <li>Gut ohne Hardware-AES</li>
                    <li>Von WireGuard verwendet</li>
                </ul>
            </li>
            <li><strong>3DES:</strong>
                <ul>
                    <li>VERALTET!</li>
                    <li>Nicht mehr sicher genug</li>
                    <li>Nur für Legacy</li>
                </ul>
            </li>
        </ul>
        <em>AES-256-GCM = sicher und schnell, 3DES = nicht mehr verwenden!</em>
    </div>

    <div data-tooltip-id="vpn-auth">
        <strong>Authentifizierungs-Methode</strong>
        <p>Wie authentifizieren sich Benutzer beim VPN?</p>
        <p><strong>Auth-Methoden erklärt:</strong></p>
        <ul>
            <li><strong>Zertifikat-basiert:</strong>
                <ul>
                    <li>Digitales Zertifikat auf Client</li>
                    <li>Sehr sicher (2-Faktor: haben + wissen)</li>
                    <li>Keine Passwörter nötig</li>
                    <li>Verwaltung aufwendiger</li>
                    <li><em>Best Practice für Site-to-Site!</em></li>
                </ul>
            </li>
            <li><strong>Benutzername/Passwort:</strong>
                <ul>
                    <li>Einfachste Methode</li>
                    <li>Benutzer kennen es</li>
                    <li>Aber: Passwörter können kompromittiert werden</li>
                    <li>MFA unbedingt dazu!</li>
                </ul>
            </li>
            <li><strong>Zertifikat + Passwort:</strong>
                <ul>
                    <li>Kombination: Sehr sicher</li>
                    <li>Haben (Zertifikat) + Wissen (Passwort)</li>
                    <li>Etwas komplexer für Benutzer</li>
                </ul>
            </li>
            <li><strong>Multi-Faktor (MFA):</strong>
                <ul>
                    <li>Z.B. Passwort + SMS/App-Code</li>
                    <li>Sehr sicher gegen Phishing</li>
                    <li>Heute Standard!</li>
                    <li><em>Empfohlen für alle Remote-Access-VPNs</em></li>
                </ul>
            </li>
            <li><strong>Pre-Shared Key (PSK):</strong>
                <ul>
                    <li>Gemeinsames Geheimnis</li>
                    <li>Einfach, aber: ein PSK für alle</li>
                    <li>Nur für Site-to-Site OK</li>
                    <li>Nie für Benutzer-VPNs!</li>
                </ul>
            </li>
            <li><strong>Smartcard / PKI:</strong>
                <ul>
                    <li>Physische Chipkarte</li>
                    <li>Höchste Sicherheit</li>
                    <li>Teuer in Anschaffung/Verwaltung</li>
                </ul>
            </li>
        </ul>
        <em>MFA ist heute Pflicht - ohne = Sicherheitsrisiko!</em>
    </div>

    <div data-tooltip-id="vpn-routing-mode">
        <strong>Routing-Modus</strong>
        <p>Welcher Traffic geht durchs VPN?</p>
        <p><strong>Routing-Modi erklärt:</strong></p>
        <ul>
            <li><strong>Full Tunnel (gesamter Traffic):</strong>
                <ul>
                    <li>ALLE Internet-Verbindungen durch VPN</li>
                    <li>Auch YouTube, Netflix, etc.</li>
                    <li>Höchste Sicherheit</li>
                    <li>Aber: Mehr Last auf VPN</li>
                    <li><em>Best Practice für Compliance!</em></li>
                </ul>
            </li>
            <li><strong>Split Tunnel (nur Firmen-Traffic):</strong>
                <ul>
                    <li>Nur internes Firmen-Netz durch VPN</li>
                    <li>Internet direkt (ohne VPN)</li>
                    <li>Weniger Last auf VPN</li>
                    <li>Schneller für Benutzer</li>
                    <li>Aber: Benutzer nicht vollständig geschützt</li>
                </ul>
            </li>
            <li><strong>Inverse Split Tunnel:</strong>
                <ul>
                    <li>Alles durch VPN AUSSER bestimmte Sites</li>
                    <li>Z.B. Office 365 direkt</li>
                    <li>Kompromiss zwischen Full und Split</li>
                </ul>
            </li>
        </ul>
        <p><strong>Beispiel:</strong></p>
        <ul>
            <li>Full Tunnel: Mitarbeiter surft Google → durch Firmen-VPN → Firmen-Internet</li>
            <li>Split Tunnel: Mitarbeiter surft Google → direkt über sein privates WLAN</li>
        </ul>
        <em>Full Tunnel = sicherer, Split Tunnel = schneller</em>
    </div>

    <div data-tooltip-id="vpn-compliance-check">
        <strong>Endpoint Compliance Check (Posture Check)</strong>
        <p>Prüfung des Geräts vor VPN-Zugang.</p>
        <p><strong>Was ist Posture Check?</strong> VPN prüft Sicherheits-Zustand des Clients bevor Zugang gewährt wird.</p>
        <p><strong>Was wird geprüft:</strong></p>
        <ul>
            <li><strong>Antivirus:</strong> Ist installiert? Ist aktuell?</li>
            <li><strong>Firewall:</strong> Ist aktiviert?</li>
            <li><strong>OS Patches:</strong> Sind alle Updates installiert?</li>
            <li><strong>Festplatten-Verschlüsselung:</strong> BitLocker/FileVault aktiv?</li>
            <li><strong>Verbotene Software:</strong> Torrent-Clients, etc. vorhanden?</li>
        </ul>
        <p><strong>Wenn Check fehlschlägt:</strong></p>
        <ul>
            <li>VPN-Zugang verweigert ODER</li>
            <li>Nur eingeschränkter Zugang (z.B. nur Patch-Server)</li>
        </ul>
        <p><strong>Vorteil:</strong> Nur sichere Geräte im Firmennetz</p>
        <p><strong>Nachteil:</strong> Mehr Verwaltungsaufwand, User-Frustration wenn abgelehnt</p>
        <em>Compliance Check = wichtige Sicherheits-Schicht, aber braucht gute Kommunikation!</em>
    </div>

    <div data-tooltip-id="vpn-kill-switch">
        <strong>Kill Switch / Drop-on-Disconnect</strong>
        <p>Blockiert Internet wenn VPN abbricht.</p>
        <p><strong>Was ist Kill Switch?</strong> Wenn VPN-Verbindung abbricht → Internet wird sofort blockiert (kein "ungeschütztes Surfen").</p>
        <p><strong>Das Problem ohne Kill Switch:</strong></p>
        <ol>
            <li>Mitarbeiter verbunden mit VPN</li>
            <li>VPN bricht ab (schlechtes WLAN, etc.)</li>
            <li>Computer verbindet automatisch direkt mit Internet</li>
            <li>Mitarbeiter merkt es nicht</li>
            <li>Sensitive Daten gehen unverschlüsselt raus!</li>
        </ol>
        <p><strong>Mit Kill Switch:</strong> Internet wird sofort blockiert → Mitarbeiter merkt Problem → verbindet VPN neu</p>
        <p><strong>Nachteil:</strong> Bei VPN-Problemen = kein Internet (Frustration)</p>
        <em>Kill Switch ist Best Practice für Full-Tunnel-VPNs!</em>
    </div>

    <div data-tooltip-id="vpn-always-on">
        <strong>Always-On VPN</strong>
        <p>VPN baut sich automatisch auf - ohne User-Interaktion.</p>
        <p><strong>Was ist Always-On?</strong> VPN startet automatisch beim Booten und bleibt immer verbunden.</p>
        <p><strong>Vorteile:</strong></p>
        <ul>
            <li>Benutzer kann es nicht "vergessen"</li>
            <li>Kein manuelles Verbinden nötig</li>
            <li>Immer geschützt</li>
            <li>Gut für nicht-technische User</li>
        </ul>
        <p><strong>Nachteile:</strong></p>
        <ul>
            <li>Keine Privatsphäre (Firma sieht alles)</li>
            <li>Kann nicht ausgeschaltet werden</li>
            <li>Bei VPN-Problemen = kein Internet</li>
        </ul>
        <p><strong>Use Cases:</strong></p>
        <ul>
            <li>Firmen-Laptops (immer über VPN)</li>
            <li>Compliance-Anforderungen</li>
            <li>Zero Trust Architektur</li>
        </ul>
        <em>Always-On = maximale Sicherheit, aber auch maximale Kontrolle</em>
    </div>

    <div data-tooltip-id="vpn-ha">
        <strong>Hochverfügbarkeit (HA)</strong>
        <p>Redundante VPN-Gateways für Ausfallsicherheit.</p>
        <p><strong>HA-Modi erklärt:</strong></p>
        <ul>
            <li><strong>Active-Active:</strong>
                <ul>
                    <li>Beide Gateways gleichzeitig aktiv</li>
                    <li>Last wird verteilt</li>
                    <li>Bei Ausfall: Andere übernimmt alle</li>
                    <li>Beste Performance</li>
                </ul>
            </li>
            <li><strong>Active-Passive:</strong>
                <ul>
                    <li>Ein Gateway aktiv, eins standby</li>
                    <li>Bei Ausfall: Passive wird aktiv</li>
                    <li>Einfacher zu konfigurieren</li>
                    <li>Passive Gateway "verschwendet" Ressourcen</li>
                </ul>
            </li>
            <li><strong>Cluster:</strong>
                <ul>
                    <li>Mehrere Gateways (3+) als Cluster</li>
                    <li>Sehr hohe Verfügbarkeit</li>
                    <li>Komplex zu konfigurieren</li>
                </ul>
            </li>
            <li><strong>Keine HA:</strong>
                <ul>
                    <li>Single Point of Failure</li>
                    <li>Gateway fällt aus = kein VPN</li>
                    <li>Nur für unkritische VPNs</li>
                </ul>
            </li>
        </ul>
        <p><strong>Failover-Zeit:</strong> Wie lange dauert Umschaltung? (meist 30 Sekunden - 2 Minuten)</p>
        <em>HA ist Pflicht für produktive Remote-Access-VPNs!</em>
    </div>

    <div data-tooltip-id="vpn-logging">
        <strong>Logging & Monitoring</strong>
        <p>Was wird protokolliert?</p>
        <p><strong>Logging-Level:</strong></p>
        <ul>
            <li><strong>Detailliert (alle Events):</strong>
                <ul>
                    <li>Jede Verbindung, jeder Traffic</li>
                    <li>Gut für Troubleshooting</li>
                    <li>ABER: Datenschutz-Problem!</li>
                    <li>Sehr viele Daten</li>
                </ul>
            </li>
            <li><strong>Normal (Connect/Disconnect):</strong>
                <ul>
                    <li>Wer hat sich wann verbunden?</li>
                    <li>Wie lange war Session?</li>
                    <li>Wie viel Traffic?</li>
                    <li><em>Standard-Empfehlung</em></li>
                </ul>
            </li>
            <li><strong>Minimal (nur Fehler):</strong>
                <ul>
                    <li>Nur fehlgeschlagene Verbindungen</li>
                    <li>Wenig Daten</li>
                    <li>Schwer zu troubleshooten</li>
                </ul>
            </li>
        </ul>
        <p><strong>Was sollte geloggt werden:</strong></p>
        <ul>
            <li>Authentifizierung (erfolgreich/fehlgeschlagen)</li>
            <li>Verbindungsaufbau/Trennung</li>
            <li>IP-Adressen (Client + zugewiesene VPN-IP)</li>
            <li>Datenvolumen</li>
            <li>Fehler und Warnings</li>
        </ul>
        <p><strong>SIEM-Integration:</strong> Logs an zentrales SIEM senden für Security-Monitoring</p>
        <p><strong>Datenschutz:</strong> User haben Recht zu wissen was geloggt wird - Betriebsrat einbeziehen!</p>
        <em>Logging ist wichtig für Security, aber Datenschutz beachten!</em>
    </div>

    <div data-tooltip-id="vpn-notes">
        <strong>Notizen / VPN-Besonderheiten</strong>
        <p>Zusätzliche wichtige Informationen zum VPN.</p>
        <p><strong>Was dokumentieren:</strong></p>
        <ul>
            <li>Spezielle Firewall-Regeln (welche Ports offen?)</li>
            <li>Bekannte Probleme und Workarounds</li>
            <li>Split-Tunnel Konfiguration (welche Routen?)</li>
            <li>ACLs und Berechtigungen (wer darf auf was zugreifen?)</li>
            <li>Client-Deployment (wie verteilt?)</li>
            <li>Zertifikat-Renewal-Prozess</li>
            <li>Eskalations-Kontakte bei Problemen</li>
        </ul>
        <p><strong>Beispiel:</strong> "Cisco AnyConnect 4.10 mit IKEv2/IPsec. Authentifizierung über Active Directory + Duo MFA. Split-Tunnel aktiv: nur 10.0.0.0/8 und 172.16.0.0/12 durch VPN, Internet direkt. VPN-Pool: 10.8.0.0/22 (1024 IPs). 250 Lizenzen, Peak ~180 gleichzeitige Verbindungen. HA: Active-Passive (vpn-01.example.com Primary, vpn-02.example.com Standby), Failover <60s. Posture Check: Antivirus + OS-Patches erforderlich. Bekanntes Problem: macOS Big Sur → AnyConnect 4.9 erforderlich (Upgrade läuft). Client-Deployment via SCCM/Jamf. Zertifikate: Corporate-CA, Gültigkeit 2 Jahre, Renewal 6 Monate vorher. Firewall: UDP/500 + UDP/4500 für IPsec. Logging: Connect/Disconnect Events an Splunk. Support: network-vpn@example.com, Eskalation: Network-Team-Lead bei >10 zeitgleichen Ausfällen. Compliance: DSGVO-konform (Betriebsrat informiert), Logging 90 Tage."</p>
        <em>VPN-Dokumentation ist kritisch - bei Ausfall muss schnell reagiert werden!</em>
    </div>
</div>
