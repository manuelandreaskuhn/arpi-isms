<div class="tooltip-definitions" style="display: none;">
    <div data-tooltip-id="container-name">
        <strong>Container-Name</strong>
        <p>Ein eindeutiger, beschreibender Name für diesen Container.</p>
        <p><strong>Best Practices:</strong></p>
        <ul>
            <li>Verwenden Sie Klein buchstaben und Bindestriche</li>
            <li>Beschreiben Sie die Funktion des Containers</li>
            <li>Vermeiden Sie Sonderzeichen außer Bindestrich (-)</li>
        </ul>
        <p><strong>Beispiele:</strong></p>
        <ul>
            <li>"kis-webapp" - Die Web-Anwendung des KIS</li>
            <li>"pacs-database" - Datenbank für PACS</li>
            <li>"nginx-proxy" - Nginx als Reverse Proxy</li>
            <li>"redis-cache-01" - Redis Cache, Instanz 1</li>
        </ul>
        <em>Der Name sollte ohne Erklärung verständlich sein!</em>
    </div>

    <div data-tooltip-id="container-type">
        <strong>Container-Typ</strong>
        <p>Was läuft in diesem Container? Sie können mehrere Typen auswählen.</p>
        <p><strong>Typ-Erklärungen:</strong></p>
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
        <p><strong>Mehrfachauswahl:</strong> Ein Container kann z.B. gleichzeitig "Webserver" und "Proxy" sein.</p>
        <em>Tipp: Wählen Sie alle zutreffenden Typen aus!</em>
    </div>

    <div data-tooltip-id="container-runtime">
        <strong>Container-Runtime</strong>
        <p>Die Software, die Container auf dem Host ausführt.</p>
        <p><strong>Optionen erklärt:</strong></p>
        <ul>
            <li><strong>Docker:</strong> Am weitesten verbreitet, einfach zu bedienen. Standard-Wahl für die meisten Projekte.</li>
            <li><strong>Podman:</strong> Alternative zu Docker, läuft ohne Root-Rechte (daemonless), kompatibel zu Docker</li>
            <li><strong>containerd:</strong> Low-Level Runtime, wird oft von Kubernetes verwendet</li>
            <li><strong>CRI-O:</strong> Leichtgewichtige Runtime speziell für Kubernetes</li>
            <li><strong>LXC/LXD:</strong> System-Container (wie leichte VMs), nicht für Anwendungs-Container</li>
        </ul>
        <p><strong>Entscheidungshilfe:</strong></p>
        <ul>
            <li>Standard-Fall → Docker</li>
            <li>Mehr Sicherheit → Podman</li>
            <li>Kubernetes → containerd oder CRI-O</li>
        </ul>
        <em>Docker ist die einfachste und häufigste Wahl!</em>
    </div>

    <div data-tooltip-id="container-orchestration">
        <strong>Orchestrierung</strong>
        <p>System zur automatischen Verwaltung vieler Container.</p>
        <p><strong>Was macht Orchestrierung?</strong></p>
        <ul>
            <li>Automatisches Starten/Stoppen von Containern</li>
            <li>Lastenverteilung (Load Balancing)</li>
            <li>Selbstheilung (automatischer Neustart bei Fehler)</li>
            <li>Skalierung (mehr Container bei hoher Last)</li>
            <li>Service Discovery (Container finden sich gegenseitig)</li>
        </ul>
        <p><strong>Optionen:</strong></p>
        <ul>
            <li><strong>Keine/Standalone:</strong> Container läuft einzeln, manuelle Verwaltung. Einfach, aber kein Failover.</li>
            <li><strong>Docker Compose:</strong> Mehrere Container zusammen definieren und starten. Gut für Entwicklung/Test.</li>
            <li><strong>Kubernetes (K8s):</strong> Industrie-Standard für Produktion. Komplex, aber sehr mächtig. <em>Für kritische Systeme!</em></li>
            <li><strong>OpenShift:</strong> Enterprise-Version von Kubernetes (Red Hat). Zusätzliche Management-Features.</li>
            <li><strong>Docker Swarm:</strong> Einfachere Alternative zu Kubernetes. Weniger Features, dafür einfacher.</li>
            <li><strong>Nomad:</strong> Von HashiCorp, einfacher als Kubernetes, flexibel</li>
            <li><strong>Rancher:</strong> Management-Plattform für Kubernetes-Cluster</li>
        </ul>
        <p><strong>Wann was verwenden:</strong></p>
        <ul>
            <li>1-5 Container → Keine oder Docker Compose</li>
            <li>5-20 Container → Docker Swarm</li>
            <li>20+ Container oder kritisch → Kubernetes</li>
        </ul>
    </div>

    <div data-tooltip-id="k8s-namespace">
        <strong>Kubernetes Namespace</strong>
        <p>Logische Trennung von Ressourcen in Kubernetes.</p>
        <p><strong>Was ist ein Namespace?</strong> Wie ein Ordner für Container - trennt verschiedene Projekte oder Umgebungen voneinander.</p>
        <p><strong>Typische Namespaces:</strong></p>
        <ul>
            <li>"production" - Produktiv-Umgebung</li>
            <li>"staging" / "test" - Test-Umgebung</li>
            <li>"development" - Entwicklung</li>
            <li>"medical-apps" - Alle medizinischen Anwendungen</li>
            <li>"kis-system" - KIS und zugehörige Services</li>
        </ul>
        <em>Namespaces helfen, Ordnung zu halten und Berechtigungen zu steuern!</em>
    </div>

    <div data-tooltip-id="k8s-deployment">
        <strong>Deployment / Pod Name</strong>
        <p>Der Name des Kubernetes Deployment oder Pod.</p>
        <p><strong>Was ist ein Deployment?</strong> Eine Vorlage, die beschreibt, wie Container gestartet werden sollen.</p>
        <p><strong>Was ist ein Pod?</strong> Eine Gruppe von einem oder mehreren Containern, die zusammen laufen.</p>
        <p><strong>Beispiele:</strong></p>
        <ul>
            <li>"kis-web-deployment" - Deployment für KIS Web-App</li>
            <li>"pacs-db-pod" - Pod für PACS Datenbank</li>
        </ul>
        <em>Ein Deployment verwaltet mehrere Pods (Replicas)</em>
    </div>

    <div data-tooltip-id="k8s-replicas">
        <strong>Replicas</strong>
        <p>Anzahl der identischen Container-Kopien, die parallel laufen.</p>
        <p><strong>Warum mehrere Replicas?</strong></p>
        <ul>
            <li><strong>Hochverfügbarkeit:</strong> Wenn ein Container abstürzt, laufen andere weiter</li>
            <li><strong>Lastverteilung:</strong> Anfragen werden auf alle Replicas verteilt</li>
            <li><strong>Performance:</strong> Mehr Container = mehr Kapazität</li>
        </ul>
        <p><strong>Typische Werte:</strong></p>
        <ul>
            <li><strong>1:</strong> Keine Hochverfügbarkeit (nur für Test/Entwicklung)</li>
            <li><strong>2:</strong> Minimum für HA (wenn einer ausfällt, läuft noch einer)</li>
            <li><strong>3+:</strong> Empfohlen für Produktion</li>
            <li><strong>5+:</strong> Bei hoher Last</li>
        </ul>
        <em>Mehr Replicas = mehr Ressourcen benötigt!</em>
    </div>

    <div data-tooltip-id="k8s-service">
        <strong>Kubernetes Service Name</strong>
        <p>Der interne DNS-Name, unter dem der Container erreichbar ist.</p>
        <p><strong>Was ist ein Service?</strong> Ein stabiler Netzwerk-Endpunkt für Container. Auch wenn Container neu starten (neue IP), bleibt der Service-Name gleich.</p>
        <p><strong>Beispiele:</strong></p>
        <ul>
            <li>"kis-web-service" → erreichbar unter http://kis-web-service</li>
            <li>"database-service" → andere Container verbinden sich damit</li>
        </ul>
        <em>Andere Container nutzen den Service-Namen zur Kommunikation!</em>
    </div>

    <div data-tooltip-id="container-image">
        <strong>Container-Image</strong>
        <p>Das "Installations-Paket" für den Container - enthält die komplette Software.</p>
        <p><strong>Format:</strong> [Registry/]Image-Name:Tag</p>
        <p><strong>Beispiele:</strong></p>
        <ul>
            <li><strong>nginx:1.24</strong> - Nginx Webserver Version 1.24</li>
            <li><strong>postgres:15-alpine</strong> - PostgreSQL 15 (Alpine Linux = klein)</li>
            <li><strong>redis:7.0</strong> - Redis Cache Version 7.0</li>
            <li><strong>mcr.microsoft.com/mssql/server:2022-latest</strong> - MS SQL Server</li>
        </ul>
        <p><strong>Tag-Bedeutung:</strong></p>
        <ul>
            <li><strong>:latest</strong> - Neueste Version (NICHT für Produktion!)</li>
            <li><strong>:1.24</strong> - Spezifische Version (empfohlen)</li>
            <li><strong>:alpine</strong> - Kleine Linux-Variante</li>
        </ul>
        <em>Wichtig: Immer spezifische Versionen verwenden, nicht "latest"!</em>
    </div>

    <div data-tooltip-id="container-registry">
        <strong>Image-Registry</strong>
        <p>Der "App-Store" für Container-Images - wo das Image gespeichert ist.</p>
        <p><strong>Öffentliche Registries:</strong></p>
        <ul>
            <li><strong>Docker Hub:</strong> Größte öffentliche Registry (docker.io). Standard für viele Images.</li>
            <li><strong>Quay.io:</strong> Alternative zu Docker Hub (Red Hat)</li>
            <li><strong>GitHub Container Registry:</strong> Gut für eigene Projekte auf GitHub</li>
        </ul>
        <p><strong>Cloud-Registries:</strong></p>
        <ul>
            <li><strong>GCR:</strong> Google Container Registry</li>
            <li><strong>ECR:</strong> Amazon Elastic Container Registry</li>
            <li><strong>ACR:</strong> Azure Container Registry</li>
        </ul>
        <p><strong>Private Registry:</strong></p>
        <ul>
            <li><strong>Harbor:</strong> Selbst gehostete Enterprise-Registry</li>
            <li><strong>Private Registry:</strong> Eigener Docker Registry Server</li>
        </ul>
        <p><strong>Entscheidung:</strong></p>
        <ul>
            <li>Öffentliche Standard-Software → Docker Hub</li>
            <li>Eigene Software → Private Registry/Harbor</li>
            <li>Cloud-Umgebung → Entsprechende Cloud-Registry</li>
        </ul>
        <em>Für Patientendaten: Nur private Registries verwenden!</em>
    </div>

    <div data-tooltip-id="image-scan">
        <strong>Image Security Scanning</strong>
        <p>Automatische Überprüfung des Container-Images auf Sicherheitslücken.</p>
        <p><strong>Was wird gescannt?</strong></p>
        <ul>
            <li>Bekannte Schwachstellen (CVEs) in Basis-Image</li>
            <li>Veraltete Software-Pakete</li>
            <li>Unsichere Konfigurationen</li>
            <li>Malware</li>
        </ul>
        <p><strong>Scan-Tools:</strong></p>
        <ul>
            <li>Trivy (Open Source)</li>
            <li>Clair</li>
            <li>Snyk</li>
            <li>Harbor (integriert)</li>
        </ul>
        <em>WICHTIG: Für Produktiv-Systeme IMMER aktivieren!</em>
    </div>

    <div data-tooltip-id="cpu-limit">
        <strong>CPU-Limit</strong>
        <p>Maximale CPU-Leistung, die der Container nutzen darf.</p>
        <p><strong>Einheiten:</strong></p>
        <ul>
            <li><strong>Ganze Zahl:</strong> 1 = 1 CPU-Core, 2 = 2 CPU-Cores</li>
            <li><strong>Dezimal:</strong> 0.5 = halber Core</li>
            <li><strong>Millicores (m):</strong> 1000m = 1 Core, 500m = 0.5 Core</li>
        </ul>
        <p><strong>Beispiele:</strong></p>
        <ul>
            <li><strong>250m</strong> - Viertel CPU (kleine Services)</li>
            <li><strong>1 oder 1000m</strong> - Ein voller Core (Standard)</li>
            <li><strong>2</strong> - Zwei Cores (rechenintensive Apps)</li>
            <li><strong>4</strong> - Vier Cores (Datenbanken)</li>
        </ul>
        <p><strong>Faustregel:</strong></p>
        <ul>
            <li>Webserver: 0.5 - 1 Core</li>
            <li>API: 1 - 2 Cores</li>
            <li>Datenbank: 2 - 4 Cores</li>
            <li>Worker: 0.5 - 2 Cores</li>
        </ul>
        <em>Limit = Container kann nicht mehr verbrauchen, auch wenn CPU frei ist</em>
    </div>

    <div data-tooltip-id="memory-limit">
        <strong>Memory-Limit</strong>
        <p>Maximaler RAM, den der Container nutzen darf.</p>
        <p><strong>Einheiten:</strong></p>
        <ul>
            <li><strong>Gi (Gibibyte):</strong> 1Gi = 1.024 GB, binäre Einheit</li>
            <li><strong>Mi (Mebibyte):</strong> 1Mi = 1.024 MB</li>
            <li><strong>G (Gigabyte):</strong> 1G = 1.000 MB, dezimal</li>
        </ul>
        <p><strong>Beispiele:</strong></p>
        <ul>
            <li><strong>512Mi</strong> - 512 MB (kleine Services)</li>
            <li><strong>1Gi</strong> - 1 GB (Standard Web-App)</li>
            <li><strong>2Gi</strong> - 2 GB (größere Anwendungen)</li>
            <li><strong>4Gi</strong> - 4 GB (Datenbanken)</li>
            <li><strong>8Gi+</strong> - 8+ GB (Cache, große DBs)</li>
        </ul>
        <p><strong>Was passiert bei Überschreitung?</strong> Container wird automatisch beendet (OOM Kill = Out Of Memory)</p>
        <em>Wichtig: Limit muss größer sein als tatsächlicher Bedarf!</em>
    </div>

    <div data-tooltip-id="cpu-request">
        <strong>CPU-Request</strong>
        <p>Garantierte CPU-Leistung, die dem Container mindestens zur Verfügung steht.</p>
        <p><strong>Unterschied zu Limit:</strong></p>
        <ul>
            <li><strong>Request:</strong> "Ich brauche mindestens..."</li>
            <li><strong>Limit:</strong> "Ich darf höchstens..."</li>
        </ul>
        <p><strong>Beispiel:</strong> Request 0.5, Limit 2 → Container bekommt garantiert 0.5 Cores, darf bis zu 2 nutzen wenn verfügbar</p>
        <p><strong>Typische Werte:</strong> 50-75% des Limits</p>
        <em>Request wird für die Platzierung auf Hosts verwendet</em>
    </div>

    <div data-tooltip-id="memory-request">
        <strong>Memory-Request</strong>
        <p>Garantierter RAM, der dem Container mindestens zur Verfügung steht.</p>
        <p><strong>Best Practice:</strong> Request = Limit bei Memory (keine Überbuchung)</p>
        <p><strong>Warum?</strong> RAM kann nicht wie CPU "geteilt" werden. Wenn Request < Limit, kann es zu OOM-Kills kommen.</p>
        <p><strong>Empfehlung:</strong> Setzen Sie Request und Limit auf denselben Wert!</p>
    </div>

    <div data-tooltip-id="exposed-ports">
        <strong>Exposed Ports</strong>
        <p>Netzwerk-Ports, über die der Container erreichbar ist.</p>
        <p><strong>Format:</strong></p>
        <ul>
            <li><strong>80</strong> - Container-Port 80 wird exponiert</li>
            <li><strong>8080:80</strong> - Host-Port 8080 → Container-Port 80</li>
            <li><strong>443, 8443</strong> - Mehrere Ports (Komma-getrennt)</li>
        </ul>
        <p><strong>Häufige Ports:</strong></p>
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
        <em>Nur Ports exponieren, die wirklich von außen erreichbar sein müssen!</em>
    </div>

    <div data-tooltip-id="network-mode">
        <strong>Netzwerk-Modus</strong>
        <p>Wie der Container mit dem Netzwerk verbunden ist.</p>
        <p><strong>Modi erklärt:</strong></p>
        <ul>
            <li><strong>Bridge (Standard):</strong> Container haben eigenes internes Netzwerk. Müssen Ports freigeben. <em>Standard für die meisten Fälle.</em></li>
            <li><strong>Host:</strong> Container nutzt Netzwerk des Hosts direkt. Keine Port-Isolation. <em>Bessere Performance, aber weniger Sicherheit.</em></li>
            <li><strong>Overlay:</strong> Für verteilte Container über mehrere Hosts (Swarm, Kubernetes)</li>
            <li><strong>Macvlan:</strong> Container bekommt eigene MAC-Adresse, erscheint wie physisches Gerät</li>
            <li><strong>None:</strong> Kein Netzwerk (für isolierte Container)</li>
        </ul>
        <p><strong>Wann was?</strong></p>
        <ul>
            <li>Standard-Fall → Bridge</li>
            <li>Performance kritisch → Host</li>
            <li>Multi-Host → Overlay</li>
        </ul>
    </div>

    <div data-tooltip-id="volumes-check">
        <strong>Persistent Volumes</strong>
        <p>Speicher, der auch nach Container-Neustart erhalten bleibt.</p>
        <p><strong>Warum wichtig?</strong> Container sind "flüchtig" - wenn sie neu starten, gehen alle Daten verloren. Volumes lösen das!</p>
        <p><strong>Was sollte in Volumes?</strong></p>
        <ul>
            <li>Datenbank-Dateien</li>
            <li>Hochgeladene Dateien</li>
            <li>Log-Dateien (die dauerhaft gespeichert werden sollen)</li>
            <li>Konfigurationsdateien</li>
        </ul>
        <p><strong>Was NICHT in Volumes?</strong></p>
        <ul>
            <li>Programm-Code (gehört ins Image)</li>
            <li>Temporäre Daten</li>
        </ul>
        <em>Für Datenbanken und wichtige Daten IMMER Volumes verwenden!</em>
    </div>

    <div data-tooltip-id="volume-mounts">
        <strong>Volume-Mounts</strong>
        <p>Verbindung zwischen Host-Speicher und Container-Pfad.</p>
        <p><strong>Format:</strong> Container-Pfad → Volume-Name</p>
        <p><strong>Beispiele:</strong></p>
        <ul>
            <li>/var/lib/postgresql/data → postgres-data</li>
            <li>/app/uploads → app-uploads-volume</li>
            <li>/var/log/nginx → nginx-logs</li>
            <li>/etc/config → app-config</li>
        </ul>
        <p><strong>Typische Pfade:</strong></p>
        <ul>
            <li><strong>PostgreSQL:</strong> /var/lib/postgresql/data</li>
            <li><strong>MySQL:</strong> /var/lib/mysql</li>
            <li><strong>MongoDB:</strong> /data/db</li>
            <li><strong>Redis:</strong> /data</li>
        </ul>
    </div>

    <div data-tooltip-id="volume-type">
        <strong>Volume-Typ</strong>
        <p>Die Art des verwendeten Speichers.</p>
        <p><strong>Optionen:</strong></p>
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
        <p><strong>Entscheidung:</strong></p>
        <ul>
            <li>Einzelner Host → Local Volume</li>
            <li>Mehrere Hosts → NFS, CephFS</li>
            <li>Cloud → Entsprechender Cloud-Storage</li>
        </ul>
        <em>Für Produktion: Immer Netzwerk-Storage oder Cloud-Storage!</em>
    </div>

    <div data-tooltip-id="env-vars-check">
        <strong>Umgebungsvariablen</strong>
        <p>Konfigurationswerte, die an den Container übergeben werden.</p>
        <p><strong>Wofür?</strong> Container-Konfiguration ohne Image neu zu bauen</p>
        <p><strong>Typische Verwendung:</strong></p>
        <ul>
            <li>Datenbank-Verbindung (HOST, PORT, DATABASE)</li>
            <li>API-URLs</li>
            <li>Log-Level (DEBUG, INFO, ERROR)</li>
            <li>Feature-Flags</li>
            <li>Umgebungs-Unterscheidung (dev, test, prod)</li>
        </ul>
        <p><strong>Wichtig:</strong> KEINE Passwörter oder Secrets hier! Dafür gibt es extra "Secrets".</p>
    </div>

    <div data-tooltip-id="env-vars-list">
        <strong>Wichtige Umgebungsvariablen</strong>
        <p>Dokumentieren Sie die Namen der wichtigsten Konfigurations-Variablen.</p>
        <p><strong>NUR NAMEN, KEINE WERTE!</strong> Werte enthalten oft Secrets.</p>
        <p><strong>Beispiele:</strong></p>
        <ul>
            <li>DATABASE_URL</li>
            <li>API_KEY</li>
            <li>LOG_LEVEL</li>
            <li>REDIS_HOST</li>
            <li>SMTP_SERVER</li>
            <li>APP_ENV</li>
        </ul>
        <em>Hilft zu verstehen, wie der Container konfiguriert wird</em>
    </div>

    <div data-tooltip-id="secrets-check">
        <strong>Secrets / Sensitive Daten</strong>
        <p>Werden sensible Daten wie Passwörter verwendet?</p>
        <p><strong>Was sind Secrets?</strong> Verschlüsselt gespeicherte sensible Daten</p>
        <p><strong>Typische Secrets:</strong></p>
        <ul>
            <li>Datenbank-Passwörter</li>
            <li>API-Keys</li>
            <li>SSL/TLS-Zertifikate</li>
            <li>OAuth-Tokens</li>
            <li>Verschlüsselungs-Schlüssel</li>
        </ul>
        <p><strong>Wichtig:</strong> Secrets NIEMALS in Umgebungsvariablen oder im Image speichern!</p>
        <em>Kubernetes/Docker haben spezielle Secret-Management-Systeme</em>
    </div>

    <div data-tooltip-id="health-check">
        <strong>Health Check</strong>
        <p>Automatische Prüfung, ob der Container noch funktioniert.</p>
        <p><strong>Was wird geprüft?</strong></p>
        <ul>
            <li>Container-Prozess läuft noch</li>
            <li>Anwendung antwortet auf Anfragen</li>
            <li>Kritische Dienste sind verfügbar</li>
        </ul>
        <p><strong>Was passiert bei Fehler?</strong> Container wird automatisch neu gestartet</p>
        <p><strong>Beispiele:</strong></p>
        <ul>
            <li>HTTP-Endpoint: GET /health → 200 OK</li>
            <li>Kommando: curl localhost/health</li>
            <li>TCP-Check: Port 80 erreichbar?</li>
        </ul>
        <em>Für Produktion IMMER Health Checks konfigurieren!</em>
    </div>

    <div data-tooltip-id="readiness-probe">
        <strong>Readiness Probe</strong>
        <p>Prüft, ob Container bereit ist, Traffic zu empfangen.</p>
        <p><strong>Unterschied zu Health Check:</strong></p>
        <ul>
            <li><strong>Health Check:</strong> "Läuft der Container?" → Neustart bei Fehler</li>
            <li><strong>Readiness:</strong> "Ist er bereit?" → Kein Traffic bei Fehler, aber kein Neustart</li>
        </ul>
        <p><strong>Wann "nicht bereit"?</strong></p>
        <ul>
            <li>Beim Starten (Initialisierung läuft noch)</li>
            <li>Datenbank-Verbindung fehlt</li>
            <li>Cache wird gefüllt</li>
            <li>Überlastet (temporär)</li>
        </ul>
        <em>Verhindert, dass Nutzer auf nicht-bereite Container geleitet werden</em>
    </div>

    <div data-tooltip-id="restart-policy">
        <strong>Restart-Policy</strong>
        <p>Wann soll der Container automatisch neu gestartet werden?</p>
        <p><strong>Optionen:</strong></p>
        <ul>
            <li><strong>Always:</strong> Immer neu starten, auch nach erfolgreichem Beenden. <em>Standard für Services.</em></li>
            <li><strong>On Failure:</strong> Nur bei Fehler neu starten (Exit-Code ≠ 0). Gut für Jobs.</li>
            <li><strong>Unless Stopped:</strong> Neu starten, außer manuell gestoppt</li>
            <li><strong>Never:</strong> Nie automatisch neu starten. Nur für One-Time-Tasks.</li>
        </ul>
        <p><strong>Empfehlung:</strong> "Always" für Dauer-Services, "On Failure" für Batch-Jobs</p>
    </div>

    <div data-tooltip-id="log-driver">
        <strong>Log-Driver</strong>
        <p>Wohin werden die Container-Logs geschrieben?</p>
        <p><strong>Optionen:</strong></p>
        <ul>
            <li><strong>JSON File (Standard):</strong> Logs in JSON-Dateien auf Host. Einfach, aber Platz-begrenzt.</li>
            <li><strong>Syslog:</strong> An Syslog-Server senden. Standard in Linux.</li>
            <li><strong>Journald:</strong> Systemd Journal (moderne Linux-Systeme)</li>
            <li><strong>Fluentd:</strong> An Fluentd Log-Collector. Flexibel, für zentrale Log-Verwaltung.</li>
            <li><strong>Splunk:</strong> Direkt an Splunk (Enterprise Logging)</li>
            <li><strong>GELF:</strong> Graylog Extended Log Format</li>
        </ul>
        <p><strong>Entscheidung:</strong></p>
        <ul>
            <li>Entwicklung → JSON File</li>
            <li>Produktion, kleine Installation → Journald/Syslog</li>
            <li>Produktion, große Installation → Fluentd/Splunk</li>
        </ul>
        <em>Zentrale Log-Verwaltung vereinfacht Fehlersuche!</em>
    </div>

    <div data-tooltip-id="container-host">
        <strong>Container-Host</strong>
        <p>Auf welchem physischen/virtuellen Server läuft dieser Container?</p>
        <p><strong>Warum wichtig?</strong></p>
        <ul>
            <li>Nachvollziehen, wo Container läuft</li>
            <li>Ressourcen-Planung</li>
            <li>Fehlersuche und Monitoring</li>
        </ul>
        <p><strong>Bei Orchestrierung:</strong> Container können automatisch zwischen Hosts verschoben werden → "Keine spezifische Zuordnung" wählen</p>
        <p><strong>Bei statischer Zuordnung:</strong> Wählen Sie den VM- oder Hardware-Server aus</p>
        <em>Ohne Orchestrierung sollte immer ein Host zugeordnet werden!</em>
    </div>

    <div data-tooltip-id="container-notes">
        <strong>Anmerkungen</strong>
        <p>Zusätzliche wichtige Informationen zu diesem Container.</p>
        <p><strong>Was hier dokumentieren:</strong></p>
        <ul>
            <li>Abhängigkeiten zu anderen Containern</li>
            <li>Besondere Konfigurationen</li>
            <li>Bekannte Probleme oder Limitierungen</li>
            <li>Wichtige Befehle (z.B. für Backup)</li>
            <li>Wartungs-Hinweise</li>
        </ul>
        <p><strong>Beispiel:</strong> "Benötigt Redis-Container für Session-Storage. Bei Update: Erst Datenbank, dann diese App. Logs in Splunk unter index=medical-apps"</p>
        <em>Hilft dem nächsten Admin, der sich damit beschäftigt!</em>
    </div>
</div>
