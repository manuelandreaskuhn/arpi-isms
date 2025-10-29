<div class="tooltip-definitions" style="display: none;">
    <div data-tooltip-id="lb-name">
        <strong>Load Balancer Name</strong>
        <p>Ein eindeutiger Name für diesen Load Balancer.</p>
        <p><strong>Was ist ein Load Balancer?</strong> Ein "Lastverteiler" - verteilt eingehende Anfragen auf mehrere Server, damit kein Server überlastet wird.</p>
        <p><strong>Warum wichtig?</strong></p>
        <ul>
            <li>Verhindert Überlastung einzelner Server</li>
            <li>Ermöglicht Hochverfügbarkeit (HA)</li>
            <li>Wenn ein Server ausfällt, leitet LB Traffic zu anderen</li>
            <li>Bessere Performance durch Verteilung</li>
        </ul>
        <p><strong>Namens-Beispiele:</strong></p>
        <ul>
            <li>"LB-KIS-PROD" - Load Balancer für KIS Produktion</li>
            <li>"F5-BigIP-01" - F5 Load Balancer, Instance 1</li>
            <li>"NGINX-LB-WebApps" - NGINX Load Balancer für Web-Apps</li>
            <li>"Azure-LB-Frontend" - Azure Load Balancer Frontend</li>
        </ul>
    </div>

    <div data-tooltip-id="lb-type">
        <strong>Typ / Hersteller</strong>
        <p>Die verwendete Load Balancer Lösung.</p>
        <p><strong>Hardware vs. Software:</strong></p>
        <ul>
            <li><strong>Hardware-LB:</strong> Dedizierte Appliance (teuer, sehr performant)</li>
            <li><strong>Software-LB:</strong> Software auf Standard-Server (flexibel, günstiger)</li>
            <li><strong>Cloud-LB:</strong> Cloud-Service (Azure, AWS)</li>
        </ul>
        <p><strong>Typen erklärt:</strong></p>
        <ul>
            <li><strong>F5 BIG-IP:</strong>
                <ul>
                    <li>Marktführer, sehr leistungsstark</li>
                    <li>Hardware-Appliance oder Virtual Edition</li>
                    <li>Viele Features: WAF, SSL, Traffic Management</li>
                    <li>Teuer, aber Enterprise-Support</li>
                </ul>
            </li>
            <li><strong>Citrix NetScaler / ADC:</strong>
                <ul>
                    <li>Enterprise Load Balancer & Application Delivery Controller</li>
                    <li>Gut für Citrix-Umgebungen</li>
                    <li>Starke SSL-Performance</li>
                </ul>
            </li>
            <li><strong>NGINX:</strong>
                <ul>
                    <li>Open Source (auch Commercial Version)</li>
                    <li>Software-basiert, sehr schnell</li>
                    <li>Einfache Konfiguration</li>
                    <li>Gut für Web-Anwendungen</li>
                    <li><em>Beliebt für neue Projekte!</em></li>
                </ul>
            </li>
            <li><strong>HAProxy:</strong>
                <ul>
                    <li>Open Source, kostenlos</li>
                    <li>Sehr zuverlässig und schnell</li>
                    <li>Text-Konfiguration</li>
                    <li>Standard für viele Linux-Umgebungen</li>
                </ul>
            </li>
            <li><strong>AWS Elastic Load Balancer:</strong>
                <ul>
                    <li>Cloud-nativer AWS-Service</li>
                    <li>ALB (Application), NLB (Network), CLB (Classic)</li>
                    <li>Automatisch skalierend</li>
                </ul>
            </li>
            <li><strong>Azure Load Balancer:</strong>
                <ul>
                    <li>Microsoft Azure Cloud-Service</li>
                    <li>Basic oder Standard Tier</li>
                    <li>Gut integriert mit Azure-Services</li>
                </ul>
            </li>
            <li><strong>Kemp LoadMaster:</strong>
                <ul>
                    <li>Preis-Leistungs-starke Alternative zu F5</li>
                    <li>Hardware und Virtual</li>
                </ul>
            </li>
        </ul>
        <p><strong>Entscheidungshilfe:</strong></p>
        <ul>
            <li>Enterprise, Budget vorhanden → F5 oder Citrix</li>
            <li>Cloud (AWS) → AWS ELB</li>
            <li>Cloud (Azure) → Azure LB</li>
            <li>Open Source, flexibel → NGINX oder HAProxy</li>
        </ul>
    </div>

    <div data-tooltip-id="lb-mgmt-ip">
        <strong>Management IP</strong>
        <p>Die IP-Adresse für die Administration des Load Balancers.</p>
        <p><strong>Was ist das?</strong> Eine separate IP nur für Management - dort melden Sie sich an, um den LB zu konfigurieren.</p>
        <p><strong>Warum separate Management-IP?</strong></p>
        <ul>
            <li>Trennung von Management und Production-Traffic</li>
            <li>Sicherheit: Management nur aus Admin-Netz</li>
            <li>Auch bei Problem mit Production-IPs erreichbar</li>
        </ul>
        <p><strong>Typisches Setup:</strong></p>
        <ul>
            <li>Management-IP: 192.168.10.100 (Admin-Netz)</li>
            <li>VIP (Virtual IP): 10.0.1.100 (Production)</li>
        </ul>
        <em>Best Practice: Management-IP in separatem VLAN!</em>
    </div>

    <div data-tooltip-id="lb-location">
        <strong>Standort</strong>
        <p>Wo ist der Load Balancer platziert?</p>
        <p><strong>Typische Positionen:</strong></p>
        <ul>
            <li><strong>DMZ:</strong> Zwischen Internet und internem Netz (für öffentliche Webseiten)</li>
            <li><strong>Internal:</strong> Im internen Netz (für interne Anwendungen)</li>
            <li><strong>RZ1/RZ2:</strong> Spezifisches Rechenzentrum</li>
            <li><strong>Cloud:</strong> In Cloud-Umgebung (AWS, Azure)</li>
            <li><strong>Edge:</strong> Am Netzwerk-Rand</li>
        </ul>
    </div>

    <div data-tooltip-id="vip">
        <strong>Virtual IP (VIP)</strong>
        <p>Die "öffentliche" IP-Adresse, auf die Clients zugreifen.</p>
        <p><strong>Was ist eine VIP?</strong> Die IP, die nach außen sichtbar ist. Der Load Balancer "horcht" auf dieser IP und verteilt Traffic an Backend-Server.</p>
        <p><strong>Wichtig:</strong></p>
        <ul>
            <li>Clients verbinden sich zur VIP</li>
            <li>Load Balancer leitet weiter an Backend-IPs</li>
            <li>Bei HA: VIP wandert zwischen LB-Paaren</li>
        </ul>
        <p><strong>Beispiel-Szenario:</strong></p>
        <ul>
            <li>VIP: 10.0.1.100 (das sehen Clients)</li>
            <li>Backend 1: 10.0.2.10 (versteckt)</li>
            <li>Backend 2: 10.0.2.11 (versteckt)</li>
            <li>Client verbindet zu 10.0.1.100 → LB wählt Backend 10.0.2.10 oder .11</li>
        </ul>
        <em>Die VIP ist wie eine Empfangsdame, die Besucher auf verschiedene Büros verteilt</em>
    </div>

    <div data-tooltip-id="lb-ports">
        <strong>Port(s)</strong>
        <p>Die Netzwerk-Ports, auf denen der Load Balancer lauscht.</p>
        <p><strong>Standard-Ports:</strong></p>
        <ul>
            <li><strong>443:</strong> HTTPS (verschlüsselt) - Standard für Web</li>
            <li><strong>80:</strong> HTTP (unverschlüsselt)</li>
            <li><strong>8080:</strong> Alternative HTTP</li>
            <li><strong>3389:</strong> RDP (Remote Desktop)</li>
            <li><strong>1433:</strong> MS SQL Server</li>
        </ul>
        <p><strong>Mehrere Ports:</strong> "443, 80" - LB lauscht auf beiden</p>
        <em>Meist: Port 443 für HTTPS Web-Anwendungen</em>
    </div>

    <div data-tooltip-id="lb-protocol">
        <strong>Protokoll</strong>
        <p>Das Netzwerk-Protokoll für die Kommunikation.</p>
        <p><strong>Protokolle erklärt:</strong></p>
        <ul>
            <li><strong>HTTP:</strong>
                <ul>
                    <li>Hypertext Transfer Protocol (Web, unverschlüsselt)</li>
                    <li>Port 80</li>
                    <li>LB kann HTTP-Header lesen</li>
                    <li><em>Nicht für sensible Daten!</em></li>
                </ul>
            </li>
            <li><strong>HTTPS:</strong>
                <ul>
                    <li>HTTP über SSL/TLS (verschlüsselt)</li>
                    <li>Port 443</li>
                    <li>Standard für moderne Web-Apps</li>
                    <li><em>Empfohlen für Patientendaten!</em></li>
                </ul>
            </li>
            <li><strong>TCP:</strong>
                <ul>
                    <li>Transmission Control Protocol</li>
                    <li>Niedrigere Ebene als HTTP</li>
                    <li>Für Datenbanken, RDP, generische Services</li>
                    <li>LB sieht Inhalt nicht (nur IP/Port)</li>
                </ul>
            </li>
            <li><strong>UDP:</strong>
                <ul>
                    <li>User Datagram Protocol</li>
                    <li>Verbindungslos, schneller als TCP</li>
                    <li>Für DNS, VoIP, Streaming</li>
                    <li>Weniger gebräuchlich für Load Balancing</li>
                </ul>
            </li>
            <li><strong>Gemischt (HTTP/HTTPS):</strong>
                <ul>
                    <li>LB akzeptiert beide</li>
                    <li>Oft: HTTP → automatisch Redirect zu HTTPS</li>
                </ul>
            </li>
        </ul>
        <p><strong>Wann was?</strong></p>
        <ul>
            <li>Web-Anwendungen → HTTP oder HTTPS (meist HTTPS)</li>
            <li>Datenbank → TCP</li>
            <li>RDP/SSH → TCP</li>
        </ul>
    </div>

    <div data-tooltip-id="lb-algorithm">
        <strong>Load Balancing Algorithmus</strong>
        <p>Wie entscheidet der LB, welcher Backend-Server die nächste Anfrage bekommt?</p>
        <p><strong>Algorithmen erklärt:</strong></p>
        <ul>
            <li><strong>Round Robin:</strong>
                <ul>
                    <li>Reihum: Server 1 → Server 2 → Server 3 → Server 1...</li>
                    <li>Am einfachsten, fair verteilt</li>
                    <li>Problem: Berücksichtigt nicht Server-Last</li>
                    <li><em>Standard-Wahl für gleich starke Server</em></li>
                </ul>
            </li>
            <li><strong>Least Connections:</strong>
                <ul>
                    <li>Sendet Anfrage an Server mit wenigsten aktiven Verbindungen</li>
                    <li>Besser als Round Robin für unterschiedliche Request-Dauern</li>
                    <li>Dynamische Anpassung an Last</li>
                    <li><em>Gut für Anwendungen mit langen Sessions</em></li>
                </ul>
            </li>
            <li><strong>IP Hash:</strong>
                <ul>
                    <li>Client-IP wird gehasht → bestimmt Backend-Server</li>
                    <li>Gleicher Client → immer gleicher Server (Session Affinity)</li>
                    <li>Gut für Sessions ohne Session-Store</li>
                    <li>Problem: Ungleiche Verteilung bei wenigen Clients</li>
                </ul>
            </li>
            <li><strong>Weighted Round Robin:</strong>
                <ul>
                    <li>Wie Round Robin, aber Server haben Gewichtung</li>
                    <li>Starker Server (Gewicht 3) bekommt 3x so viel wie schwacher (Gewicht 1)</li>
                    <li>Für unterschiedlich leistungsstarke Server</li>
                </ul>
            </li>
            <li><strong>Least Response Time:</strong>
                <ul>
                    <li>Sendet an Server mit schnellster Antwortzeit</li>
                    <li>LB misst Performance der Backends</li>
                    <li>Optimal für beste User-Experience</li>
                    <li>Etwas mehr Overhead</li>
                </ul>
            </li>
        </ul>
        <p><strong>Empfehlung:</strong></p>
        <ul>
            <li>Standard → Round Robin</li>
            <li>Unterschiedliche Server-Power → Weighted</li>
            <li>Sessions wichtig → IP Hash oder Least Connections</li>
            <li>Beste Performance → Least Response Time</li>
        </ul>
    </div>

    <div data-tooltip-id="lb-backend">
        <strong>Backend-Server</strong>
        <p>Die Server, zu denen der Load Balancer Traffic verteilt.</p>
        <p><strong>Was sind Backend-Server?</strong> Die "echten" Server im Hintergrund, die die Arbeit machen. Load Balancer ist nur Vermittler.</p>
        <p><strong>Typisches Setup:</strong></p>
        <ul>
            <li>Frontend: Load Balancer VIP 10.0.1.100</li>
            <li>Backend: Server1 (10.0.2.10), Server2 (10.0.2.11), Server3 (10.0.2.12)</li>
        </ul>
        <p><strong>Warum mehrere Backend-Server?</strong></p>
        <ul>
            <li>Lastverteilung (kein Server überlastet)</li>
            <li>Redundanz (ein Server fällt aus → andere übernehmen)</li>
            <li>Wartung ohne Downtime (einen Server abschalten, andere laufen)</li>
        </ul>
        <p><strong>Mindestanzahl:</strong> 2 Server für HA, empfohlen 3+</p>
    </div>

    <div data-tooltip-id="backend-port">
        <strong>Backend Port</strong>
        <p>Der Port, auf dem die Backend-Server lauschen.</p>
        <p><strong>Kann unterschiedlich sein vom Frontend!</strong></p>
        <p><strong>Beispiel-Szenario:</strong></p>
        <ul>
            <li>Frontend (VIP): Port 443 (HTTPS)</li>
            <li>Backend: Port 8080 (HTTP)</li>
            <li>Load Balancer macht SSL-Terminierung (entschlüsselt)</li>
            <li>Backend-Server brauchen kein SSL</li>
        </ul>
        <p><strong>Typische Setups:</strong></p>
        <ul>
            <li>443 → 443 (SSL Passthrough)</li>
            <li>443 → 8080 (SSL Offload)</li>
            <li>80 → 80 (Plain HTTP)</li>
        </ul>
    </div>

    <div data-tooltip-id="session-persistence">
        <strong>Session Persistence</strong>
        <p>Stellt sicher, dass ein Benutzer immer zum gleichen Backend-Server geleitet wird.</p>
        <p><strong>Warum wichtig?</strong> Manche Anwendungen speichern Session-Daten lokal auf dem Server. Wenn User zu anderem Server wechselt = Session verloren = erneut anmelden!</p>
        <p><strong>Methoden:</strong></p>
        <ul>
            <li><strong>Keine:</strong>
                <ul>
                    <li>Jede Anfrage kann an anderen Server</li>
                    <li>Nur für stateless Anwendungen</li>
                    <li>Oder wenn Session in Datenbank/Redis</li>
                </ul>
            </li>
            <li><strong>Cookie-basiert:</strong>
                <ul>
                    <li>LB setzt Cookie mit Server-ID</li>
                    <li>Bei nächster Anfrage: Cookie lesen → gleicher Server</li>
                    <li>Am flexibelsten</li>
                    <li><em>Standard für Web-Apps!</em></li>
                </ul>
            </li>
            <li><strong>Source IP:</strong>
                <ul>
                    <li>Client-IP bestimmt Backend-Server</li>
                    <li>Gleiche IP → gleicher Server</li>
                    <li>Problem: Hinter NAT/Proxy alle gleiche IP</li>
                </ul>
            </li>
            <li><strong>SSL Session ID:</strong>
                <ul>
                    <li>SSL-Session-ID für Zuordnung</li>
                    <li>Für SSL/TLS Verbindungen</li>
                </ul>
            </li>
        </ul>
        <p><strong>Wann was?</strong></p>
        <ul>
            <li>Moderne Web-App mit Session-Store → Keine</li>
            <li>Alte Web-App mit lokalen Sessions → Cookie</li>
            <li>Non-HTTP Protokoll → Source IP</li>
        </ul>
    </div>

    <div data-tooltip-id="health-check-method">
        <strong>Health Check Methode</strong>
        <p>Wie prüft der Load Balancer, ob ein Backend-Server noch funktioniert?</p>
        <p><strong>Warum Health Checks?</strong> Wenn ein Backend-Server abstürzt oder hängt, soll LB keinen Traffic mehr dorthin senden!</p>
        <p><strong>Methoden:</strong></p>
        <ul>
            <li><strong>TCP Port Check:</strong>
                <ul>
                    <li>Prüft nur: Ist Port offen?</li>
                    <li>Schnell, aber oberflächlich</li>
                    <li>Server könnte hängen, Port aber offen</li>
                </ul>
            </li>
            <li><strong>HTTP GET:</strong>
                <ul>
                    <li>Ruft HTTP-URL auf (z.B. /health)</li>
                    <li>Erwartet HTTP 200 OK</li>
                    <li>Besser: Prüft, ob Anwendung antwortet</li>
                    <li><em>Standard für Web-Apps!</em></li>
                </ul>
            </li>
            <li><strong>HTTPS GET:</strong>
                <ul>
                    <li>Wie HTTP GET, aber verschlüsselt</li>
                    <li>Für HTTPS-Backends</li>
                </ul>
            </li>
            <li><strong>ICMP Ping:</strong>
                <ul>
                    <li>Prüft nur: Ist Server erreichbar?</li>
                    <li>Sehr basic, nicht empfohlen</li>
                </ul>
            </li>
            <li><strong>Custom Script:</strong>
                <ul>
                    <li>Eigenes Test-Skript</li>
                    <li>Für spezielle Checks (z.B. Datenbank-Verbindung testen)</li>
                </ul>
            </li>
        </ul>
        <p><strong>Empfehlung:</strong> HTTP(S) GET mit dediziertem Health-Endpoint</p>
    </div>

    <div data-tooltip-id="health-check-path">
        <strong>Health Check Pfad</strong>
        <p>Die URL oder der Pfad, der für HTTP Health Checks aufgerufen wird.</p>
        <p><strong>Typische Pfade:</strong></p>
        <ul>
            <li>/health</li>
            <li>/healthcheck</li>
            <li>/status</li>
            <li>/ping</li>
            <li>/api/health</li>
        </ul>
        <p><strong>Was sollte der Endpoint zurückgeben?</strong></p>
        <ul>
            <li>HTTP 200 OK bei gesund</li>
            <li>HTTP 503 Service Unavailable bei Problem</li>
            <li>Optional: JSON mit Details {"status": "healthy"}</li>
        </ul>
        <p><strong>Best Practice:</strong> Health-Endpoint sollte prüfen:</p>
        <ul>
            <li>Ist Anwendung gestartet?</li>
            <li>Datenbank-Verbindung OK?</li>
            <li>Kritische Services erreichbar?</li>
        </ul>
        <em>Nicht nur "200 OK" zurückgeben - echte Checks machen!</em>
    </div>

    <div data-tooltip-id="check-interval">
        <strong>Check Intervall</strong>
        <p>Wie oft (in Sekunden) wird der Health Check durchgeführt?</p>
        <p><strong>Typische Werte:</strong></p>
        <ul>
            <li><strong>5 Sekunden:</strong> Sehr häufig, schnelle Fehler-Erkennung</li>
            <li><strong>10 Sekunden:</strong> Standard, guter Kompromiss</li>
            <li><strong>30 Sekunden:</strong> Weniger Last, langsamere Erkennung</li>
        </ul>
        <p><strong>Trade-off:</strong></p>
        <ul>
            <li>Kurzes Intervall = schnelle Fehler-Erkennung, aber mehr Last auf Backend</li>
            <li>Langes Intervall = weniger Last, aber längere Ausfallzeit bis Erkennung</li>
        </ul>
        <p><strong>Empfehlung:</strong> 10 Sekunden für kritische Services, 30 Sekunden für unkritische</p>
    </div>

    <div data-tooltip-id="check-timeout">
        <strong>Timeout</strong>
        <p>Wie lange (in Sekunden) wartet LB auf Antwort des Health Checks?</p>
        <p><strong>Was passiert bei Timeout?</strong> Health Check gilt als fehlgeschlagen → Server wird als "down" markiert</p>
        <p><strong>Typische Werte:</strong></p>
        <ul>
            <li><strong>3 Sekunden:</strong> Standard</li>
            <li><strong>5 Sekunden:</strong> Für langsamere Anwendungen</li>
        </ul>
        <p><strong>Wichtig:</strong> Timeout muss KLEINER sein als Intervall!</p>
        <p><strong>Beispiel:</strong> Intervall 10s, Timeout 3s → Alle 10s wird geprüft, nach 3s ohne Antwort = Fehler</p>
    </div>

    <div data-tooltip-id="ssl-termination">
        <strong>SSL/TLS Terminierung</strong>
        <p>Wo wird die SSL-Verschlüsselung be- und entschlüsselt?</p>
        <p><strong>Optionen erklärt:</strong></p>
        <ul>
            <li><strong>Keine (Passthrough):</strong>
                <ul>
                    <li>LB leitet verschlüsselte Daten unverändert weiter</li>
                    <li>Backend-Server müssen SSL können</li>
                    <li>LB kann Inhalt nicht lesen (kein Content-Routing)</li>
                    <li>Höchste Sicherheit</li>
                </ul>
            </li>
            <li><strong>Edge Termination:</strong>
                <ul>
                    <li>LB entschlüsselt SSL</li>
                    <li>Zu Backend unverschlüsselt (HTTP)</li>
                    <li>LB kann Inhalt lesen und routen</li>
                    <li>Backend einfacher (kein SSL)</li>
                    <li><em>Am häufigsten!</em></li>
                </ul>
            </li>
            <li><strong>Re-Encryption:</strong>
                <ul>
                    <li>LB entschlüsselt, liest Inhalt, verschlüsselt NEU</li>
                    <li>Zu Backend wieder verschlüsselt</li>
                    <li>Content-Routing möglich UND Backend verschlüsselt</li>
                    <li>Sicherer als Edge, aber mehr CPU-Last</li>
                </ul>
            </li>
            <li><strong>SSL Offloading:</strong>
                <ul>
                    <li>Wie Edge Termination</li>
                    <li>Entlastet Backend-Server von SSL-Rechenarbeit</li>
                    <li>LB übernimmt SSL-Performance-Last</li>
                </ul>
            </li>
        </ul>
        <p><strong>Empfehlung:</strong></p>
        <ul>
            <li>Standard → Edge Termination / SSL Offloading</li>
            <li>Höchste Sicherheit → Re-Encryption</li>
            <li>Kein Content-Routing nötig → Passthrough</li>
        </ul>
    </div>

    <div data-tooltip-id="ssl-certificate">
        <strong>SSL Zertifikat</strong>
        <p>Das SSL/TLS-Zertifikat für die verschlüsselte Verbindung.</p>
        <p><strong>Was ist ein SSL-Zertifikat?</strong> Digitaler "Ausweis" des Servers - beweist Identität und ermöglicht Verschlüsselung.</p>
        <p><strong>Arten:</strong></p>
        <ul>
            <li><strong>Single Domain:</strong> Nur für eine Domain (z.B. www.krankenhaus.de)</li>
            <li><strong>Wildcard (*.domain.de):</strong> Für alle Subdomains (z.B. *.krankenhaus.de)</li>
            <li><strong>Multi-Domain (SAN):</strong> Für mehrere verschiedene Domains</li>
        </ul>
        <p><strong>Beispiele:</strong></p>
        <ul>
            <li>"*.example.com" - Wildcard für alle Subdomains</li>
            <li>"kis.krankenhaus.de" - Spezifisch für KIS</li>
            <li>"SAN: kis.de, pacs.de, ris.de" - Multi-Domain</li>
        </ul>
        <em>Zertifikat muss zum Hostnamen passen, sonst Browser-Warnung!</em>
    </div>

    <div data-tooltip-id="tls-version">
        <strong>TLS Version (Minimum)</strong>
        <p>Die mindestens erforderliche TLS-Version für Verbindungen.</p>
        <p><strong>TLS-Versionen:</strong></p>
        <ul>
            <li><strong>TLS 1.3:</strong>
                <ul>
                    <li>Neuester Standard (2018)</li>
                    <li>Schneller, sicherer</li>
                    <li>Nicht alle Clients unterstützen es</li>
                    <li><em>Beste Wahl für neue Systeme!</em></li>
                </ul>
            </li>
            <li><strong>TLS 1.2:</strong>
                <ul>
                    <li>Aktuell weitverbreitet (2008)</li>
                    <li>Gut unterstützt, noch sicher</li>
                    <li><em>Minimum für Produktion!</em></li>
                </ul>
            </li>
            <li><strong>TLS 1.1 und älter:</strong>
                <ul>
                    <li>VERALTET und UNSICHER!</li>
                    <li>Sollte deaktiviert sein</li>
                    <li>Nur für sehr alte Clients</li>
                </ul>
            </li>
        </ul>
        <p><strong>Empfehlung:</strong> TLS 1.2 als Minimum, TLS 1.3 bevorzugen</p>
        <em>Ältere TLS-Versionen haben bekannte Sicherheitslücken!</em>
    </div>

    <div data-tooltip-id="waf">
        <strong>WAF (Web Application Firewall)</strong>
        <p>Eine Firewall, die speziell Web-Angriffe erkennt und blockiert.</p>
        <p><strong>Was macht eine WAF?</strong> Schützt Web-Anwendungen vor:</p>
        <ul>
            <li>SQL Injection</li>
            <li>Cross-Site Scripting (XSS)</li>
            <li>DDoS-Attacken</li>
            <li>Bot-Traffic</li>
            <li>Zero-Day-Exploits</li>
        </ul>
        <p><strong>Modi:</strong></p>
        <ul>
            <li><strong>Aktiviert (Block-Mode):</strong>
                <ul>
                    <li>Blockiert verdächtige Anfragen</li>
                    <li>Produktiv-Modus</li>
                    <li>Kann legitimen Traffic blockieren (False Positives)</li>
                </ul>
            </li>
            <li><strong>Detection Mode:</strong>
                <ul>
                    <li>Erkennt Angriffe, blockiert aber nicht</li>
                    <li>Nur Logging</li>
                    <li>Zum Testen/Tuning</li>
                </ul>
            </li>
            <li><strong>Nicht aktiviert:</strong> Kein WAF-Schutz</li>
        </ul>
        <p><strong>Empfehlung:</strong> Für öffentliche Web-Anwendungen IMMER aktivieren!</p>
        <em>WAF ist zusätzliche Sicherheitsebene - ersetzt nicht sichere Code-Entwicklung!</em>
    </div>

    <div data-tooltip-id="lb-ha-check">
        <strong>High Availability / Redundanz</strong>
        <p>Wird der Load Balancer selbst redundant betrieben?</p>
        <p><strong>Das Problem:</strong> Load Balancer ist Single Point of Failure - fällt er aus, ist alles weg!</p>
        <p><strong>Lösung: HA-Paar</strong></p>
        <ul>
            <li>Zwei (oder mehr) Load Balancer</li>
            <li>Arbeiten zusammen</li>
            <li>VIP "wandert" bei Ausfall automatisch</li>
            <li>Clients merken nichts vom Failover</li>
        </ul>
        <p><strong>Wann HA?</strong></p>
        <ul>
            <li>Kritische Systeme (24/7)</li>
            <li>KIS, Notaufnahme, OP-Systeme</li>
            <li>Produktiv-Umgebung</li>
        </ul>
        <em>Für kritische Infrastruktur: Load Balancer MUSS redundant sein!</em>
    </div>

    <div data-tooltip-id="ha-mode">
        <strong>HA-Modus</strong>
        <p>Wie arbeiten die Load Balancer im HA-Verbund zusammen?</p>
        <p><strong>Modi erklärt:</strong></p>
        <ul>
            <li><strong>Active-Standby:</strong>
                <ul>
                    <li>Ein LB aktiv, anderer wartet im Standby</li>
                    <li>Bei Ausfall: Standby übernimmt VIP</li>
                    <li>Einfacher, aber Standby-LB ungenutzt</li>
                    <li><em>Standard-HA-Modus</em></li>
                </ul>
            </li>
            <li><strong>Active-Active:</strong>
                <ul>
                    <li>Beide LBs aktiv, teilen sich Last</li>
                    <li>Bessere Ressourcen-Nutzung</li>
                    <li>Bei Ausfall: Überlebender übernimmt alles</li>
                    <li>Komplexer zu konfigurieren</li>
                </ul>
            </li>
            <li><strong>Cluster (3+ Nodes):</strong>
                <ul>
                    <li>3 oder mehr Load Balancer</li>
                    <li>Für sehr kritische Umgebungen</li>
                    <li>Geografisch verteilt möglich</li>
                    <li>Höchste Verfügbarkeit</li>
                </ul>
            </li>
        </ul>
        <p><strong>Empfehlung:</strong> Active-Standby für die meisten Fälle, Active-Active bei hoher Last</p>
    </div>

    <div data-tooltip-id="partner-lb">
        <strong>Partner/Standby LB</strong>
        <p>Der redundante Load Balancer im HA-Paar.</p>
        <p><strong>Beispiel:</strong></p>
        <ul>
            <li>Primary: LB-KIS-PROD-01</li>
            <li>Standby: LB-KIS-PROD-02</li>
        </ul>
        <p><strong>Wichtig:</strong></p>
        <ul>
            <li>Beide LBs müssen identisch konfiguriert sein</li>
            <li>Heartbeat-Verbindung zwischen den LBs</li>
            <li>Shared VIP (wandert zwischen LBs)</li>
        </ul>
        <em>Ohne Partner kein HA - Single Point of Failure bleibt!</em>
    </div>

    <div data-tooltip-id="lb-notes">
        <strong>Notizen / Routing-Regeln</strong>
        <p>Zusätzliche Informationen zu diesem Load Balancer.</p>
        <p><strong>Was dokumentieren:</strong></p>
        <ul>
            <li>Spezielle Routing-Regeln (z.B. /api → Server A, /web → Server B)</li>
            <li>URL-Rewriting (z.B. /old → /new)</li>
            <li>Header-Manipulationen</li>
            <li>Rate Limiting</li>
            <li>IP-Whitelisting / Blacklisting</li>
            <li>Wartungsfenster</li>
            <li>Besondere Konfigurationen</li>
        </ul>
        <p><strong>Beispiel:</strong></p>
        <p>"Content-basiertes Routing: /api/* → App-Server-Pool, /images/* → Static-Server-Pool. Rate Limit: 100 req/s pro Client-IP. WAF aktiv mit OWASP Ruleset. Wartung: Jeden 1. Sonntag 02:00-04:00"</p>
        <em>Gute Dokumentation hilft dem nächsten Admin!</em>
    </div>
</div>
