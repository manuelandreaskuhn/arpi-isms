<div class="tooltip-definitions" style="display: none;">
    <div data-tooltip-id="hw-hostname">
        <strong>Hostname</strong>
        <p>Der eindeutige Name des physischen Servers im Netzwerk.</p>
        <p><strong>Was ist ein Hostname?</strong> Der Computer-Name, unter dem der Server im Netzwerk erreichbar ist.</p>
        <p><strong>Best Practices für Namen:</strong></p>
        <ul>
            <li>Nur Kleinbuchstaben und Bindestriche verwenden</li>
            <li>Keine Leerzeichen oder Sonderzeichen</li>
            <li>Beschreibend und strukturiert</li>
            <li>Maximal 63 Zeichen</li>
        </ul>
        <p><strong>Empfohlenes Namensschema:</strong></p>
        <ul>
            <li><strong>[typ]-[funktion]-[umgebung]-[nummer]</strong></li>
            <li>"srv-db-prod-01" - Server, Datenbank, Produktion, Nr. 1</li>
            <li>"srv-app-test-02" - Server, Applikation, Test, Nr. 2</li>
            <li>"srv-web-prod-03" - Server, Webserver, Produktion, Nr. 3</li>
        </ul>
        <p><strong>Weitere Beispiele:</strong></p>
        <ul>
            <li>"ks-kis-prod-01" - Krankenhaus-Server KIS Produktion</li>
            <li>"srv-backup-main" - Backup-Server Hauptstandort</li>
            <li>"hv-vmware-cluster-01" - Hypervisor VMware Cluster</li>
        </ul>
        <em>Ein guter Hostname verrät auf einen Blick die Funktion des Servers!</em>
    </div>

    <div data-tooltip-id="hw-ip">
        <strong>IP-Adresse</strong>
        <p>Die eindeutige Netzwerk-Adresse dieses physischen Servers.</p>
        <p><strong>Was ist eine IP-Adresse?</strong> Wie eine Postadresse im Netzwerk - damit findet man den Server.</p>
        <p><strong>IPv4-Format:</strong> Vier Zahlen von 0-255, getrennt durch Punkte</p>
        <p><strong>Typische IP-Bereiche im Krankenhaus:</strong></p>
        <ul>
            <li><strong>10.x.x.x:</strong> Große interne Netzwerke</li>
            <li><strong>172.16.x.x - 172.31.x.x:</strong> Mittlere Netzwerke</li>
            <li><strong>192.168.x.x:</strong> Kleine interne Netzwerke</li>
        </ul>
        <p><strong>Beispiele nach Funktion:</strong></p>
        <ul>
            <li>10.0.1.20 - Server-Netz</li>
            <li>10.0.10.50 - Datenbank-Netz</li>
            <li>172.16.5.100 - DMZ (öffentlich erreichbare Server)</li>
            <li>192.168.100.10 - Management-Netz</li>
        </ul>
        <p><strong>Wichtig:</strong></p>
        <ul>
            <li>Jede IP nur EINMAL im Netzwerk</li>
            <li>Server meist mit statischer (fester) IP</li>
            <li>IP sollte zum Netzwerk-Design passen</li>
        </ul>
        <em>Tipp: Dokumentieren Sie Ihr IP-Schema (z.B. .1-.50 für Server, .51-.100 für Infrastruktur)</em>
    </div>

    <div data-tooltip-id="hw-manufacturer">
        <strong>Hersteller & Modell</strong>
        <p>Der Hersteller und die genaue Modellbezeichnung des physischen Servers.</p>
        <p><strong>Warum wichtig?</strong></p>
        <ul>
            <li>Support-Anfragen (Hersteller-Support kontaktieren)</li>
            <li>Ersatzteil-Beschaffung</li>
            <li>Treiber-Downloads</li>
            <li>Hardware-Kompatibilität prüfen</li>
            <li>Firmware-Updates</li>
        </ul>
        <p><strong>Typische Server-Hersteller:</strong></p>
        <ul>
            <li><strong>Dell:</strong> PowerEdge-Serie (z.B. R740, R750, R650)</li>
            <li><strong>HPE:</strong> ProLiant-Serie (z.B. DL380, DL360, ML350)</li>
            <li><strong>Lenovo:</strong> ThinkSystem-Serie (z.B. SR630, SR650)</li>
            <li><strong>Fujitsu:</strong> PRIMERGY-Serie (z.B. RX2530, RX2540)</li>
            <li><strong>Cisco:</strong> UCS-Serie (z.B. C220, C240)</li>
            <li><strong>Supermicro:</strong> SuperServer-Serie</li>
        </ul>
        <p><strong>Beispiele:</strong></p>
        <ul>
            <li>"Dell PowerEdge R750" - 2U Rack-Server, aktuelle Generation</li>
            <li>"HPE ProLiant DL380 Gen10" - 2U Rack-Server</li>
            <li>"Lenovo ThinkSystem SR650" - 2U Rack-Server</li>
        </ul>
        <em>Die Modellbezeichnung finden Sie auf einem Aufkleber am Server oder im BIOS/iDRAC/iLO</em>
    </div>

    <div data-tooltip-id="hw-serial">
        <strong>Seriennummer</strong>
        <p>Die eindeutige Hardware-Seriennummer des Servers.</p>
        <p><strong>Was ist die Seriennummer?</strong> Wie eine Fahrgestellnummer beim Auto - identifiziert genau DIESES Gerät.</p>
        <p><strong>Wofür braucht man die?</strong></p>
        <ul>
            <li><strong>Support-Anfragen:</strong> Hersteller braucht sie für Support-Tickets</li>
            <li><strong>Garantie prüfen:</strong> Garantie-Status online abfragen</li>
            <li><strong>Ersatzteil-Bestellung:</strong> Richtige Teile für dieses Gerät</li>
            <li><strong>Asset-Management:</strong> Eindeutige Identifikation</li>
            <li><strong>Diebstahl-Schutz:</strong> Gestohlene Geräte identifizieren</li>
        </ul>
        <p><strong>Wo finde ich die Seriennummer?</strong></p>
        <ul>
            <li>Aufkleber an der Vorder- oder Rückseite</li>
            <li>Im BIOS/UEFI beim Boot</li>
            <li>Management-Interface (iDRAC, iLO, IMM)</li>
            <li>Auf der Originalverpackung</li>
            <li>In der Kaufrechnung</li>
        </ul>
        <p><strong>Typisches Format (Beispiele):</strong></p>
        <ul>
            <li>Dell: XXXXXXX (7 Zeichen)</li>
            <li>HP: 2M2XXXXXXXXX</li>
            <li>Lenovo: S4XXXXXXXXXXXX</li>
        </ul>
        <em>Wichtig: Fotografieren Sie die Seriennummer vor dem Einbau - später schlecht erreichbar!</em>
    </div>

    <div data-tooltip-id="hw-os">
        <strong>Betriebssystem</strong>
        <p>Das installierte Betriebssystem auf diesem physischen Server.</p>
        <p><strong>Was ist ein Betriebssystem?</strong> Die Basissoftware, die den Server steuert und Programme ausführt.</p>
        <p><strong>Gängige Server-Betriebssysteme:</strong></p>
        <ul>
            <li><strong>Windows Server:</strong>
                <ul>
                    <li>Windows Server 2019, 2022</li>
                    <li>Einfache Verwaltung über GUI</li>
                    <li>Gut für Microsoft-Anwendungen (SQL Server, Exchange)</li>
                    <li>Lizenzpflichtig</li>
                </ul>
            </li>
            <li><strong>Linux-Distributionen:</strong>
                <ul>
                    <li><strong>Ubuntu Server:</strong> Einsteigerfreundlich, große Community</li>
                    <li><strong>Red Hat Enterprise Linux (RHEL):</strong> Enterprise-Support, kostenpflichtig</li>
                    <li><strong>SUSE Linux Enterprise:</strong> In Deutschland beliebt, Support</li>
                    <li><strong>Debian:</strong> Sehr stabil, kostenlos</li>
                    <li><strong>CentOS/Rocky Linux:</strong> RHEL-kompatibel, kostenlos</li>
                </ul>
            </li>
            <li><strong>Virtualisierungs-Plattformen:</strong>
                <ul>
                    <li><strong>VMware ESXi:</strong> Weit verbreitet, kommerziell</li>
                    <li><strong>Proxmox VE:</strong> Open Source, KVM-basiert</li>
                    <li><strong>Microsoft Hyper-V Server:</strong> Kostenlose Hyper-V-Variante</li>
                    <li><strong>Citrix Hypervisor:</strong> Ehemals XenServer</li>
                </ul>
            </li>
        </ul>
        <p><strong>Entscheidungshilfe:</strong></p>
        <ul>
            <li>Microsoft-Anwendungen → Windows Server</li>
            <li>Open Source / Kostenersparnis → Linux</li>
            <li>Virtualisierungs-Host → ESXi, Proxmox, Hyper-V</li>
            <li>Enterprise-Support nötig → RHEL, SUSE, Windows</li>
        </ul>
    </div>

    <div data-tooltip-id="hw-role">
        <strong>Rolle / Funktion</strong>
        <p>Die Hauptaufgabe oder Funktion dieses Servers.</p>
        <p><strong>Server-Rollen erklärt:</strong></p>
        <ul>
            <li><strong>Datenbankserver:</strong>
                <ul>
                    <li>Hostet Datenbank-Systeme (Oracle, SQL Server, PostgreSQL)</li>
                    <li>Braucht viel RAM und schnelle Festplatten</li>
                    <li>Oft kritisch für Betrieb</li>
                </ul>
            </li>
            <li><strong>Applikationsserver:</strong>
                <ul>
                    <li>Führt Anwendungen aus (KIS, PACS, etc.)</li>
                    <li>Verarbeitet Geschäftslogik</li>
                    <li>Vermittelt zwischen Client und Datenbank</li>
                </ul>
            </li>
            <li><strong>Webserver:</strong>
                <ul>
                    <li>Stellt Web-Anwendungen bereit</li>
                    <li>HTTP/HTTPS-Dienste</li>
                    <li>Beispiel: IIS, Apache, Nginx</li>
                </ul>
            </li>
            <li><strong>Fileserver:</strong>
                <ul>
                    <li>Zentrale Datei-Ablage</li>
                    <li>Netzwerk-Shares (SMB/CIFS, NFS)</li>
                    <li>Braucht viel Speicherplatz</li>
                </ul>
            </li>
            <li><strong>Domain Controller:</strong>
                <ul>
                    <li>Verwaltet Benutzer und Computer</li>
                    <li>Active Directory</li>
                    <li>Authentifizierung und Berechtigungen</li>
                </ul>
            </li>
            <li><strong>Backup-Server:</strong>
                <ul>
                    <li>Erstellt und verwaltet Backups</li>
                    <li>Braucht SEHR viel Speicher</li>
                    <li>Backup-Software (Veeam, Commvault, etc.)</li>
                </ul>
            </li>
            <li><strong>Hypervisor/Virtualisierungs-Host:</strong>
                <ul>
                    <li>Läuft nur Virtualisierungs-Software</li>
                    <li>Hostet viele virtuelle Maschinen</li>
                    <li>Braucht viel CPU und RAM</li>
                </ul>
            </li>
            <li><strong>Firewall:</strong>
                <ul>
                    <li>Netzwerk-Sicherheit</li>
                    <li>Kontrolliert ein- und ausgehenden Traffic</li>
                    <li>Oft dedizierte Hardware</li>
                </ul>
            </li>
            <li><strong>Storage-Server / SAN:</strong>
                <ul>
                    <li>Zentraler Speicher für andere Server</li>
                    <li>iSCSI, Fibre Channel, NFS</li>
                    <li>Viele Festplatten in RAID</li>
                </ul>
            </li>
        </ul>
        <em>Ein Server kann mehrere Rollen haben, aber für Sicherheit und Performance ist Trennung besser!</em>
    </div>

    <div data-tooltip-id="hw-cpu">
        <strong>CPU / Prozessor</strong>
        <p>Der Prozessor (oder die Prozessoren) des Servers.</p>
        <p><strong>Was ist die CPU?</strong> Das "Gehirn" des Servers - führt alle Berechnungen durch.</p>
        <p><strong>Wichtige Angaben:</strong></p>
        <ul>
            <li><strong>Anzahl CPUs:</strong> 1x, 2x, 4x (Sockets auf dem Mainboard)</li>
            <li><strong>Hersteller:</strong> Intel oder AMD</li>
            <li><strong>Modell:</strong> Xeon, EPYC, Ryzen</li>
            <li><strong>Generation:</strong> Wichtig für Features und Performance</li>
            <li><strong>Kerne:</strong> Je mehr, desto besser für parallele Aufgaben</li>
        </ul>
        <p><strong>Server-CPU-Serien:</strong></p>
        <ul>
            <li><strong>Intel Xeon:</strong>
                <ul>
                    <li>Xeon Gold - High-End (z.B. Gold 6248R)</li>
                    <li>Xeon Silver - Mid-Range (z.B. Silver 4214R)</li>
                    <li>Xeon Bronze - Entry (z.B. Bronze 3204)</li>
                </ul>
            </li>
            <li><strong>AMD EPYC:</strong>
                <ul>
                    <li>EPYC 7003 Series - Aktuelle Generation</li>
                    <li>Oft mehr Kerne als Intel zum gleichen Preis</li>
                </ul>
            </li>
        </ul>
        <p><strong>Beispiele:</strong></p>
        <ul>
            <li>"2x Intel Xeon Gold 6248R" - 2 CPUs, jeweils 24 Kerne</li>
            <li>"1x AMD EPYC 7543" - 1 CPU mit 32 Kernen</li>
            <li>"2x Intel Xeon Silver 4214R" - 2 CPUs, jeweils 12 Kerne</li>
        </ul>
        <p><strong>Faustregel für Anforderungen:</strong></p>
        <ul>
            <li>Fileserver: 1 CPU mit wenigen Kernen reicht</li>
            <li>Webserver: 1-2 CPUs, mittlere Kernzahl</li>
            <li>Datenbank: 2 CPUs, viele Kerne</li>
            <li>Virtualisierung: 2+ CPUs, sehr viele Kerne</li>
        </ul>
        <em>Mehr Kerne ≠ automatisch schneller! Kommt auf die Anwendung an.</em>
    </div>

    <div data-tooltip-id="hw-ram">
        <strong>RAM (Arbeitsspeicher)</strong>
        <p>Der Arbeitsspeicher des Servers in Gigabyte (GB).</p>
        <p><strong>Was ist RAM?</strong> Der schnelle Kurzzeitgedächtnis-Speicher, in dem aktuelle Daten und Programme liegen.</p>
        <p><strong>Warum so wichtig?</strong></p>
        <ul>
            <li>Zu wenig RAM = langsam, Abstürze</li>
            <li>Datenbanken laden Daten in RAM (schneller als Festplatte)</li>
            <li>Virtuelle Maschinen brauchen eigenen RAM</li>
            <li>RAM ist oft der Flaschenhals!</li>
        </ul>
        <p><strong>Richtwerte nach Server-Rolle:</strong></p>
        <ul>
            <li><strong>16-32 GB:</strong> Einfache Fileserver, kleine Webserver</li>
            <li><strong>64-128 GB:</strong> Standard Applikations- und Webserver</li>
            <li><strong>128-256 GB:</strong> Datenbank-Server, mittlere Virtualisierung</li>
            <li><strong>256-512 GB:</strong> Große Datenbanken, viele VMs</li>
            <li><strong>512+ GB:</strong> In-Memory-Datenbanken, große Virtualisierungs-Cluster</li>
        </ul>
        <p><strong>Beispiele aus dem Krankenhaus:</strong></p>
        <ul>
            <li>KIS-Datenbank: 256-512 GB</li>
            <li>PACS-Server: 128-256 GB</li>
            <li>Fileserver: 32-64 GB</li>
            <li>Hypervisor mit 20 VMs: 512 GB+</li>
        </ul>
        <p><strong>RAM-Typen:</strong></p>
        <ul>
            <li>DDR4 - Aktueller Standard</li>
            <li>DDR5 - Neueste Generation (schneller, teurer)</li>
            <li>ECC RAM - Fehlerkorrektur (Pflicht für Server!)</li>
        </ul>
        <em>Faustregel: Lieber zu viel als zu wenig - RAM nachrüsten ist einfach!</em>
    </div>

    <div data-tooltip-id="hw-storage">
        <strong>Storage / Speicher</strong>
        <p>Die Festplatten-Konfiguration des Servers.</p>
        <p><strong>Wichtige Informationen:</strong></p>
        <ul>
            <li>Anzahl und Größe der Festplatten</li>
            <li>Technologie (HDD, SSD, NVMe)</li>
            <li>RAID-Level (Ausfallsicherheit)</li>
            <li>Gesamtkapazität</li>
        </ul>
        <p><strong>Festplatten-Technologien:</strong></p>
        <ul>
            <li><strong>HDD (Hard Disk Drive):</strong>
                <ul>
                    <li>Mechanische Festplatte mit rotierenden Scheiben</li>
                    <li>Günstig, viel Kapazität</li>
                    <li>Langsamer, bewegliche Teile (Verschleiß)</li>
                    <li>Gut für: Backup, Archiv, Massendaten</li>
                </ul>
            </li>
            <li><strong>SSD (Solid State Drive):</strong>
                <ul>
                    <li>Elektronische Chips, keine beweglichen Teile</li>
                    <li>10-100x schneller als HDD</li>
                    <li>Teurer pro GB</li>
                    <li>Gut für: Betriebssystem, Datenbanken, VMs</li>
                </ul>
            </li>
            <li><strong>NVMe SSD:</strong>
                <ul>
                    <li>Noch schneller als normale SSD</li>
                    <li>Direkt am PCIe-Bus</li>
                    <li>Für höchste Performance</li>
                    <li>Gut für: Hochperformante Datenbanken</li>
                </ul>
            </li>
        </ul>
        <p><strong>RAID-Level erklärt:</strong></p>
        <ul>
            <li><strong>RAID 0:</strong> Streifen über mehrere Platten. Schnell, KEINE Ausfallsicherheit. <em>Nur für unwichtige Daten!</em></li>
            <li><strong>RAID 1:</strong> Spiegelung auf 2 Platten. Eine Platte kann ausfallen. 50% Kapazität genutzt.</li>
            <li><strong>RAID 5:</strong> Min. 3 Platten, eine darf ausfallen. Guter Kompromiss Performance/Kapazität.</li>
            <li><strong>RAID 6:</strong> Min. 4 Platten, zwei dürfen ausfallen. Sicherer als RAID 5.</li>
            <li><strong>RAID 10:</strong> Kombination aus RAID 1+0. Schnell und sicher. Braucht min. 4 Platten.</li>
        </ul>
        <p><strong>Beispiele:</strong></p>
        <ul>
            <li>"4x 960GB SSD RAID 10" - 4 SSDs à 960GB in RAID 10 = ~1,8TB nutzbar</li>
            <li>"8x 4TB HDD RAID 6" - 8 HDDs à 4TB in RAID 6 = ~24TB nutzbar</li>
            <li>"2x 480GB SSD RAID 1 (OS) + 6x 1,2TB SSD RAID 10 (Data)"</li>
        </ul>
        <p><strong>Empfehlung:</strong></p>
        <ul>
            <li>Betriebssystem: 2x SSD RAID 1</li>
            <li>Datenbank: 4+ SSD/NVMe RAID 10</li>
            <li>Fileserver: Viele HDD RAID 6</li>
        </ul>
    </div>

    <div data-tooltip-id="hw-location">
        <strong>Standort / Rack</strong>
        <p>Der physische Standort des Servers im Rechenzentrum.</p>
        <p><strong>Was dokumentieren?</strong></p>
        <ul>
            <li>Rechenzentrum / Serverraum</li>
            <li>Rack-Nummer</li>
            <li>Höheneinheit (U = Units)</li>
            <li>Etage / Raum (optional)</li>
        </ul>
        <p><strong>Warum wichtig?</strong></p>
        <ul>
            <li>Schnelles Auffinden bei Hardware-Problem</li>
            <li>Verkabelungs-Planung</li>
            <li>Stromkreis-Zuordnung</li>
            <li>Klimatisierung / Kühlung</li>
            <li>Sicherheits-Zonen</li>
        </ul>
        <p><strong>Typisches Format:</strong></p>
        <ul>
            <li><strong>[RZ]-Rack-[Nummer]-U[Position]</strong></li>
        </ul>
        <p><strong>Beispiele:</strong></p>
        <ul>
            <li>"RZ1-Rack-A12-U10" - Rechenzentrum 1, Rack A12, Höheneinheit 10</li>
            <li>"Serverraum-2-Rack-03-U25" - Serverraum 2, Rack 3, Position 25</li>
            <li>"DC-Main-Row-B-Rack-07-U15-17" - Datacenter Main, Reihe B, Rack 7, Units 15-17</li>
        </ul>
        <p><strong>Höheneinheiten (U):</strong></p>
        <ul>
            <li>1U = 4,45cm Höhe</li>
            <li>Standard-Rack: 42U hoch</li>
            <li>Typische Server: 1U oder 2U</li>
            <li>Zählung von UNTEN nach OBEN</li>
        </ul>
        <p><strong>Zusatz-Infos (optional):</strong></p>
        <ul>
            <li>Stromkreis / PDU-Anschluss</li>
            <li>Netzwerk-Switch und Port</li>
            <li>KVM-Switch Port</li>
        </ul>
        <em>Tipp: Fotografieren Sie das Rack mit Beschriftung - hilft enorm bei der Fehlersuche!</em>
    </div>

    <div data-tooltip-id="hw-warranty">
        <strong>Garantie / Support bis</strong>
        <p>Bis wann läuft die Hersteller-Garantie oder der Support-Vertrag?</p>
        <p><strong>Warum wichtig?</strong></p>
        <ul>
            <li>Kostenloser Ersatzteil-Austausch während Garantie</li>
            <li>Support-Hotline verfügbar</li>
            <li>Vor-Ort-Service (je nach Vertrag)</li>
            <li>Firmware-Updates</li>
            <li>Rechtzeitig Verlängerung planen</li>
        </ul>
        <p><strong>Typische Garantie-Modelle:</strong></p>
        <ul>
            <li><strong>3 Jahre Standard:</strong> Basis-Garantie, meist enthalten</li>
            <li><strong>5 Jahre:</strong> Empfohlen für Produktiv-Server</li>
            <li><strong>Next Business Day (NBD):</strong> Ersatzteil am nächsten Werktag</li>
            <li><strong>4-Stunden-Service:</strong> Techniker innerhalb 4h vor Ort</li>
            <li><strong>24/7-Support:</strong> Support rund um die Uhr</li>
        </ul>
        <p><strong>Format-Beispiele:</strong></p>
        <ul>
            <li>"12/2027" - Dezember 2027</li>
            <li>"2027-12-31" - ISO-Format</li>
            <li>"Q4/2027" - 4. Quartal 2027</li>
            <li>"Abgelaufen 06/2023" - Wichtig zu wissen!</li>
        </ul>
        <p><strong>Was tun vor Ablauf?</strong></p>
        <ul>
            <li>6 Monate vorher: Verlängerung prüfen</li>
            <li>Bei kritischen Servern: Verlängern</li>
            <li>Bei alten Servern: Ersatz planen</li>
            <li>Support-Vertrag kann oft nachträglich gekauft werden</li>
        </ul>
        <p><strong>Garantie-Status online prüfen:</strong></p>
        <ul>
            <li>Dell: support.dell.com (mit Service Tag)</li>
            <li>HP: support.hpe.com (mit Seriennummer)</li>
            <li>Lenovo: support.lenovo.com (mit Seriennummer)</li>
        </ul>
        <em>Kritische Server ohne Garantie = hohes Risiko! Downtime kann teurer sein als Garantie-Verlängerung.</em>
    </div>
</div>
