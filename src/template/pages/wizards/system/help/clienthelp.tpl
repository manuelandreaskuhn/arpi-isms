<div class="tooltip-definitions" style="display: none;">
    <div data-tooltip-id="client-access-name">
        <h2>Zugriffsbezeichnung</h2>
        <p>Ein beschreibender Name für diese Client-Zugriffsmethode.</p>
        <div>
            <h3>Hilft zu verstehen:</h3>
            <ul>
                <li>Welche Benutzergruppe nutzt diesen Zugriff?</li>
                <li>Was ist der Zweck des Zugriffs?</li>
                <li>Wo wird zugegriffen?</li>
            </ul>
        </div>
        <div>
            <h3>Beispiele:</h3>
            <ul>
                <li>"Ärzte-Arbeitsplätze Stationen" - Desktop-PCs auf den Stationen</li>
                <li>"Admin-Zugriff IT-Abteilung" - Spezieller Admin-Zugang</li>
                <li>"Patient-Portal Web" - Online-Portal für Patienten</li>
                <li>"Mobile Visite Tablets" - Tablets für Visite</li>
            </ul>
        </div>
    </div>

    <div data-tooltip-id="client-type">
        <h2>Client-Typ</h2>
        <p>Die Art der Anwendung oder des Endgeräts, mit dem auf das System zugegriffen wird.</p>
        <div>
            <h3>Web-basiert:</h3>
            <ul>
                <li><strong>Web Browser:</strong> Zugriff über normalen Browser (Chrome, Firefox, Edge). Keine Installation nötig.</li>
                <li><strong>Mobile Browser:</strong> Optimiert für Smartphones/Tablets im Browser.</li>
                <li><strong>PWA:</strong> Progressive Web App - verhält sich wie native App, ist aber Web-basiert.</li>
            </ul>
        </div>
        <div>
            <h3>Native Desktop:</h3>
            <ul>
                <li><strong>Windows Client:</strong> Installierte Windows-Anwendung (.exe)</li>
                <li><strong>macOS Client:</strong> Installierte Mac-Anwendung</li>
                <li><strong>Cross-Platform:</strong> Funktioniert auf mehreren Betriebssystemen</li>
            </ul>
        </div>
        <div>
            <h3>Mobile Apps:</h3>
            <ul>
                <li><strong>iOS/Android App:</strong> Native Apps aus App Store/Play Store</li>
                <li><strong>Hybrid App:</strong> Eine App für beide Plattformen</li>
            </ul>
        </div>
        <div>
            <h3>Spezielle Clients:</h3>
            <ul>
                <li><strong>Thick Client:</strong> Anwendung mit viel Logik auf dem Client, kann teilweise offline arbeiten</li>
                <li><strong>Thin Client:</strong> Minimaler Client, alle Verarbeitung auf Server</li>
                <li><strong>Citrix/RDP:</strong> Zugriff über Remote-Desktop-Verbindung</li>
            </ul>
        </div>
        <em>Faustregel: Web-basiert = einfach, Native = leistungsstärker, Thin Client = zentral verwaltbar</em>
    </div>

    <div data-tooltip-id="client-os">
        <h2>Betriebssystem(e)</h2>
        <p>Welche Betriebssysteme werden von den Clients verwendet?</p>
        <div>
            <h3>Wichtig für:</h3>
            <ul>
                <li>Kompatibilitätsprüfungen</li>
                <li>Software-Updates und Patches</li>
                <li>Sicherheitsrichtlinien</li>
            </ul>
        </div>
        <div>
            <h3>Beispiele:</h3>
            <ul>
                <li>"Windows 10/11 Professional"</li>
                <li>"macOS 13+ (Ventura oder neuer)"</li>
                <li>"iOS 16+, Android 12+"</li>
                <li>"Ubuntu 22.04 LTS"</li>
            </ul>
        </div>
        <em>Tipp: Geben Sie Mindestversionen an, falls relevant!</em>
    </div>

    <div data-tooltip-id="client-count">
        <h2>Anzahl Clients</h2>
        <p>Ungefähre Anzahl der Endgeräte/Arbeitsplätze, die auf diese Weise zugreifen.</p>
        <div>
            <h3>Hilft bei:</h3>
            <ul>
                <li>Kapazitätsplanung</li>
                <li>Lizenzierung</li>
                <li>Performance-Dimensionierung</li>
                <li>Support-Ressourcen</li>
            </ul>
        </div>
        <div>
            <h3>Beispiele:</h3>
            <ul>
                <li>50 - Kleine Abteilung</li>
                <li>200 - Mittleres Krankenhaus, eine Klinik</li>
                <li>1000+ - Großes Krankenhaus, mehrere Standorte</li>
            </ul>
        </div>
        <em>Eine Schätzung reicht - muss nicht exakt sein!</em>
    </div>

    <div data-tooltip-id="access-protocol">
        <h2>Zugriffsprotokoll</h2>
        <p>Das technische Protokoll, über das die Kommunikation zwischen Client und Server läuft.</p>
        <div>
            <h3>Web-Protokolle:</h3>
            <ul>
                <li><strong>HTTPS:</strong> Standard für Web-Anwendungen (verschlüsselt)</li>
                <li><strong>WebSocket:</strong> Für Echtzeit-Kommunikation (z.B. Chat, Live-Updates)</li>
                <li><strong>WebRTC:</strong> Für Video-/Audio-Übertragung</li>
            </ul>
        </div>
        <div>
            <h3>Netzwerk-Protokolle:</h3>
            <ul>
                <li><strong>TCP/UDP Custom:</strong> Eigenes Protokoll über Netzwerk</li>
                <li><strong>REST API:</strong> Moderne API-Schnittstelle</li>
                <li><strong>SOAP:</strong> Älteres Web-Service-Protokoll</li>
            </ul>
        </div>
        <div>
            <h3>Remote Access:</h3>
            <ul>
                <li><strong>RDP:</strong> Remote Desktop (Windows Terminal Server)</li>
                <li><strong>ICA (Citrix):</strong> Citrix Virtual Apps & Desktops</li>
                <li><strong>VNC:</strong> Plattformunabhängige Fernsteuerung</li>
            </ul>
        </div>
        <div>
            <h3>Datenbank:</h3>
            <ul>
                <li><strong>ODBC/JDBC:</strong> Direkte Datenbankverbindung (meist nicht empfohlen für Enduser)</li>
            </ul>
        </div>
        <div>
            <h3>Medizinische Protokolle:</h3>
            <ul>
                <li><strong>HL7/MLLP:</strong> Für medizinische Nachrichten</li>
                <li><strong>DICOM:</strong> Für medizinische Bilder</li>
                <li><strong>FHIR:</strong> Moderne medizinische Daten-API</li>
            </ul>
        </div>
        <em>Am häufigsten: HTTPS für Web-Apps, RDP für Remote Desktop</em>
    </div>

    <div data-tooltip-id="client-port">
        <h2>Port(s)</h2>
        <p>Die Netzwerk-Ports, über die die Kommunikation läuft.</p>
        <div>
            <h3>Standard-Ports:</h3>
            <ul>
                <li><strong>443:</strong> HTTPS (verschlüsselt)</li>
                <li><strong>80:</strong> HTTP (unverschlüsselt, nicht empfohlen)</li>
                <li><strong>3389:</strong> RDP (Remote Desktop)</li>
                <li><strong>1433:</strong> MS SQL Server (Datenbank)</li>
                <li><strong>1521:</strong> Oracle Database</li>
                <li><strong>5432:</strong> PostgreSQL</li>
                <li><strong>8080:</strong> Alternative HTTP-Port (oft für Test)</li>
            </ul>
        </div>
        <div>
            <h3>Mehrere Ports:</h3>
            Geben Sie alle verwendeten Ports an, z.B. "443, 8443"
        </div>
        <em>Standard-Ports verwenden = weniger Firewall-Konfiguration nötig</em>
    </div>

    <div data-tooltip-id="client-encryption">
        <h2>Verschlüsselung</h2>
        <p>Wie wird die Kommunikation zwischen Client und Server verschlüsselt?</p>
        <div>
            <h3>TLS/SSL:</h3>
            <ul>
                <li><strong>TLS 1.3:</strong> Neuester Standard (am sichersten, empfohlen)</li>
                <li><strong>TLS 1.2:</strong> Weitverbreitet, noch sicher</li>
                <li><strong>SSL/TLS gemischt:</strong> Mehrere Versionen (prüfen, ob TLS 1.0/1.1 deaktiviert!)</li>
            </ul>
        </div>
        <div>
            <h3>Weitere Verschlüsselung:</h3>
            <ul>
                <li><strong>VPN:</strong> Zusätzliche VPN-Tunnel-Verschlüsselung</li>
                <li><strong>SSH:</strong> Für SSH-Tunnel oder SFTP</li>
                <li><strong>Application-Level:</strong> Verschlüsselung in der Anwendung selbst</li>
            </ul>
        </div>
        <div>
            <h3>Keine Verschlüsselung:</h3>
            Nur bei internen, isolierten Netzwerken akzeptabel!
        </div>
        <em>WICHTIG: Patientendaten MÜSSEN verschlüsselt übertragen werden (DSGVO)!</em>
    </div>

    <div data-tooltip-id="client-auth">
        <h2>Authentifizierung</h2>
        <p>Wie melden sich Benutzer am System an?</p>
        <div>
            <h3>Enterprise-Lösungen:</h3>
            <ul>
                <li><strong>Single Sign-On (SSO):</strong> Einmal anmelden für alle Systeme</li>
                <li><strong>SAML 2.0:</strong> Standard für SSO in großen Organisationen</li>
                <li><strong>OAuth 2.0/OpenID:</strong> Moderner Standard, oft für Cloud-Apps</li>
                <li><strong>Active Directory:</strong> Windows-Domänen-Anmeldung</li>
            </ul>
        </div>
        <div>
            <h3>Erhöhte Sicherheit:</h3>
            <ul>
                <li><strong>Multi-Faktor (MFA):</strong> Passwort + SMS/App/Token (sehr sicher!)</li>
                <li><strong>Zertifikat:</strong> Digitales Zertifikat auf dem Gerät</li>
                <li><strong>Smartcard/eGK:</strong> Chipkarte (z.B. für HBA im Gesundheitswesen)</li>
                <li><strong>Kerberos:</strong> Ticketbasierte Authentifizierung</li>
            </ul>
        </div>
        <div>
            <h3>Einfache Methoden:</h3>
            <ul>
                <li><strong>Username/Password:</strong> Standard-Login (Minimum)</li>
                <li><strong>API Key:</strong> Für technische Integrationen</li>
            </ul>
        </div>
        <em>Empfehlung: Für Patientendaten mindestens MFA verwenden!</em>
    </div>

    <div data-tooltip-id="connection-target">
        <h2>Verbindungsziel</h2>
        <p>Wohin verbindet sich der Client direkt?</p>
        <div>
            <h3>Optionen erklärt:</h3>
            <ul>
                <li><strong>Load Balancer (HA):</strong> Verteilt Last auf mehrere Server. Bei Ausfall eines Servers läuft es weiter. <em>Beste Lösung für Hochverfügbarkeit!</em></li>
                <li><strong>Direkt zu VM(s):</strong> Client verbindet direkt zu virtuellen Maschinen. Einfacher, aber kein automatischer Failover.</li>
                <li><strong>Direkt zu Hardware Server(n):</strong> Client verbindet zu physischen Servern.</li>
                <li><strong>Reverse Proxy:</strong> Zwischenstation, die Anfragen weiterleitet. Zusätzliche Sicherheitsschicht.</li>
                <li><strong>API Gateway:</strong> Speziell für API-Zugriffe, bietet Authentifizierung, Rate-Limiting, etc.</li>
                <li><strong>Cloud Service Endpoint:</strong> Verbindung zu Cloud-Dienst (Azure, AWS, etc.)</li>
            </ul>
        </div>
        <div>
            <h3>Entscheidungshilfe:</h3>
            <ul>
                <li>Kritisches System (24/7) → Load Balancer</li>
                <li>Normale Anwendung → Direkt zu VM/Server</li>
                <li>Internet-Zugriff → Reverse Proxy oder API Gateway</li>
            </ul>
        </div>
    </div>

    <div data-tooltip-id="target-lb">
        <h2>Verwendeter Load Balancer</h2>
        <p>Wählen Sie den Load Balancer aus, der die Verbindungen verteilt.</p>
        <div>
            <h3>Vorteile eines Load Balancers:</h3>
            <ul>
                <li>Verteilung der Last auf mehrere Server</li>
                <li>Automatischer Failover bei Server-Ausfall</li>
                <li>Zentrale SSL-Terminierung möglich</li>
                <li>Health-Checks der Backend-Server</li>
            </ul>
        </div>
        <em>Der Load Balancer muss vorher in der Load Balancer-Sektion angelegt worden sein.</em>
    </div>

    <div data-tooltip-id="target-servers">
        <h2>Ziel VMs / Server</h2>
        <p>Wählen Sie die Server aus, zu denen die Clients direkt verbinden.</p>
        <div>
            <h3>Mehrere Server auswählen:</h3>
            <ul>
                <li>Bei mehreren Servern: Clients verbinden zu einem davon</li>
                <li>Kein automatischer Failover (außer durch DNS Round-Robin)</li>
                <li>Für HA besser Load Balancer verwenden</li>
            </ul>
        </div>
        <em>Die Server müssen vorher als VMs oder Hardware Server angelegt worden sein.</em>
    </div>

    <div data-tooltip-id="access-url">
        <h2>Zugriffs-URL / Adresse</h2>
        <p>Die vollständige Adresse, die Benutzer eingeben oder auf die sie klicken.</p>
        <div>
            <h3>Beispiele:</h3>
            <ul>
                <li><strong>https://kis.klinik.de</strong> - Öffentliche URL</li>
                <li><strong>https://kis-intern.local:8443</strong> - Interne URL mit speziellem Port</li>
                <li><strong>\\server01\application</strong> - UNC-Pfad für Netzwerk-Shares</li>
                <li><strong>rdp://terminalserver.local</strong> - RDP-Verbindung</li>
            </ul>
        </div>
        <em>Tipp: Bei HTTPS immer Zertifikat für diese URL ausstellen!</em>
    </div>

    <div data-tooltip-id="dns-name">
        <h2>DNS Name</h2>
        <p>Der Domain-Name, der zur IP-Adresse aufgelöst wird.</p>
        <div>
            <h3>Beispiele:</h3>
            <ul>
                <li>kis.klinik.de</li>
                <li>app-intern.krankenhaus.local</li>
                <li>client.medical-center.com</li>
            </ul>
        </div>
        <div>
            <h3>Wichtig für:</h3>
            <ul>
                <li>SSL-Zertifikate (müssen zum DNS-Namen passen)</li>
                <li>Load Balancer Konfiguration</li>
                <li>Firewall-Regeln</li>
            </ul>
        </div>
        <em>Der DNS-Name muss im DNS-Server eingetragen sein!</em>
    </div>

    <div data-tooltip-id="client-software">
        <h2>Client-Software / App</h2>
        <p>Name und Version der Software, die auf den Clients installiert ist.</p>
        <div>
            <h3>Beispiele:</h3>
            <ul>
                <li>"Orbis KIS Client Version 8.2.1"</li>
                <li>"Google Chrome Version 120+"</li>
                <li>"SAP GUI 8.0"</li>
                <li>"Microsoft Teams Desktop"</li>
                <li>"Custom Medical App 2.5"</li>
            </ul>
        </div>
        <em>Hilft bei Support und Update-Planung!</em>
    </div>

    <div data-tooltip-id="install-method">
        <h2>Installations-Methode</h2>
        <p>Wie wird die Software auf den Clients installiert?</p>
        <div>
            <h3>Keine Installation:</h3>
            <ul>
                <li><strong>Browser:</strong> Nur Browser nötig, keine Installation</li>
            </ul>
        </div>
        <div>
            <h3>Manuelle Installation:</h3>
            <ul>
                <li><strong>MSI/EXE:</strong> Benutzer lädt Installer herunter und installiert</li>
                <li><strong>DMG/PKG:</strong> Mac-Installer</li>
                <li><strong>App Store:</strong> Installation aus App Store / Play Store</li>
            </ul>
        </div>
        <div>
            <h3>Zentrale Verteilung:</h3>
            <ul>
                <li><strong>SCCM/Intune:</strong> Microsoft-Tools für zentrale Software-Verteilung</li>
                <li><strong>Group Policy:</strong> Automatische Installation über Windows-Domäne</li>
                <li><strong>Citrix Published App:</strong> Läuft auf Server, erscheint wie lokale App</li>
            </ul>
        </div>
        <div>
            <h3>Portable:</h3>
            Keine Installation, einfach ausführen (z.B. von USB-Stick)
        </div>
        <em>Zentrale Verteilung = einfacher für viele Clients!</em>
    </div>

    <div data-tooltip-id="update-mechanism">
        <h2>Update-Mechanismus</h2>
        <p>Wie werden Updates der Client-Software eingespielt?</p>
        <div>
            <h3>Optionen:</h3>
            <ul>
                <li><strong>Automatische Updates:</strong> Software aktualisiert sich selbst (einfach, aber weniger Kontrolle)</li>
                <li><strong>Manuelle Updates:</strong> IT muss Updates manuell einspielen (mehr Kontrolle, aber aufwändiger)</li>
                <li><strong>Zentral gesteuert:</strong> Updates über SCCM, Intune, etc. verteilt (beste Methode für viele Clients)</li>
                <li><strong>Browser-basiert:</strong> Automatisch immer aktuelle Version (bei Web-Apps)</li>
                <li><strong>App Store:</strong> Updates über Store (bei Mobile Apps)</li>
            </ul>
        </div>
        <em>Empfehlung: Bei vielen Clients zentral steuern!</em>
    </div>

    <div data-tooltip-id="client-licensing">
        <h2>Lizenzierung</h2>
        <p>Wie werden die Client-Lizenzen gezählt und verwaltet?</p>
        <div>
            <h3>Lizenzmodelle:</h3>
            <ul>
                <li><strong>Named User:</strong> Lizenz pro Person (z.B. "Dr. Müller"). Person kann von mehreren Geräten zugreifen.</li>
                <li><strong>Concurrent User:</strong> Lizenz pro gleichzeitiger Anmeldung. Mehrere Personen teilen sich Lizenzen.</li>
                <li><strong>Device-basiert:</strong> Lizenz pro Gerät/PC (egal wer sich anmeldet)</li>
                <li><strong>Subscription/SaaS:</strong> Monatliche/Jährliche Zahlung pro Nutzer (z.B. Microsoft 365)</li>
                <li><strong>Site License:</strong> Pauschal für kompletten Standort/Organisation</li>
                <li><strong>Kostenlos:</strong> Open Source oder frei verfügbare Software</li>
            </ul>
        </div>
        <div>
            <h3>Beispiel Concurrent:</h3>
            100 Mitarbeiter, aber nur 50 arbeiten gleichzeitig → 50 Concurrent-Lizenzen reichen
        </div>
        <em>Wichtig für Budgetplanung und Compliance!</em>
    </div>

    <div data-tooltip-id="network-segment">
        <h2>Netzwerk-Segment</h2>
        <p>In welchem Teil des Netzwerks befinden sich die Clients?</p>
        <div>
            <h3>Typische Segmente:</h3>
            <ul>
                <li><strong>Intern (LAN):</strong> Lokales Netzwerk im Krankenhaus/Firma</li>
                <li><strong>VPN:</strong> Über VPN-Verbindung von außen</li>
                <li><strong>DMZ:</strong> Abgeschottete Zone zwischen Internet und internem Netz</li>
                <li><strong>Internet:</strong> Direkter Zugriff aus dem Internet</li>
                <li><strong>WLAN:</strong> Drahtloses Netzwerk</li>
                <li><strong>Guest Network:</strong> Gäste-Netzwerk</li>
            </ul>
        </div>
        <div>
            <h3>Wichtig für:</h3>
            <ul>
                <li>Firewall-Regeln</li>
                <li>Sicherheitskonzept</li>
                <li>Netzwerk-Performance</li>
            </ul>
        </div>
        <em>Patientendaten aus Internet = höchste Sicherheitsanforderungen!</em>
    </div>

    <div data-tooltip-id="bandwidth">
        <h2>Bandbreiten-Anforderung</h2>
        <p>Wie viel Netzwerk-Geschwindigkeit brauchen die Clients?</p>
        <div>
            <h3>Richtwerte:</h3>
            <ul>
                <li><strong>< 1 Mbit/s:</strong> Einfache Text-Anwendungen, E-Mail</li>
                <li><strong>1-10 Mbit/s:</strong> Standard-Anwendungen, leichte Grafiken</li>
                <li><strong>10-100 Mbit/s:</strong> Normale Anforderungen, Datenbank-Anwendungen</li>
                <li><strong>> 100 Mbit/s:</strong> Bildbearbeitung, PACS, Video-Streaming</li>
                <li><strong>> 1 Gbit/s:</strong> Hochauflösende medizinische Bilder, große Datenmengen</li>
            </ul>
        </div>
        <div>
            <h3>Beispiele:</h3>
            <ul>
                <li>KIS-Client: 10-50 Mbit/s</li>
                <li>PACS-Viewer: 100 Mbit/s - 1 Gbit/s</li>
                <li>Remote Desktop: 2-5 Mbit/s</li>
                <li>Web-Browser: 5-20 Mbit/s</li>
            </ul>
        </div>
        <em>Bei vielen gleichzeitigen Nutzern: Bandbreite × Anzahl Nutzer rechnen!</em>
    </div>

    <div data-tooltip-id="offline-capability">
        <h2>Offline-Fähigkeit</h2>
        <p>Kann die Anwendung auch ohne Netzwerkverbindung genutzt werden?</p>
        <div>
            <h3>Optionen:</h3>
            <ul>
                <li><strong>Vollständig offline:</strong> Alle Funktionen verfügbar, Daten werden später synchronisiert (z.B. Mobile Apps für Außendienst)</li>
                <li><strong>Teilweise offline:</strong> Lesezugriff auf zwischengespeicherte Daten möglich, kein Schreiben (z.B. E-Mail-Clients)</li>
                <li><strong>Caching/Sync:</strong> Häufig genutzte Daten werden zwischengespeichert (z.B. OneDrive)</li>
                <li><strong>Nur online:</strong> Funktioniert nur mit Netzwerkverbindung (z.B. Web-Anwendungen)</li>
            </ul>
        </div>
        <div>
            <h3>Wichtig bei:</h3>
            <ul>
                <li>Mobile Arbeit (Hausbesuche, Rettungsdienst)</li>
                <li>Instabilen Netzwerken</li>
                <li>Flugzeug-Modus auf Tablets</li>
            </ul>
        </div>
        <em>Achtung: Offline = Datensynchronisation und Konflikte beachten!</em>
    </div>

    <div data-tooltip-id="session-management">
        <h2>Session-Verwaltung</h2>
        <p>Wie wird die Verbindung/Sitzung zwischen Client und Server verwaltet?</p>
        <div>
            <h3>Optionen:</h3>
            <ul>
                <li><strong>Persistent (Keep-Alive):</strong> Verbindung bleibt permanent offen. Vorteil: Schnell. Nachteil: Mehr Server-Ressourcen.</li>
                <li><strong>Timeout-basiert:</strong> Nach X Minuten Inaktivität wird Sitzung beendet (z.B. 30 Min). Standard für Sicherheit.</li>
                <li><strong>Stateless (Token):</strong> Jede Anfrage ist unabhängig, Client sendet Token mit (modern, skalierbar)</li>
                <li><strong>Heartbeat/Ping:</strong> Client sendet regelmäßig "Ich bin noch da"-Signal</li>
            </ul>
        </div>
        <div>
            <h3>Sicherheitsaspekt:</h3>
            Kürzere Timeouts = sicherer, aber lästiger für Benutzer
        </div>
        <div>
            <h3>Typische Werte:</h3>
            <ul>
                <li>Hochsicherheit: 15 Minuten Timeout</li>
                <li>Normal: 30-60 Minuten Timeout</li>
                <li>Komfortabel: 4-8 Stunden Timeout</li>
            </ul>
        </div>
        <em>Bei Patientendaten: Kurze Timeouts für verlassene Arbeitsplätze!</em>
    </div>

    <div data-tooltip-id="user-group">
        <h2>Benutzergruppe</h2>
        <p>Welche Gruppe von Personen nutzt diesen Client-Zugriff?</p>
        <div>
            <h3>Beispiele im Krankenhaus:</h3>
            <ul>
                <li>Ärzte</li>
                <li>Pflegepersonal</li>
                <li>Verwaltung / Administration</li>
                <li>IT-Support / Administratoren</li>
                <li>Labor-Personal</li>
                <li>Radiologie-Personal</li>
                <li>Patienten (Patient-Portal)</li>
                <li>Externe Partner (Labore, Zuweiser)</li>
            </ul>
        </div>
        <div>
            <h3>Hilft bei:</h3>
            <ul>
                <li>Berechtigungskonzepten</li>
                <li>Support-Zuständigkeiten</li>
                <li>Schulungsplanung</li>
            </ul>
        </div>
    </div>

    <div data-tooltip-id="working-hours">
        <h2>Arbeitszeiten / Zugriffszeiten</h2>
        <p>Wann wird das System von dieser Benutzergruppe genutzt?</p>
        <div>
            <h3>Beispiele:</h3>
            <ul>
                <li><strong>24/7:</strong> Rund um die Uhr (Notaufnahme, Intensivstation)</li>
                <li><strong>Mo-Fr 07:00-20:00:</strong> Normale Arbeitszeiten</li>
                <li><strong>Mo-Fr 08:00-17:00:</strong> Verwaltung</li>
                <li><strong>Schichtbetrieb:</strong> 06:00-14:00, 14:00-22:00, 22:00-06:00</li>
            </ul>
        </div>
        <div>
            <h3>Wichtig für:</h3>
            <ul>
                <li>Wartungsfenster-Planung</li>
                <li>Support-Verfügbarkeit</li>
                <li>Backup-Zeiten</li>
            </ul>
        </div>
        <em>Wartungen sollten außerhalb der Hauptnutzungszeiten stattfinden!</em>
    </div>

    <div data-tooltip-id="system-requirements">
        <h2>System-Anforderungen (Client)</h2>
        <p>Welche technischen Voraussetzungen müssen die Client-Geräte erfüllen?</p>
        <div>
            <h3>Typische Anforderungen:</h3>
            <ul>
                <li><strong>Prozessor:</strong> Intel Core i5 oder besser</li>
                <li><strong>RAM:</strong> Mindestens 8 GB, empfohlen 16 GB</li>
                <li><strong>Betriebssystem:</strong> Windows 10/11, mindestens Version 21H2</li>
                <li><strong>Browser:</strong> Chrome 120+, Firefox 115+, Edge 120+</li>
                <li><strong>Bildschirm:</strong> Mind. 1920x1080 Auflösung</li>
                <li><strong>Festplatte:</strong> 50 GB freier Speicher</li>
                <li><strong>Netzwerk:</strong> Ethernet oder WLAN mit mind. 10 Mbit/s</li>
            </ul>
        </div>
        <div>
            <h3>Beispiel:</h3>
            "Min. 8GB RAM, Windows 10 (64-bit), Chrome 90+, 1920x1080 Display"
        </div>
        <em>Hilft bei der Beschaffung und Troubleshooting!</em>
    </div>

    <div data-tooltip-id="special-requirements">
        <h2>Besondere Anforderungen</h2>
        <p>Welche zusätzliche Hardware oder Software wird benötigt?</p>
        <div>
            <h3>Beispiele im Gesundheitswesen:</h3>
            <ul>
                <li><strong>Kartenleser:</strong> Für elektronische Gesundheitskarte (eGK), Heilberufsausweis (HBA)</li>
                <li><strong>Barcode-Scanner:</strong> Für Medikamentenverwaltung, Labor-Proben</li>
                <li><strong>Drucker:</strong> Netzwerk-Drucker, Label-Drucker, Befund-Drucker</li>
                <li><strong>Signatur-Pad:</strong> Für digitale Unterschriften</li>
                <li><strong>Webcam/Headset:</strong> Für Telemedizin</li>
                <li><strong>Zweiter Bildschirm:</strong> Für bessere Übersicht</li>
                <li><strong>Touch-Screen:</strong> Für Tablet-Nutzung</li>
            </ul>
        </div>
        <div>
            <h3>Software-Anforderungen:</h3>
            <ul>
                <li>Java Runtime (JRE)</li>
                <li>Adobe Reader</li>
                <li>Spezielle Treiber</li>
                <li>VPN-Client</li>
            </ul>
        </div>
        <em>Dokumentieren Sie alles, was zusätzlich beschafft werden muss!</em>
    </div>

    <div data-tooltip-id="client-notes">
        <h2>Notizen / Zugriffsdetails</h2>
        <p>Zusätzliche wichtige Informationen zu diesem Client-Zugriff.</p>
        <div>
            <h3>Was hier rein sollte:</h3>
            <ul>
                <li>Bekannte Probleme und deren Lösungen</li>
                <li>Besondere Konfigurationen</li>
                <li>Support-Kontakte</li>
                <li>Dokumentations-Links</li>
                <li>Wichtige Hinweise für neue Mitarbeiter</li>
                <li>Geplante Änderungen</li>
            </ul>
        </div>
        <div>
            <h3>Beispiel:</h3>
            "Wichtig: Antivirus-Software muss Port 8443 freigeben. Bei Problemen mit Kartenleser: Treiber von https://... neu installieren. Support: IT-Helpdesk Tel. 1234"
        </div>
        <em>Je mehr Details, desto einfacher der Support!</em>
    </div>
</div>
