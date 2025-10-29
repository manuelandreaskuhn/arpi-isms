<div class="entry-content">
    <!-- Grundlegende Informationen -->
    <div class="subsection-header">Grundlegende Informationen</div>
    <div class="form-row">
        <div class="form-group">
            <label>Container-Name <span class="required">*</span></label>
            <input type="text" name="containerName" required placeholder="z.B. kis-webapp, pacs-db, nginx-proxy">
            <div class="help-text">Eindeutiger Name des Containers</div>
        </div>
        <div class="form-group">
            <label>Container-Typ</label>
            <div class="custom-select" data-name="containerType" data-multiple="true">
                <div class="select-trigger">
                    <span class="placeholder">Bitte wählen</span>
                    <span class="arrow">▼</span>
                </div>
                <div class="select-dropdown">
                    <div class="select-options">
                        <div class="select-option" data-value="">Bitte wählen</div>
                        <div class="select-option" data-value="application">Applikation</div>
                        <div class="select-option" data-value="database">Datenbank</div>
                        <div class="select-option" data-value="webserver">Webserver</div>
                        <div class="select-option" data-value="api">API / Microservice</div>
                        <div class="select-option" data-value="cache">Cache (Redis, Memcached)</div>
                        <div class="select-option" data-value="queue">Message Queue</div>
                        <div class="select-option" data-value="logging">Logging / Monitoring</div>
                        <div class="select-option" data-value="proxy">Proxy / Load Balancer</div>
                        <div class="select-option" data-value="worker">Worker / Background Job</div>
                        <div class="select-option" data-value="storage">Storage / File Service</div>
                        <div class="select-option" data-value="other">Sonstiges</div>
                    </div>
                </div>
            </div>
            <div class="selected-badges" data-target="containerType"></div>
        </div>
    </div>

    <!-- Container-Plattform -->
    <div class="subsection-header">Container-Plattform & Runtime</div>
    <div class="form-row">
        <div class="form-group">
            <label>Container-Runtime</label>
            <div class="custom-select" data-name="containerRuntime">
                <div class="select-trigger">
                    <span class="placeholder">Bitte wählen</span>
                    <span class="arrow">▼</span>
                </div>
                <div class="select-dropdown">
                    <div class="select-options">
                        <div class="select-option" data-value="">Bitte wählen</div>
                        <div class="select-option" data-value="docker">Docker</div>
                        <div class="select-option" data-value="podman">Podman</div>
                        <div class="select-option" data-value="containerd">containerd</div>
                        <div class="select-option" data-value="crio">CRI-O</div>
                        <div class="select-option" data-value="lxc">LXC/LXD</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label>Orchestrierung</label>
            <div class="custom-select" data-name="containerOrchestration">
                <div class="select-trigger">
                    <span class="placeholder">Bitte wählen</span>
                    <span class="arrow">▼</span>
                </div>
                <div class="select-dropdown">
                    <div class="select-options">
                        <div class="select-option" data-value="">Keine / Standalone</div>
                        <div class="select-option" data-value="kubernetes">Kubernetes</div>
                        <div class="select-option" data-value="openshift">Red Hat OpenShift</div>
                        <div class="select-option" data-value="dockerswarm">Docker Swarm</div>
                        <div class="select-option" data-value="dockercompose">Docker Compose</div>
                        <div class="select-option" data-value="nomad">HashiCorp Nomad</div>
                        <div class="select-option" data-value="rancher">Rancher</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Kubernetes-spezifische Felder -->
    <div class="container-k8s-config" style="display: none;">
        <div class="form-row">
            <div class="form-group">
                <label>Namespace</label>
                <input type="text" name="containerK8sNamespace" placeholder="z.B. production, medical-apps">
            </div>
            <div class="form-group">
                <label>Deployment / Pod Name</label>
                <input type="text" name="containerK8sDeployment" placeholder="z.B. kis-deployment">
            </div>
        </div>
        <div class="form-row">
            <div class="form-group">
                <label>Replicas</label>
                <input type="number" name="containerK8sReplicas" placeholder="z.B. 3" min="1">
            </div>
            <div class="form-group">
                <label>Service Name</label>
                <input type="text" name="containerK8sService" placeholder="z.B. kis-service">
            </div>
        </div>
    </div>

    <!-- Image-Informationen -->
    <div class="subsection-header">Container-Image</div>
    <div class="form-row">
        <div class="form-group">
            <label>Image-Name</label>
            <input type="text" name="containerImage" placeholder="z.B. nginx:1.24, postgres:15-alpine">
            <div class="help-text">Registry/Image:Tag</div>
        </div>
        <div class="form-group">
            <label>Image-Registry</label>
            <div class="custom-select" data-name="containerRegistry">
                <div class="select-trigger">
                    <span class="placeholder">Bitte wählen</span>
                    <span class="arrow">▼</span>
                </div>
                <div class="select-dropdown">
                    <div class="select-options">
                        <div class="select-option" data-value="">Bitte wählen</div>
                        <div class="select-option" data-value="dockerhub">Docker Hub</div>
                        <div class="select-option" data-value="gcr">Google Container Registry</div>
                        <div class="select-option" data-value="ecr">AWS ECR</div>
                        <div class="select-option" data-value="acr">Azure Container Registry</div>
                        <div class="select-option" data-value="ghcr">GitHub Container Registry</div>
                        <div class="select-option" data-value="quay">Quay.io</div>
                        <div class="select-option" data-value="harbor">Harbor (Self-hosted)</div>
                        <div class="select-option" data-value="private">Private Registry</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="form-group">
        <label class="cluster-label">
            <input type="checkbox" name="containerImageScan" class="container-scan-check">
            <span>Image Security Scanning aktiviert</span>
        </label>
        <div class="help-text">Wird das Container-Image auf Schwachstellen gescannt?</div>
    </div>

    <!-- Ressourcen -->
    <div class="subsection-header">Ressourcen & Limits</div>
    <div class="form-row">
        <div class="form-group">
            <label>CPU-Limit</label>
            <input type="text" name="containerCPULimit" placeholder="z.B. 2, 500m, 0.5">
            <div class="help-text">CPU Cores oder Millicores (m)</div>
        </div>
        <div class="form-group">
            <label>Memory-Limit</label>
            <input type="text" name="containerMemoryLimit" placeholder="z.B. 4Gi, 2048Mi, 2G">
            <div class="help-text">In Gi (Gibibytes) oder Mi (Mebibytes)</div>
        </div>
    </div>

    <div class="form-row">
        <div class="form-group">
            <label>CPU-Request</label>
            <input type="text" name="containerCPURequest" placeholder="z.B. 1, 250m, 0.25">
            <div class="help-text">Minimale garantierte CPU</div>
        </div>
        <div class="form-group">
            <label>Memory-Request</label>
            <input type="text" name="containerMemoryRequest" placeholder="z.B. 2Gi, 1024Mi, 1G">
            <div class="help-text">Minimaler garantierter Speicher</div>
        </div>
    </div>

    <!-- Netzwerk & Ports -->
    <div class="subsection-header">Netzwerk & Ports</div>
    <div class="form-row">
        <div class="form-group">
            <label>Exposed Ports</label>
            <input type="text" name="containerPorts" placeholder="z.B. 80, 443, 8080:80">
            <div class="help-text">Kommagetrennte Liste: Port oder HostPort:ContainerPort</div>
        </div>
        <div class="form-group">
            <label>Netzwerk-Modus</label>
            <div class="custom-select" data-name="containerNetworkMode">
                <div class="select-trigger">
                    <span class="placeholder">Bitte wählen</span>
                    <span class="arrow">▼</span>
                </div>
                <div class="select-dropdown">
                    <div class="select-options">
                        <div class="select-option" data-value="">Standard</div>
                        <div class="select-option" data-value="bridge">Bridge</div>
                        <div class="select-option" data-value="host">Host</div>
                        <div class="select-option" data-value="overlay">Overlay</div>
                        <div class="select-option" data-value="macvlan">Macvlan</div>
                        <div class="select-option" data-value="none">None</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Storage & Volumes -->
    <div class="subsection-header">Storage & Volumes</div>
    <div class="form-group">
        <label class="cluster-label">
            <input type="checkbox" name="containerHasVolumes" class="container-volumes-check">
            <span>Persistent Volumes verwendet</span>
        </label>
    </div>

    <div class="container-volumes-config" style="display: none;">
        <div class="form-group">
            <label>Volume-Mounts</label>
            <textarea name="containerVolumes" rows="3" placeholder="Liste der Volumes, z.B.:&#10;/var/lib/app/data → app-data-volume&#10;/var/log → logs-volume&#10;/etc/config → config-map"></textarea>
            <div class="help-text">Container-Pfad → Volume/Mount-Name (eine pro Zeile)</div>
        </div>
        <div class="form-group">
            <label>Volume-Typ</label>
            <div class="custom-select" data-name="containerVolumeType">
                <div class="select-trigger">
                    <span class="placeholder">Bitte wählen</span>
                    <span class="arrow">▼</span>
                </div>
                <div class="select-dropdown">
                    <div class="select-options">
                        <div class="select-option" data-value="">Bitte wählen</div>
                        <div class="select-option" data-value="local">Local Volume</div>
                        <div class="select-option" data-value="nfs">NFS</div>
                        <div class="select-option" data-value="cephfs">CephFS</div>
                        <div class="select-option" data-value="glusterfs">GlusterFS</div>
                        <div class="select-option" data-value="awsebs">AWS EBS</div>
                        <div class="select-option" data-value="azuredisk">Azure Disk</div>
                        <div class="select-option" data-value="gcepd">GCE Persistent Disk</div>
                        <div class="select-option" data-value="hostpath">Host Path</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Umgebungsvariablen & Secrets -->
    <div class="subsection-header">Konfiguration & Secrets</div>
    <div class="form-group">
        <label class="cluster-label">
            <input type="checkbox" name="containerHasEnv" class="container-env-check">
            <span>Umgebungsvariablen / ConfigMaps verwendet</span>
        </label>
    </div>

    <div class="container-env-config" style="display: none;">
        <div class="form-group">
            <label>Wichtige Umgebungsvariablen</label>
            <textarea name="containerEnvVars" rows="3" placeholder="z.B.:&#10;DATABASE_URL&#10;API_KEY&#10;LOG_LEVEL"></textarea>
            <div class="help-text">Namen der wichtigsten Konfigurationsvariablen (ohne Werte!)</div>
        </div>
    </div>

    <div class="form-group">
        <label class="cluster-label">
            <input type="checkbox" name="containerHasSecrets">
            <span>Secrets / Sensitive Daten verwendet</span>
        </label>
        <div class="help-text">Z.B. Passwörter, API-Keys, Zertifikate</div>
    </div>

    <!-- Health Checks -->
    <div class="subsection-header">Health Checks & Monitoring</div>
    <div class="form-row">
        <div class="form-group">
            <label class="cluster-label">
                <input type="checkbox" name="containerHealthCheck">
                <span>Health Check konfiguriert</span>
            </label>
        </div>
        <div class="form-group">
            <label class="cluster-label">
                <input type="checkbox" name="containerReadinessProbe">
                <span>Readiness Probe konfiguriert</span>
            </label>
        </div>
    </div>

    <div class="form-row">
        <div class="form-group">
            <label>Restart-Policy</label>
            <div class="custom-select" data-name="containerRestartPolicy">
                <div class="select-trigger">
                    <span class="placeholder">Bitte wählen</span>
                    <span class="arrow">▼</span>
                </div>
                <div class="select-dropdown">
                    <div class="select-options">
                        <div class="select-option" data-value="">Standard</div>
                        <div class="select-option" data-value="always">Always</div>
                        <div class="select-option" data-value="onfailure">On Failure</div>
                        <div class="select-option" data-value="unlessstopped">Unless Stopped</div>
                        <div class="select-option" data-value="never">Never</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label>Log-Driver</label>
            <div class="custom-select" data-name="containerLogDriver">
                <div class="select-trigger">
                    <span class="placeholder">Bitte wählen</span>
                    <span class="arrow">▼</span>
                </div>
                <div class="select-dropdown">
                    <div class="select-options">
                        <div class="select-option" data-value="">Standard (json-file)</div>
                        <div class="select-option" data-value="jsonfile">JSON File</div>
                        <div class="select-option" data-value="syslog">Syslog</div>
                        <div class="select-option" data-value="journald">Journald</div>
                        <div class="select-option" data-value="fluentd">Fluentd</div>
                        <div class="select-option" data-value="splunk">Splunk</div>
                        <div class="select-option" data-value="gelf">GELF (Graylog)</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Host-Zuordnung -->
    <div class="subsection-header">Host-Zuordnung</div>
    <div class="form-group">
        <label>Läuft auf Host (optional)</label>
        <div class="custom-select" data-name="containerHost">
            <div class="select-trigger">
                <span class="placeholder">Keine spezifische Zuordnung</span>
                <span class="arrow">▼</span>
            </div>
            <div class="select-dropdown">
                <div class="select-options container-host-options">
                    <div class="select-option" data-value="">Keine spezifische Zuordnung</div>
                    <!-- Will be populated dynamically -->
                </div>
            </div>
        </div>
        <div class="help-text">Ordnen Sie den Container einer VM oder Hardware-Server-Instanz zu</div>
    </div>

    <!-- Zusätzliche Informationen -->
    <div class="form-group">
        <label>Anmerkungen</label>
        <textarea name="containerNotes" rows="3" placeholder="z.B. Besonderheiten, Dependencies, bekannte Probleme..."></textarea>
    </div>
</div>
