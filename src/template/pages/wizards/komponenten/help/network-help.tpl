<div class="tooltip-definitions" style="display: none;">
    <div data-tooltip-id="network-name">
        <h2>Netzwerk-Name</h2>
        <p>Ein eindeutiger, beschreibender Name für das Netzwerk-Segment.</p>
        <div>
            <h3>Was ist ein Netzwerk-Segment?</h3>
            Ein logisch oder physisch abgetrennter Teil des Netzwerks - wie "Räume" in einem Haus.
        </div>
        <div>
            <h3>Warum Netzwerk-Segmentierung wichtig ist:</h3>
            <ul>
                <li><strong>Sicherheit:</strong> Trennung verschiedener Bereiche (z.B. Produktion von Gäste-WLAN)</li>
                <li><strong>Performance:</strong> Reduziert Broadcast-Traffic</li>
                <li><strong>Compliance:</strong> DSGVO/KRITIS verlangen Segmentierung</li>
                <li><strong>Troubleshooting:</strong> Probleme einfacher lokalisieren</li>
            </ul>
        </div>
        <div>
            <h3>Namens-Beispiele:</h3>
            <ul>
                <li>"Prod-Network" - Produktiv-Netzwerk</li>
                <li>"VLAN-100-KIS" - VLAN 100 für KIS</li>
                <li>"DMZ-Webserver" - DMZ für Webserver</li>
                <li>"Management-Network" - Management-Netzwerk</li>
            </ul>
        </div>
        <em>Gute Namen = schnelleres Verständnis der Netzwerk-Architektur!</em>
    </div>

    <div data-tooltip-id="network-type">
        <h2>Netzwerk-Typ</h2>
        <p>Die Art bzw. Funktion des Netzwerks.</p>
        <div>
            <h3>Netzwerk-Typen erklärt:</h3>
            <ul>
                <li><strong>LAN (Local Area Network):</strong>
                    <ul>
                        <li>Lokales Netzwerk in einem Gebäude/Standort</li>
                        <li>Typisch: Büro-Netzwerk</li>
                        <li>Hohe Geschwindigkeit (1-100 Gbit/s)</li>
                    </ul>
                </li>
                <li><strong>VLAN (Virtual LAN):</strong>
                    <ul>
                        <li>Logisch getrenntes Netzwerk auf gleicher Hardware</li>
                        <li>Segmentierung ohne zusätzliche Switches</li>
                        <li>Flexibel und kosteneffizient</li>
                        <li><em>Standard im modernen Netzwerk!</em></li>
                    </ul>
                </li>
                <li><strong>WAN (Wide Area Network):</strong>
                    <ul>
                        <li>Verbindung zwischen Standorten</li>
                        <li>Über Internet oder dedizierte Leitungen</li>
                        <li>Langsamer als LAN</li>
                    </ul>
                </li>
                <li><strong>DMZ (Demilitarized Zone):</strong>
                    <ul>
                        <li>Pufferzone zwischen Internet und internem Netz</li>
                        <li>Für öffentliche Server (Web, Mail)</li>
                        <li>Wenn kompromittiert: Internes Netz geschützt</li>
                    </ul>
                </li>
                <li><strong>Management Network:</strong>
                    <ul>
                        <li>Für Administration von Servern/Switches</li>
                        <li>Getrennt vom Produktiv-Traffic</li>
                        <li>Nur für Admins erreichbar</li>
                    </ul>
                </li>
                <li><strong>Storage Network (SAN):</strong>
                    <ul>
                        <li>Dediziert für Storage-Traffic</li>
                        <li>Hohe Bandbreite (10G+)</li>
                        <li>Von Produktiv-Netz getrennt</li>
                    </ul>
                </li>
                <li><strong>WiFi / WLAN:</strong> Drahtloses Netzwerk</li>
                <li><strong>VPN Network:</strong> Verschlüsseltes Overlay-Netzwerk</li>
            </ul>
        </div>
    </div>

    <div data-tooltip-id="network-vlan-id">
        <h2>VLAN-ID</h2>
        <p>Die eindeutige Nummer des VLANs (1-4094).</p>
        <div>
            <h3>Was ist eine VLAN-ID?</h3>
            Eine Nummer (Tag), die Netzwerk-Pakete einem VLAN zuordnet.
        </div>
        <div>
            <h3>Typische VLAN-Bereiche:</h3>
            <ul>
                <li><strong>VLAN 1:</strong> Default VLAN (nicht nutzen!)</li>
                <li><strong>VLAN 10-99:</strong> Management, Infrastruktur</li>
                <li><strong>VLAN 100-199:</strong> Server, Produktion</li>
                <li><strong>VLAN 200-299:</strong> Clients, Arbeitsplätze</li>
                <li><strong>VLAN 300-399:</strong> Gast, IoT</li>
                <li><strong>VLAN 400-499:</strong> DMZ, öffentliche Server</li>
            </ul>
        </div>
        <div>
            <h3>Best Practice:</h3>
            Dokumentieren Sie Ihr VLAN-Schema - z.B. "100er = Server, 200er = Clients"
        </div>
        <em>VLAN 1 niemals produktiv nutzen - Sicherheitsrisiko!</em>
    </div>

    <div data-tooltip-id="network-cidr">
        <h2>Netzwerk-Adresse (CIDR)</h2>
        <p>Die IP-Adresse und Größe des Netzwerks in CIDR-Notation.</p>
        <div>
            <h3>Was ist CIDR?</h3>
            Classless Inter-Domain Routing - kompakte Schreibweise für Netzwerke.
        </div>
        <div>
            <h3>Format:</h3>
            IP-Adresse/Präfixlänge
        </div>
        <div>
            <h3>Beispiele:</h3>
            <ul>
                <li><strong>192.168.100.0/24:</strong> 256 IPs (192.168.100.0 - 192.168.100.255)</li>
                <li><strong>10.0.0.0/16:</strong> 65.536 IPs (10.0.0.0 - 10.0.255.255)</li>
                <li><strong>172.16.0.0/12:</strong> 1.048.576 IPs (172.16.0.0 - 172.31.255.255)</li>
            </ul>
        </div>
        <div>
            <h3>Häufige Präfixlängen:</h3>
            <ul>
                <li>/24 = 256 IPs - Typisch für Abteilungs-Netze</li>
                <li>/23 = 512 IPs</li>
                <li>/22 = 1.024 IPs</li>
                <li>/16 = 65.536 IPs - Große Unternehmen</li>
                <li>/8 = 16 Millionen IPs - Sehr große Netze</li>
            </ul>
        </div>
        <div>
            <h3>Private IP-Bereiche (RFC 1918):</h3>
            <ul>
                <li>10.0.0.0/8 (10.0.0.0 - 10.255.255.255)</li>
                <li>172.16.0.0/12 (172.16.0.0 - 172.31.255.255)</li>
                <li>192.168.0.0/16 (192.168.0.0 - 192.168.255.255)</li>
            </ul>
        </div>
        <em>Größe des Netzwerks gut planen - Wachstum einkalkulieren!</em>
    </div>

    <div data-tooltip-id="network-gateway">
        <h2>Gateway / Router</h2>
        <p>Die IP-Adresse des Standard-Gateways (meist der Router).</p>
        <div>
            <h3>Was ist ein Gateway?</h3>
            Der "Ausgang" aus dem Netzwerk - alle Pakete zu anderen Netzen gehen durchs Gateway.
        </div>
        <div>
            <h3>Typische Gateway-IPs:</h3>
            <ul>
                <li>Erste IP: 192.168.100.1 (häufigste Konvention)</li>
                <li>Letzte IP: 192.168.100.254</li>
                <li>Zweite IP: 192.168.100.2</li>
            </ul>
        </div>
        <div>
            <h3>Beispiel:</h3>
            Netzwerk 192.168.100.0/24 → Gateway meist 192.168.100.1
        </div>
        <em>Gateway ist meist erste oder letzte nutzbare IP des Netzes</em>
    </div>

    <div data-tooltip-id="network-dhcp">
        <h2>DHCP (Dynamic Host Configuration Protocol)</h2>
        <p>Automatische IP-Vergabe an Geräte.</p>
        <div>
            <h3>Was ist DHCP?</h3>
            Server vergibt automatisch IPs an neue Geräte - wie "Zimmervergabe" im Hotel.
        </div>
        <div>
            <h3>DHCP vs. Statische IPs:</h3>
            <ul>
                <li>
                    <strong>DHCP (Dynamisch):</strong>
                    <ul>
                        <li>IP wird automatisch vergeben</li>
                        <li>Einfach für Clients (PCs, Laptops)</li>
                        <li>IP kann sich ändern</li>
                        <li><em>Standard für Endgeräte</em></li>
                    </ul>
                </li>
                <li>
                    <strong>Statisch:</strong>
                    <ul>
                        <li>IP manuell konfiguriert</li>
                        <li>IP ändert sich nie</li>
                        <li>Für Server, Drucker, Netzwerkgeräte</li>
                        <li><em>Wichtig für Infrastruktur!</em></li>
                    </ul>
                </li>
            </ul>
        </div>
        <div>
            <h3>DHCP-Reservierung:</h3>
            MAC-Adresse → immer gleiche IP (Mix aus beiden Welten)
        </div>
        <em>Server = statisch, Clients = DHCP</em>
    </div>

    <div data-tooltip-id="network-dhcp-pool">
        <h2>DHCP-Pool (IP-Range)</h2>
        <p>Der Bereich von IPs, die DHCP vergeben darf.</p>
        <div>
            <h3>Beispiel-Planung für 192.168.100.0/24:</h3>
            <ul>
                <li>192.168.100.1 - Gateway</li>
                <li>192.168.100.2-50 - Statische IPs (Server)</li>
                <li>192.168.100.51-200 - DHCP-Pool (Clients)</li>
                <li>192.168.100.201-254 - Reserve</li>
            </ul>
        </div>
        <div>
            <h3>Best Practice:</h3>
            DHCP-Pool NICHT das ganze Netz - Platz für statische IPs lassen!
        </div>
    </div>

    <div data-tooltip-id="network-dhcp-lease">
        <h2>DHCP-Lease-Zeit</h2>
        <p>Wie lange eine IP-Adresse "gemietet" wird.</p>
        <div>
            <h3>Typische Lease-Zeiten:</h3>
            <ul>
                <li><strong>24 Stunden (86400s):</strong> Standard für Büro-Netze</li>
                <li><strong>8 Stunden:</strong> Für Umgebungen mit häufigen Wechseln</li>
                <li><strong>7 Tage:</strong> Für stabile Umgebungen</li>
                <li><strong>Unbegrenzt:</strong> Quasi statisch (selten verwendet)</li>
            </ul>
        </div>
        <div>
            <h3>Kurze Lease-Zeit:</h3>
            Mehr Overhead, aber flexibler
        </div>
        <div>
            <h3>Lange Lease-Zeit:</h3>
            Weniger Last auf DHCP-Server, IPs länger gebunden
        </div>
    </div>

    <div data-tooltip-id="network-security-zone">
        <h2>Sicherheitszone</h2>
        <p>Die Vertrauensstufe dieses Netzwerks.</p>
        <div>
            <h3>Zonen-Konzept:</h3>
            Netzwerke nach Vertrauenslevel trennen
        </div>
        <div>
            <h3>Sicherheitszonen erklärt:</h3>
            <ul>
                <li>
                    <strong>Internal / Trusted:</strong>
                    <ul>
                        <li>Internes Produktiv-Netz</li>
                        <li>Höchste Vertrauensstufe</li>
                        <li>Für geschäftskritische Systeme</li>
                    </ul>
                </li>
                <li>
                    <strong>DMZ:</strong>
                    <ul>
                        <li>Pufferzone für öffentliche Server</li>
                        <li>Mittleres Vertrauen</li>
                        <li>Wenn kompromittiert: Internes Netz geschützt</li>
                    </ul>
                </li>
                <li>
                    <strong>External / Untrusted:</strong>
                    <ul>
                        <li>Internet, externe Netzwerke</li>
                        <li>Kein Vertrauen</li>
                        <li>Alles blockieren außer explizit erlaubt</li>
                    </ul>
                </li>
                <li>
                    <strong>Management Zone:</strong>
                    <ul>
                        <li>Nur für Admins</li>
                        <li>Isoliert vom Produktiv-Netz</li>
                    </ul>
                </li>
                <li>
                    <strong>Guest Network:</strong>
                    <ul>
                        <li>Für Gäste/Besucher</li>
                        <li>Nur Internet, kein interner Zugriff</li>
                    </ul>
                </li>
                <li>
                    <strong>Restricted / High Security:</strong>
                    <ul>
                        <li>Sehr sensible Daten (z.B. Patientendaten)</li>
                        <li>Strenge Zugriffskontrolle</li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>

    <div data-tooltip-id="network-isolation">
        <h2>Netzwerk-Isolation</h2>
        <p>Wie stark ist dieses Netz von anderen getrennt?</p>
        <div>
            <h3>Isolations-Level:</h3>
            <ul>
                <li>
                    <strong>Vollständig isoliert:</strong>
                    <ul>
                        <li>Kein Routing zu anderen Netzen</li>
                        <li>Air-Gap (physisch getrennt)</li>
                        <li>Für sehr kritische Systeme</li>
                    </ul>
                </li>
                <li>
                    <strong>Teilweise isoliert:</strong>
                    <ul>
                        <li>Routing über Firewall mit strengen Regeln</li>
                        <li>Nur spezifische Verbindungen erlaubt</li>
                        <li><em>Standard für Produktiv-Netze</em></li>
                    </ul>
                </li>
                <li>
                    <strong>Keine Isolation:</strong>
                    <ul>
                        <li>Freies Routing zwischen Netzen</li>
                        <li>Nur für unkritische Bereiche</li>
                    </ul>
                </li>
            </ul>
        </div>
        <em>Mehr Isolation = höhere Sicherheit, aber komplexere Verwaltung</em>
    </div>

    <div data-tooltip-id="network-802-1x">
        <h2>802.1X (Port-based NAC)</h2>
        <p>Authentifizierung bevor Netzwerkzugang gewährt wird.</p>
        <div>
            <h3>Was ist 802.1X?</h3>
            Standard für Port-basierte Netzwerk-Zugriffskontrolle - wie "Ausweiskontrolle" am Netzwerk-Port.
        </div>
        <div>
            <h3>Wie funktioniert's:</h3>
            <ol>
                <li>Gerät verbindet sich mit Switch-Port</li>
                <li>Port ist blockiert (kein Netzwerk)</li>
                <li>Gerät authentifiziert sich (Zertifikat, Username/Passwort)</li>
                <li>RADIUS-Server prüft Berechtigung</li>
                <li>Port wird freigeschaltet → richtiges VLAN zugewiesen</li>
            </ol>
        </div>
        <div>
            <h3>Vorteile:</h3>
            <ul>
                <li>Nur autorisierte Geräte im Netz</li>
                <li>Dynamische VLAN-Zuweisung</li>
                <li>Schutz vor Rogue Devices</li>
            </ul>
        </div>
        <div>
            <h3>Herausforderungen:</h3>
            <ul>
                <li>Komplex zu konfigurieren</li>
                <li>Nicht alle Geräte unterstützen 802.1X (IoT!)</li>
                <li>Braucht RADIUS-Server</li>
            </ul>
        </div>
        <em>802.1X ist Best Practice für Enterprise-Security!</em>
    </div>

    <div data-tooltip-id="network-mac-filtering">
        <h2>MAC-Adress-Filtering</h2>
        <p>Zugriffskontrolle basierend auf Hardware-Adressen.</p>
        <div>
            <h3>Was ist MAC-Filtering?</h3>
            Nur Geräte mit bekannter MAC-Adresse dürfen ins Netz.
        </div>
        <div>
            <h3>Methoden:</h3>
            <ul>
                <li><strong>Whitelist:</strong> Nur gelistete MACs erlaubt (restriktiv)</li>
                <li><strong>Blacklist:</strong> Gelistete MACs blockiert (permissiv)</li>
            </ul>
        </div>
        <div>
            <h3>Problem:</h3>
            MAC-Adressen sind fälschbar (MAC-Spoofing) → keine echte Sicherheit!
        </div>
        <div>
            <h3>Besser:</h3>
            802.1X mit Zertifikaten
        </div>
        <em>MAC-Filtering = Security durch Obskurität, nicht wirklich sicher!</em>
    </div>

    <div data-tooltip-id="network-dhcp-snooping">
        <h2>DHCP Snooping</h2>
        <p>Schutz vor Rogue DHCP-Servern.</p>
        <div>
            <h3>Das Problem:</h3>
            Angreifer installiert eigenen DHCP-Server → verteilt falsche IPs/Gateway → Man-in-the-Middle!
        </div>
        <div>
            <h3>Was ist DHCP Snooping?</h3>
            Switch lernt, welche Ports "vertrauenswürdig" sind (zu echtem DHCP-Server führen).
        </div>
        <div>
            <h3>Wie's funktioniert:</h3>
            <ul>
                <li>Trusted Ports: DHCP-Server-Antworten erlaubt</li>
                <li>Untrusted Ports: DHCP-Server-Antworten blockiert</li>
                <li>Switch baut Binding-Tabelle (IP ↔ MAC ↔ Port)</li>
            </ul>
        </div>
        <div>
            <h3>Basis für:</h3>
            Dynamic ARP Inspection, IP Source Guard
        </div>
        <em>DHCP Snooping ist Grundlage für Layer-2-Security!</em>
    </div>

    <div data-tooltip-id="network-arp-inspection">
        <h2>Dynamic ARP Inspection (DAI)</h2>
        <p>Schutz vor ARP-Spoofing-Angriffen.</p>
        <div>
            <h3>Was ist ARP-Spoofing?</h3>
            Angreifer sendet falsche ARP-Antworten → Traffic umgeleitet → Man-in-the-Middle!
        </div>
        <div>
            <h3>Was ist DAI?</h3>
            Switch prüft ARP-Pakete gegen DHCP-Snooping-Tabelle.
        </div>
        <div>
            <h3>Beispiel-Angriff (ohne DAI):</h3>
            <ul>
                <li>Angreifer: "Ich bin das Gateway (192.168.1.1)!"</li>
                <li>Clients senden Traffic an Angreifer statt Gateway</li>
                <li>Angreifer kann mitlesen</li>
            </ul>
        </div>
        <div>
            <h3>Mit DAI:</h3>
            Switch blockiert falsche ARP-Pakete
        </div>
        <div>
            <h3>Voraussetzung:</h3>
            DHCP Snooping muss aktiviert sein
        </div>
    </div>

    <div data-tooltip-id="network-spanning-tree">
        <h2>STP/RSTP/MSTP (Spanning Tree Protocol)</h2>
        <p>Verhindert Switch-Loops im Netzwerk.</p>
        <div>
            <h3>Das Problem ohne STP:</h3>
            Redundante Switch-Verbindungen → Broadcast-Storm → Netzwerk down!
        </div>
        <div>
            <h3>Was ist STP:</h3>
            Protokoll das automatisch Redundanz-Pfade blockiert, aber bei Ausfall aktiviert.
        </div>
        <div>
            <h3>Versionen:</h3>
            <ul>
                <li><strong>STP (802.1d):</strong> Original, langsam (30-50 Sekunden Konvergenz)</li>
                <li><strong>RSTP (802.1w):</strong> Rapid STP, schnell (1-6 Sekunden) - <em>Standard heute</em></li>
                <li><strong>MSTP (802.1s):</strong> Multiple STP, pro VLAN - für große Netze</li>
            </ul>
        </div>
        <div>
            <h3>Wie's funktioniert:</h3>
            <ol>
                <li>Switches wählen Root Bridge (Chef)</li>
                <li>Berechnen besten Pfad zur Root Bridge</li>
                <li>Blockieren redundante Pfade</li>
                <li>Bei Ausfall: Automatisches Failover auf Backup-Pfad</li>
            </ol>
        </div>
        <em>RSTP ist Pflicht bei redundanten Switch-Verbindungen!</em>
    </div>

    <div data-tooltip-id="network-lacp">
        <h2>Link Aggregation (LACP)</h2>
        <p>Mehrere Netzwerk-Links zu einem logischen bündeln.</p>
        <div>
            <h3>Was ist LACP?</h3>
            Link Aggregation Control Protocol (802.3ad) - mehrere Kabel = ein schnellerer Link.
        </div>
        <div>
            <h3>Vorteile:</h3>
            <ul>
                <li><strong>Höhere Bandbreite:</strong> 2x 1G = 2G, 4x 10G = 40G</li>
                <li><strong>Redundanz:</strong> Ein Kabel ausfällt → Rest läuft weiter</li>
                <li><strong>Load Balancing:</strong> Traffic verteilt auf alle Links</li>
            </ul>
        </div>
        <div>
            <h3>Beispiel:</h3>
            Server mit 4x 10G Netzwerkkarten → LACP → 40G Bandbreite zum Switch
        </div>
        <div>
            <h3>Varianten:</h3>
            <ul>
                <li><strong>LACP (dynamic):</strong> Automatische Aushandlung</li>
                <li><strong>Static Port Channel:</strong> Manuell konfiguriert</li>
            </ul>
        </div>
        <em>LACP ist Standard für Server-Uplinks!</em>
    </div>

    <div data-tooltip-id="network-vrrp">
        <h2>VRRP/HSRP/GLBP (Gateway Redundancy)</h2>
        <p>Redundante Default-Gateways für Hochverfügbarkeit.</p>
        <div>
            <h3>Das Problem:</h3>
            Wenn Gateway ausfällt → kein Internet/anderes Netz erreichbar!
        </div>
        <div>
            <h3>Die Lösung:</h3>
            Mehrere Router = ein virtuelles Gateway
        </div>
        <div>
            <h3>Protokolle:</h3>
            <ul>
                <li>
                    <strong>VRRP (Virtual Router Redundancy Protocol):</strong>
                    <ul>
                        <li>Standard (RFC 5798)</li>
                        <li>Hersteller-unabhängig</li>
                        <li>Active-Standby</li>
                    </ul>
                </li>
                <li>
                    <strong>HSRP (Hot Standby Router Protocol):</strong>
                    <ul>
                        <li>Cisco-proprietär</li>
                        <li>Active-Standby</li>
                        <li>Weit verbreitet</li>
                    </ul>
                </li>
                <li>
                    <strong>GLBP (Gateway Load Balancing Protocol):</strong>
                    <ul>
                        <li>Cisco-proprietär</li>
                        <li>Active-Active (Load Balancing)</li>
                        <li>Bessere Ressourcen-Nutzung</li>
                    </ul>
                </li>
            </ul>
        </div>
        <div>
            <h3>Wie's funktioniert:</h3>
            <ul>
                <li>Zwei Router: Router A (Primary), Router B (Standby)</li>
                <li>Virtuelle IP: 192.168.1.1 (das ist das Gateway)</li>
                <li>Router A antwortet auf 192.168.1.1</li>
                <li>Router A fällt aus → Router B übernimmt 192.168.1.1</li>
                <li>Clients merken nichts (verwenden weiter 192.168.1.1)</li>
            </ul>
        </div>
        <em>Gateway-Redundanz ist Pflicht für kritische Netze!</em>
    </div>

    <div data-tooltip-id="network-qos">
        <h2>QoS (Quality of Service)</h2>
        <p>Priorisierung wichtiger Netzwerk-Traffic.</p>
        <div>
            <h3>Warum QoS nötig:</h3>
            Nicht aller Traffic ist gleich wichtig!
        </div>
        <div>
            <h3>Das Problem ohne QoS:</h3>
            VoIP-Anruf stockt, weil jemand große Datei lädt
        </div>
        <div>
            <h3>QoS-Mechanismen:</h3>
            <ul>
                <li>
                    <strong>DiffServ (DSCP):</strong>
                    <ul>
                        <li>Layer 3 (IP-Header)</li>
                        <li>6 Bit = 64 Klassen</li>
                        <li>Standard im Internet</li>
                    </ul>
                </li>
                <li>
                    <strong>CoS (Class of Service, 802.1p):</strong>
                    <ul>
                        <li>Layer 2 (Ethernet-Frame)</li>
                        <li>3 Bit = 8 Prioritäten (0-7)</li>
                        <li>Nur innerhalb LAN</li>
                    </ul>
                </li>
            </ul>
        </div>
        <div>
            <h3>Typische Priorisierung:</h3>
            <ul>
                <li><strong>Höchste Priorität:</strong> VoIP, Video-Konferenzen (EF - Expedited Forwarding)</li>
                <li><strong>Hoch:</strong> Geschäftskritische Anwendungen</li>
                <li><strong>Mittel:</strong> Standard-Traffic (HTTP, E-Mail)</li>
                <li><strong>Niedrig:</strong> Backup, Datei-Sync, Updates (Best Effort)</li>
            </ul>
        </div>
        <div>
            <h3>Traffic Shaping vs Policing:</h3>
            <ul>
                <li><strong>Shaping:</strong> Traffic glätten (Puffer) - freundlich</li>
                <li><strong>Policing:</strong> Überschuss droppen - hart</li>
            </ul>
        </div>
        <em>QoS ist essentiell für VoIP und Video-Conferencing!</em>
    </div>

    <div data-tooltip-id="network-netflow">
        <h2>NetFlow / sFlow / IPFIX</h2>
        <p>Monitoring von Netzwerk-Traffic-Flows.</p>
        <div>
            <h3>Was ist ein Flow:</h3>
            Eine Verbindung zwischen zwei Endpoints (z.B. PC → Webserver).
        </div>
        <div>
            <h3>Flow-Export-Protokolle:</h3>
            <ul>
                <li>
                    <strong>NetFlow:</strong>
                    <ul>
                        <li>Cisco-Standard (auch von anderen unterstützt)</li>
                        <li>Detaillierte Flow-Informationen</li>
                        <li>Versions: v5 (alt), v9 (flexibel)</li>
                    </ul>
                </li>
                <li>
                    <strong>sFlow:</strong>
                    <ul>
                        <li>Sampling-basiert (nur Teil des Traffics)</li>
                        <li>Geringere Switch-Last</li>
                        <li>Weniger genau</li>
                    </ul>
                </li>
                <li>
                    <strong>IPFIX:</strong>
                    <ul>
                        <li>IETF-Standard (Nachfolger von NetFlow v9)</li>
                        <li>Sehr flexibel</li>
                    </ul>
                </li>
            </ul>
        </div>
        <div>
            <h3>Warum Flow-Monitoring wichtig:</h3>
            <ul>
                <li>Wer kommuniziert mit wem?</li>
                <li>Welche Anwendungen verursachen Traffic?</li>
                <li>Anomalie-Erkennung (DDoS, Data Exfiltration)</li>
                <li>Kapazitätsplanung</li>
                <li>Troubleshooting</li>
            </ul>
        </div>
        <div>
            <h3>Collector-Software:</h3>
            ntopng, ElastiFlow, Plixer Scrutinizer
        </div>
        <em>Flow-Monitoring = "Wer spricht mit wem im Netzwerk"</em>
    </div>

    <div data-tooltip-id="network-vpn">
        <h2>VPN (Virtual Private Network)</h2>
        <p>Verschlüsselte Netzwerk-Verbindung.</p>
        <div>
            <h3>VPN-Typen:</h3>
            <ul>
                <li>
                    <strong>Site-to-Site VPN:</strong>
                    <ul>
                        <li>Verbindet zwei Standorte</li>
                        <li>Transparent für Endbenutzer</li>
                        <li>Router/Firewall baut Tunnel auf</li>
                        <li>Beispiel: Hauptsitz ↔ Zweigstelle</li>
                    </ul>
                </li>
                <li>
                    <strong>Remote Access VPN:</strong>
                    <ul>
                        <li>Einzelne Benutzer verbinden sich</li>
                        <li>VPN-Client auf Laptop/PC nötig</li>
                        <li>Für Home Office, Dienstreisen</li>
                    </ul>
                </li>
            </ul>
        </div>
        <div>
            <h3>VPN-Protokolle:</h3>
            <ul>
                <li><strong>IPSec:</strong> Standard für Site-to-Site, sehr sicher</li>
                <li><strong>SSL VPN:</strong> Browser-basiert, einfach</li>
                <li><strong>OpenVPN:</strong> Open Source, flexibel</li>
                <li><strong>WireGuard:</strong> Modern, sehr schnell, einfach</li>
            </ul>
        </div>
    </div>

    <div data-tooltip-id="network-compliance">
        <h2>Compliance-Anforderungen</h2>
        <p>Welche gesetzlichen/regulatorischen Standards müssen erfüllt werden?</p>
        <div>
            <h3>Standards erklärt:</h3>
            <ul>
                <li>
                    <strong>PCI DSS:</strong>
                    <ul>
                        <li>Payment Card Industry Data Security Standard</li>
                        <li>Für Netzwerke die Kreditkarten verarbeiten</li>
                        <li>Verlangt: Segmentierung, Firewall, Logging</li>
                    </ul>
                </li>
                <li>
                    <strong>HIPAA:</strong>
                    <ul>
                        <li>Health Insurance Portability and Accountability Act (USA)</li>
                        <li>Für Gesundheitsdaten</li>
                        <li>Verschlüsselung, Zugriffskontrolle, Audit-Logs</li>
                    </ul>
                </li>
                <li>
                    <strong>DSGVO:</strong>
                    <ul>
                        <li>Datenschutz-Grundverordnung (EU)</li>
                        <li>Für alle personenbezogenen Daten</li>
                        <li>Segmentierung, Verschlüsselung, Logging</li>
                    </ul>
                </li>
                <li>
                    <strong>KRITIS:</strong>
                    <ul>
                        <li>Kritische Infrastrukturen (DE)</li>
                        <li>Krankenhäuser, Energie, Wasser</li>
                        <li>BSI-Grundschutz, ISO 27001</li>
                        <li>Netzwerk-Segmentierung Pflicht!</li>
                    </ul>
                </li>
            </ul>
        </div>
        <em>Compliance ist nicht optional - bei Verstößen drohen Millionen-Bußgelder!</em>
    </div>

    <div data-tooltip-id="network-ipam">
        <h2>IP-Adress-Management (IPAM)</h2>
        <p>Tool zur Verwaltung von IP-Adressen.</p>
        <div>
            <h3>Warum IPAM wichtig:</h3>
            <ul>
                <li>Übersicht: Welche IPs sind belegt?</li>
                <li>Planung: Wachstum, neue Netze</li>
                <li>Vermeidung von IP-Konflikten</li>
                <li>Dokumentation</li>
            </ul>
        </div>
        <div>
            <h3>IPAM-Lösungen:</h3>
            <ul>
                <li><strong>phpIPAM:</strong> Open Source, Web-basiert, beliebt</li>
                <li><strong>NetBox:</strong> Open Source, auch für DCIM</li>
                <li><strong>Infoblox:</strong> Commercial, Enterprise</li>
                <li><strong>Microsoft IPAM:</strong> Teil von Windows Server</li>
                <li><strong>Excel:</strong> Für kleine Umgebungen (nicht empfohlen bei Wachstum!)</li>
            </ul>
        </div>
        <em>Excel ist KEIN IPAM - ab 100+ IPs besser echtes Tool nutzen!</em>
    </div>

    <div data-tooltip-id="network-notes">
        <h2>Notizen / Netzwerk-Besonderheiten</h2>
        <p>Zusätzliche wichtige Informationen zu diesem Netzwerk.</p>
        <div>
            <h3>Was dokumentieren:</h3>
            <ul>
                <li>Spezielle Routing-Regeln</li>
                <li>Bekannte Probleme und Workarounds</li>
                <li>Geplante Änderungen (z.B. "Migration auf neues VLAN geplant Q2/2025")</li>
                <li>Historische Informationen (warum so konfiguriert?)</li>
                <li>Performance-Bottlenecks</li>
                <li>Abhängigkeiten zu anderen Netzen</li>
                <li>Wartungsfenster</li>
            </ul>
        </div>
        <div>
            <h3>Beispiel:</h3>
            "VLAN 100 für KIS-Server. Firewall-Regel FW-PROD-001 erlaubt nur Port 1433 (SQL) von VLAN 200. QoS-Profile 'Database-Priority' aktiv. Bekanntes Problem: Bei Lastspitzen > 80% Switch-CPU gelegentlich Packet Loss → Upgrade auf 10G geplant Q3/2025. Wartungsfenster: Sonntag 02:00-06:00 Uhr. Netzwerk-Diagramm: \\fileserver\netdocs\VLAN100.vsdx"
        </div>
        <em>Gute Netzwerk-Dokumentation ist Gold wert - spart Stunden bei Troubleshooting!</em>
    </div>
</div>
