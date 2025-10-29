<div class="tooltip-definitions" style="display: none;">
    <div data-tooltip-id="hypervisor-name">
        <strong>Hypervisor Name</strong>
        <p>Ein eindeutiger Name für Ihren Hypervisor oder Cluster.</p>
        <p><strong>Was ist ein Hypervisor?</strong> Die Software, die virtuelle Maschinen (VMs) erstellt und verwaltet - quasi der "Manager" für alle virtuellen Server.</p>
        <p><strong>Warum Virtualisierung wichtig ist:</strong></p>
        <ul>
            <li><strong>Bessere Hardware-Auslastung:</strong> Ein physischer Server kann 10-30 VMs hosten</li>
            <li><strong>Flexibilität:</strong> VMs schnell erstellen, verschieben, löschen</li>
            <li><strong>Kosteneinsparung:</strong> Weniger physische Server = weniger Strom, Kühlung, Platz</li>
            <li><strong>Hochverfügbarkeit:</strong> VMs können live zwischen Hosts verschoben werden</li>
        </ul>
        <p><strong>Namens-Beispiele:</strong></p>
        <ul>
            <li>"ESXi-Cluster-01" - VMware Cluster Nr. 1</li>
            <li>"Hyper-V-Host-DC1" - Hyper-V im Datacenter 1</li>
            <li>"Proxmox-Production" - Proxmox Produktiv-Umgebung</li>
            <li>"vSphere-Healthcare" - VMware für Healthcare-Systeme</li>
        </ul>
        <em>Ohne Virtualisierung bräuchten Sie für jede Anwendung einen eigenen Server!</em>
    </div>

    <div data-tooltip-id="hypervisor-type">
        <strong>Typ / Hersteller</strong>
        <p>Welche Virtualisierungs-Software wird verwendet?</p>
        <p><strong>Hypervisor-Kategorien:</strong></p>
        <ul>
            <li><strong>VMware (Marktführer):</strong>
                <ul>
                    <li><strong>ESXi:</strong> Einzelner Host, kostenlose Version verfügbar</li>
                    <li><strong>vSphere:</strong> Enterprise-Plattform mit vCenter (Cluster-Management)</li>
                    <li>Sehr stabil, teuer, größte Feature-Set</li>
                    <li>Gold-Standard im Krankenhaus</li>
                    <li><em>90%+ der Krankenhäuser nutzen VMware!</em></li>
                </ul>
            </li>
            <li><strong>Microsoft Hyper-V:</strong>
                <ul>
                    <li>In Windows Server integriert</li>
                    <li>Gut für Windows-lastige Umgebungen</li>
                    <li>Günstiger als VMware</li>
                    <li>Failover Cluster für HA</li>
                </ul>
            </li>
            <li><strong>Open Source:</strong>
                <ul>
                    <li><strong>KVM:</strong> Linux Kernel-basiert, sehr performant</li>
                    <li><strong>Proxmox VE:</strong> KVM mit Web-UI, sehr beliebt für KMU</li>
                    <li><strong>XenServer/XCP-ng:</strong> Citrix (kommerziell) / XCP-ng (Open Source)</li>
                    <li><strong>OpenStack:</strong> Cloud-Plattform, komplex</li>
                    <li>Kostenlos, aber weniger Support</li>
                </ul>
            </li>
            <li><strong>Cloud:</strong>
                <ul>
                    <li><strong>Azure:</strong> Hyper-V-basiert</li>
                    <li><strong>AWS:</strong> Nitro Hypervisor (custom)</li>
                    <li><strong>Google Cloud:</strong> KVM-basiert</li>
                    <li>Keine eigene Verwaltung nötig</li>
                </ul>
            </li>
            <li><strong>Andere:</strong>
                <ul>
                    <li><strong>Oracle VM:</strong> Für Oracle-Datenbanken</li>
                    <li><strong>Nutanix AHV:</strong> Teil der Nutanix HCI-Lösung</li>
                </ul>
            </li>
        </ul>
        <p><strong>Typ 1 vs Typ 2 Hypervisor:</strong></p>
        <ul>
            <li><strong>Typ 1 (Bare Metal):</strong> Läuft direkt auf Hardware (ESXi, Hyper-V) - <em>Für Server!</em></li>
            <li><strong>Typ 2 (Hosted):</strong> Läuft auf OS (VirtualBox, VMware Workstation) - <em>Für Desktop!</em></li>
        </ul>
        <em>Wahl hängt ab von: Budget, Expertise, Ökosystem (Windows vs Linux)</em>
    </div>

    <div data-tooltip-id="hypervisor-version">
        <strong>Version</strong>
        <p>Die installierte Hypervisor-Version.</p>
        <p><strong>Warum Version kritisch ist:</strong></p>
        <ul>
            <li>Neue Hardware-Support (CPU, RAM, NVMe)</li>
            <li>Performance-Verbesserungen</li>
            <li>Sicherheits-Patches</li>
            <li>Neue Features (z.B. vSphere 8: vGPU-Verbesserungen)</li>
            <li>Kompatibilität mit VM-Hardware-Versionen</li>
        </ul>
        <p><strong>Beispiele:</strong></p>
        <ul>
            <li>"ESXi 8.0 U2" - VMware Version 8.0 Update 2</li>
            <li>"Hyper-V 2022" - Windows Server 2022 Hyper-V</li>
            <li>"Proxmox VE 8.1" - Proxmox Version 8.1</li>
        </ul>
        <p><strong>Update-Strategie:</strong></p>
        <ul>
            <li>Nicht neueste Version = fehlt Support für neue Hardware</li>
            <li>Zu alte Version = Sicherheitsrisiko</li>
            <li><em>Empfehlung: N-1 Version (eine zurück) = stabil + aktuell</em></li>
        </ul>
        <em>Hypervisor MUSS aktuell gehalten werden - alte Versionen = Angriffspunkt!</em>
    </div>

    <div data-tooltip-id="hypervisor-mgmt-url">
        <strong>Management IP / URL</strong>
        <p>Die Adresse zur Verwaltung des Hypervisors.</p>
        <p><strong>Management-Zugriff:</strong></p>
        <ul>
            <li><strong>ESXi:</strong> Web-UI (https://esxi-host-ip) oder vCenter</li>
            <li><strong>vCenter:</strong> https://vcenter.example.com (zentral für Cluster)</li>
            <li><strong>Hyper-V:</strong> Hyper-V Manager oder System Center VMM</li>
            <li><strong>Proxmox:</strong> Web-UI (https://proxmox-ip:8006)</li>
        </ul>
        <p><strong>Best Practices:</strong></p>
        <ul>
            <li>Dediziertes Management-Netzwerk (VLAN)</li>
            <li>Nur aus Admin-Netz erreichbar</li>
            <li>MFA aktivieren (wo möglich)</li>
            <li>Niemals direkt aus Internet!</li>
        </ul>
        <em>Management-Zugriff ist kritisch - wenn kompromittiert, sind ALLE VMs gefährdet!</em>
    </div>

    <div data-tooltip-id="hypervisor-cluster">
        <strong>Cluster-Konfiguration</strong>
        <p>Laufen mehrere Hypervisor-Hosts zusammen als Cluster?</p>
        <p><strong>Was ist ein Cluster?</strong> Mehrere physische Server, die als ein System arbeiten - VMs können zwischen ihnen verschoben werden.</p>
        <p><strong>Warum Cluster wichtig:</strong></p>
        <ul>
            <li><strong>Hochverfügbarkeit (HA):</strong> VM startet automatisch auf anderem Host bei Ausfall</li>
            <li><strong>Live Migration:</strong> VM ohne Downtime verschieben (vMotion, Live Migration)</li>
            <li><strong>Load Balancing:</strong> Last automatisch verteilen (DRS)</li>
            <li><strong>Wartung ohne Downtime:</strong> Host in Wartungsmodus → VMs migrieren automatisch</li>
        </ul>
        <p><strong>Einzelner Host vs Cluster:</strong></p>
        <ul>
            <li><strong>Einzelhost:</strong> Einfach, günstig, aber Single Point of Failure</li>
            <li><strong>Cluster:</strong> Teurer, komplexer, aber hochverfügbar</li>
        </ul>
        <em>Für kritische Systeme (KIS, PACS): Cluster ist Pflicht!</em>
    </div>

    <div data-tooltip-id="hypervisor-cluster-name">
        <strong>Cluster Name</strong>
        <p>Der Name des Clusters (Gruppe von Hosts).</p>
        <p><strong>Namens-Beispiele:</strong></p>
        <ul>
            <li>"Production-Cluster" - Produktiv-VMs</li>
            <li>"HA-Cluster-01" - HA-Cluster Nr. 1</li>
            <li>"Test-Cluster" - Test-Umgebung</li>
            <li>"Healthcare-Cluster" - Medizinische Systeme</li>
        </ul>
    </div>

    <div data-tooltip-id="hypervisor-cluster-hosts">
        <strong>Anzahl Hosts im Cluster</strong>
        <p>Wie viele physische Server sind im Cluster?</p>
        <p><strong>Typische Größen:</strong></p>
        <ul>
            <li><strong>2 Hosts:</strong> Minimum für HA, aber bei Wartung keine Redundanz</li>
            <li><strong>3 Hosts:</strong> Ideal - HA funktioniert auch bei Wartung</li>
            <li><strong>4-8 Hosts:</strong> Standard für mittelgroße Umgebungen</li>
            <li><strong>8+ Hosts:</strong> Große Rechenzentren</li>
        </ul>
        <p><strong>N+1 Redundanz:</strong> Cluster muss auch funktionieren, wenn ein Host ausfällt</p>
        <p><strong>Beispiel:</strong> 100 VMs, 4 Hosts → Jeder Host ~25 VMs → Bei Ausfall: 3 Hosts müssen 100 VMs tragen können</p>
        <em>Minimum 3 Hosts empfohlen - sonst kein echtes HA!</em>
    </div>

    <div data-tooltip-id="hypervisor-ha">
        <strong>HA (High Availability)</strong>
        <p>Automatischer Neustart von VMs bei Host-Ausfall.</p>
        <p><strong>Was ist HA?</strong> Wenn ein Host ausfällt, werden dessen VMs automatisch auf anderen Hosts neu gestartet.</p>
        <p><strong>Wie HA funktioniert:</strong></p>
        <ol>
            <li>Host fällt aus (Hardware-Defekt, Stromausfall)</li>
            <li>Cluster erkennt Ausfall (Heartbeat fehlt)</li>
            <li>VMs werden auf verbleibenden Hosts neu gestartet</li>
            <li>Dauert 1-5 Minuten (kurze Downtime)</li>
        </ol>
        <p><strong>HA vs Fault Tolerance:</strong></p>
        <ul>
            <li><strong>HA:</strong> VM wird neu gestartet (kurze Downtime)</li>
            <li><strong>Fault Tolerance:</strong> VM läuft parallel auf 2 Hosts (keine Downtime, aber sehr ressourcen-intensiv)</li>
        </ul>
        <p><strong>Voraussetzungen:</strong></p>
        <ul>
            <li>Shared Storage (alle Hosts müssen auf gleiche VMDKs zugreifen können)</li>
            <li>Genug freie Ressourcen auf anderen Hosts</li>
        </ul>
        <em>HA aktivieren ist Best Practice für Produktiv-Cluster!</em>
    </div>

    <div data-tooltip-id="hypervisor-drs">
        <strong>DRS / Load Balancing</strong>
        <p>Automatische Lastverteilung von VMs über Hosts.</p>
        <p><strong>Was ist DRS?</strong> Distributed Resource Scheduler (VMware) - verschiebt VMs automatisch für optimale Auslastung.</p>
        <p><strong>Modi erklärt:</strong></p>
        <ul>
            <li><strong>Fully Automated:</strong>
                <ul>
                    <li>DRS verschiebt VMs automatisch</li>
                    <li>Keine manuelle Bestätigung</li>
                    <li>Beste Performance</li>
                    <li><em>Empfohlen für Produktion</em></li>
                </ul>
            </li>
            <li><strong>Partially Automated:</strong>
                <ul>
                    <li>DRS schlägt Verschiebungen vor</li>
                    <li>Admin muss bestätigen</li>
                    <li>Mehr Kontrolle</li>
                </ul>
            </li>
            <li><strong>Manual:</strong>
                <ul>
                    <li>Keine automatischen Verschiebungen</li>
                    <li>Nur Empfehlungen</li>
                    <li>Admin entscheidet alles</li>
                </ul>
            </li>
            <li><strong>Disabled:</strong> DRS aus</li>
        </ul>
        <p><strong>Vorteile:</strong></p>
        <ul>
            <li>Verhindert, dass ein Host überlastet ist</li>
            <li>Optimale Performance für alle VMs</li>
            <li>Automatische Initial Placement (wo neue VM starten?)</li>
        </ul>
        <p><strong>Microsoft-Äquivalent:</strong> Live Migration in Hyper-V (manuell oder gescriptet)</p>
        <em>DRS ist "Luxus" aber sehr praktisch - spart viel manuelle Arbeit!</em>
    </div>

    <div data-tooltip-id="hypervisor-hostlist">
        <strong>Host-Liste / Hostnames</strong>
        <p>Die einzelnen physischen Server im Cluster.</p>
        <p><strong>Was eintragen:</strong> FQDNs oder Hostnames der ESXi/Hyper-V Hosts</p>
        <p><strong>Beispiel:</strong></p>
        <ul>
            <li>esxi-host-01.example.com</li>
            <li>esxi-host-02.example.com</li>
            <li>esxi-host-03.example.com</li>
        </ul>
        <p><strong>Warum dokumentieren:</strong></p>
        <ul>
            <li>Schnelle Übersicht über physische Infrastruktur</li>
            <li>Bei Ausfall: Welcher Host ist betroffen?</li>
            <li>Wartungsplanung</li>
        </ul>
    </div>

    <div data-tooltip-id="hypervisor-location">
        <strong>Standort / Rechenzentrum</strong>
        <p>Wo stehen die physischen Server?</p>
        <p><strong>Wichtig für:</strong></p>
        <ul>
            <li>Disaster Recovery (geografische Trennung)</li>
            <li>Latenz-Planung</li>
            <li>Compliance (Daten müssen in DE/EU bleiben)</li>
            <li>Support (wer ist vor Ort?)</li>
        </ul>
        <p><strong>Beispiele:</strong> "RZ1", "Datacenter Berlin", "Colocation Frankfurt"</p>
    </div>

    <div data-tooltip-id="hypervisor-total-cpu">
        <strong>Gesamt CPU Cores</strong>
        <p>Die Summe aller physischen CPU-Kerne über alle Hosts.</p>
        <p><strong>Beispiel-Rechnung:</strong></p>
        <ul>
            <li>3 Hosts à 2x Intel Xeon mit je 16 Cores = 3 × 32 = 96 Cores</li>
        </ul>
        <p><strong>Warum wichtig:</strong> Kapazitätsplanung - wie viele VMs passen?</p>
        <p><strong>vCPU-Berechnung:</strong></p>
        <ul>
            <li>96 physische Cores</li>
            <li>Mit 4:1 Overcommitment = 384 vCPUs möglich</li>
            <li>Typische VM hat 2-4 vCPUs</li>
            <li>→ Ca. 100-200 VMs möglich (abhängig von Last)</li>
        </ul>
        <em>Mehr Cores = mehr VMs, aber beachte RAM und Storage!</em>
    </div>

    <div data-tooltip-id="hypervisor-total-ram">
        <strong>Gesamt RAM (GB)</strong>
        <p>Die Summe aller physischen RAM über alle Hosts.</p>
        <p><strong>RAM ist meist der limitierende Faktor!</strong> Nicht CPU.</p>
        <p><strong>Beispiel:</strong></p>
        <ul>
            <li>3 Hosts à 512 GB RAM = 1536 GB total</li>
            <li>Reserve für HA (20%): -307 GB</li>
            <li>Verfügbar: ~1200 GB</li>
            <li>Durchschnittliche VM: 8 GB</li>
            <li>→ Ca. 150 VMs möglich</li>
        </ul>
        <p><strong>Memory Overcommitment:</strong></p>
        <ul>
            <li>VMware/Hyper-V können mehr RAM vergeben als physisch vorhanden</li>
            <li>Durch Memory Ballooning, Compression, Swap</li>
            <li>Aber: Performance leidet!</li>
            <li><em>Overcommitment bei RAM vermeiden - lieber mehr RAM!</em></li>
        </ul>
    </div>

    <div data-tooltip-id="hypervisor-total-storage">
        <strong>Gesamt Storage (TB)</strong>
        <p>Gesamter verfügbarer Storage für VMs.</p>
        <p><strong>Nicht nur VMDK-Größe:</strong></p>
        <ul>
            <li>VM-Festplatten (VMDKs/VHDXs)</li>
            <li>Snapshots (können riesig werden!)</li>
            <li>Templates und ISOs</li>
            <li>Logs</li>
        </ul>
        <p><strong>Thin vs Thick Provisioning:</strong></p>
        <ul>
            <li><strong>Thin:</strong> Wächst dynamisch - 500 GB Disk kann 50 GB belegen</li>
            <li><strong>Thick:</strong> Kompletter Speicher sofort reserviert</li>
        </ul>
        <p><strong>Planung:</strong> Storage wächst schneller als erwartet - 20-30% Reserve einplanen!</p>
    </div>

    <div data-tooltip-id="hypervisor-storage-type">
        <strong>Storage-Typ</strong>
        <p>Wie ist der Storage angebunden?</p>
        <p><strong>Storage-Typen erklärt:</strong></p>
        <ul>
            <li><strong>Local Storage:</strong>
                <ul>
                    <li>Festplatten direkt im Server</li>
                    <li>Schnell, günstig</li>
                    <li>Kein vMotion/Live Migration möglich!</li>
                    <li>Nur für Testumgebungen</li>
                </ul>
            </li>
            <li><strong>SAN (Fibre Channel):</strong>
                <ul>
                    <li>Dediziertes Storage-Netzwerk</li>
                    <li>Sehr schnell, sehr teuer</li>
                    <li>Enterprise-Standard</li>
                    <li>vMotion/HA möglich</li>
                </ul>
            </li>
            <li><strong>iSCSI SAN:</strong>
                <ul>
                    <li>SAN über Standard-Ethernet</li>
                    <li>Günstiger als Fibre Channel</li>
                    <li>Gute Performance bei 10G+ Netzwerk</li>
                    <li>Beliebt im Mittelstand</li>
                </ul>
            </li>
            <li><strong>NFS:</strong>
                <ul>
                    <li>File-basierter Storage</li>
                    <li>Einfach zu verwalten</li>
                    <li>Für VMware gut geeignet</li>
                </ul>
            </li>
            <li><strong>vSAN / Software Defined:</strong>
                <ul>
                    <li>Lokale Disks werden zu Cluster-Storage</li>
                    <li>Hyper-Converged Infrastructure (HCI)</li>
                    <li>Sehr flexibel, skalierbar</li>
                    <li>Modern, aber komplex</li>
                </ul>
            </li>
        </ul>
        <em>Shared Storage ist Voraussetzung für HA und vMotion!</em>
    </div>

    <div data-tooltip-id="hypervisor-vm-count">
        <strong>Anzahl VMs (aktuell)</strong>
        <p>Wie viele VMs laufen derzeit auf dem Cluster?</p>
        <p><strong>Warum zählen:</strong></p>
        <ul>
            <li>Auslastung überwachen</li>
            <li>Kapazitätsplanung (wann zusätzliche Hosts?)</li>
            <li>Lizenzierung (oft pro VM)</li>
        </ul>
        <p><strong>VM-Density:</strong> VMs pro Host - gibt Aufschluss über Auslastung</p>
    </div>

    <div data-tooltip-id="hypervisor-cpu-overcommit">
        <strong>Overcommitment Ratio (CPU)</strong>
        <p>Wie viele vCPUs pro physischem Core?</p>
        <p><strong>Was ist CPU Overcommitment?</strong> Mehr vCPUs vergeben als physische Cores vorhanden - funktioniert, weil VMs selten 100% CPU nutzen.</p>
        <p><strong>Typische Ratios:</strong></p>
        <ul>
            <li><strong>1:1:</strong> Keine Überbuchung - sehr konservativ (Verschwendung)</li>
            <li><strong>4:1:</strong> Standard - funktioniert für die meisten Workloads</li>
            <li><strong>8:1:</strong> Aggressiv - nur wenn VMs sehr idle sind</li>
            <li><strong>10:1+:</strong> Zu viel - Performance-Probleme!</li>
        </ul>
        <p><strong>Beispiel:</strong></p>
        <ul>
            <li>96 physische Cores</li>
            <li>4:1 Ratio</li>
            <li>= 384 vCPUs können vergeben werden</li>
        </ul>
        <p><strong>Vorsicht:</strong> CPU-intensive VMs (Datenbanken) vertragen weniger Overcommitment!</p>
        <em>4:1 ist sicher, 8:1 funktioniert oft, mehr ist riskant</em>
    </div>

    <div data-tooltip-id="hypervisor-mgmt-network">
        <strong>Management Netzwerk</strong>
        <p>Das Netzwerk für Hypervisor-Management.</p>
        <p><strong>Was läuft über Management:</strong></p>
        <ul>
            <li>ESXi/Hyper-V Web-UI Zugriff</li>
            <li>vCenter ↔ ESXi Kommunikation</li>
            <li>SSH/PowerShell-Zugriff</li>
        </ul>
        <p><strong>Best Practices:</strong></p>
        <ul>
            <li>Dediziertes VLAN (z.B. VLAN 10)</li>
            <li>Nur aus Admin-Netz erreichbar</li>
            <li>Redundante Netzwerkkarten</li>
        </ul>
        <p><strong>Beispiel:</strong> "192.168.10.0/24, VLAN 10"</p>
    </div>

    <div data-tooltip-id="hypervisor-vmotion-network">
        <strong>vMotion / Live Migration Netzwerk</strong>
        <p>Das Netzwerk für Live-Migration von VMs.</p>
        <p><strong>Was ist vMotion/Live Migration?</strong> VM ohne Downtime von einem Host zu anderem verschieben - RAM-Inhalt wird übertragen!</p>
        <p><strong>Warum separates Netzwerk:</strong></p>
        <ul>
            <li>Sehr bandbreiten-intensiv (10+ GB RAM-Transfer)</li>
            <li>Sollte Produktiv-Netzwerk nicht belasten</li>
            <li>Dediziertes 10G+ Netzwerk empfohlen</li>
        </ul>
        <p><strong>Beispiel:</strong> "192.168.20.0/24, VLAN 20, 10G"</p>
        <em>vMotion braucht schnelles Netzwerk - sonst dauert Migration ewig!</em>
    </div>

    <div data-tooltip-id="hypervisor-storage-network">
        <strong>Storage Netzwerk</strong>
        <p>Das Netzwerk für Storage-Kommunikation (iSCSI, NFS).</p>
        <p><strong>Warum separates Storage-Netz:</strong></p>
        <ul>
            <li>Alle VM-Disk-Zugriffe laufen darüber</li>
            <li>Sehr hoher Traffic</li>
            <li>Latenz-kritisch</li>
            <li>Sollte isoliert sein</li>
        </ul>
        <p><strong>Best Practices:</strong></p>
        <ul>
            <li>Minimum 10G, besser 25G+</li>
            <li>Redundante Pfade (Multipathing)</li>
            <li>Dediziertes VLAN</li>
            <li>Jumbo Frames aktiviert (MTU 9000)</li>
        </ul>
        <p><strong>Beispiel:</strong> "192.168.30.0/24, VLAN 30, 25G"</p>
    </div>

    <div data-tooltip-id="hypervisor-vm-networks">
        <strong>VM Netzwerke / Port Groups</strong>
        <p>Die Netzwerke, die VMs nutzen können.</p>
        <p><strong>Was sind Port Groups?</strong> Virtuelle Netzwerk-Segmente für VMs - wie VLANs.</p>
        <p><strong>Typische VM-Netzwerke:</strong></p>
        <ul>
            <li>Prod-VLAN100 - Produktiv-Server</li>
            <li>DMZ-VLAN200 - DMZ-Zone</li>
            <li>Backup-VLAN300 - Backup-Netzwerk</li>
            <li>Test-VLAN400 - Test-VMs</li>
        </ul>
        <p><strong>Sicherheit:</strong> VMs sollten in verschiedenen VLANs sein je nach Funktion (Segmentierung)</p>
    </div>

    <div data-tooltip-id="hypervisor-vswitch">
        <strong>Distributed Switch / Virtual Switch</strong>
        <p>Der virtuelle Switch für Netzwerk-Konfiguration.</p>
        <p><strong>Standard vs Distributed Switch:</strong></p>
        <ul>
            <li><strong>Standard vSwitch:</strong> Pro Host konfiguriert - einfach, aber viel Arbeit bei vielen Hosts</li>
            <li><strong>Distributed vSwitch (vDS):</strong> Zentral über vCenter - konsistente Konfiguration über alle Hosts</li>
        </ul>
        <p><strong>Beispiel:</strong> "vDS-Production" oder "vSwitch0"</p>
        <em>Distributed Switch ist Pflicht für größere Umgebungen!</em>
    </div>

    <div data-tooltip-id="hypervisor-mgmt-tool">
        <strong>Management-Tool</strong>
        <p>Die Software zur Verwaltung des Hypervisors.</p>
        <p><strong>Tools erklärt:</strong></p>
        <ul>
            <li><strong>vCenter:</strong> VMware zentrale Management-Plattform (für Cluster)</li>
            <li><strong>System Center VMM:</strong> Microsoft für Hyper-V (Enterprise)</li>
            <li><strong>Proxmox Web UI:</strong> Eingebaut in Proxmox</li>
            <li><strong>Xen Orchestra:</strong> Web-UI für XenServer/XCP-ng</li>
            <li><strong>virsh / virt-manager:</strong> Kommandozeile / GUI für KVM</li>
        </ul>
        <p><strong>Ohne Management-Tool:</strong> Jeder Host einzeln verwalten = Alptraum!</p>
    </div>

    <div data-tooltip-id="hypervisor-monitoring">
        <strong>Monitoring / Alerting</strong>
        <p>Wie wird der Hypervisor überwacht?</p>
        <p><strong>Was überwachen:</strong></p>
        <ul>
            <li>Host-Status (Up/Down)</li>
            <li>CPU/RAM-Auslastung pro Host</li>
            <li>Storage-Kapazität und Performance</li>
            <li>VM-Status</li>
            <li>HA-Events</li>
            <li>Datastore-Latenzen</li>
        </ul>
        <p><strong>Monitoring-Tools:</strong></p>
        <ul>
            <li>vROps (VMware vRealize Operations) - Premium</li>
            <li>PRTG - Windows-fokussiert</li>
            <li>Zabbix - Open Source</li>
            <li>Nagios/Icinga - Open Source</li>
        </ul>
        <em>Hypervisor-Ausfall = viele VMs down - Monitoring ist kritisch!</em>
    </div>

    <div data-tooltip-id="hypervisor-backup">
        <strong>Backup-Lösung</strong>
        <p>Welche Software sichert die VMs?</p>
        <p><strong>VM-Backup-Lösungen:</strong></p>
        <ul>
            <li><strong>Veeam:</strong> Marktführer, sehr gut für VMware/Hyper-V</li>
            <li><strong>Altaro:</strong> Günstiger, für KMU</li>
            <li><strong>Commvault:</strong> Enterprise, teuer</li>
            <li><strong>Nakivo:</strong> Alternative zu Veeam</li>
            <li><strong>Proxmox Backup Server:</strong> Für Proxmox</li>
        </ul>
        <p><strong>Agentless Backup:</strong> Backup direkt auf Hypervisor-Ebene (ohne Agent in VM) - einfacher!</p>
        <em>VM-Backup ist essentiell - Snapshots sind KEIN Backup!</em>
    </div>

    <div data-tooltip-id="hypervisor-license-model">
        <strong>Lizenzmodell</strong>
        <p>Wie wird der Hypervisor lizenziert?</p>
        <p><strong>Lizenzmodelle erklärt:</strong></p>
        <ul>
            <li><strong>Perpetual:</strong> Einmalkauf, Updates oft extra - VMware früher</li>
            <li><strong>Subscription:</strong> Jährliche Zahlung - VMware jetzt, Microsoft</li>
            <li><strong>Per CPU/Socket:</strong> Pro physischem CPU-Sockel - VMware</li>
            <li><strong>Per Core:</strong> Pro Core - Microsoft Hyper-V (über Windows Server)</li>
            <li><strong>Per VM:</strong> Pro virtueller Maschine - selten</li>
            <li><strong>Free/Open Source:</strong> ESXi Free, Proxmox, KVM</li>
        </ul>
        <p><strong>VMware-Beispiel:</strong> vSphere Standard = 6 Lizenzen für 3 Hosts à 2 CPUs</p>
        <em>Lizenzkosten können sehr hoch sein - gut planen!</em>
    </div>

    <div data-tooltip-id="hypervisor-support-level">
        <strong>Support-Level</strong>
        <p>Welchen Support-Vertrag haben Sie?</p>
        <p><strong>Support-Level:</strong></p>
        <ul>
            <li><strong>Production Support (24/7):</strong> Anruf jederzeit, kritisch für Produktiv</li>
            <li><strong>Business Support (5x8):</strong> Mo-Fr Bürozeiten</li>
            <li><strong>Basic Support:</strong> E-Mail, langsame Response</li>
            <li><strong>Community Support:</strong> Nur Community-Foren</li>
            <li><strong>Kein Support:</strong> ESXi Free, keine Hilfe vom Hersteller</li>
        </ul>
        <em>Bei kritischen Clustern: 24/7 Support ist Pflicht!</em>
    </div>

    <div data-tooltip-id="hypervisor-notes">
        <strong>Notizen / Besonderheiten</strong>
        <p>Zusätzliche wichtige Informationen zum Hypervisor.</p>
        <p><strong>Was dokumentieren:</strong></p>
        <ul>
            <li>Spezielle Konfigurationen (z.B. CPU-Pinning)</li>
            <li>Geplante Upgrades</li>
            <li>Bekannte Probleme und Workarounds</li>
            <li>Hardware-Besonderheiten</li>
            <li>Change-Prozesse</li>
            <li>Ansprechpartner (Vendor, intern)</li>
        </ul>
        <p><strong>Beispiel:</strong> "vSphere 8.0 U2, vCenter auf separater VM. DRS auf Fully Automated. HA aktiviert mit Admission Control. Geplantes Upgrade auf 8.0 U3 in Q2/2024. Bekanntes Problem: Host esxi-03 hat gelegentlich NIC-Probleme (Workaround: Driver-Update). Support-Vertrag bis 31.12.2025. Ansprechpartner: VMware TAC +1-xxx, intern: virtualization-team@example.com"</p>
        <em>Gute Dokumentation rettet Sie bei Hypervisor-Problemen!</em>
    </div>
</div>
