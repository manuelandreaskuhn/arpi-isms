<div class="tooltip-definitions" style="display: none;">
    <div data-tooltip-id="client-access-name">
        <strong>Zugriffsbezeichnung</strong>
        <p>Ein beschreibender Name für diese Client-Zugriffsmethode.</p>
        <p><strong>Hilft zu verstehen:</strong></p>
        <ul>
            <li>Welche Benutzergruppe nutzt diesen Zugriff?</li>
            <li>Was ist der Zweck des Zugriffs?</li>
            <li>Wo wird zugegriffen?</li>
        </ul>
        <p><strong>Beispiele:</strong></p>
        <ul>
            <li>"Ärzte-Arbeitsplätze Stationen" - Desktop-PCs auf den Stationen</li>
            <li>"Admin-Zugriff IT-Abteilung" - Spezieller Admin-Zugang</li>
            <li>"Patient-Portal Web" - Online-Portal für Patienten</li>
            <li>"Mobile Visite Tablets" - Tablets für Visite</li>
        </ul>
    </div>

    <div data-tooltip-id="client-type">
        <strong>Client-Typ</strong>
        <p>Die Art der Anwendung oder des Endgeräts, mit dem auf das System zugegriffen wird.</p>
        <p><strong>Web-basiert:</strong></p>
        <ul>
            <li><strong>Web Browser:</strong> Zugriff über normalen Browser (Chrome, Firefox, Edge). Keine Installation nötig.</li>
            <li><strong>Mobile Browser:</strong> Optimiert für Smartphones/Tablets im Browser.</li>
            <li><strong>PWA:</strong> Progressive Web App - verhält sich wie native App, ist aber Web-basiert.</li>
        </ul>
        <p><strong>Native Desktop:</strong></p>
        <ul>
            <li><strong>Windows Client:</strong> Installierte Windows-Anwendung (.exe)</li>
            <li><strong>macOS Client:</strong> Installierte Mac-Anwendung</li>
            <li><strong>Cross-Platform:</strong> Funktioniert auf mehreren Betriebssystemen</li>
        </ul>
        <p><strong>Mobile Apps:</strong></p>
        <ul>
            <li><strong>iOS/Android App:</strong> Native Apps aus App Store/Play Store</li>
            <li><strong>Hybrid App:</strong> Eine App für beide Plattformen</li>
        </ul>
        <p><strong>Spezielle Clients:</strong></p>
        <ul>
            <li><strong>Thick Client:</strong> Anwendung mit viel Logik auf dem Client, kann teilweise offline arbeiten</li>
            <li><strong>Thin Client:</strong> Minimaler Client, alle Verarbeitung auf Server</li>
            <li><strong>Citrix/RDP:</strong> Zugriff über Remote-Desktop-Verbindung</li>
        </ul>
        <em>Faustregel: Web-basiert = einfach, Native = leistungsstärker, Thin Client = zentral verwaltbar</em>
    </div>

    <div data-tooltip-id="client-os">
        <strong>Betriebssystem(e)</strong>
        <p>Welche Betriebssysteme werden von den Clients verwendet?</p>
        <p><strong>Wichtig für:</strong></p>
        <ul>
            <li>Kompatibilitätsprüfungen</li>
            <li>Software-Updates und Patches</li>
            <li>Sicherheitsrichtlinien</li>
        </ul>
        <p><strong>Beispiele:</strong></p>
        <ul>
            <li>"Windows 10/11 Professional"</li>
            <li>"macOS 13+ (Ventura oder neuer)"</li>
            <li>"iOS 16+, Android 12+"</li>
            <li>"Ubuntu 22.04 LTS"</li>
        </ul>
        <em>Tipp: Geben Sie Mindestversionen an, falls relevant!</em>
    </div>

    <div data-tooltip-id="client-count">
        <strong>Anzahl Clients</strong>
        <p>Ungefähre Anzahl der Endgeräte/Arbeitsplätze, die auf diese Weise zugreifen.</p>
        <p><strong>Hilft bei:</strong></p>
        <ul>
            <li>Kapazitätsplanung</li>
            <li>Lizenzierung</li>
            <li>Performance-Dimensionierung</li>
            <li>Support-Ressourcen</li>
        </ul>
        <p><strong>Beispiele:</strong></p>
        <ul>
            <li>50 - Kleine Abteilung</li>
            <li>200 - Mittleres Krankenhaus, eine Klinik</li>
            <li>1000+ - Großes Krankenhaus, mehrere Standorte</li>
        </ul>
        <em>Eine Schätzung reicht - muss nicht exakt sein!</em>
    </div>

    <div data-tooltip-id="access-protocol">
        <strong>Zugriffsprotokoll</strong>
        <p>Das technische Protokoll, über das die Kommunikation zwischen Client und Server läuft.</p>
        <p><strong>Web-Protokolle:</strong></p>
        <ul>
            <li><strong>HTTPS:</strong> Standard für Web-Anwendungen (verschlüsselt)</li>
            <li><strong>WebSocket:</strong> Für Echtzeit-Kommunikation (z.B. Chat, Live-Updates)</li>
            <li><strong>WebRTC:</strong> Für Video-/Audio-Übertragung</li>
        </ul>
        <p><strong>Netzwerk-Protokolle:</strong></p>
        <ul>
            <li><strong>TCP/UDP Custom:</strong> Eigenes Protokoll über Netzwerk</li>
            <li><strong>REST API:</strong> Moderne API-Schnittstelle</li>
            <li><strong>SOAP:</strong> Älteres Web-Service-Protokoll</li>
        </ul>
        <p><strong>Remote Access:</strong></p>
        <ul>
            <li><strong>RDP:</strong> Remote Desktop (Windows Terminal Server)</li>
            <li><strong>ICA (Citrix):</strong> Citrix Virtual Apps & Desktops</li>
            <li><strong>VNC:</strong> Plattformunabhängige Fernsteuerung</li>
        </ul>
        <p><strong>Datenbank:</strong></p>
        <ul>
            <li><strong>ODBC/JDBC:</strong> Direkte Datenbankverbindung (meist nicht empfohlen für Enduser)</li>
        </ul>
        <p><strong>Medizinische Protokolle:</strong></p>
        <ul>
            <li><strong>HL7/MLLP:</strong> Für medizinische Nachrichten</li>
            <li><strong>DICOM:</strong> Für medizinische Bilder</li>
            <li><strong>FHIR:</strong> Moderne medizinische Daten-API</li>
        </ul>
        <em>Am häufigsten: HTTPS für Web-Apps, RDP für Remote Desktop</em>
    </div>

    <div data-tooltip-id="client-port">
        <strong>Port(s)</strong>
        <p>Die Netzwerk-Ports, über die die Kommunikation läuft.</p>
        <p><strong>Standard-Ports:</strong></p>
        <ul>
            <li><strong>443:</strong> HTTPS (verschlüsselt)</li>
            <li><strong>80:</strong> HTTP (unverschlüsselt, nicht empfohlen)</li>
            <li><strong>3389:</strong> RDP (Remote Desktop)</li>
            <li><strong>1433:</strong> MS SQL Server (Datenbank)</li>
            <li><strong>1521:</strong> Oracle Database</li>
            <li><strong>5432:</strong> PostgreSQL</li>
            <li><strong>8080:</strong> Alternative HTTP-Port (oft für Test)</li>
        </ul>
        <p><strong>Mehrere Ports:</strong> Geben Sie alle verwendeten Ports an, z.B. "443, 8443"</p>
        <em>Standard-Ports verwenden = weniger Firewall-Konfiguration nötig</em>
    </div>

    <div data-tooltip-id="client-encryption">
        <strong>Verschlüsselung</strong>
        <p>Wie wird die Kommunikation zwischen Client und Server verschlüsselt?</p>
        <p><strong>TLS/SSL:</strong></p>
        <ul>
            <li><strong>TLS 1.3:</strong> Neuester Standard (am sichersten, empfohlen)</li>
            <li><strong>TLS 1.2:</strong> Weitverbreitet, noch sicher</li>
            <li><strong>SSL/TLS gemischt:</strong> Mehrere Versionen (prüfen, ob TLS 1.0/1.1 deaktiviert!)</li>
        </ul>
        <p><strong>Weitere Verschlüsselung:</strong></p>
        <ul>
            <li><strong>VPN:</strong> Zusätzliche VPN-Tunnel-Verschlüsselung</li>
            <li><strong>SSH:</strong> Für SSH-Tunnel oder SFTP</li>
            <li><strong>Application-Level:</strong> Verschlüsselung in der Anwendung selbst</li>
        </ul>
        <p><strong>Keine Verschlüsselung:</strong> Nur bei internen, isolierten Netzwerken akzeptabel!</p>
        <em>WICHTIG: Patientendaten MÜSSEN verschlüsselt übertragen werden (DSGVO)!</em>
    </div>

    <div data-tooltip-id="client-auth">
        <strong>Authentifizierung</strong>
        <p>Wie melden sich Benutzer am System an?</p>
        <p><strong>Enterprise-Lösungen:</strong></p>
        <ul>
            <li><strong>Single Sign-On (SSO):</strong> Einmal anmelden für alle Systeme</li>
            <li><strong>SAML 2.0:</strong> Standard für SSO in großen Organisationen</li>
            <li><strong>OAuth 2.0/OpenID:</strong> Moderner Standard, oft für Cloud-Apps</li>
            <li><strong>Active Directory:</strong> Windows-Domänen-Anmeldung</li>
        </ul>
        <p><strong>Erhöhte Sicherheit:</strong></p>
        <ul>
            <li><strong>Multi-Faktor (MFA):</strong> Passwort + SMS/App/Token (sehr sicher!)</li>
            <li><strong>Zertifikat:</strong> Digitales Zertifikat auf dem Gerät</li>
            <li><strong>Smartcard/eGK:</strong> Chipkarte (z.B. für HBA im Gesundheitswesen)</li>
            <li><strong>Kerberos:</strong> Ticketbasierte Authentifizierung</li>
        </ul>
        <p><strong>Einfache Methoden:</strong></p>
        <ul>
            <li><strong>Username/Password:</strong> Standard-Login (Minimum)</li>
            <li><strong>API Key:</strong> Für technische Integrationen</li>
        </ul>
        <em>Empfehlung: Für Patientendaten mindestens MFA verwenden!</em>
    </div>

    <div data-tooltip-id="connection-target">
        <strong>Verbindungsziel</strong>
        <p>Wohin verbindet sich der Client direkt?</p>
        <p><strong>Optionen erklärt:</strong></p>
        <ul>
            <li><strong>Load Balancer (HA):</strong> Verteilt Last auf mehrere Server. Bei Ausfall eines Servers läuft es weiter. <em>Beste Lösung für Hochverfügbarkeit!</em></li>
            <li><strong>Direkt zu VM(s):</strong> Client verbindet direkt zu virtuellen Maschinen. Einfacher, aber kein automatischer Failover.</li>
            <li><strong>Direkt zu Hardware Server(n):</strong> Client verbindet zu physischen Servern.</li>
            <li><strong>Reverse Proxy:</strong> Zwischenstation, die Anfragen weiterleitet. Zusätzliche Sicherheitsschicht.</li>
            <li><strong>API Gateway:</strong> Speziell für API-Zugriffe, bietet Authentifizierung, Rate-Limiting, etc.</li>
            <li><strong>Cloud Service Endpoint:</strong> Verbindung zu Cloud-Dienst (Azure, AWS, etc.)</li>
        </ul>
        <p><strong>Entscheidungshilfe:</strong></p>
        <ul>
            <li>Kritisches System (24/7) → Load Balancer</li>
            <li>Normale Anwendung → Direkt zu VM/Server</li>
            <li>Internet-Zugriff → Reverse Proxy oder API Gateway</li>
        </ul>
    </div>

    <div data-tooltip-id="target-lb">
        <strong>Verwendeter Load Balancer</strong>
        <p>Wählen Sie den Load Balancer aus, der die Verbindungen verteilt.</p>
        <p><strong>Vorteile eines Load Balancers:</strong></p>
        <ul>
            <li>Verteilung der Last auf mehrere Server</li>
            <li>Automatischer Failover bei Server-Ausfall</li>
            <li>Zentrale SSL-Terminierung möglich</li>
            <li>Health-Checks der Backend-Server</li>
        </ul>
        <em>Der Load Balancer muss vorher in der Load Balancer-Sektion angelegt worden sein.</em>
    </div>

    <div data-tooltip-id="target-servers">
        <strong>Ziel VMs / Server</strong>
        <p>Wählen Sie die Server aus, zu denen die Clients direkt verbinden.</p>
        <p><strong>Mehrere Server auswählen:</strong></p>
        <ul>
            <li>Bei mehreren Servern: Clients verbinden zu einem davon</li>
            <li>Kein automatischer Failover (außer durch DNS Round-Robin)</li>
            <li>Für HA besser Load Balancer verwenden</li>
        </ul>
        <em>Die Server müssen vorher als VMs oder Hardware Server angelegt worden sein.</em>
    </div>

    <div data-tooltip-id="access-url">
        <strong>Zugriffs-URL / Adresse</strong>
        <p>Die vollständige Adresse, die Benutzer eingeben oder auf die sie klicken.</p>
        <p><strong>Beispiele:</strong></p>
        <ul>
            <li><strong>https://kis.klinik.de</strong> - Öffentliche URL</li>
            <li><strong>https://kis-intern.local:8443</strong> - Interne URL mit speziellem Port</li>
            <li><strong>\\server01\application</strong> - UNC-Pfad für Netzwerk-Shares</li>
            <li><strong>rdp://terminalserver.local</strong> - RDP-Verbindung</li>
        </ul>
        <em>Tipp: Bei HTTPS immer Zertifikat für diese URL ausstellen!</em>
    </div>

    <div data-tooltip-id="dns-name">
        <strong>DNS Name</strong>
        <p>Der Domain-Name, der zur IP-Adresse aufgelöst wird.</p>
        <p><strong>Beispiele:</strong></p>
        <ul>
            <li>kis.klinik.de</li>
            <li>app-intern.krankenhaus.local</li>
            <li>client.medical-center.com</li>
        </ul>
        <p><strong>Wichtig für:</strong></p>
        <ul>
            <li>SSL-Zertifikate (müssen zum DNS-Namen passen)</li>
            <li>Load Balancer Konfiguration</li>
            <li>Firewall-Regeln</li>
        </ul>
        <em>Der DNS-Name muss im DNS-Server eingetragen sein!</em>
    </div>

    <div data-tooltip-id="client-software">
        <strong>Client-Software / App</strong>
        <p>Name und Version der Software, die auf den Clients installiert ist.</p>
        <p><strong>Beispiele:</strong></p>
        <ul>
            <li>"Orbis KIS Client Version 8.2.1"</li>
            <li>"Google Chrome Version 120+"</li>
            <li>"SAP GUI 8.0"</li>
            <li>"Microsoft Teams Desktop"</li>
            <li>"Custom Medical App 2.5"</li>
        </ul>
        <em>Hilft bei Support und Update-Planung!</em>
    </div>

    <div data-tooltip-id="install-method">
        <strong>Installations-Methode</strong>
        <p>Wie wird die Software auf den Clients installiert?</p>
        <p><strong>Keine Installation:</strong></p>
        <ul>
            <li><strong>Browser:</strong> Nur Browser nötig, keine Installation</li>
        </ul>
        <p><strong>Manuelle Installation:</strong></p>
        <ul>
            <li><strong>MSI/EXE:</strong> Benutzer lädt Installer herunter und installiert</li>
            <li><strong>DMG/PKG:</strong> Mac-Installer</li>
            <li><strong>App Store:</strong> Installation aus App Store / Play Store</li>
        </ul>
        <p><strong>Zentrale Verteilung:</strong></p>
        <ul>
            <li><strong>SCCM/Intune:</strong> Microsoft-Tools für zentrale Software-Verteilung</li>
            <li><strong>Group Policy:</strong> Automatische Installation über Windows-Domäne</li>
            <li><strong>Citrix Published App:</strong> Läuft auf Server, erscheint wie lokale App</li>
        </ul>
        <p><strong>Portable:</strong> Keine Installation, einfach ausführen (z.B. von USB-Stick)</p>
        <em>Zentrale Verteilung = einfacher für viele Clients!</em>
    </div>

    <div data-tooltip-id="update-mechanism">
        <strong>Update-Mechanismus</strong>
        <p>Wie werden Updates der Client-Software eingespielt?</p>
        <p><strong>Optionen:</strong></p>
        <ul>
            <li><strong>Automatische Updates:</strong> Software aktualisiert sich selbst (einfach, aber weniger Kontrolle)</li>
            <li><strong>Manuelle Updates:</strong> IT muss Updates manuell einspielen (mehr Kontrolle, aber aufwändiger)</li>
            <li><strong>Zentral gesteuert:</strong> Updates über SCCM, Intune, etc. verteilt (beste Methode für viele Clients)</li>
            <li><strong>Browser-basiert:</strong> Automatisch immer aktuelle Version (bei Web-Apps)</li>
            <li><strong>App Store:</strong> Updates über Store (bei Mobile Apps)</li>
        </ul>
        <em>Empfehlung: Bei vielen Clients zentral steuern!</em>
    </div>

    <div data-tooltip-id="client-licensing">
        <strong>Lizenzierung</strong>
        <p>Wie werden die Client-Lizenzen gezählt und verwaltet?</p>
        <p><strong>Lizenzmodelle:</strong></p>
        <ul>
            <li><strong>Named User:</strong> Lizenz pro Person (z.B. "Dr. Müller"). Person kann von mehreren Geräten zugreifen.</li>
            <li><strong>Concurrent User:</strong> Lizenz pro gleichzeitiger Anmeldung. Mehrere Personen teilen sich Lizenzen.</li>
            <li><strong>Device-basiert:</strong> Lizenz pro Gerät/PC (egal wer sich anmeldet)</li>
            <li><strong>Subscription/SaaS:</strong> Monatliche/Jährliche Zahlung pro Nutzer (z.B. Microsoft 365)</li>
            <li><strong>Site License:</strong> Pauschal für kompletten Standort/Organisation</li>
            <li><strong>Kostenlos:</strong> Open Source oder frei verfügbare Software</li>
        </ul>
        <p><strong>Beispiel Concurrent:</strong> 100 Mitarbeiter, aber nur 50 arbeiten gleichzeitig → 50 Concurrent-Lizenzen reichen</p>
        <em>Wichtig für Budgetplanung und Compliance!</em>
    </div>

    <div data-tooltip-id="network-segment">
        <strong>Netzwerk-Segment</strong>
        <p>In welchem Teil des Netzwerks befinden sich die Clients?</p>
        <p><strong>Typische Segmente:</strong></p>
        <ul>
            <li><strong>Intern (LAN):</strong> Lokales Netzwerk im Krankenhaus/Firma</li>
            <li><strong>VPN:</strong> Über VPN-Verbindung von außen</li>
            <li><strong>DMZ:</strong> Abgeschottete Zone zwischen Internet und internem Netz</li>
            <li><strong>Internet:</strong> Direkter Zugriff aus dem Internet</li>
            <li><strong>WLAN:</strong> Drahtloses Netzwerk</li>
            <li><strong>Guest Network:</strong> Gäste-Netzwerk</li>
        </ul>
        <p><strong>Wichtig für:</strong></p>
        <ul>
            <li>Firewall-Regeln</li>
            <li>Sicherheitskonzept</li>
            <li>Netzwerk-Performance</li>
        </ul>
        <em>Patientendaten aus Internet = höchste Sicherheitsanforderungen!</em>
    </div>

    <div data-tooltip-id="bandwidth">
        <strong>Bandbreiten-Anforderung</strong>
        <p>Wie viel Netzwerk-Geschwindigkeit brauchen die Clients?</p>
        <p><strong>Richtwerte:</strong></p>
        <ul>
            <li><strong>< 1 Mbit/s:</strong> Einfache Text-Anwendungen, E-Mail</li>
            <li><strong>1-10 Mbit/s:</strong> Standard-Anwendungen, leichte Grafiken</li>
            <li><strong>10-100 Mbit/s:</strong> Normale Anforderungen, Datenbank-Anwendungen</li>
            <li><strong>> 100 Mbit/s:</strong> Bildbearbeitung, PACS, Video-Streaming</li>
            <li><strong>> 1 Gbit/s:</strong> Hochauflösende medizinische Bilder, große Datenmengen</li>
        </ul>
        <p><strong>Beispiele:</strong></p>
        <ul>
            <li>KIS-Client: 10-50 Mbit/s</li>
            <li>PACS-Viewer: 100 Mbit/s - 1 Gbit/s</li>
            <li>Remote Desktop: 2-5 Mbit/s</li>
            <li>Web-Browser: 5-20 Mbit/s</li>
        </ul>
        <em>Bei vielen gleichzeitigen Nutzern: Bandbreite × Anzahl Nutzer rechnen!</em>
    </div>

    <div data-tooltip-id="offline-capability">
        <strong>Offline-Fähigkeit</strong>
        <p>Kann die Anwendung auch ohne Netzwerkverbindung genutzt werden?</p>
        <p><strong>Optionen:</strong></p>
        <ul>
            <li><strong>Vollständig offline:</strong> Alle Funktionen verfügbar, Daten werden später synchronisiert (z.B. Mobile Apps für Außendienst)</li>
            <li><strong>Teilweise offline:</strong> Lesezugriff auf zwischengespeicherte Daten möglich, kein Schreiben (z.B. E-Mail-Clients)</li>
            <li><strong>Caching/Sync:</strong> Häufig genutzte Daten werden zwischengespeichert (z.B. OneDrive)</li>
            <li><strong>Nur online:</strong> Funktioniert nur mit Netzwerkverbindung (z.B. Web-Anwendungen)</li>
        </ul>
        <p><strong>Wichtig bei:</strong></p>
        <ul>
            <li>Mobile Arbeit (Hausbesuche, Rettungsdienst)</li>
            <li>Instabilen Netzwerken</li>
            <li>Flugzeug-Modus auf Tablets</li>
        </ul>
        <em>Achtung: Offline = Datensynchronisation und Konflikte beachten!</em>
    </div>

    <div data-tooltip-id="session-management">
        <strong>Session-Verwaltung</strong>
        <p>Wie wird die Verbindung/Sitzung zwischen Client und Server verwaltet?</p>
        <p><strong>Optionen:</strong></p>
        <ul>
            <li><strong>Persistent (Keep-Alive):</strong> Verbindung bleibt permanent offen. Vorteil: Schnell. Nachteil: Mehr Server-Ressourcen.</li>
            <li><strong>Timeout-basiert:</strong> Nach X Minuten Inaktivität wird Sitzung beendet (z.B. 30 Min). Standard für Sicherheit.</li>
            <li><strong>Stateless (Token):</strong> Jede Anfrage ist unabhängig, Client sendet Token mit (modern, skalierbar)</li>
            <li><strong>Heartbeat/Ping:</strong> Client sendet regelmäßig "Ich bin noch da"-Signal</li>
        </ul>
        <p><strong>Sicherheitsaspekt:</strong> Kürzere Timeouts = sicherer, aber lästiger für Benutzer</p>
        <p><strong>Typische Werte:</strong></p>
        <ul>
            <li>Hochsicherheit: 15 Minuten Timeout</li>
            <li>Normal: 30-60 Minuten Timeout</li>
            <li>Komfortabel: 4-8 Stunden Timeout</li>
        </ul>
        <em>Bei Patientendaten: Kurze Timeouts für verlassene Arbeitsplätze!</em>
    </div>

    <div data-tooltip-id="user-group">
        <strong>Benutzergruppe</strong>
        <p>Welche Gruppe von Personen nutzt diesen Client-Zugriff?</p>
        <p><strong>Beispiele im Krankenhaus:</strong></p>
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
        <p><strong>Hilft bei:</strong></p>
        <ul>
            <li>Berechtigungskonzepten</li>
            <li>Support-Zuständigkeiten</li>
            <li>Schulungsplanung</li>
        </ul>
    </div>

    <div data-tooltip-id="working-hours">
        <strong>Arbeitszeiten / Zugriffszeiten</strong>
        <p>Wann wird das System von dieser Benutzergruppe genutzt?</p>
        <p><strong>Beispiele:</strong></p>
        <ul>
            <li><strong>24/7:</strong> Rund um die Uhr (Notaufnahme, Intensivstation)</li>
            <li><strong>Mo-Fr 07:00-20:00:</strong> Normale Arbeitszeiten</li>
            <li><strong>Mo-Fr 08:00-17:00:</strong> Verwaltung</li>
            <li><strong>Schichtbetrieb:</strong> 06:00-14:00, 14:00-22:00, 22:00-06:00</li>
        </ul>
        <p><strong>Wichtig für:</strong></p>
        <ul>
            <li>Wartungsfenster-Planung</li>
            <li>Support-Verfügbarkeit</li>
            <li>Backup-Zeiten</li>
        </ul>
        <em>Wartungen sollten außerhalb der Hauptnutzungszeiten stattfinden!</em>
    </div>

    <div data-tooltip-id="system-requirements">
        <strong>System-Anforderungen (Client)</strong>
        <p>Welche technischen Voraussetzungen müssen die Client-Geräte erfüllen?</p>
        <p><strong>Typische Anforderungen:</strong></p>
        <ul>
            <li><strong>Prozessor:</strong> Intel Core i5 oder besser</li>
            <li><strong>RAM:</strong> Mindestens 8 GB, empfohlen 16 GB</li>
            <li><strong>Betriebssystem:</strong> Windows 10/11, mindestens Version 21H2</li>
            <li><strong>Browser:</strong> Chrome 120+, Firefox 115+, Edge 120+</li>
            <li><strong>Bildschirm:</strong> Mind. 1920x1080 Auflösung</li>
            <li><strong>Festplatte:</strong> 50 GB freier Speicher</li>
            <li><strong>Netzwerk:</strong> Ethernet oder WLAN mit mind. 10 Mbit/s</li>
        </ul>
        <p><strong>Beispiel:</strong> "Min. 8GB RAM, Windows 10 (64-bit), Chrome 90+, 1920x1080 Display"</p>
        <em>Hilft bei der Beschaffung und Troubleshooting!</em>
    </div>

    <div data-tooltip-id="special-requirements">
        <strong>Besondere Anforderungen</strong>
        <p>Welche zusätzliche Hardware oder Software wird benötigt?</p>
        <p><strong>Beispiele im Gesundheitswesen:</strong></p>
        <ul>
            <li><strong>Kartenleser:</strong> Für elektronische Gesundheitskarte (eGK), Heilberufsausweis (HBA)</li>
            <li><strong>Barcode-Scanner:</strong> Für Medikamentenverwaltung, Labor-Proben</li>
            <li><strong>Drucker:</strong> Netzwerk-Drucker, Label-Drucker, Befund-Drucker</li>
            <li><strong>Signatur-Pad:</strong> Für digitale Unterschriften</li>
            <li><strong>Webcam/Headset:</strong> Für Telemedizin</li>
            <li><strong>Zweiter Bildschirm:</strong> Für bessere Übersicht</li>
            <li><strong>Touch-Screen:</strong> Für Tablet-Nutzung</li>
        </ul>
        <p><strong>Software-Anforderungen:</strong></p>
        <ul>
            <li>Java Runtime (JRE)</li>
            <li>Adobe Reader</li>
            <li>Spezielle Treiber</li>
            <li>VPN-Client</li>
        </ul>
        <em>Dokumentieren Sie alles, was zusätzlich beschafft werden muss!</em>
    </div>

    <div data-tooltip-id="client-notes">
        <strong>Notizen / Zugriffsdetails</strong>
        <p>Zusätzliche wichtige Informationen zu diesem Client-Zugriff.</p>
        <p><strong>Was hier rein sollte:</strong></p>
        <ul>
            <li>Bekannte Probleme und deren Lösungen</li>
            <li>Besondere Konfigurationen</li>
            <li>Support-Kontakte</li>
            <li>Dokumentations-Links</li>
            <li>Wichtige Hinweise für neue Mitarbeiter</li>
            <li>Geplante Änderungen</li>
        </ul>
        <p><strong>Beispiel:</strong></p>
        <p>"Wichtig: Antivirus-Software muss Port 8443 freigeben. Bei Problemen mit Kartenleser: Treiber von https://... neu installieren. Support: IT-Helpdesk Tel. 1234"</p>
        <em>Je mehr Details, desto einfacher der Support!</em>
    </div>
</div>
