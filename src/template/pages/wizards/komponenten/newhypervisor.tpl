<aside>
    <p>Assetmanagement</p>
    <i>›</i>
    <p>Komponenten</p>
    <i>›</i>
    <p>Neuer Hypervisor anlegen</p>
</aside>

<form id="newHypervisorForm">

    <!-- Basis-Informationen -->
    <div class="form-section">
        <div class="section-title">
            <span>Basis-Informationen</span>
            <span class="section-badge">Pflicht</span>
            <span class="section-counter">0/4</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="form-row">
                <div class="form-group">
                    <label>Hypervisor Name <span class="required">*</span></label>
                    <input type="text" id="hypervisorname" required placeholder="z.B. ESXi-Cluster-01, Hyper-V-Host-DC1">
                </div>
                <div class="form-group">
                    <label>Typ / Hersteller <span class="required">*</span></label>
                    <div class="custom-select" data-name="hypervisortype">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-group-header">VMware</div>
                                <div class="select-option" data-value="vmware-esxi">VMware ESXi</div>
                                <div class="select-option" data-value="vmware-vsphere">VMware vSphere</div>
                                <div class="select-group-header">Microsoft</div>
                                <div class="select-option" data-value="hyperv">Microsoft Hyper-V</div>
                                <div class="select-option" data-value="hyperv-failover">Hyper-V Failover Cluster</div>
                                <div class="select-group-header">Open Source</div>
                                <div class="select-option" data-value="kvm">KVM (Kernel-based Virtual Machine)</div>
                                <div class="select-option" data-value="proxmox">Proxmox VE</div>
                                <div class="select-option" data-value="xen">Citrix XenServer / XCP-ng</div>
                                <div class="select-option" data-value="openstack">OpenStack</div>
                                <div class="select-group-header">Cloud Hypervisors</div>
                                <div class="select-option" data-value="azure-hyperv">Azure (Hyper-V based)</div>
                                <div class="select-option" data-value="aws-nitro">AWS (Nitro Hypervisor)</div>
                                <div class="select-option" data-value="gcp-kvm">Google Cloud (KVM based)</div>
                                <div class="select-group-header">Andere</div>
                                <div class="select-option" data-value="oracle-vm">Oracle VM</div>
                                <div class="select-option" data-value="nutanix-ahv">Nutanix AHV</div>
                                <div class="select-option" data-value="other">Sonstige</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Version</label>
                    <input type="text" id="hypervisorversion" placeholder="z.B. ESXi 8.0 U2, Hyper-V 2022">
                </div>
                <div class="form-group">
                    <label>Management IP / URL</label>
                    <input type="text" id="mgmturl" placeholder="z.B. vcenter.example.com, 192.168.10.50">
                </div>
            </div>
        </div>
    </div>

    <!-- Cluster-Konfiguration -->
    <div class="form-section collapsed">
        <div class="section-title">
            <span>Cluster / Host-Konfiguration</span>
            <span class="section-counter">0/4</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="form-group">
                <label class="cluster-label">
                    <input type="checkbox" id="hypervisor-cluster-check">
                    <span>Cluster-Konfiguration (mehrere Hosts)</span>
                </label>
            </div>

            <div id="hypervisor-cluster-config" style="display:none;">
                <div class="form-row">
                    <div class="form-group">
                        <label>Cluster Name</label>
                        <input type="text" id="clustername" placeholder="z.B. Production-Cluster, HA-Cluster-01">
                    </div>
                    <div class="form-group">
                        <label>Anzahl Hosts im Cluster</label>
                        <input type="number" id="clusterhosts" placeholder="z.B. 3, 5, 8" min="2">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label>HA (High Availability)</label>
                        <div class="custom-select" data-name="ha">
                            <div class="select-trigger">
                                <span class="placeholder">Bitte wählen</span>
                                <span class="arrow">▼</span>
                            </div>
                            <div class="select-dropdown">
                                <div class="select-options">
                                    <div class="select-option" data-value="">Bitte wählen</div>
                                    <div class="select-option" data-value="enabled">Aktiviert</div>
                                    <div class="select-option" data-value="disabled">Nicht aktiviert</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>DRS / Load Balancing</label>
                        <div class="custom-select" data-name="drs">
                            <div class="select-trigger">
                                <span class="placeholder">Bitte wählen</span>
                                <span class="arrow">▼</span>
                            </div>
                            <div class="select-dropdown">
                                <div class="select-options">
                                    <div class="select-option" data-value="">Bitte wählen</div>
                                    <div class="select-option" data-value="fully-automated">Fully Automated</div>
                                    <div class="select-option" data-value="partially-automated">Partially Automated</div>
                                    <div class="select-option" data-value="manual">Manual</div>
                                    <div class="select-option" data-value="disabled">Nicht aktiviert</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="subsection-header">Host-Details</div>
            <div class="form-row">
                <div class="form-group">
                    <label>Host-Liste / Hostnames</label>
                    <textarea id="hostlist" rows="3" placeholder="Liste der physischen Hosts (einer pro Zeile)&#10;z.B.:&#10;esxi-host-01.example.com&#10;esxi-host-02.example.com&#10;esxi-host-03.example.com"></textarea>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Standort / Rechenzentrum</label>
                    <input type="text" id="location" placeholder="z.B. RZ1, Datacenter Berlin">
                </div>
                <div class="form-group">
                    <label>Rack-Informationen</label>
                    <input type="text" id="rackinfo" placeholder="z.B. Rack A12-A14">
                </div>
            </div>
        </div>
    </div>

    <!-- Ressourcen & Kapazität -->
    <div class="form-section collapsed">
        <div class="section-title">
            <span>Ressourcen & Kapazität</span>
            <span class="section-counter">0/5</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="form-row">
                <div class="form-group">
                    <label>Gesamt CPU Cores</label>
                    <input type="number" id="totalcpu" placeholder="z.B. 128, 256">
                    <div class="help-text">Gesamte physische CPU Cores (alle Hosts)</div>
                </div>
                <div class="form-group">
                    <label>Gesamt RAM (GB)</label>
                    <input type="number" id="totalram" placeholder="z.B. 1024, 2048">
                    <div class="help-text">Gesamter physischer RAM (alle Hosts)</div>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Gesamt Storage (TB)</label>
                    <input type="number" id="totalstorage" step="0.1" placeholder="z.B. 10.5, 50">
                    <div class="help-text">Gesamter zugewiesener Storage</div>
                </div>
                <div class="form-group">
                    <label>Storage-Typ</label>
                    <div class="custom-select" data-name="storagetype">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="local">Local Storage</div>
                                <div class="select-option" data-value="san">SAN (Fibre Channel)</div>
                                <div class="select-option" data-value="iscsi">iSCSI SAN</div>
                                <div class="select-option" data-value="nfs">NFS</div>
                                <div class="select-option" data-value="vsan">vSAN / Software Defined</div>
                                <div class="select-option" data-value="mixed">Gemischt</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Anzahl VMs (aktuell)</label>
                    <input type="number" id="vmcount" placeholder="z.B. 50, 200">
                </div>
                <div class="form-group">
                    <label>Overcommitment Ratio (CPU)</label>
                    <input type="text" id="cpuovercommit" placeholder="z.B. 4:1, 8:1">
                </div>
            </div>
        </div>
    </div>

    <!-- Netzwerk-Konfiguration -->
    <div class="form-section collapsed">
        <div class="section-title">
            <span>Netzwerk-Konfiguration</span>
            <span class="section-counter">0/3</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="form-row">
                <div class="form-group">
                    <label>Management Netzwerk</label>
                    <input type="text" id="mgmtnetwork" placeholder="z.B. 192.168.10.0/24, VLAN 10">
                </div>
                <div class="form-group">
                    <label>vMotion / Live Migration Netzwerk</label>
                    <input type="text" id="vmotionnetwork" placeholder="z.B. 192.168.20.0/24, VLAN 20">
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Storage Netzwerk</label>
                    <input type="text" id="storagenetwork" placeholder="z.B. 192.168.30.0/24, VLAN 30">
                </div>
                <div class="form-group">
                    <label>VM Netzwerke / Port Groups</label>
                    <input type="text" id="vmnetworks" placeholder="z.B. Prod-VLAN100, DMZ-VLAN200">
                </div>
            </div>

            <div class="form-group">
                <label>Distributed Switch / Virtual Switch</label>
                <input type="text" id="vswitch" placeholder="z.B. vDS-Production, vSwitch0">
            </div>
        </div>
    </div>

    <!-- Management & Monitoring -->
    <div class="form-section collapsed">
        <div class="section-title">
            <span>Management & Monitoring</span>
            <span class="section-counter">0/4</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="form-row">
                <div class="form-group">
                    <label>Management-Tool</label>
                    <div class="custom-select" data-name="mgmttool">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="vcenter">VMware vCenter</div>
                                <div class="select-option" data-value="scvmm">System Center VMM</div>
                                <div class="select-option" data-value="proxmox-web">Proxmox Web UI</div>
                                <div class="select-option" data-value="xen-orchestra">Xen Orchestra</div>
                                <div class="select-option" data-value="virsh">virsh / virt-manager</div>
                                <div class="select-option" data-value="other">Sonstige</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>Management Version</label>
                    <input type="text" id="mgmtversion" placeholder="z.B. vCenter 8.0, SCVMM 2022">
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Monitoring / Alerting</label>
                    <input type="text" id="monitoring" placeholder="z.B. vROps, PRTG, Zabbix">
                </div>
                <div class="form-group">
                    <label>Backup-Lösung</label>
                    <input type="text" id="backupsolution" placeholder="z.B. Veeam, Altaro, Commvault">
                </div>
            </div>
        </div>
    </div>

    <!-- Lizenzierung -->
    <div class="form-section collapsed">
        <div class="section-title">
            <span>Lizenzierung & Support</span>
            <span class="section-counter">0/3</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="form-row">
                <div class="form-group">
                    <label>Lizenzmodell</label>
                    <div class="custom-select" data-name="licensemodel">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="perpetual">Perpetual (einmalig)</div>
                                <div class="select-option" data-value="subscription">Subscription (jährlich)</div>
                                <div class="select-option" data-value="per-cpu">Per CPU / Socket</div>
                                <div class="select-option" data-value="per-core">Per Core</div>
                                <div class="select-option" data-value="per-vm">Per VM</div>
                                <div class="select-option" data-value="free">Kostenlos / Open Source</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>Support-Level</label>
                    <div class="custom-select" data-name="supportlevel">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="production">Production Support (24/7)</div>
                                <div class="select-option" data-value="business">Business Support (5x8)</div>
                                <div class="select-option" data-value="basic">Basic Support</div>
                                <div class="select-option" data-value="community">Community Support</div>
                                <div class="select-option" data-value="none">Kein Support</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label>Support-Vertragsende</label>
                <input type="text" id="supportend" placeholder="z.B. 31.12.2025, unbegrenzt">
            </div>
        </div>
    </div>

    <!-- Notizen -->
    <div class="form-section collapsed">
        <div class="section-title">
            <span>Zusätzliche Informationen</span>
            <span class="section-counter">0/1</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="form-group">
                <label>Notizen / Besonderheiten</label>
                <textarea id="hypervisornotes" rows="4" placeholder="Zusätzliche Informationen zum Hypervisor, spezielle Konfigurationen, geplante Updates..."></textarea>
            </div>
        </div>
    </div>

</form>
