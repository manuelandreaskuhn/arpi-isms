<div class="tooltip-definitions" style="display: none;">
    <div data-tooltip-id="container-name">
        <h2>Container-Name</h2>
        <p>Ein eindeutiger, beschreibender Name für diesen Container.</p>
        <div>
            <h3>Best Practices:</h3>
            <ul>
                <li>Verwenden Sie Klein buchstaben und Bindestriche</li>
                <li>Beschreiben Sie die Funktion des Containers</li>
                <li>Vermeiden Sie Sonderzeichen außer Bindestrich (-)</li>
            </ul>
        </div>
        <div>
            <h3>Beispiele:</h3>
            <ul>
                <li>"kis-webapp" - Die Web-Anwendung des KIS</li>
                <li>"pacs-database" - Datenbank für PACS</li>
                <li>"nginx-proxy" - Nginx als Reverse Proxy</li>
                <li>"redis-cache-01" - Redis Cache, Instanz 1</li>
            </ul>
        </div>
        <em>Der Name sollte ohne Erklärung verständlich sein!</em>
    </div>

    <div data-tooltip-id="container-type">
        <h2>Container-Typ</h2>
        <p>Was läuft in diesem Container? Sie können mehrere Typen auswählen.</p>
        <div>
            <h3>Typ-Erklärungen:</h3>
            <ul>
                <li><strong>Applikation:</strong> Die Haupt-Anwendung (z.B. KIS, PACS-Viewer)</li>
                <li><strong>Datenbank:</strong> Datenbank wie PostgreSQL, MySQL, MongoDB</li>
                <li><strong>Webserver:</strong> HTTP-Server wie Nginx, Apache</li>
                <li><strong>API / Microservice:</strong> REST/GraphQL API oder kleiner Service</li>
                <li><strong>Cache:</strong> Redis, Memcached für schnellen Datenzugriff</li>
                <li><strong>Message Queue:</strong> RabbitMQ, Kafka für asynchrone Verarbeitung</li>
                <li><strong>Logging:</strong> Log-Sammler wie Fluentd, Logstash</li>
                <li><strong>Proxy:</strong> Reverse Proxy, Load Balancer (Nginx, HAProxy)</li>
                <li><strong>Worker:</strong> Hintergrund-Jobs (z.B. E-Mail-Versand, Berichte)</li>
                <li><strong>Storage:</strong> File-Server, Object Storage</li>
            </ul>
        </div>
        <div>
            <h3>Mehrfachauswahl:</h3>
            Ein Container kann z.B. gleichzeitig "Webserver" und "Proxy" sein.
        </div>
        <em>Tipp: Wählen Sie alle zutreffenden Typen aus!</em>
    </div>

    <div data-tooltip-id="container-runtime">
        <h2>Container-Runtime</h2>
        <p>Die Software, die Container auf dem Host ausführt.</p>
        <div>
            <h3>Optionen erklärt:</h3>
            <ul>
                <li><strong>Docker:</strong> Am weitesten verbreitet, einfach zu bedienen. Standard-Wahl für die meisten Projekte.</li>
                <li><strong>Podman:</strong> Alternative zu Docker, läuft ohne Root-Rechte (daemonless), kompatibel zu Docker</li>
                <li><strong>containerd:</strong> Low-Level Runtime, wird oft von Kubernetes verwendet</li>
                <li><strong>CRI-O:</strong> Leichtgewichtige Runtime speziell für Kubernetes</li>
                <li><strong>LXC/LXD:</strong> System-Container (wie leichte VMs), nicht für Anwendungs-Container</li>
            </ul>
        </div>
        <div>
            <h3>Entscheidungshilfe:</h3>
            <ul>
                <li>Standard-Fall → Docker</li>
                <li>Mehr Sicherheit → Podman</li>
                <li>Kubernetes → containerd oder CRI-O</li>
            </ul>
        </div>
        <em>Docker ist die einfachste und häufigste Wahl!</em>
    </div>

    <div data-tooltip-id="container-orchestration">
        <h2>Orchestrierung</h2>
        <p>System zur automatischen Verwaltung vieler Container.</p>
        <div>
            <h3>Was macht Orchestrierung?</h3>
            <ul>
                <li>Automatisches Starten/Stoppen von Containern</li>
                <li>Lastenverteilung (Load Balancing)</li>
                <li>Selbstheilung (automatischer Neustart bei Fehler)</li>
                <li>Skalierung (mehr Container bei hoher Last)</li>
                <li>Service Discovery (Container finden sich gegenseitig)</li>
            </ul>
        </div>
        <div>
            <h3>Optionen:</h3>
            <ul>
                <li><strong>Keine/Standalone:</strong> Container läuft einzeln, manuelle Verwaltung. Einfach, aber kein Failover.</li>
                <li><strong>Docker Compose:</strong> Mehrere Container zusammen definieren und starten. Gut für Entwicklung/Test.</li>
                <li><strong>Kubernetes (K8s):</strong> Industrie-Standard für Produktion. Komplex, aber sehr mächtig. <em>Für kritische Systeme!</em></li>
                <li><strong>OpenShift:</strong> Enterprise-Version von Kubernetes (Red Hat). Zusätzliche Management-Features.</li>
                <li><strong>Docker Swarm:</strong> Einfachere Alternative zu Kubernetes. Weniger Features, dafür einfacher.</li>
                <li><strong>Nomad:</strong> Von HashiCorp, einfacher als Kubernetes, flexibel</li>
                <li><strong>Rancher:</strong> Management-Plattform für Kubernetes-Cluster</li>
            </ul>
        </div>
        <div>
            <h3>Wann was verwenden:</h3>
            <ul>
                <li>1-5 Container → Keine oder Docker Compose</li>
                <li>5-20 Container → Docker Swarm</li>
                <li>20+ Container oder kritisch → Kubernetes</li>
            </ul>
        </div>
    </div>

    <div data-tooltip-id="k8s-namespace">
        <h2>Kubernetes Namespace</h2>
        <p>Logische Trennung von Ressourcen in Kubernetes.</p>
        <div>
            <h3>Was ist ein Namespace?</h3>
            Wie ein Ordner für Container - trennt verschiedene Projekte oder Umgebungen voneinander.
        </div>
        <div>
            <h3>Typische Namespaces:</h3>
            <ul>
                <li>"production" - Produktiv-Umgebung</li>
                <li>"staging" / "test" - Test-Umgebung</li>
                <li>"development" - Entwicklung</li>
                <li>"medical-apps" - Alle medizinischen Anwendungen</li>
                <li>"kis-system" - KIS und zugehörige Services</li>
            </ul>
        </div>
        <em>Namespaces helfen, Ordnung zu halten und Berechtigungen zu steuern!</em>
    </div>

    <div data-tooltip-id="k8s-deployment">
        <h2>Deployment / Pod Name</h2>
        <p>Der Name des Kubernetes Deployment oder Pod.</p>
        <div>
            <h3>Was ist ein Deployment?</h3>
            Eine Vorlage, die beschreibt, wie Container gestartet werden sollen.
        </div>
        <div>
            <h3>Was ist ein Pod?</h3>
            Eine Gruppe von einem oder mehreren Containern, die zusammen laufen.
        </div>
        <div>
            <h3>Beispiele:</h3>
            <ul>
                <li>"kis-web-deployment" - Deployment für KIS Web-App</li>
                <li>"pacs-db-pod" - Pod für PACS Datenbank</li>
            </ul>
        </div>
        <em>Ein Deployment verwaltet mehrere Pods (Replicas)</em>
    </div>

    <div data-tooltip-id="k8s-replicas">
        <h2>Replicas</h2>
        <p>Anzahl der identischen Container-Kopien, die parallel laufen.</p>
        <div>
            <h3>Warum mehrere Replicas?</h3>
            <ul>
                <li><strong>Hochverfügbarkeit:</strong> Wenn ein Container abstürzt, laufen andere weiter</li>
                <li><strong>Lastverteilung:</strong> Anfragen werden auf alle Replicas verteilt</li>
                <li><strong>Performance:</strong> Mehr Container = mehr Kapazität</li>
            </ul>
        </div>
        <div>
            <h3>Typische Werte:</h3>
            <ul>
                <li><strong>1:</strong> Keine Hochverfügbarkeit (nur für Test/Entwicklung)</li>
                <li><strong>2:</strong> Minimum für HA (wenn einer ausfällt, läuft noch einer)</li>
                <li><strong>3+:</strong> Empfohlen für Produktion</li>
                <li><strong>5+:</strong> Bei hoher Last</li>
            </ul>
        </div>
        <em>Mehr Replicas = mehr Ressourcen benötigt!</em>
    </div>

    <div data-tooltip-id="k8s-service">
        <h2>Kubernetes Service Name</h2>
        <p>Der interne DNS-Name, unter dem der Container erreichbar ist.</p>
        <div>
            <h3>Was ist ein Service?</h3>
            Ein stabiler Netzwerk-Endpunkt für Container. Auch wenn Container neu starten (neue IP), bleibt der Service-Name gleich.
        </div>
        <div>
            <h3>Beispiele:</h3>
            <ul>
                <li>"kis-web-service" → erreichbar unter http://kis-web-service</li>
                <li>"database-service" → andere Container verbinden sich damit</li>
            </ul>
        </div>
        <em>Andere Container nutzen den Service-Namen zur Kommunikation!</em>
    </div>

    <div data-tooltip-id="container-image">
        <h2>Container-Image</h2>
        <p>Das "Installations-Paket" für den Container - enthält die komplette Software.</p>
        <div>
            <h3>Format:</h3>
            [Registry/]Image-Name:Tag
        </div>
        <div>
            <h3>Beispiele:</h3>
            <ul>
                <li><strong>nginx:1.24</strong> - Nginx Webserver Version 1.24</li>
                <li><strong>postgres:15-alpine</strong> - PostgreSQL 15 (Alpine Linux = klein)</li>
                <li><strong>redis:7.0</strong> - Redis Cache Version 7.0</li>
                <li><strong>mcr.microsoft.com/mssql/server:2022-latest</strong> - MS SQL Server</li>
            </ul>
        </div>
        <div>
            <h3>Tag-Bedeutung:</h3>
            <ul>
                <li><strong>:latest</strong> - Neueste Version (NICHT für Produktion!)</li>
                <li><strong>:1.24</strong> - Spezifische Version (empfohlen)</li>
                <li><strong>:alpine</strong> - Kleine Linux-Variante</li>
            </ul>
        </div>
        <em>Wichtig: Immer spezifische Versionen verwenden, nicht "latest"!</em>
    </div>

    <div data-tooltip-id="container-registry">
        <h2>Image-Registry</h2>
        <p>Der "App-Store" für Container-Images - wo das Image gespeichert ist.</p>
        <div>
            <h3>Öffentliche Registries:</h3>
            <ul>
                <li><strong>Docker Hub:</strong> Größte öffentliche Registry (docker.io). Standard für viele Images.</li>
                <li><strong>Quay.io:</strong> Alternative zu Docker Hub (Red Hat)</li>
                <li><strong>GitHub Container Registry:</strong> Gut für eigene Projekte auf GitHub</li>
            </ul>
        </div>
        <div>
            <h3>Cloud-Registries:</h3>
            <ul>
                <li><strong>GCR:</strong> Google Container Registry</li>
                <li><strong>ECR:</strong> Amazon Elastic Container Registry</li>
                <li><strong>ACR:</strong> Azure Container Registry</li>
            </ul>
        </div>
        <div>
            <h3>Private Registry:</h3>
            <ul>
                <li><strong>Harbor:</strong> Selbst gehostete Enterprise-Registry</li>
                <li><strong>Private Registry:</strong> Eigener Docker Registry Server</li>
            </ul>
        </div>
        <div>
            <h3>Entscheidung:</h3>
            <ul>
                <li>Öffentliche Standard-Software → Docker Hub</li>
                <li>Eigene Software → Private Registry/Harbor</li>
                <li>Cloud-Umgebung → Entsprechende Cloud-Registry</li>
            </ul>
        </div>
        <em>Für Patientendaten: Nur private Registries verwenden!</em>
    </div>

    <div data-tooltip-id="image-scan">
        <h2>Image Security Scanning</h2>
        <p>Automatische Überprüfung des Container-Images auf Sicherheitslücken.</p>
        <div>
            <h3>Was wird gescannt?</h3>
            <ul>
                <li>Bekannte Schwachstellen (CVEs) in Basis-Image</li>
                <li>Veraltete Software-Pakete</li>
                <li>Unsichere Konfigurationen</li>
                <li>Malware</li>
            </ul>
        </div>
        <div>
            <h3>Scan-Tools:</h3>
            <ul>
                <li>Trivy (Open Source)</li>
                <li>Clair</li>
                <li>Snyk</li>
                <li>Harbor (integriert)</li>
            </ul>
        </div>
        <em>WICHTIG: Für Produktiv-Systeme IMMER aktivieren!</em>
    </div>

    <div data-tooltip-id="cpu-limit">
        <h2>CPU-Limit</h2>
        <p>Maximale CPU-Leistung, die der Container nutzen darf.</p>
        <div>
            <h3>Einheiten:</h3>
            <ul>
                <li><strong>Ganze Zahl:</strong> 1 = 1 CPU-Core, 2 = 2 CPU-Cores</li>
                <li><strong>Dezimal:</strong> 0.5 = halber Core</li>
                <li><strong>Millicores (m):</strong> 1000m = 1 Core, 500m = 0.5 Core</li>
            </ul>
        </div>
        <div>
            <h3>Beispiele:</h3>
            <ul>
                <li><strong>250m</strong> - Viertel CPU (kleine Services)</li>
                <li><strong>1 oder 1000m</strong> - Ein voller Core (Standard)</li>
                <li><strong>2</strong> - Zwei Cores (rechenintensive Apps)</li>
                <li><strong>4</strong> - Vier Cores (Datenbanken)</li>
            </ul>
        </div>
        <div>
            <h3>Faustregel:</h3>
            <ul>
                <li>Webserver: 0.5 - 1 Core</li>
                <li>API: 1 - 2 Cores</li>
                <li>Datenbank: 2 - 4 Cores</li>
                <li>Worker: 0.5 - 2 Cores</li>
            </ul>
        </div>
        <em>Limit = Container kann nicht mehr verbrauchen, auch wenn CPU frei ist</em>
    </div>

    <div data-tooltip-id="memory-limit">
        <h2>Memory-Limit</h2>
        <p>Maximaler RAM, den der Container nutzen darf.</p>
        <div>
            <h3>Einheiten:</h3>
            <ul>
                <li><strong>Gi (Gibibyte):</strong> 1Gi = 1.024 GB, binäre Einheit</li>
                <li><strong>Mi (Mebibyte):</strong> 1Mi = 1.024 MB</li>
                <li><strong>G (Gigabyte):</strong> 1G = 1.000 MB, dezimal</li>
            </ul>
        </div>
        <div>
            <h3>Beispiele:</h3>
            <ul>
                <li><strong>512Mi</strong> - 512 MB (kleine Services)</li>
                <li><strong>1Gi</strong> - 1 GB (Standard Web-App)</li>
                <li><strong>2Gi</strong> - 2 GB (größere Anwendungen)</li>
                <li><strong>4Gi</strong> - 4 GB (Datenbanken)</li>
                <li><strong>8Gi+</strong> - 8+ GB (Cache, große DBs)</li>
            </ul>
        </div>
        <div>
            <h3>Was passiert bei Überschreitung?</h3>
            Container wird automatisch beendet (OOM Kill = Out Of Memory)
        </div>
        <em>Wichtig: Limit muss größer sein als tatsächlicher Bedarf!</em>
    </div>

    <div data-tooltip-id="cpu-request">
        <h2>CPU-Request</h2>
        <p>Garantierte CPU-Leistung, die dem Container mindestens zur Verfügung steht.</p>
        <div>
            <h3>Unterschied zu Limit:</h3>
            <ul>
                <li><strong>Request:</strong> "Ich brauche mindestens..."</li>
                <li><strong>Limit:</strong> "Ich darf höchstens..."</li>
            </ul>
        </div>
        <div>
            <h3>Beispiel:</h3>
            Request 0.5, Limit 2 → Container bekommt garantiert 0.5 Cores, darf bis zu 2 nutzen wenn verfügbar
        </div>
        <div>
            <h3>Typische Werte:</h3>
            50-75% des Limits
        </div>
        <em>Request wird für die Platzierung auf Hosts verwendet</em>
    </div>

    <div data-tooltip-id="memory-request">
        <h2>Memory-Request</h2>
        <p>Garantierter RAM, der dem Container mindestens zur Verfügung steht.</p>
        <div>
            <h3>Best Practice:</h3>
            Request = Limit bei Memory (keine Überbuchung)
        </div>
        <div>
            <h3>Warum?</h3>
            RAM kann nicht wie CPU "geteilt" werden. Wenn Request < Limit, kann es zu OOM-Kills kommen.
        </div>
        <div>
            <h3>Empfehlung:</h3>
            Setzen Sie Request und Limit auf denselben Wert!
        </div>
    </div>

    <div data-tooltip-id="exposed-ports">
        <h2>Exposed Ports</h2>
        <p>Netzwerk-Ports, über die der Container erreichbar ist.</p>
        <div>
            <h3>Format:</h3>
            <ul>
                <li><strong>80</strong> - Container-Port 80 wird exponiert</li>
                <li><strong>8080:80</strong> - Host-Port 8080 → Container-Port 80</li>
                <li><strong>443, 8443</strong> - Mehrere Ports (Komma-getrennt)</li>
            </ul>
        </div>
        <div>
            <h3>Häufige Ports:</h3>
            <ul>
                <li>80 - HTTP</li>
                <li>443 - HTTPS</li>
                <li>3000 - Node.js Apps</li>
                <li>8080 - Alternative HTTP</li>
                <li>5432 - PostgreSQL</li>
                <li>3306 - MySQL</li>
                <li>6379 - Redis</li>
                <li>27017 - MongoDB</li>
            </ul>
        </div>
        <em>Nur Ports exponieren, die wirklich von außen erreichbar sein müssen!</em>
    </div>

    <div data-tooltip-id="network-mode">
        <h2>Netzwerk-Modus</h2>
        <p>Wie der Container mit dem Netzwerk verbunden ist.</p>
        <div>
            <h3>Modi erklärt:</h3>
            <ul>
                <li><strong>Bridge (Standard):</strong> Container haben eigenes internes Netzwerk. Müssen Ports freigeben. <em>Standard für die meisten Fälle.</em></li>
                <li><strong>Host:</strong> Container nutzt Netzwerk des Hosts direkt. Keine Port-Isolation. <em>Bessere Performance, aber weniger Sicherheit.</em></li>
                <li><strong>Overlay:</strong> Für verteilte Container über mehrere Hosts (Swarm, Kubernetes)</li>
                <li><strong>Macvlan:</strong> Container bekommt eigene MAC-Adresse, erscheint wie physisches Gerät</li>
                <li><strong>None:</strong> Kein Netzwerk (für isolierte Container)</li>
            </ul>
        </div>
        <div>
            <h3>Wann was?</h3>
            <ul>
                <li>Standard-Fall → Bridge</li>
                <li>Performance kritisch → Host</li>
                <li>Multi-Host → Overlay</li>
            </ul>
        </div>
    </div>

    <div data-tooltip-id="volumes-check">
        <h2>Persistent Volumes</h2>
        <p>Speicher, der auch nach Container-Neustart erhalten bleibt.</p>
        <div>
            <h3>Warum wichtig?</h3>
            Container sind "flüchtig" - wenn sie neu starten, gehen alle Daten verloren. Volumes lösen das!
        </div>
        <div>
            <h3>Was sollte in Volumes?</h3>
            <ul>
                <li>Datenbank-Dateien</li>
                <li>Hochgeladene Dateien</li>
                <li>Log-Dateien (die dauerhaft gespeichert werden sollen)</li>
                <li>Konfigurationsdateien</li>
            </ul>
        </div>
        <div>
            <h3>Was NICHT in Volumes?</h3>
            <ul>
                <li>Programm-Code (gehört ins Image)</li>
                <li>Temporäre Daten</li>
            </ul>
        </div>
        <em>Für Datenbanken und wichtige Daten IMMER Volumes verwenden!</em>
    </div>

    <div data-tooltip-id="volume-mounts">
        <h2>Volume-Mounts</h2>
        <p>Verbindung zwischen Host-Speicher und Container-Pfad.</p>
        <div>
            <h3>Format:</h3>
            Container-Pfad → Volume-Name
        </div>
        <div>
            <h3>Beispiele:</h3>
            <ul>
                <li>/var/lib/postgresql/data → postgres-data</li>
                <li>/app/uploads → app-uploads-volume</li>
                <li>/var/log/nginx → nginx-logs</li>
                <li>/etc/config → app-config</li>
            </ul>
        </div>
        <div>
            <h3>Typische Pfade:</h3>
            <ul>
                <li><strong>PostgreSQL:</strong> /var/lib/postgresql/data</li>
                <li><strong>MySQL:</strong> /var/lib/mysql</li>
                <li><strong>MongoDB:</strong> /data/db</li>
                <li><strong>Redis:</strong> /data</li>
            </ul>
        </div>
    </div>

    <div data-tooltip-id="volume-type">
        <h2>Volume-Typ</h2>
        <p>Die Art des verwendeten Speichers.</p>
        <div>
            <h3>Optionen:</h3>
            <ul>
                <li><strong>Local Volume:</strong> Auf dem Host gespeichert. Einfach, aber an Host gebunden.</li>
                <li><strong>NFS:</strong> Netzwerk-Speicher, von mehreren Hosts nutzbar. Standard für Shared Storage.</li>
                <li><strong>CephFS:</strong> Verteiltes Dateisystem, hochverfügbar</li>
                <li><strong>GlusterFS:</strong> Distributed File System</li>
                <li><strong>AWS EBS:</strong> Amazon Block Storage</li>
                <li><strong>Azure Disk:</strong> Microsoft Azure Disk</li>
                <li><strong>GCE Persistent Disk:</strong> Google Cloud Disk</li>
                <li><strong>Host Path:</strong> Direkter Pfad auf Host (nur für Entwicklung!)</li>
            </ul>
        </div>
        <div>
            <h3>Entscheidung:</h3>
            <ul>
                <li>Einzelner Host → Local Volume</li>
                <li>Mehrere Hosts → NFS, CephFS</li>
                <li>Cloud → Entsprechender Cloud-Storage</li>
            </ul>
        </div>
        <em>Für Produktion: Immer Netzwerk-Storage oder Cloud-Storage!</em>
    </div>

    <div data-tooltip-id="env-vars-check">
        <h2>Umgebungsvariablen</h2>
        <p>Konfigurationswerte, die an den Container übergeben werden.</p>
        <div>
            <h3>Wofür?</h3>
            Container-Konfiguration ohne Image neu zu bauen
        </div>
        <div>
            <h3>Typische Verwendung:</h3>
            <ul>
                <li>Datenbank-Verbindung (HOST, PORT, DATABASE)</li>
                <li>API-URLs</li>
                <li>Log-Level (DEBUG, INFO, ERROR)</li>
                <li>Feature-Flags</li>
                <li>Umgebungs-Unterscheidung (dev, test, prod)</li>
            </ul>
        </div>
        <div>
            <h3>Wichtig:</h3>
            KEINE Passwörter oder Secrets hier! Dafür gibt es extra "Secrets".
        </div>
    </div>

    <div data-tooltip-id="env-vars-list">
        <h2>Wichtige Umgebungsvariablen</h2>
        <p>Dokumentieren Sie die Namen der wichtigsten Konfigurations-Variablen.</p>
        <div>
            <h3>NUR NAMEN, KEINE WERTE!</h3>
            Werte enthalten oft Secrets.
        </div>
        <div>
            <h3>Beispiele:</h3>
            <ul>
                <li>DATABASE_URL</li>
                <li>API_KEY</li>
                <li>LOG_LEVEL</li>
                <li>REDIS_HOST</li>
                <li>SMTP_SERVER</li>
                <li>APP_ENV</li>
            </ul>
        </div>
        <em>Hilft zu verstehen, wie der Container konfiguriert wird</em>
    </div>

    <div data-tooltip-id="secrets-check">
        <h2>Secrets / Sensitive Daten</h2>
        <p>Werden sensible Daten wie Passwörter verwendet?</p>
        <div>
            <h3>Was sind Secrets?</h3>
            Verschlüsselt gespeicherte sensible Daten
        </div>
        <div>
            <h3>Typische Secrets:</h3>
            <ul>
                <li>Datenbank-Passwörter</li>
                <li>API-Keys</li>
                <li>SSL/TLS-Zertifikate</li>
                <li>OAuth-Tokens</li>
                <li>Verschlüsselungs-Schlüssel</li>
            </ul>
        </div>
        <div>
            <h3>Wichtig:</h3>
            Secrets NIEMALS in Umgebungsvariablen oder im Image speichern!
        </div>
        <em>Kubernetes/Docker haben spezielle Secret-Management-Systeme</em>
    </div>

    <div data-tooltip-id="health-check">
        <h2>Health Check</h2>
        <p>Automatische Prüfung, ob der Container noch funktioniert.</p>
        <div>
            <h3>Was wird geprüft?</h3>
            <ul>
                <li>Container-Prozess läuft noch</li>
                <li>Anwendung antwortet auf Anfragen</li>
                <li>Kritische Dienste sind verfügbar</li>
            </ul>
        </div>
        <div>
            <h3>Was passiert bei Fehler?</h3>
            Container wird automatisch neu gestartet
        </div>
        <div>
            <h3>Beispiele:</h3>
            <ul>
                <li>HTTP-Endpoint: GET /health → 200 OK</li>
                <li>Kommando: curl localhost/health</li>
                <li>TCP-Check: Port 80 erreichbar?</li>
            </ul>
        </div>
        <em>Für Produktion IMMER Health Checks konfigurieren!</em>
    </div>

    <div data-tooltip-id="readiness-probe">
        <h2>Readiness Probe</h2>
        <p>Prüft, ob Container bereit ist, Traffic zu empfangen.</p>
        <div>
            <h3>Unterschied zu Health Check:</h3>
            <ul>
                <li><strong>Health Check:</strong> "Läuft der Container?" → Neustart bei Fehler</li>
                <li><strong>Readiness:</strong> "Ist er bereit?" → Kein Traffic bei Fehler, aber kein Neustart</li>
            </ul>
        </div>
        <div>
            <h3>Wann "nicht bereit"?</h3>
            <ul>
                <li>Beim Starten (Initialisierung läuft noch)</li>
                <li>Datenbank-Verbindung fehlt</li>
                <li>Cache wird gefüllt</li>
                <li>Überlastet (temporär)</li>
            </ul>
        </div>
        <em>Verhindert, dass Nutzer auf nicht-bereite Container geleitet werden</em>
    </div>

    <div data-tooltip-id="restart-policy">
        <h2>Restart-Policy</h2>
        <p>Wann soll der Container automatisch neu gestartet werden?</p>
        <div>
            <h3>Optionen:</h3>
            <ul>
                <li><strong>Always:</strong> Immer neu starten, auch nach erfolgreichem Beenden. <em>Standard für Services.</em></li>
                <li><strong>On Failure:</strong> Nur bei Fehler neu starten (Exit-Code ≠ 0). Gut für Jobs.</li>
                <li><strong>Unless Stopped:</strong> Neu starten, außer manuell gestoppt</li>
                <li><strong>Never:</strong> Nie automatisch neu starten. Nur für One-Time-Tasks.</li>
            </ul>
        </div>
        <div>
            <h3>Empfehlung:</h3>
            "Always" für Dauer-Services, "On Failure" für Batch-Jobs
        </div>
    </div>

    <div data-tooltip-id="log-driver">
        <h2>Log-Driver</h2>
        <p>Wohin werden die Container-Logs geschrieben?</p>
        <div>
            <h3>Optionen:</h3>
            <ul>
                <li><strong>JSON File (Standard):</strong> Logs in JSON-Dateien auf Host. Einfach, aber Platz-begrenzt.</li>
                <li><strong>Syslog:</strong> An Syslog-Server senden. Standard in Linux.</li>
                <li><strong>Journald:</strong> Systemd Journal (moderne Linux-Systeme)</li>
                <li><strong>Fluentd:</strong> An Fluentd Log-Collector. Flexibel, für zentrale Log-Verwaltung.</li>
                <li><strong>Splunk:</strong> Direkt an Splunk (Enterprise Logging)</li>
                <li><strong>GELF:</strong> Graylog Extended Log Format</li>
            </ul>
        </div>
        <div>
            <h3>Entscheidung:</h3>
            <ul>
                <li>Entwicklung → JSON File</li>
                <li>Produktion, kleine Installation → Journald/Syslog</li>
                <li>Produktion, große Installation → Fluentd/Splunk</li>
            </ul>
        </div>
        <em>Zentrale Log-Verwaltung vereinfacht Fehlersuche!</em>
    </div>

    <div data-tooltip-id="container-host">
        <h2>Container-Host</h2>
        <p>Auf welchem physischen/virtuellen Server läuft dieser Container?</p>
        <div>
            <h3>Warum wichtig?</h3>
            <ul>
                <li>Nachvollziehen, wo Container läuft</li>
                <li>Ressourcen-Planung</li>
                <li>Fehlersuche und Monitoring</li>
            </ul>
        </div>
        <div>
            <h3>Bei Orchestrierung:</h3>
            Container können automatisch zwischen Hosts verschoben werden → "Keine spezifische Zuordnung" wählen
        </div>
        <div>
            <h3>Bei statischer Zuordnung:</h3>
            Wählen Sie den VM- oder Hardware-Server aus
        </div>
        <em>Ohne Orchestrierung sollte immer ein Host zugeordnet werden!</em>
    </div>

    <div data-tooltip-id="container-notes">
        <h2>Anmerkungen</h2>
        <p>Zusätzliche wichtige Informationen zu diesem Container.</p>
        <div>
            <h3>Was hier dokumentieren:</h3>
            <ul>
                <li>Abhängigkeiten zu anderen Containern</li>
                <li>Besondere Konfigurationen</li>
                <li>Bekannte Probleme oder Limitierungen</li>
                <li>Wichtige Befehle (z.B. für Backup)</li>
                <li>Wartungs-Hinweise</li>
            </ul>
        </div>
        <div>
            <h3>Beispiel:</h3>
            "Benötigt Redis-Container für Session-Storage. Bei Update: Erst Datenbank, dann diese App. Logs in Splunk unter index=medical-apps"
        </div>
        <em>Hilft dem nächsten Admin, der sich damit beschäftigt!</em>
    </div>
</div>
