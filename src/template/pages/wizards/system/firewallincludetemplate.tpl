<div class="entry-content">
    <!-- Firewall-Auswahl -->
    <div class="subsection-header">Firewall-Auswahl</div>
    <div class="form-group">
        <label>Zentrale Firewall <span class="required">*</span></label>
        <div class="custom-select" data-name="firewallid" data-index="0" data-category="firewall">
            <div class="select-trigger">
                <span class="placeholder">Bitte wählen</span>
                <span class="arrow">▼</span>
            </div>
            <div class="select-dropdown">
                <div class="select-options">
                    <div class="select-option" data-value="">Bitte wählen</div>
                    <div class="select-option" data-value="fw-dmz-01">FW-DMZ-01 (Perimeter)</div>
                    <div class="select-option" data-value="fw-internal-01">FW-Internal-01 (Segmentation)</div>
                    <div class="select-option" data-value="fw-datacenter-01">FW-Datacenter-01</div>
                </div>
            </div>
        </div>
        <div class="help-text">Wählen Sie die zentrale Firewall aus, über die dieses System geschützt wird</div>
    </div>

    <!-- Firewall-Regeln für dieses System -->
    <div class="subsection-header">Firewall-Regeln für dieses System</div>
    <div class="form-group">
        <label>Regelname / Policy</label>
        <input type="text" name="rulename" class="fw-field" placeholder="z.B. Allow-KIS-Access, Deny-External-RDP">
    </div>

    <div class="form-row">
        <div class="form-group">
            <label>Quell-Zone</label>
            <input type="text" name="sourcezone" class="fw-field" placeholder="z.B. Internal, DMZ">
        </div>
        <div class="form-group">
            <label>Ziel-Zone</label>
            <input type="text" name="destzone" class="fw-field" placeholder="z.B. DMZ, External">
        </div>
    </div>

    <div class="form-row">
        <div class="form-group">
            <label>Quell-Adresse(n)</label>
            <input type="text" name="sourceaddr" class="fw-field" placeholder="z.B. 10.0.1.0/24, any">
        </div>
        <div class="form-group">
            <label>Ziel-Adresse(n)</label>
            <input type="text" name="destaddr" class="fw-field" placeholder="z.B. 172.16.1.10, KIS-Server-Group">
        </div>
    </div>

    <div class="form-row">
        <div class="form-group">
            <label>Protokoll / Ports</label>
            <input type="text" name="protocol" class="fw-field" placeholder="z.B. TCP/443, UDP/53, HTTPS">
        </div>
        <div class="form-group">
            <label>Aktion</label>
            <div class="custom-select" data-name="ruleaction" data-index="0" data-category="firewall">
                <div class="select-trigger">
                    <span class="placeholder">Bitte wählen</span>
                    <span class="arrow">▼</span>
                </div>
                <div class="select-dropdown">
                    <div class="select-options">
                        <div class="select-option" data-value="">Bitte wählen</div>
                        <div class="select-option" data-value="allow">Allow / Permit</div>
                        <div class="select-option" data-value="deny">Deny / Block</div>
                        <div class="select-option" data-value="reject">Reject (with response)</div>
                        <div class="select-option" data-value="inspect">Inspect / Deep Packet</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- NAT-Konfiguration für dieses System -->
    <div class="subsection-header">NAT-Konfiguration</div>
    <div class="form-group">
        <label class="cluster-label">
            <input type="checkbox" class="fw-nat-check">
            <span>NAT-Regel für dieses System</span>
        </label>
    </div>

    <div class="fw-nat-config">
        <div class="form-row">
            <div class="form-group">
                <label>NAT-Typ</label>
                <div class="custom-select" data-name="nattype" data-index="0" data-category="firewall">
                    <div class="select-trigger">
                        <span class="placeholder">Bitte wählen</span>
                        <span class="arrow">▼</span>
                    </div>
                    <div class="select-dropdown">
                        <div class="select-options">
                            <div class="select-option" data-value="">Bitte wählen</div>
                            <div class="select-option" data-value="snat">Source NAT (SNAT)</div>
                            <div class="select-option" data-value="dnat">Destination NAT (DNAT)</div>
                            <div class="select-option" data-value="pat">Port Address Translation (PAT)</div>
                            <div class="select-option" data-value="static">Static NAT (1:1)</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label>NAT Pool / Adresse</label>
                <input type="text" name="natpool" class="fw-field" placeholder="z.B. 203.0.113.10">
            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <label>Interne IP (Original)</label>
                <input type="text" name="natinternalip" class="fw-field" placeholder="z.B. 10.0.1.100">
            </div>
            <div class="form-group">
                <label>Externe IP (Translated)</label>
                <input type="text" name="natexternalip" class="fw-field" placeholder="z.B. 203.0.113.10">
            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <label>Port Mapping</label>
                <input type="text" name="portmapping" class="fw-field" placeholder="z.B. 443:8443, 80:8080">
            </div>
        </div>
    </div>

    <!-- Geschützte Komponenten -->
    <div class="subsection-header">Geschützte Komponenten</div>
    <div class="form-group">
        <label>Zugeordnete VMs / Server</label>
        <div class="help-text">Wählen Sie die VMs oder Hardware-Server aus, die durch diese Firewall-Regel geschützt werden.</div>
        <div class="host-assignment-box">
            <div class="host-assignment" data-hostlist>
                <div class="help-text">Keine Hosts verfügbar. Fügen Sie zuerst VMs oder Hardware Server hinzu.</div>
            </div>
        </div>
    </div>

    <!-- Notizen -->
    <div class="subsection-header">Zusätzliche Informationen</div>
    <div class="form-group">
        <label>Notizen / Regeldetails</label>
        <textarea name="fwnotes" class="fw-field" rows="3" placeholder="Zusätzliche Informationen zu dieser Regel, Ausnahmen, Gültigkeitszeitraum..."></textarea>
    </div>
</div>
