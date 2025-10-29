<div class="tooltip-definitions" style="display: none;">
    <div data-tooltip-id="commserver-name">
        <strong>Name des Kommunikationsservers</strong>
        <p>Ein eindeutiger Name für Ihren Kommunikationsserver.</p>
        <p><strong>Was ist ein Kommunikationsserver?</strong> Eine zentrale Software-Plattform (auch Interface Engine genannt), die Nachrichten zwischen verschiedenen medizinischen Systemen vermittelt, übersetzt und routet.</p>
        <p><strong>Warum wichtig im Krankenhaus?</strong></p>
        <ul>
            <li><strong>Zentrale Vermittlung:</strong> Ein System statt viele direkte Verbindungen</li>
            <li><strong>Protokoll-Übersetzung:</strong> HL7 ↔ DICOM ↔ FHIR ↔ REST</li>
            <li><strong>Nachrichtenrouting:</strong> Eine Nachricht an mehrere Empfänger</li>
            <li><strong>Transformation:</strong> Datenformat-Anpassungen</li>
            <li><strong>Überwachung:</strong> Zentrale Stelle für Monitoring</li>
        </ul>
        <p><strong>Namens-Beispiele:</strong></p>
        <ul>
            <li>"HL7 Interface Engine" - HL7-fokussierter Server</li>
            <li>"Mirth Connect Prod" - Produktiv-Mirth-Server</li>
            <li>"Integration Hub KIS" - Zentrale KIS-Integration</li>
            <li>"Medical Interface Server" - Allgemeiner medizinischer Interface-Server</li>
        </ul>
        <em>Ohne Interface Engine: Jedes System muss mit jedem direkt reden = Chaos!</em>
    </div>

    <div data-tooltip-id="commserver-type">
        <strong>Typ / Produkt</strong>
        <p>Welche Interface Engine Software wird verwendet?</p>
        <p><strong>Produkte erklärt:</strong></p>
        <ul>
            <li><strong>Mirth Connect / NextGen Connect:</strong>
                <ul>
                    <li>Open Source (Community) & Commercial</li>
                    <li>Sehr weit verbreitet</li>
                    <li>Java-basiert, plattformübergreifend</li>
                    <li>Starke HL7-Unterstützung</li>
                    <li>Grafische Channel-Konfiguration</li>
                    <li><em>Beliebteste Open-Source-Lösung!</em></li>
                </ul>
            </li>
            <li><strong>Rhapsody Integration Engine:</strong>
                <ul>
                    <li>Commercial, Enterprise-Fokus</li>
                    <li>Orion Health (jetzt Rhapsody Health)</li>
                    <li>Sehr leistungsstark</li>
                    <li>Gutes Monitoring und Management</li>
                </ul>
            </li>
            <li><strong>InterSystems Ensemble/HealthConnect:</strong>
                <ul>
                    <li>Enterprise Integration Platform</li>
                    <li>Teil der InterSystems IRIS Plattform</li>
                    <li>Sehr performant, skalierbar</li>
                    <li>Integriert mit InterSystems Datenbanken</li>
                </ul>
            </li>
            <li><strong>Infor Cloverleaf:</strong>
                <ul>
                    <li>Traditionelle Enterprise-Lösung</li>
                    <li>Sehr stabil, seit Jahrzehnten am Markt</li>
                    <li>Viele Healthcare-Installationen</li>
                </ul>
            </li>
            <li><strong>Interfaceware Iguana:</strong>
                <ul>
                    <li>Lua-basiert, flexibel</li>
                    <li>Gute Web-Oberfläche</li>
                    <li>Für mittlere Umgebungen</li>
                </ul>
            </li>
            <li><strong>Corepoint Integration Engine:</strong>
                <ul>
                    <li>.NET-basiert</li>
                    <li>Windows-fokussiert</li>
                    <li>Grafische Entwicklungsumgebung</li>
                </ul>
            </li>
            <li><strong>Qvera Interface Engine (QIE):</strong>
                <ul>
                    <li>Mirth-kompatibel</li>
                    <li>Commercial Support für Mirth-Migrationen</li>
                </ul>
            </li>
            <li><strong>Eigenentwicklung:</strong>
                <ul>
                    <li>Selbst programmiert (z.B. mit Python, Java)</li>
                    <li>Volle Kontrolle, aber hoher Wartungsaufwand</li>
                </ul>
            </li>
        </ul>
        <em>Wahl hängt ab von: Budget, Support-Bedarf, Team-Know-how, Skalierung</em>
    </div>

    <div data-tooltip-id="commserver-vendor">
        <strong>Hersteller</strong>
        <p>Das Unternehmen, das die Software herstellt.</p>
        <p><strong>Bekannte Hersteller:</strong></p>
        <ul>
            <li>NextGen Healthcare (Mirth)</li>
            <li>Rhapsody Health</li>
            <li>InterSystems</li>
            <li>Infor</li>
            <li>Interfaceware</li>
            <li>Lyniate (Corepoint)</li>
            <li>Qvera</li>
        </ul>
        <p><strong>Wichtig für:</strong> Support-Verträge, Lizenzierung, Update-Planung</p>
    </div>

    <div data-tooltip-id="commserver-version">
        <strong>Version</strong>
        <p>Die installierte Software-Version.</p>
        <p><strong>Warum Version wichtig ist:</strong></p>
        <ul>
            <li>Neue Protokoll-Standards (z.B. FHIR R4 vs R5)</li>
            <li>Performance-Verbesserungen</li>
            <li>Sicherheits-Patches</li>
            <li>Bug-Fixes</li>
            <li>Support-Ende (End of Life)</li>
        </ul>
        <p><strong>Beispiele:</strong></p>
        <ul>
            <li>"4.4.0" - Mirth Connect Version</li>
            <li>"2024.1" - Jahresbasierte Versionierung</li>
            <li>"6.1.2" - Major.Minor.Patch</li>
        </ul>
        <em>Interface Engines MÜSSEN aktuell gehalten werden - alte Versionen = Sicherheitsrisiko!</em>
    </div>

    <div data-tooltip-id="commserver-criticality">
        <strong>Kritikalität</strong>
        <p>Wie kritisch ist dieser Server für den Krankenhausbetrieb?</p>
        <p><strong>Kritikalitätsstufen:</strong></p>
        <ul>
            <li><strong>Kritisch (24/7):</strong>
                <ul>
                    <li>Ausfall = sofortige Betriebsunterbrechung</li>
                    <li>Keine Kommunikation zwischen Systemen</li>
                    <li>Notaufnahme, Labor, Radiologie betroffen</li>
                    <li>Muss IMMER laufen, Redundanz Pflicht</li>
                    <li><em>Typisch für Produktiv-Interface-Engine!</em></li>
                </ul>
            </li>
            <li><strong>Hoch:</strong> Wichtig, kurze Ausfallzeiten tolerierbar</li>
            <li><strong>Mittel:</strong> Wichtig, aber Ausfall verkraftbar</li>
            <li><strong>Niedrig:</strong> Test-/Entwicklungsserver</li>
        </ul>
        <em>Interface Engine ist meist DAS kritischste System - ohne sie: keine Datenkommunikation!</em>
    </div>

    <div data-tooltip-id="commserver-hostname">
        <strong>Hostname / FQDN</strong>
        <p>Der vollständige Netzwerk-Name des Servers.</p>
        <p><strong>FQDN = Fully Qualified Domain Name:</strong> hostname.domain.tld</p>
        <p><strong>Beispiele:</strong></p>
        <ul>
            <li>"hl7engine.krankenhaus.local"</li>
            <li>"mirth-prod.example.com"</li>
            <li>"interface-server-01.healthcare.de"</li>
        </ul>
        <em>FQDN wichtig für SSL-Zertifikate und DNS-Auflösung</em>
    </div>

    <div data-tooltip-id="commserver-os">
        <strong>Betriebssystem</strong>
        <p>Auf welchem OS läuft die Interface Engine?</p>
        <p><strong>Plattformen:</strong></p>
        <ul>
            <li><strong>Windows Server:</strong> Für .NET-basierte Engines (Corepoint), häufig bei Mirth</li>
            <li><strong>Linux:</strong> Beliebt für Mirth (Ubuntu, RHEL), performant</li>
            <li><strong>Unix:</strong> Ältere Systeme, Cloverleaf</li>
            <li><strong>Docker Container:</strong> Modern, isoliert, einfach skalierbar</li>
            <li><strong>Kubernetes:</strong> Enterprise Container-Orchestrierung, Hochverfügbarkeit</li>
        </ul>
        <p><strong>Trend:</strong> Containerisierung (Docker/Kubernetes) - einfachere Verwaltung und Skalierung</p>
    </div>

    <div data-tooltip-id="commserver-admin-port">
        <strong>Web-Management-Port</strong>
        <p>Der Port für die Web-Administrationsoberfläche.</p>
        <p><strong>Typische Ports:</strong></p>
        <ul>
            <li><strong>8443:</strong> Mirth Connect (HTTPS)</li>
            <li><strong>9090:</strong> Rhapsody Web Console</li>
            <li><strong>8080:</strong> HTTP (unsicher, nicht empfohlen)</li>
            <li><strong>443:</strong> Standard HTTPS</li>
        </ul>
        <p><strong>Wichtig:</strong> Port sollte nur für Admins erreichbar sein (Firewall!)</p>
        <em>Niemals Standard-Ports offen ins Internet!</em>
    </div>

    <div data-tooltip-id="commserver-environment">
        <strong>Umgebung</strong>
        <p>In welcher Umgebung läuft dieser Server?</p>
        <p><strong>Umgebungen erklärt:</strong></p>
        <ul>
            <li><strong>Produktion:</strong> Live-System, echte Patientendaten</li>
            <li><strong>Test/Staging:</strong> Exakte Kopie von Produktion zum Testen</li>
            <li><strong>Entwicklung:</strong> Für neue Channel-Entwicklung</li>
            <li><strong>Schulung:</strong> Für Mitarbeiter-Training</li>
        </ul>
        <p><strong>Best Practice:</strong> NIEMALS direkt in Produktion entwickeln - erst Test, dann Prod!</p>
    </div>

    <div data-tooltip-id="commserver-protocols">
        <strong>Protokoll-Support</strong>
        <p>Welche Kommunikations-Protokolle und Standards werden unterstützt?</p>
        <p><strong>Protokolle erklärt:</strong></p>
        <ul>
            <li><strong>HL7 v2.x:</strong> Standard für Patientendaten, Befunde, Aufträge (am häufigsten!)</li>
            <li><strong>HL7 FHIR:</strong> Moderner REST-basierter Standard, Zukunft</li>
            <li><strong>DICOM:</strong> Medizinische Bilder und Bildkommunikation</li>
            <li><strong>IHE XDS:</strong> Dokumenten-Austausch zwischen Einrichtungen</li>
            <li><strong>REST API:</strong> Moderne Web-APIs (JSON/XML über HTTP)</li>
            <li><strong>SOAP:</strong> Älterer Web-Service-Standard (XML)</li>
            <li><strong>MLLP:</strong> Minimal Lower Layer Protocol - Transport für HL7 v2</li>
            <li><strong>HTTP/HTTPS:</strong> Web-basierte Kommunikation</li>
            <li><strong>TCP/IP:</strong> Rohes TCP für proprietäre Protokolle</li>
            <li><strong>File-basiert:</strong> Datei-Austausch über Verzeichnisse</li>
            <li><strong>FTP/SFTP:</strong> Dateitransfer</li>
            <li><strong>Message Queue:</strong> RabbitMQ, IBM MQ, Kafka</li>
        </ul>
        <em>Moderne Interface Engines sollten mindestens HL7 v2, FHIR und REST unterstützen</em>
    </div>

    <div data-tooltip-id="commserver-channel-count">
        <strong>Anzahl aktiver Channels/Routen</strong>
        <p>Wie viele Schnittstellen (Channels) sind konfiguriert?</p>
        <p><strong>Was ist ein Channel?</strong> Eine einzelne konfigurierte Schnittstelle - z.B. "ADT-Feed von KIS zu Labor"</p>
        <p><strong>Typische Größenordnungen:</strong></p>
        <ul>
            <li><strong>10-30 Channels:</strong> Kleine Klinik</li>
            <li><strong>30-100 Channels:</strong> Mittleres Krankenhaus</li>
            <li><strong>100-500 Channels:</strong> Großes Krankenhaus oder Klinikverbund</li>
            <li><strong>500+ Channels:</strong> Sehr große Installation oder mehrere Standorte</li>
        </ul>
        <p><strong>Warum zählen?</strong> Kapazitätsplanung, Performance-Überwachung, Lizenzierung</p>
    </div>

    <div data-tooltip-id="commserver-throughput">
        <strong>Nachrichtendurchsatz</strong>
        <p>Wie viele Nachrichten werden pro Tag verarbeitet?</p>
        <p><strong>Warum wichtig?</strong> Performance-Planung, Kapazitäts-Dimensionierung</p>
        <p><strong>Richtwerte:</strong></p>
        <ul>
            <li><strong>< 10.000/Tag:</strong> Kleine Installation</li>
            <li><strong>10.000-100.000/Tag:</strong> Mittelgroß</li>
            <li><strong>100.000-1 Mio/Tag:</strong> Groß</li>
            <li><strong>> 1 Mio/Tag:</strong> Sehr groß, HA erforderlich</li>
        </ul>
        <p><strong>Beispiel:</strong> "ca. 500.000 Nachrichten" oder "ca. 20.000 HL7-Messages/Tag"</p>
        <em>Bei Spitzenzeiten (Montag morgen) kann Durchsatz 3-5x höher sein!</em>
    </div>

    <div data-tooltip-id="commserver-channels">
        <strong>Wichtige Channels</strong>
        <p>Listen Sie die kritischsten oder wichtigsten Channels auf.</p>
        <p><strong>Warum dokumentieren?</strong></p>
        <ul>
            <li>Schnelle Übersicht bei Störungen</li>
            <li>Priorisierung bei Problemen</li>
            <li>Onboarding neuer Admins</li>
        </ul>
        <p><strong>Beispiele:</strong></p>
        <ul>
            <li>"ADT-Feed (KIS → Labor)" - Patientenbewegungen</li>
            <li>"ORU-Results (Labor → KIS)" - Labor-Befunde</li>
            <li>"DICOM-Routing (Modalität → PACS)" - Bildrouting</li>
            <li>"ORM-Orders (KIS → Radiologie)" - Aufträge</li>
            <li>"HL7-to-FHIR-Converter" - Protokoll-Übersetzung</li>
        </ul>
    </div>

    <div data-tooltip-id="commserver-ha">
        <strong>Hochverfügbarkeits-Konfiguration (HA/Cluster)</strong>
        <p>Läuft die Interface Engine redundant?</p>
        <p><strong>Warum HA wichtig ist:</strong> Interface Engine ist meist kritischstes System - Ausfall = keine Datenflüsse!</p>
        <p><strong>HA-Vorteile:</strong></p>
        <ul>
            <li>Kein Single Point of Failure</li>
            <li>Wartung ohne Downtime</li>
            <li>Automatisches Failover bei Ausfall</li>
            <li>Load Distribution</li>
        </ul>
        <p><strong>Typisches Setup:</strong> 2 oder 3 Server im Cluster</p>
        <em>Für kritische Produktiv-Systeme: HA ist Pflicht!</em>
    </div>

    <div data-tooltip-id="commserver-cluster-type">
        <strong>Cluster-Typ</strong>
        <p>Wie arbeiten die Server im Cluster zusammen?</p>
        <p><strong>Cluster-Modi:</strong></p>
        <ul>
            <li><strong>Active-Active:</strong>
                <ul>
                    <li>Beide Server verarbeiten parallel Nachrichten</li>
                    <li>Last wird verteilt</li>
                    <li>Beste Performance</li>
                    <li>Bei Ausfall: Anderer übernimmt komplett</li>
                </ul>
            </li>
            <li><strong>Active-Passive:</strong>
                <ul>
                    <li>Ein Server aktiv, anderer wartet im Standby</li>
                    <li>Bei Ausfall: Automatisches Failover</li>
                    <li>Einfacher zu konfigurieren</li>
                    <li>Standby-Server wird nicht genutzt (Verschwendung)</li>
                </ul>
            </li>
            <li><strong>Load Balanced:</strong>
                <ul>
                    <li>Load Balancer verteilt Anfragen</li>
                    <li>Mehrere aktive Knoten</li>
                    <li>Sehr skalierbar</li>
                    <li>Komplex in der Konfiguration</li>
                </ul>
            </li>
        </ul>
        <em>Active-Active ist ideal für hohe Last, Active-Passive für einfache Redundanz</em>
    </div>

    <div data-tooltip-id="commserver-node-count">
        <strong>Anzahl Knoten</strong>
        <p>Wie viele Server sind im Cluster?</p>
        <p><strong>Typisch:</strong></p>
        <ul>
            <li><strong>2 Knoten:</strong> Standard HA (ein aktiv, ein Standby oder beide aktiv)</li>
            <li><strong>3 Knoten:</strong> Bessere Redundanz, bei Kubernetes oft Standard</li>
            <li><strong>5+ Knoten:</strong> Sehr große Installationen, geografisch verteilt</li>
        </ul>
        <em>Ungerade Anzahl (3, 5) hilft bei Split-Brain-Prävention</em>
    </div>

    <div data-tooltip-id="commserver-monitoring">
        <strong>Monitoring-Tool</strong>
        <p>Wie wird der Server überwacht?</p>
        <p><strong>Warum Monitoring kritisch ist:</strong> Interface Engine-Ausfall = Betriebsausfall!</p>
        <p><strong>Monitoring-Optionen:</strong></p>
        <ul>
            <li><strong>Eingebautes Dashboard:</strong> Viele Engines haben eigenes Monitoring (z.B. Mirth Dashboard)</li>
            <li><strong>Nagios / Icinga:</strong> Open-Source-Monitoring</li>
            <li><strong>Zabbix:</strong> Enterprise Monitoring</li>
            <li><strong>PRTG:</strong> Windows-fokussiert</li>
            <li><strong>Prometheus + Grafana:</strong> Modern, Container-freundlich</li>
            <li><strong>Splunk:</strong> Log-Aggregation und Monitoring</li>
        </ul>
        <p><strong>Was überwachen:</strong></p>
        <ul>
            <li>Channel Status (läuft/gestoppt)</li>
            <li>Nachrichtendurchsatz</li>
            <li>Fehlerrate</li>
            <li>Queue-Längen</li>
            <li>CPU/RAM-Auslastung</li>
        </ul>
        <em>Ohne Monitoring: Keine Ahnung wenn Channels ausfallen!</em>
    </div>

    <div data-tooltip-id="commserver-log-retention">
        <strong>Log-Retention (Tage)</strong>
        <p>Wie lange werden Logs aufbewahrt?</p>
        <p><strong>Warum Logs wichtig:</strong></p>
        <ul>
            <li>Troubleshooting bei Problemen</li>
            <li>Compliance-Nachweis (DSGVO)</li>
            <li>Audit-Trail</li>
            <li>Fehleranalyse</li>
        </ul>
        <p><strong>Empfohlene Aufbewahrung:</strong></p>
        <ul>
            <li><strong>Minimum:</strong> 30 Tage</li>
            <li><strong>Standard:</strong> 90 Tage</li>
            <li><strong>Compliance:</strong> 1-2 Jahre (je nach Anforderung)</li>
        </ul>
        <p><strong>Problem:</strong> Interface Engine Logs können RIESIG werden (GB pro Tag!)</p>
        <em>Balance: Genug für Troubleshooting, nicht zu viel für Storage</em>
    </div>

    <div data-tooltip-id="commserver-siem">
        <strong>SIEM-Integration</strong>
        <p>Werden Logs an ein zentrales SIEM gesendet?</p>
        <p><strong>Was ist SIEM?</strong> Security Information and Event Management - zentrale Log-Sammlung und Sicherheitsüberwachung</p>
        <p><strong>Warum SIEM für Interface Engine?</strong></p>
        <ul>
            <li>Zentrale Übersicht über alle Systeme</li>
            <li>Sicherheits-Events erkennen (unbefugte Zugriffe)</li>
            <li>Korrelation über Systeme hinweg</li>
            <li>Compliance (DSGVO, KRITIS)</li>
        </ul>
        <p><strong>Typische SIEM-Systeme:</strong> Splunk, QRadar, Elastic, Microsoft Sentinel</p>
        <em>Bei kritischen Interface Engines: SIEM ist sehr empfohlen!</em>
    </div>

    <div data-tooltip-id="commserver-siem-log-format">
        <strong>Log-Format</strong>
        <p>In welchem Format werden Logs zum SIEM gesendet?</p>
        <p><strong>Formate erklärt:</strong></p>
        <ul>
            <li><strong>Syslog:</strong> Standard Unix/Linux Log-Format, weit verbreitet</li>
            <li><strong>JSON:</strong> Strukturiert, maschinenlesbar, modern</li>
            <li><strong>CEF (Common Event Format):</strong> Standard von ArcSight/HP</li>
            <li><strong>LEEF (Log Event Extended Format):</strong> IBM QRadar Format</li>
            <li><strong>Custom:</strong> Spezifisches Format für Ihr SIEM</li>
        </ul>
        <em>JSON ist meist beste Wahl - flexibel und gut parsebar</em>
    </div>

    <div data-tooltip-id="commserver-siem-transport">
        <strong>Transport-Protokoll</strong>
        <p>Wie werden Logs zum SIEM übertragen?</p>
        <p><strong>Protokolle:</strong></p>
        <ul>
            <li><strong>TCP:</strong> Zuverlässig, garantierte Zustellung</li>
            <li><strong>UDP:</strong> Schnell, aber Logs können verloren gehen</li>
            <li><strong>TLS/SSL:</strong> Verschlüsseltes TCP (empfohlen!)</li>
            <li><strong>HTTPS:</strong> Web-basiert, verschlüsselt</li>
            <li><strong>Elastic Beats:</strong> Spezielle Agents für Elastic Stack</li>
        </ul>
        <em>Für sensible Logs (Patientendaten): Immer verschlüsselt (TLS/HTTPS)!</em>
    </div>

    <div data-tooltip-id="commserver-siem-log-types">
        <strong>Log-Kategorien</strong>
        <p>Welche Log-Typen werden zum SIEM gesendet?</p>
        <p><strong>Kategorien erklärt:</strong></p>
        <ul>
            <li><strong>Application Logs:</strong> Channel-Aktivitäten, Nachrichtenflüsse</li>
            <li><strong>Security Events:</strong> Login-Versuche, Zugriffsrechte-Änderungen</li>
            <li><strong>Access Logs:</strong> Wer hat wann auf was zugegriffen</li>
            <li><strong>Error Logs:</strong> Fehler, Exceptions, Channel-Ausfälle</li>
            <li><strong>Audit Logs:</strong> Konfigurationsänderungen, Admin-Aktionen</li>
            <li><strong>Performance Logs:</strong> CPU, RAM, Durchsatz-Statistiken</li>
        </ul>
        <em>Für Compliance: Mindestens Security, Access und Audit Logs!</em>
    </div>

    <div data-tooltip-id="commserver-auth">
        <strong>Authentifizierung</strong>
        <p>Wie authentifizieren sich Administratoren?</p>
        <p><strong>Auth-Methoden:</strong></p>
        <ul>
            <li><strong>Active Directory:</strong> Windows-Domänen-Login, SSO</li>
            <li><strong>LDAP:</strong> Zentrale Benutzerverwaltung (auch für Linux)</li>
            <li><strong>Lokale Benutzer:</strong> Direkt in Interface Engine, einfach aber dezentral</li>
            <li><strong>Single Sign-On:</strong> Einmal anmelden, überall Zugriff</li>
            <li><strong>Zertifikatsbasiert:</strong> Mit Client-Zertifikaten, sehr sicher</li>
        </ul>
        <em>AD/LDAP ist empfohlen - zentrale Verwaltung, einfacher zu kontrollieren</em>
    </div>

    <div data-tooltip-id="commserver-tls">
        <strong>TLS/SSL für Admin-Zugriff</strong>
        <p>Ist die Admin-Oberfläche verschlüsselt?</p>
        <p><strong>Warum TLS wichtig:</strong></p>
        <ul>
            <li>Passwörter werden verschlüsselt übertragen</li>
            <li>Konfigurationen können sensible Daten enthalten</li>
            <li>Schutz vor Man-in-the-Middle-Angriffen</li>
        </ul>
        <p><strong>Ja, TLS aktiviert:</strong> HTTPS (Port 8443, 443) - <em>Empfohlen!</em></p>
        <p><strong>Nein:</strong> HTTP (Port 8080) - <em>Nur für Test-Umgebungen!</em></p>
        <em>Produktiv-Systeme MÜSSEN TLS haben!</em>
    </div>

    <div data-tooltip-id="commserver-access">
        <strong>Zugriffsberechtigung</strong>
        <p>Wer darf auf den Server zugreifen?</p>
        <p><strong>Typische Rollen:</strong></p>
        <ul>
            <li><strong>Interface-Team:</strong> Spezialisten für Interface Engine</li>
            <li><strong>IT-Operations:</strong> Allgemeine IT-Admins</li>
            <li><strong>Application-Teams:</strong> Nur lesender Zugriff für Monitoring</li>
            <li><strong>Vendor-Support:</strong> Temporärer Zugriff für Wartung</li>
        </ul>
        <p><strong>Principle of Least Privilege:</strong> Nur die wirklich nötigen Personen, nur die nötigen Rechte</p>
        <em>Dokumentieren Sie: Wer hat warum Zugriff?</em>
    </div>

    <div data-tooltip-id="commserver-maintenance">
        <strong>Wartungsfenster</strong>
        <p>Wann werden Updates und Wartung durchgeführt?</p>
        <p><strong>Warum Wartungsfenster wichtig:</strong></p>
        <ul>
            <li>Interface Engine-Neustart nötig für Updates</li>
            <li>Während Neustart: Keine Nachrichtenverarbeitung!</li>
            <li>Koordination mit abhängigen Systemen</li>
        </ul>
        <p><strong>Typische Fenster:</strong></p>
        <ul>
            <li>"Sonntag 02:00-06:00 Uhr" - Nachts am Wochenende</li>
            <li>"Erster Sonntag im Monat 03:00-05:00"</li>
            <li>"Nach Vereinbarung" - Für unkritische Systeme</li>
        </ul>
        <em>Bei HA-Cluster: Rolling Updates ohne Downtime möglich!</em>
    </div>

    <div data-tooltip-id="commserver-last-update">
        <strong>Letztes Update</strong>
        <p>Wann wurde die Software zuletzt aktualisiert?</p>
        <p><strong>Warum dokumentieren:</strong></p>
        <ul>
            <li>Update-Rhythmus nachvollziehen</li>
            <li>Sicherheitsrisiko erkennen (zu alt?)</li>
            <li>Nächstes Update planen</li>
        </ul>
        <p><strong>Empfohlener Update-Rhythmus:</strong></p>
        <ul>
            <li>Security Patches: Sofort (oder innerhalb 14 Tage)</li>
            <li>Minor Updates: Quartalsweise</li>
            <li>Major Updates: Jährlich oder alle 2 Jahre</li>
        </ul>
    </div>

    <div data-tooltip-id="commserver-support">
        <strong>Support-Kontakt</strong>
        <p>Wen kontaktieren bei Problemen?</p>
        <p><strong>Wichtige Kontakte:</strong></p>
        <ul>
            <li>Internes Interface-Team E-Mail</li>
            <li>Vendor-Support (Hersteller-Hotline)</li>
            <li>Notfall-Kontakt (Rufbereitschaft)</li>
        </ul>
        <p><strong>Beispiel:</strong> "interface-support@example.com, Rufbereitschaft: +49-xxx-xxx (24/7)"</p>
        <em>Bei kritischen Systemen: 24/7 Erreichbarkeit Pflicht!</em>
    </div>

    <div data-tooltip-id="commserver-notes">
        <strong>Anmerkungen</strong>
        <p>Zusätzliche wichtige Informationen.</p>
        <p><strong>Was dokumentieren:</strong></p>
        <ul>
            <li>Besonderheiten der Konfiguration</li>
            <li>Bekannte Probleme und Workarounds</li>
            <li>Geplante Upgrades oder Migrationen</li>
            <li>Historische Informationen (Migration von altem System)</li>
            <li>Performance-Tuning-Einstellungen</li>
            <li>Abhängigkeiten zu anderen Systemen</li>
        </ul>
        <p><strong>Beispiel:</strong> "Upgrade auf v4.5 geplant für Q2/2024. Bekanntes Problem: Channel 'Lab-Results' muss nach Neustart manuell gestartet werden. Java Heap Size auf 8GB erhöht wegen hoher Last."</p>
        <em>Gute Dokumentation rettet Leben (und Nerven) bei Notfällen!</em>
    </div>
</div>
