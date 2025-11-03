<div class="tooltip-definitions" style="display: none;">
    <div data-tooltip-id="vm-hostname">
        <h2>Hostname (VM)</h2>
        <p>Der eindeutige Name der virtuellen Maschine im Netzwerk.</p>
        <div>
            <h3>Was ist eine VM?</h3>
            Eine virtuelle Maschine (Virtual Machine) - ein Software-Computer, der auf einem physischen Server läuft. Wie ein "Computer im Computer".
        </div>
        <div>
            <h3>Best Practices für VM-Namen:</h3>
            <ul>
                <li>Nur Kleinbuchstaben und Bindestriche</li>
                <li>Funktion erkennbar machen</li>
                <li>Maximal 63 Zeichen</li>
            </ul>
        </div>
        <div>
            <h3>Namensschema-Beispiele:</h3>
            <ul>
                <li>"srv-kis-prod-01" - Server, KIS, Produktion, Nr. 1</li>
                <li>"vm-web-test-02" - VM, Webserver, Test, Nr. 2</li>
                <li>"app-labor-dev-03" - Applikation, Labor, Entwicklung, Nr. 3</li>
            </ul>
        </div>
        <em>Gute Namen helfen bei Übersicht und Troubleshooting!</em>
    </div>

    <div data-tooltip-id="vm-ip">
        <h2>IP-Adresse (VM)</h2>
        <p>Die Netzwerk-Adresse dieser virtuellen Maschine.</p>
        <div>
            <h3>Statisch vs. DHCP:</h3>
            <ul>
                <li><strong>Statische IP:</strong> Feste IP, ändert sich nie. Empfohlen für Server!</li>
                <li><strong>DHCP:</strong> IP wird automatisch vergeben, kann sich ändern. Für Test-VMs OK.</li>
            </ul>
        </div>
        <div>
            <h3>Typische IP-Bereiche:</h3>
            <ul>
                <li>10.0.1.x - Server-Netz</li>
                <li>192.168.100.x - VM-Netz</li>
                <li>172.16.x.x - Spezielle Segmente</li>
            </ul>
        </div>
        <em>Produktiv-Server sollten IMMER statische IPs haben!</em>
    </div>

    <div data-tooltip-id="vm-os">
        <h2>Betriebssystem (VM)</h2>
        <p>Das installierte Betriebssystem auf dieser VM.</p>
        <div>
            <h3>Gängige VM-Betriebssysteme:</h3>
            <ul>
                <li><strong>Windows Server:</strong> 2019, 2022 - Für Microsoft-Anwendungen</li>
                <li><strong>Linux:</strong> Ubuntu, RHEL, SUSE - Open Source, performant</li>
                <li><strong>VMware Appliances:</strong> Vorgefertigte virtuelle Geräte</li>
            </ul>
        </div>
        <div>
            <h3>Virtualisierungs-Vorteile:</h3>
            <ul>
                <li>Bessere Hardware-Auslastung</li>
                <li>Schnelle Bereitstellung</li>
                <li>Einfache Backups (Snapshots)</li>
                <li>Live-Migration möglich</li>
            </ul>
        </div>
    </div>

    <div data-tooltip-id="vm-role">
        <h2>Rolle / Funktion (VM)</h2>
        <p>Die Hauptaufgabe dieser VM.</p>
        <div>
            <h3>Typische VM-Rollen:</h3>
            <ul>
                <li><strong>Applikationsserver:</strong> KIS, PACS-Anwendung</li>
                <li><strong>Datenbank:</strong> SQL Server, Oracle auf VM</li>
                <li><strong>Webserver:</strong> IIS, Apache, Nginx</li>
                <li><strong>Fileserver:</strong> Dateiablage</li>
                <li><strong>Domain Controller:</strong> Active Directory</li>
            </ul>
        </div>
        <em>VMs sind ideal für Server-Rollen - flexibel und gut zu verwalten</em>
    </div>

    <div data-tooltip-id="vm-hypervisor">
        <h2>Hypervisor</h2>
        <p>Die Virtualisierungs-Plattform, auf der diese VM läuft.</p>
        <div>
            <h3>Was ist ein Hypervisor?</h3>
            Die Software, die VMs erstellt und verwaltet - wie ein "Manager" für virtuelle Computer.
        </div>
        <div>
            <h3>Gängige Hypervisoren:</h3>
            <ul>
                <li><strong>VMware vSphere/ESXi:</strong>
                    <ul>
                        <li>Marktführer, sehr zuverlässig</li>
                        <li>Enterprise-Features (vMotion, HA, DRS)</li>
                        <li>Lizenzpflichtig, aber weit verbreitet</li>
                    </ul>
                </li>
                <li><strong>Microsoft Hyper-V:</strong>
                    <ul>
                        <li>In Windows Server integriert</li>
                        <li>Gut für Windows-VMs</li>
                        <li>Günstiger als VMware</li>
                    </ul>
                </li>
                <li><strong>Proxmox VE:</strong>
                    <ul>
                        <li>Open Source, kostenlos</li>
                        <li>Linux-basiert (KVM)</li>
                        <li>Gut für kleinere Umgebungen</li>
                    </ul>
                </li>
                <li><strong>Citrix Hypervisor:</strong> Ehemals XenServer</li>
                <li><strong>KVM:</strong> Linux-native Virtualisierung</li>
            </ul>
        </div>
        <div>
            <h3>Beispiele:</h3>
            <ul>
                <li>"ESXi-Cluster-01" - VMware Cluster</li>
                <li>"Hyper-V-Host-DC1" - Hyper-V im Datacenter 1</li>
            </ul>
        </div>
        <em>Der Hypervisor muss vorher als Komponente angelegt sein</em>
    </div>

    <div data-tooltip-id="vm-esxi-host">
        <h2>ESXi Host / Physical Host</h2>
        <p>Der spezifische physische Server, auf dem diese VM läuft.</p>
        <div>
            <h3>Warum wichtig?</h3>
            <ul>
                <li>Troubleshooting: Wo läuft die VM genau?</li>
                <li>Ressourcen-Planung: Ist der Host überlastet?</li>
                <li>HA-Planung: VMs verteilen</li>
                <li>Wartung: Welcher Host muss gewartet werden?</li>
            </ul>
        </div>
        <div>
            <h3>Cluster vs. Host:</h3>
            <ul>
                <li><strong>Cluster:</strong> Mehrere Hosts arbeiten zusammen (z.B. "ESXi-Cluster-01")</li>
                <li><strong>Spezifischer Host:</strong> Ein einzelner Server im Cluster (z.B. "esxi-host-01.example.com")</li>
            </ul>
        </div>
        <div>
            <h3>Bei HA-Cluster:</h3>
            VM kann zwischen Hosts wechseln (vMotion, Live Migration)
        </div>
        <em>Optional - bei Cluster kann VM auf verschiedenen Hosts laufen</em>
    </div>

    <div data-tooltip-id="vm-vcpu">
        <h2>vCPU (Virtuelle CPUs)</h2>
        <p>Anzahl der virtuellen Prozessor-Kerne für diese VM.</p>
        <div>
            <h3>Was sind vCPUs?</h3>
            Virtuelle CPU-Kerne - die VM "denkt", sie hat diese Anzahl an Prozessoren.
        </div>
        <div>
            <h3>Richtwerte:</h3>
            <ul>
                <li><strong>1-2 vCPU:</strong> Kleine Dienste, Fileserver, einfache Web-Apps</li>
                <li><strong>4 vCPU:</strong> Standard für viele Anwendungen</li>
                <li><strong>8 vCPU:</strong> Datenbank-Server, große Anwendungen</li>
                <li><strong>16+ vCPU:</strong> Sehr rechenintensive Anwendungen</li>
            </ul>
        </div>
        <div>
            <h3>Wichtige Konzepte:</h3>
            <ul>
                <li><strong>Overcommitment:</strong> Mehr vCPUs vergeben als physische Cores vorhanden (z.B. Ratio 4:1)</li>
                <li><strong>CPU Ready Time:</strong> Wartezeit wenn zu viele vCPUs</li>
            </ul>
        </div>
        <div>
            <h3>Faustregel:</h3>
            Lieber weniger vCPUs und bei Bedarf erhöhen. Zu viele vCPUs können Performance verschlechtern!
        </div>
        <em>Mehr vCPUs ≠ automatisch schneller!</em>
    </div>

    <div data-tooltip-id="vm-ram">
        <h2>RAM (Arbeitsspeicher)</h2>
        <p>Der zugewiesene Arbeitsspeicher für diese VM in Gigabyte.</p>
        <div>
            <h3>Warum RAM kritisch ist:</h3>
            <ul>
                <li>Zu wenig RAM = langsam, Abstürze</li>
                <li>Zu viel RAM = Verschwendung (andere VMs brauchen es)</li>
            </ul>
        </div>
        <div>
            <h3>Richtwerte nach Rolle:</h3>
            <ul>
                <li><strong>2-4 GB:</strong> Minimale Services, Test-VMs</li>
                <li><strong>8 GB:</strong> Standard Fileserver, kleine Web-Apps</li>
                <li><strong>16 GB:</strong> Standard Applikationsserver</li>
                <li><strong>32 GB:</strong> Große Anwendungen, kleinere Datenbanken</li>
                <li><strong>64+ GB:</strong> Datenbank-Server, In-Memory-Anwendungen</li>
            </ul>
        </div>
        <div>
            <h3>Beispiele aus dem Krankenhaus:</h3>
            <ul>
                <li>KIS-Appserver: 32-64 GB</li>
                <li>Datenbank-VM: 64-128 GB</li>
                <li>Fileserver: 8-16 GB</li>
                <li>Web-Frontend: 16-32 GB</li>
            </ul>
        </div>
        <div>
            <h3>Memory Ballooning:</h3>
            Hypervisor kann RAM zwischen VMs verschieben
        </div>
        <em>RAM kann meist live hinzugefügt werden (Hot-Add)</em>
    </div>

    <div data-tooltip-id="vm-storage">
        <h2>Storage (Festplatten)</h2>
        <p>Der zugewiesene Festplatten-Speicher für diese VM in Gigabyte.</p>
        <div>
            <h3>VM-Disk-Typen:</h3>
            <ul>
                <li><strong>Thick Provisioned:</strong> Kompletter Speicher sofort reserviert (besser für Performance)</li>
                <li><strong>Thin Provisioned:</strong> Wächst dynamisch (spart Platz, aber Vorsicht bei Überbuchung!)</li>
            </ul>
        </div>
        <div>
            <h3>Richtwerte:</h3>
            <ul>
                <li><strong>40-80 GB:</strong> Betriebssystem + Basis-Software</li>
                <li><strong>100-500 GB:</strong> Standard-Server mit Anwendungen</li>
                <li><strong>500+ GB:</strong> Datenbank-Server, Fileserver</li>
                <li><strong>1+ TB:</strong> Große Datenbanken, Archive</li>
            </ul>
        </div>
        <div>
            <h3>Best Practice:</h3>
            Mehrere virtuelle Festplatten verwenden:
            <ul>
                <li>Disk 1 (C:): Betriebssystem (80 GB)</li>
                <li>Disk 2 (D:): Anwendung (200 GB)</li>
                <li>Disk 3 (E:): Daten (500 GB)</li>
            </ul>
        </div>
        <em>Storage kann meist online erweitert werden</em>
    </div>

    <div data-tooltip-id="vm-datastore">
        <h2>Datastore / Storage Pool</h2>
        <p>Der Speicherort, wo die VM-Dateien liegen.</p>
        <div>
            <h3>Was ist ein Datastore?</h3>
            Ein Speicher-Repository auf dem die virtuellen Festplatten (VMDK, VHD) gespeichert werden.
        </div>
        <div>
            <h3>Typische Datastore-Typen:</h3>
            <ul>
                <li><strong>Local Storage:</strong> Festplatten im ESXi-Host direkt</li>
                <li><strong>SAN (Storage Area Network):</strong> Zentraler Storage über Fibre Channel oder iSCSI</li>
                <li><strong>NAS (Network Attached Storage):</strong> Storage über NFS oder SMB</li>
                <li><strong>vSAN:</strong> Software-Defined Storage (VMware)</li>
            </ul>
        </div>
        <div>
            <h3>Namenskonventionen:</h3>
            <ul>
                <li>"Datastore-PROD-SSD-01" - Produktiv, SSD, Nr. 1</li>
                <li>"Storage-Pool-NVMe" - NVMe-basierter Pool</li>
                <li>"SAN-HDD-Backup" - SAN mit HDDs für Backups</li>
            </ul>
        </div>
        <div>
            <h3>Performance-Überlegungen:</h3>
            <ul>
                <li><strong>SSD/NVMe Datastore:</strong> Für Datenbanken, I/O-intensive VMs</li>
                <li><strong>HDD Datastore:</strong> Für Archiv, Backup-VMs</li>
            </ul>
        </div>
        <em>Kritische VMs auf schnelle (SSD) Datastores legen!</em>
    </div>

    <div data-tooltip-id="vm-hw-version">
        <h2>VM Hardware Version</h2>
        <p>Die Version der virtuellen Hardware-Plattform.</p>
        <div>
            <h3>Was bedeutet das?</h3>
            Definiert welche virtuellen Geräte und Features die VM unterstützt - wie das "Modell" des virtuellen Computers.
        </div>
        <div>
            <h3>VMware Hardware Versionen:</h3>
            <ul>
                <li><strong>vmx-19:</strong> ESXi 7.0 Update 2 (neueste Features)</li>
                <li><strong>vmx-17:</strong> ESXi 7.0</li>
                <li><strong>vmx-14:</strong> ESXi 6.7</li>
                <li><strong>vmx-11:</strong> ESXi 6.0 (alt)</li>
            </ul>
        </div>
        <div>
            <h3>Hyper-V Generationen:</h3>
            <ul>
                <li><strong>Generation 2:</strong> Modern, UEFI-Boot, bessere Performance (empfohlen!)</li>
                <li><strong>Generation 1:</strong> Legacy, BIOS-Boot (nur für alte OS)</li>
            </ul>
        </div>
        <div>
            <h3>Wichtig:</h3>
            <ul>
                <li>Upgrade ist möglich, aber VM muss aus sein</li>
                <li>Downgrade nicht möglich!</li>
                <li>Neuere Version = mehr Features (z.B. mehr vCPUs, RAM)</li>
            </ul>
        </div>
        <em>Neue VMs sollten neueste HW-Version verwenden</em>
    </div>

    <div data-tooltip-id="vm-tools">
        <h2>VM Tools Status</h2>
        <p>Status der installierten Gast-Tools (VMware Tools, Integration Services).</p>
        <div>
            <h3>Was sind VM Tools?</h3>
            Spezielle Software im Gast-OS, die Performance und Funktionen verbessert - wie "Treiber" für die virtuelle Hardware.
        </div>
        <div>
            <h3>Warum wichtig?</h3>
            <ul>
                <li><strong>Performance:</strong> Bessere Grafik, Netzwerk, Disk-I/O</li>
                <li><strong>Zeit-Synchronisation:</strong> Korrekte Uhrzeit</li>
                <li><strong>Graceful Shutdown:</strong> Sauberes Herunterfahren</li>
                <li><strong>Heartbeat:</strong> Hypervisor weiß, ob VM noch reagiert</li>
                <li><strong>Snapshots:</strong> Application-consistent Snapshots</li>
                <li><strong>Monitoring:</strong> CPU, RAM-Auslastung sichtbar</li>
            </ul>
        </div>
        <div>
            <h3>Status-Optionen:</h3>
            <ul>
                <li><strong>Installiert & Aktuell:</strong> Perfekt - alles gut!</li>
                <li><strong>Installiert (veraltet):</strong> Funktioniert, sollte aber aktualisiert werden</li>
                <li><strong>Nicht installiert:</strong> Schlecht - VM läuft suboptimal, keine erweiterten Features</li>
            </ul>
        </div>
        <div>
            <h3>Namen je nach Hypervisor:</h3>
            <ul>
                <li><strong>VMware:</strong> VMware Tools</li>
                <li><strong>Hyper-V:</strong> Integration Services (IS)</li>
                <li><strong>Proxmox/KVM:</strong> QEMU Guest Agent</li>
            </ul>
        </div>
        <em>VM Tools sollten IMMER installiert und aktuell sein!</em>
    </div>

    <div data-tooltip-id="vm-snapshots">
        <h2>Snapshots vorhanden</h2>
        <p>Gibt es Snapshots (Momentaufnahmen) dieser VM?</p>
        <div>
            <h3>Was ist ein Snapshot?</h3>
            Ein "eingefrorener" Zustand der VM zu einem bestimmten Zeitpunkt - wie ein "Speicherpunkt" in einem Videospiel.
        </div>
        <div>
            <h3>Snapshot-Typen:</h3>
            <ul>
                <li><strong>Keine:</strong> Ideal - keine Snapshots vorhanden (gut für Performance)</li>
                <li><strong>Backup-Snapshots:</strong>
                    <ul>
                        <li>Temporär für Backup-Software</li>
                        <li>Werden nach Backup automatisch gelöscht</li>
                        <li>OK, wenn nicht älter als 24h</li>
                    </ul>
                </li>
                <li><strong>Produktiv-Snapshots:</strong>
                    <ul>
                        <li>Manuell erstellt, z.B. vor Updates</li>
                        <li><strong>ACHTUNG:</strong> Sollten nicht lange existieren!</li>
                        <li>Verursachen Performance-Probleme</li>
                        <li>Können Datastore volllaufen lassen</li>
                    </ul>
                </li>
            </ul>
        </div>
        <div>
            <h3>Probleme mit alten Snapshots:</h3>
            <ul>
                <li>Schlechte Performance (alle Schreibvorgänge gehen in Snapshot)</li>
                <li>Speicherplatz-Verbrauch (Snapshot wächst ständig)</li>
                <li>Konsolidierung dauert lange und ist riskant</li>
            </ul>
        </div>
        <div>
            <h3>Best Practice:</h3>
            <ul>
                <li>Snapshots nur kurzzeitig (vor Updates, max. 24-72h)</li>
                <li>Danach IMMER löschen/konsolidieren</li>
                <li>Monitoring: Alte Snapshots alarmieren</li>
            </ul>
        </div>
        <em>Snapshots sind KEIN Backup-Ersatz! Nur temporär nutzen.</em>
    </div>

    <div data-tooltip-id="vm-boot-order">
        <h2>Boot-Reihenfolge</h2>
        <p>In welcher Reihenfolge versucht die VM zu booten?</p>
        <div>
            <h3>Was ist das?</h3>
            Die Reihenfolge der Geräte, von denen die VM versucht zu starten - wie beim BIOS eines physischen PCs.
        </div>
        <div>
            <h3>Typische Optionen:</h3>
            <ul>
                <li><strong>HDD / Hard Disk:</strong> Von der virtuellen Festplatte (Normal-Betrieb)</li>
                <li><strong>CD-ROM / DVD:</strong> Von ISO-Image (für Installation)</li>
                <li><strong>Network / PXE:</strong> Netzwerk-Boot</li>
                <li><strong>Floppy:</strong> Veraltet, kaum noch verwendet</li>
            </ul>
        </div>
        <div>
            <h3>Beispiele:</h3>
            <ul>
                <li>"HDD, Network, CD-ROM" - Standard (erst Festplatte, dann Netzwerk)</li>
                <li>"CD-ROM, HDD" - Für Installation (erst ISO, dann HDD)</li>
                <li>"HDD" - Nur Festplatte (sicherste Option)</li>
            </ul>
        </div>
        <div>
            <h3>Sicherheits-Tipp:</h3>
            Nach Installation CD-ROM aus Boot-Order entfernen oder HDD an erste Stelle!
        </div>
        <em>Produktiv-VMs sollten nur von HDD booten</em>
    </div>
</div>
