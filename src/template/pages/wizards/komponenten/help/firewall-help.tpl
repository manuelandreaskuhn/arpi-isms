<div class="tooltip-definitions" style="display: none;">
    <div data-tooltip-id="firewall-name">
        <strong>Firewall Name</strong>
        <p>Ein eindeutiger Name für Ihre Firewall.</p>
        <p><strong>Was ist eine Firewall?</strong> Ein Sicherheitssystem, das Netzwerk-Traffic kontrolliert und unerwünschten Zugriff blockiert - wie ein "Türsteher" für Ihr Netzwerk.</p>
        <p><strong>Warum Firewalls essentiell sind:</strong></p>
        <ul>
            <li><strong>Schutz vor Angriffen:</strong> Blockiert Hacker und Malware</li>
            <li><strong>Zugangskontrolle:</strong> Nur erlaubter Traffic kommt durch</li>
            <li><strong>Netzwerk-Segmentierung:</strong> Trennt verschiedene Bereiche</li>
            <li><strong>Compliance:</strong> Gesetzliche Anforderung (DSGVO, KRITIS)</li>
        </ul>
        <p><strong>Namens-Beispiele:</strong></p>
        <ul>
            <li>"FW-DMZ-01" - Firewall für DMZ, Nummer 1</li>
            <li>"Perimeter-Firewall" - Außen-Firewall (Internet-Grenze)</li>
            <li>"FW-Internal-Segmentation" - Interne Trennung</li>
            <li>"Datacenter-FW-Palo-Alto" - Datacenter Firewall</li>
        </ul>
        <em>Ohne Firewall = offenes Tor für Angreifer!</em>
    </div>

    <div data-tooltip-id="firewall-type">
        <strong>Typ / Hersteller</strong>
        <p>Welche Firewall-Lösung wird verwendet?</p>
        <p><strong>Firewall-Kategorien:</strong></p>
        <ul>
            <li><strong>Enterprise Firewalls:</strong>
                <ul>
                    <li><strong>Palo Alto Networks:</strong> Premium NGFW, sehr leistungsstark, teuer</li>
                    <li><strong>Fortinet FortiGate:</strong> Preis-Leistungs-Sieger, weit verbreitet</li>
                    <li><strong>Check Point:</strong> Traditioneller Marktführer, Enterprise-fokussiert</li>
                    <li><strong>Cisco Firepower:</strong> Integration mit Cisco-Infrastruktur</li>
                </ul>
            </li>
            <li><strong>Mittelstand:</strong>
                <ul>
                    <li><strong>Sophos XG/XGS:</strong> Einfache Verwaltung, gut für KMU</li>
                    <li><strong>WatchGuard:</strong> Solide Mittelstands-Lösung</li>
                    <li><strong>Juniper SRX:</strong> Enterprise, Carrier-Grade</li>
                </ul>
            </li>
            <li><strong>Open Source:</strong>
                <ul>
                    <li><strong>pfSense:</strong> Sehr beliebt, kostenlos, BSD-basiert</li>
                    <li><strong>OPNsense:</strong> Fork von pfSense, modernere UI</li>
                </ul>
            </li>
            <li><strong>Cloud:</strong>
                <ul>
                    <li><strong>Azure Firewall:</strong> Native Azure-Integration</li>
                    <li><strong>AWS Network Firewall:</strong> Native AWS-Integration</li>
                </ul>
            </li>
        </ul>
        <p><strong>NGFW = Next-Generation Firewall:</strong> Moderne Firewalls mit Deep Packet Inspection, Application Control, IPS, etc.</p>
        <em>Trend: Von traditionellen zu Next-Gen Firewalls (NGFW)</em>
    </div>

    <div data-tooltip-id="firewall-model">
        <strong>Modell / Version</strong>
        <p>Das spezifische Firewall-Modell und die Software-Version.</p>
        <p><strong>Warum wichtig?</strong></p>
        <ul>
            <li>Performance-Kapazität (Durchsatz in Gbps)</li>
            <li>Anzahl gleichzeitiger Sessions</li>
            <li>Verfügbare Features</li>
            <li>Support-Ende (End of Life)</li>
        </ul>
        <p><strong>Beispiele:</strong></p>
        <ul>
            <li>"PA-3220" - Palo Alto Modell</li>
            <li>"FortiGate 200F, v7.4" - Fortinet mit Version</li>
            <li>"pfSense 2.7.2" - Open Source Version</li>
        </ul>
        <p><strong>Performance-Klassen:</strong></p>
        <ul>
            <li>Small Office: 100-500 Mbps Throughput</li>
            <li>SMB: 1-5 Gbps</li>
            <li>Enterprise: 10-100 Gbps</li>
            <li>Carrier: 100+ Gbps</li>
        </ul>
        <em>Firewall muss dimensioniert sein für Ihre Bandbreite!</em>
    </div>

    <div data-tooltip-id="firewall-serial">
        <strong>Seriennummer</strong>
        <p>Die eindeutige Seriennummer der Firewall-Appliance.</p>
        <p><strong>Wofür wichtig:</strong></p>
        <ul>
            <li>Lizenz-Verwaltung (an Seriennummer gebunden)</li>
            <li>Support-Anfragen</li>
            <li>Garantie-Nachweis</li>
            <li>RMA (Return Merchandise Authorization)</li>
        </ul>
        <em>Bei Hardware-Ausfall: Seriennummer wird für Ersatz benötigt</em>
    </div>

    <div data-tooltip-id="firewall-mgmt-ip">
        <strong>Management IP</strong>
        <p>Die IP-Adresse für die Administration der Firewall.</p>
        <p><strong>Was ist Management IP?</strong> Eine separate IP nur für Admin-Zugriff zur Firewall-Konfiguration.</p>
        <p><strong>Best Practices:</strong></p>
        <ul>
            <li>Separates Management-VLAN</li>
            <li>Nur aus Admin-Netz erreichbar</li>
            <li>Niemals von Internet erreichbar!</li>
            <li>Multi-Faktor-Authentifizierung aktivieren</li>
        </ul>
        <p><strong>Typisches Setup:</strong></p>
        <ul>
            <li>Management: 192.168.10.1 (Admin-Netz)</li>
            <li>External: 203.0.113.1 (Public IP)</li>
            <li>Internal: 10.0.0.1 (LAN)</li>
        </ul>
        <em>Management-Zugriff muss maximal geschützt sein - Kompromittierung = Game Over!</em>
    </div>

    <div data-tooltip-id="firewall-location">
        <strong>Standort / Zone</strong>
        <p>Wo ist die Firewall platziert in der Netzwerk-Architektur?</p>
        <p><strong>Typische Positionen:</strong></p>
        <ul>
            <li><strong>Perimeter:</strong> Zwischen Internet und internem Netz (Außengrenze)</li>
            <li><strong>DMZ:</strong> Schützt DMZ-Zone (öffentliche Server)</li>
            <li><strong>Internal:</strong> Zwischen internen Netzsegmenten</li>
            <li><strong>Datacenter:</strong> Vor Servern im Rechenzentrum</li>
        </ul>
        <p><strong>Beispiel-Architektur:</strong></p>
        <ul>
            <li>Internet → Perimeter-FW → DMZ-FW → Interne Server</li>
        </ul>
        <em>Defense in Depth: Mehrere Firewall-Ebenen = besserer Schutz</em>
    </div>

    <div data-tooltip-id="firewall-function">
        <strong>Funktion</strong>
        <p>Welche Haupt-Rolle hat diese Firewall?</p>
        <p><strong>Funktionen erklärt:</strong></p>
        <ul>
            <li><strong>Perimeter Firewall:</strong>
                <ul>
                    <li>Erste Verteidigungslinie</li>
                    <li>Zwischen Internet und internem Netz</li>
                    <li>Blockiert die meisten Angriffe</li>
                    <li><em>Kritischste Firewall!</em></li>
                </ul>
            </li>
            <li><strong>Internal Segmentation:</strong>
                <ul>
                    <li>Trennt interne Netze (Micro-Segmentation)</li>
                    <li>Z.B. Trennung von Verwaltung und Produktion</li>
                    <li>Lateral Movement Prevention</li>
                </ul>
            </li>
            <li><strong>DMZ Firewall:</strong>
                <ul>
                    <li>Schützt DMZ-Zone</li>
                    <li>Zwischen DMZ und internem Netz</li>
                    <li>Doppelter Schutz für öffentliche Server</li>
                </ul>
            </li>
            <li><strong>Datacenter Firewall:</strong>
                <ul>
                    <li>Vor kritischen Servern</li>
                    <li>East-West Traffic Kontrolle</li>
                    <li>Schützt Datenbank- und Applikations-Server</li>
                </ul>
            </li>
            <li><strong>Next-Gen Firewall (NGFW):</strong>
                <ul>
                    <li>Moderne Firewall mit Deep Inspection</li>
                    <li>Application-Aware</li>
                    <li>Integrierte IPS, Anti-Malware, URL-Filter</li>
                </ul>
            </li>
        </ul>
    </div>

    <div data-tooltip-id="firewall-external-if">
        <strong>Externe Interface / IP</strong>
        <p>Das Interface zur Außenwelt (Internet oder externes Netz).</p>
        <p><strong>Was ist External Interface?</strong> Der "öffentliche" Port der Firewall - meist mit Public IP.</p>
        <p><strong>Typisch:</strong></p>
        <ul>
            <li>Interface-Name: WAN, External, Outside, eth0</li>
            <li>IP: Public IP vom Provider (z.B. 203.0.113.1)</li>
            <li>Security Level: Untrusted (niedrigste Vertrauensstufe)</li>
        </ul>
        <em>External Interface ist dem Internet ausgesetzt - maximal härten!</em>
    </div>

    <div data-tooltip-id="firewall-internal-if">
        <strong>Interne Interface / IP</strong>
        <p>Das Interface zum internen Netzwerk (LAN).</p>
        <p><strong>Was ist Internal Interface?</strong> Der "private" Port der Firewall - zu Ihrem internen Netz.</p>
        <p><strong>Typisch:</strong></p>
        <ul>
            <li>Interface-Name: LAN, Internal, Inside, eth1</li>
            <li>IP: Private IP (z.B. 10.0.0.1, 192.168.1.1)</li>
            <li>Security Level: Trusted (höchste Vertrauensstufe)</li>
        </ul>
        <p><strong>Meist auch:</strong> Default Gateway für interne Clients</p>
    </div>

    <div data-tooltip-id="firewall-dmz-if">
        <strong>DMZ Interface / IP</strong>
        <p>Das Interface zur DMZ (Demilitarized Zone).</p>
        <p><strong>Was ist DMZ?</strong> Ein "neutraler" Bereich zwischen Internet und internem Netz für öffentliche Server (Webserver, Mail, etc.).</p>
        <p><strong>Warum DMZ?</strong></p>
        <ul>
            <li>Öffentliche Server müssen vom Internet erreichbar sein</li>
            <li>Aber: Wenn kompromittiert, soll internes Netz geschützt bleiben</li>
            <li>DMZ = Pufferzone</li>
        </ul>
        <p><strong>Typisch:</strong></p>
        <ul>
            <li>Interface-Name: DMZ, eth2</li>
            <li>IP: 172.16.0.1</li>
            <li>Security Level: Medium</li>
        </ul>
        <p><strong>Firewall-Regeln:</strong></p>
        <ul>
            <li>Internet → DMZ: Nur spezifische Ports (80, 443)</li>
            <li>DMZ → Internal: Blockiert (oder sehr restriktiv)</li>
            <li>Internal → DMZ: Erlaubt (Management)</li>
        </ul>
    </div>

    <div data-tooltip-id="firewall-other-zones">
        <strong>Weitere Zonen</strong>
        <p>Zusätzliche Netzwerk-Zonen/Segmente.</p>
        <p><strong>Typische zusätzliche Zonen:</strong></p>
        <ul>
            <li><strong>Guest:</strong> WLAN für Besucher (stark eingeschränkt)</li>
            <li><strong>Management:</strong> Für Admin-Zugriff auf Infrastruktur</li>
            <li><strong>VPN:</strong> Für VPN-Clients (Remote-Mitarbeiter)</li>
            <li><strong>IoT:</strong> Für IoT-Geräte (medizinische Geräte)</li>
            <li><strong>Voice:</strong> Für VoIP-Telefonie</li>
            <li><strong>Backup:</strong> Dediziertes Backup-Netz</li>
        </ul>
        <em>Mehr Zonen = granularere Kontrolle = bessere Sicherheit</em>
    </div>

    <div data-tooltip-id="firewall-ips">
        <strong>IPS/IDS</strong>
        <p>Intrusion Prevention/Detection System - erkennt und blockiert Angriffe.</p>
        <p><strong>IDS vs IPS - Was ist der Unterschied?</strong></p>
        <ul>
            <li><strong>IDS (Detection):</strong> Erkennt Angriffe und alarmiert - blockiert aber NICHT</li>
            <li><strong>IPS (Prevention):</strong> Erkennt UND blockiert Angriffe automatisch</li>
        </ul>
        <p><strong>Modi:</strong></p>
        <ul>
            <li><strong>Aktiviert (IPS):</strong>
                <ul>
                    <li>Angriffe werden geblockt</li>
                    <li>Schutz in Echtzeit</li>
                    <li>Kann False Positives verursachen (legitimer Traffic blockiert)</li>
                    <li><em>Empfohlen für Produktion!</em></li>
                </ul>
            </li>
            <li><strong>IDS Only (Detection):</strong>
                <ul>
                    <li>Nur Warnung, kein Block</li>
                    <li>Für Testphase oder Tuning</li>
                    <li>Weniger Risiko für False Positives</li>
                </ul>
            </li>
            <li><strong>Nicht aktiviert:</strong> Kein Angriffsschutz (nicht empfohlen!)</li>
        </ul>
        <p><strong>Was IPS erkennt:</strong></p>
        <ul>
            <li>Exploit-Versuche (z.B. SQL Injection)</li>
            <li>Port-Scans</li>
            <li>Malware-Signaturen</li>
            <li>DoS/DDoS-Angriffe</li>
            <li>Anomalien im Traffic</li>
        </ul>
        <em>IPS ist essentiell - aber muss getuned werden (False Positives minimieren)</em>
    </div>

    <div data-tooltip-id="firewall-appcontrol">
        <strong>Application Control</strong>
        <p>Kontrolle auf Anwendungs-Ebene (nicht nur Ports).</p>
        <p><strong>Was ist Application Control?</strong> Firewall erkennt WELCHE Anwendung kommuniziert - nicht nur Port/IP.</p>
        <p><strong>Traditionelle Firewall:</strong> Erlaubt Port 443 (HTTPS) - ALLE Apps über 443 erlaubt</p>
        <p><strong>Application Control:</strong> Erlaubt Port 443 NUR für bestimmte Apps (z.B. nur Outlook Web Access, nicht Facebook)</p>
        <p><strong>Beispiel-Szenarien:</strong></p>
        <ul>
            <li>Erlaube nur Office 365, blockiere andere Cloud-Apps</li>
            <li>Erlaube Remote Desktop nur für IT-Team</li>
            <li>Blockiere File-Sharing (Dropbox, WeTransfer)</li>
            <li>Blockiere Tor, Proxies, Anonymizer</li>
        </ul>
        <p><strong>Vorteile:</strong></p>
        <ul>
            <li>Granulare Kontrolle (nicht nur "Port offen/zu")</li>
            <li>Blockiert unerwünschte Apps trotz offener Ports</li>
            <li>Verhindert Tunnel und Umgehungen</li>
        </ul>
        <em>Application Control = Next-Gen Feature - sehr mächtig!</em>
    </div>

    <div data-tooltip-id="firewall-urlfilter">
        <strong>URL Filtering</strong>
        <p>Blockiert Zugriff auf bestimmte Websites/Kategorien.</p>
        <p><strong>Was ist URL Filtering?</strong> Firewall prüft aufgerufene URLs und blockiert nach Kategorien oder Blacklist.</p>
        <p><strong>Typische blockierte Kategorien:</strong></p>
        <ul>
            <li>Malware & Phishing</li>
            <li>Adult Content</li>
            <li>Social Media (optional)</li>
            <li>Streaming (optional)</li>
            <li>File Sharing</li>
            <li>Gambling</li>
            <li>Anonymizer / VPN</li>
        </ul>
        <p><strong>Use Cases:</strong></p>
        <ul>
            <li><strong>Sicherheit:</strong> Blockiere bekannte Malware-Sites</li>
            <li><strong>Compliance:</strong> Verhindern Download illegaler Inhalte</li>
            <li><strong>Produktivität:</strong> Blockiere Zeitfresser (optional)</li>
        </ul>
        <p><strong>Datenbank-Update:</strong> URL-Filter braucht aktuelle Kategorien-Datenbank (Subscription)</p>
        <em>Im Healthcare: URL-Filter hilft gegen Phishing (größtes Einfallstor!)</em>
    </div>

    <div data-tooltip-id="firewall-antimalware">
        <strong>Anti-Malware / Virus Scan</strong>
        <p>Scannt Traffic auf Malware und Viren.</p>
        <p><strong>Was macht Anti-Malware?</strong> Firewall scannt durchlaufende Dateien und E-Mails auf Schadsoftware.</p>
        <p><strong>Scan-Typen:</strong></p>
        <ul>
            <li><strong>HTTP/HTTPS:</strong> Downloads via Browser</li>
            <li><strong>FTP:</strong> Datei-Transfers</li>
            <li><strong>SMTP/POP3:</strong> E-Mail-Anhänge</li>
            <li><strong>SMB:</strong> File-Share-Zugriffe</li>
        </ul>
        <p><strong>Erkennungs-Methoden:</strong></p>
        <ul>
            <li>Signatur-basiert (bekannte Malware)</li>
            <li>Heuristik (verdächtiges Verhalten)</li>
            <li>Sandboxing (Datei in isolierter Umgebung ausführen)</li>
            <li>Cloud-basiert (Reputation-Check)</li>
        </ul>
        <p><strong>Performance-Impact:</strong> Scanning kostet Ressourcen - kann Traffic verlangsamen</p>
        <em>Zusätzlicher Schutz zur Endpoint-Security - Defense in Depth!</em>
    </div>

    <div data-tooltip-id="firewall-ssl-inspection">
        <strong>SSL/TLS Inspection</strong>
        <p>Entschlüsselt HTTPS-Traffic zur Inspektion.</p>
        <p><strong>Das Problem:</strong> 80%+ des Traffics ist verschlüsselt (HTTPS) - Firewall kann Inhalt nicht sehen!</p>
        <p><strong>Was ist SSL Inspection?</strong> Firewall agiert als Man-in-the-Middle:</p>
        <ol>
            <li>Entschlüsselt HTTPS-Traffic</li>
            <li>Inspiziert Inhalt (Malware? Verbotene Seite?)</li>
            <li>Verschlüsselt wieder und leitet weiter</li>
        </ol>
        <p><strong>Modi:</strong></p>
        <ul>
            <li><strong>Full Inspection:</strong>
                <ul>
                    <li>Alle HTTPS-Verbindungen werden entschlüsselt</li>
                    <li>Maximale Sicherheit</li>
                    <li>Hoher Performance-Aufwand</li>
                </ul>
            </li>
            <li><strong>Partial (Outbound only):</strong>
                <ul>
                    <li>Nur ausgehende Verbindungen</li>
                    <li>Eingehend (z.B. zu Webserver) nicht</li>
                    <li>Guter Kompromiss</li>
                </ul>
            </li>
            <li><strong>Nicht aktiviert:</strong> Kein Blick in HTTPS (Malware kann sich verstecken)</li>
        </ul>
        <p><strong>Voraussetzung:</strong> Firewall-CA-Zertifikat muss auf Clients installiert sein (sonst Zertifikatsfehler)</p>
        <p><strong>Ausnahmen:</strong> Banking, Gesundheits-Apps oft ausgenommen (Privacy)</p>
        <em>SSL Inspection ist kontrovers (Privacy) aber wichtig für Security</em>
    </div>

    <div data-tooltip-id="firewall-ddos">
        <strong>DDoS Protection</strong>
        <p>Schutz vor Distributed Denial of Service Angriffen.</p>
        <p><strong>Was ist DDoS?</strong> Angreifer überlasten System mit Traffic von tausenden kompromittierten Geräten.</p>
        <p><strong>DDoS-Typen:</strong></p>
        <ul>
            <li><strong>Volumetric:</strong> Einfach massive Traffic-Menge (überlastet Bandbreite)</li>
            <li><strong>Protocol:</strong> Ausnutzung von Protokoll-Schwächen (SYN Flood)</li>
            <li><strong>Application-Layer:</strong> Gezielte Angriffe auf Anwendung (z.B. HTTP Flood)</li>
        </ul>
        <p><strong>Firewall DDoS-Schutz:</strong></p>
        <ul>
            <li>Rate Limiting (Max. Requests pro IP)</li>
            <li>SYN Cookies (Schutz vor SYN Flood)</li>
            <li>Geo-Blocking (Blockiere Traffic aus bestimmten Ländern)</li>
            <li>Blacklist bekannter Bot-Netze</li>
        </ul>
        <p><strong>Limitation:</strong> Bei sehr großen DDoS (100+ Gbps) reicht Firewall nicht - braucht Cloud-DDoS-Protection (Cloudflare, Akamai)</p>
        <em>DDoS-Angriffe nehmen zu - Schutz ist wichtig!</em>
    </div>

    <div data-tooltip-id="firewall-ha">
        <strong>High Availability / Clustering</strong>
        <p>Redundante Firewall-Konfiguration für Hochverfügbarkeit.</p>
        <p><strong>Warum HA wichtig:</strong> Firewall ist Single Point of Failure - fällt sie aus, ist komplettes Netz down!</p>
        <p><strong>HA-Setup:</strong> Zwei (oder mehr) Firewalls arbeiten zusammen</p>
        <p><strong>Vorteile:</strong></p>
        <ul>
            <li>Kein Ausfall bei Hardware-Defekt</li>
            <li>Wartung ohne Downtime (Rolling Updates)</li>
            <li>Automatisches Failover (Sekunden)</li>
        </ul>
        <em>Für kritische Umgebungen: HA ist Pflicht!</em>
    </div>

    <div data-tooltip-id="firewall-ha-mode">
        <strong>HA-Modus</strong>
        <p>Wie arbeiten die Firewalls im HA-Verbund?</p>
        <p><strong>Modi erklärt:</strong></p>
        <ul>
            <li><strong>Active-Passive:</strong>
                <ul>
                    <li>Eine FW aktiv, andere im Standby</li>
                    <li>Bei Ausfall: Standby übernimmt (Failover)</li>
                    <li>Einfachste HA-Variante</li>
                    <li>Standby-FW wird nicht genutzt (Verschwendung)</li>
                    <li><em>Standard-HA-Modus</em></li>
                </ul>
            </li>
            <li><strong>Active-Active:</strong>
                <ul>
                    <li>Beide FWs verarbeiten Traffic</li>
                    <li>Last wird verteilt (Load Balancing)</li>
                    <li>Bessere Ressourcen-Nutzung</li>
                    <li>Komplexer zu konfigurieren</li>
                    <li>Bei Ausfall: Überlebende FW übernimmt alles</li>
                </ul>
            </li>
            <li><strong>Full Mesh Cluster:</strong>
                <ul>
                    <li>3+ Firewalls im Cluster</li>
                    <li>Sehr hohe Verfügbarkeit</li>
                    <li>Komplex und teuer</li>
                    <li>Für sehr kritische Umgebungen</li>
                </ul>
            </li>
        </ul>
        <p><strong>Failover-Zeit:</strong></p>
        <ul>
            <li>Active-Passive: 1-10 Sekunden</li>
            <li>Active-Active: Nahezu transparent (< 1 Sekunde)</li>
        </ul>
    </div>

    <div data-tooltip-id="firewall-partner">
        <strong>Partner/Standby Firewall</strong>
        <p>Die redundante Firewall im HA-Paar.</p>
        <p><strong>Wichtig:</strong></p>
        <ul>
            <li>Identisches Modell wie primäre FW</li>
            <li>Gleiche Software-Version</li>
            <li>Konfiguration wird synchronisiert</li>
            <li>Dedizierte HA-Verbindung (Heartbeat)</li>
        </ul>
        <p><strong>Beispiel:</strong></p>
        <ul>
            <li>Primary: FW-DMZ-01</li>
            <li>Standby: FW-DMZ-02</li>
        </ul>
        <em>Beide FWs müssen physisch getrennt sein (verschiedene Racks, Stromkreise)</em>
    </div>

    <div data-tooltip-id="firewall-log-level">
        <strong>Log Level</strong>
        <p>Wie detailliert werden Firewall-Aktivitäten protokolliert?</p>
        <p><strong>Log-Level erklärt:</strong></p>
        <ul>
            <li><strong>All Traffic (Allow + Deny):</strong>
                <ul>
                    <li>Jede Verbindung wird geloggt (erlaubt UND blockiert)</li>
                    <li>Maximale Transparenz</li>
                    <li>Sehr große Log-Dateien!</li>
                    <li>Performance-Impact bei hohem Traffic</li>
                    <li><em>Für Compliance oft erforderlich</em></li>
                </ul>
            </li>
            <li><strong>Deny Only:</strong>
                <ul>
                    <li>Nur blockierte Verbindungen</li>
                    <li>Weniger Logs, fokussiert auf Probleme</li>
                    <li>Guter Kompromiss</li>
                </ul>
            </li>
            <li><strong>Security Events Only:</strong>
                <ul>
                    <li>Nur Sicherheits-relevante Events (IPS, Malware)</li>
                    <li>Minimale Logs</li>
                    <li>Fokus auf Bedrohungen</li>
                </ul>
            </li>
            <li><strong>Minimal:</strong>
                <ul>
                    <li>Nur kritische Fehler und Admin-Aktionen</li>
                    <li>Nicht empfohlen (zu wenig Visibility)</li>
                </ul>
            </li>
        </ul>
        <p><strong>Compliance:</strong> DSGVO und KRITIS verlangen oft "All Traffic" Logging</p>
        <em>Balance: Genug für Forensik, nicht zu viel für Storage/Performance</em>
    </div>

    <div data-tooltip-id="firewall-siem">
        <strong>SIEM Integration</strong>
        <p>Wohin werden Firewall-Logs gesendet?</p>
        <p><strong>Warum SIEM wichtig:</strong> Firewall-Logs sind essentiell für Security-Monitoring!</p>
        <p><strong>SIEM-Systeme:</strong></p>
        <ul>
            <li>Splunk - Marktführer</li>
            <li>QRadar - IBM</li>
            <li>Syslog-Server - Basic Logging</li>
            <li>Elastic Stack - Open Source</li>
            <li>Microsoft Sentinel - Cloud</li>
        </ul>
        <p><strong>Was SIEM macht:</strong></p>
        <ul>
            <li>Zentrale Log-Sammlung</li>
            <li>Korrelation über Systeme hinweg</li>
            <li>Angriffs-Erkennung</li>
            <li>Compliance-Reports</li>
        </ul>
        <em>Firewall-Logs sollten IMMER zentral gesammelt werden!</em>
    </div>

    <div data-tooltip-id="firewall-log-retention">
        <strong>Log Retention (Tage)</strong>
        <p>Wie lange werden Logs aufbewahrt?</p>
        <p><strong>Gesetzliche Anforderungen:</strong></p>
        <ul>
            <li><strong>DSGVO:</strong> 6-24 Monate (je nach Zweck)</li>
            <li><strong>KRITIS:</strong> Minimum 6 Monate</li>
            <li><strong>GoBD:</strong> 10 Jahre für steuerrelevante Daten</li>
        </ul>
        <p><strong>Typische Retention:</strong></p>
        <ul>
            <li><strong>90 Tage:</strong> Minimum für Troubleshooting</li>
            <li><strong>1 Jahr:</strong> Standard für Compliance</li>
            <li><strong>2+ Jahre:</strong> Bei sensiblen Daten (Patientendaten)</li>
        </ul>
        <p><strong>Storage-Planung:</strong> Firewall-Logs können GB/Tag erzeugen!</p>
        <em>Bei Sicherheitsvorfall: Alte Logs können entscheidend sein!</em>
    </div>

    <div data-tooltip-id="firewall-monitoring">
        <strong>Monitoring / Alerting</strong>
        <p>Wie wird die Firewall überwacht?</p>
        <p><strong>Warum Monitoring kritisch:</strong> Firewall-Ausfall = komplettes Netz down!</p>
        <p><strong>Monitoring-Methoden:</strong></p>
        <ul>
            <li><strong>SNMP:</strong> Standard Network Monitoring Protokoll</li>
            <li><strong>Prometheus:</strong> Modern, für Container-Umgebungen</li>
            <li><strong>Syslog:</strong> Log-basiertes Monitoring</li>
            <li><strong>E-Mail:</strong> Alerts bei kritischen Events</li>
            <li><strong>SMS:</strong> Für kritische Ausfälle (24/7)</li>
        </ul>
        <p><strong>Was überwachen:</strong></p>
        <ul>
            <li>HA-Status (beide FWs aktiv?)</li>
            <li>CPU/RAM-Auslastung</li>
            <li>Session-Count</li>
            <li>Interface-Status (Up/Down)</li>
            <li>Threat-Events (IPS-Alerts)</li>
            <li>VPN-Tunnels</li>
        </ul>
        <em>Firewall-Monitoring muss 24/7 laufen!</em>
    </div>

    <div data-tooltip-id="firewall-notes">
        <strong>Notizen / Besonderheiten</strong>
        <p>Zusätzliche wichtige Informationen zur Firewall.</p>
        <p><strong>Was dokumentieren:</strong></p>
        <ul>
            <li><strong>Change-Prozesse:</strong> Wer darf Firewall-Regeln ändern?</li>
            <li><strong>Besondere Konfigurationen:</strong> NAT-Regeln, VPN-Konfiguration</li>
            <li><strong>Bekannte Issues:</strong> Probleme und Workarounds</li>
            <li><strong>Wartungsfenster:</strong> Wann Updates durchführen?</li>
            <li><strong>Notfall-Kontakte:</strong> Vendor-Support, internes Team</li>
            <li><strong>Backup-Konfiguration:</strong> Wo sind Config-Backups?</li>
        </ul>
        <p><strong>Beispiel:</strong></p>
        <p>"Change-Prozess: Alle Regel-Änderungen über Ticket-System. Backup täglich um 02:00 Uhr auf backup-server-01. VPN-Tunnel zu Zweigstelle Berlin (IPsec). Wartung: Jeden 2. Sonntag 03:00-05:00. Support: Fortinet TAC +1-xxx (24/7), intern: network-team@example.com. Config-Backup: /backup/firewall/configs/"</p>
        <em>Gute Firewall-Dokumentation ist Gold wert bei Notfällen!</em>
    </div>
</div>
