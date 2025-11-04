<div class="entry-content">
    <!-- VPN-Zugang -->
    <div class="subsection-header">VPN-Zugang</div>
    <div class="form-group">
        <label class="cluster-label">
            <input type="checkbox" class="vpn-enabled-check">
            <span>System ist über VPN erreichbar</span>
            <span class="help-icon" data-tooltip="vpn-enabled">?</span>
        </label>
    </div>

    <div class="vpn-config" style="display:none;">
        <div class="form-group">
            <label>
                VPN-Komponente <span class="required">*</span>
                <span class="help-icon" data-tooltip="vpn-component">?</span>
            </label>
            <div class="custom-select" data-name="vpnid" data-index="0" data-category="vpn">
                <div class="select-trigger">
                    <span class="placeholder">Bitte wählen</span>
                    <span class="arrow">▼</span>
                </div>
                <div class="select-dropdown">
                    <div class="select-options">
                        <div class="select-option" data-value="">Bitte wählen</div>
                        <div class="select-option" data-value="vpn-1">Corporate-VPN (Cisco AnyConnect)</div>
                        <div class="select-option" data-value="vpn-2">Admin-VPN (OpenVPN)</div>
                        <div class="select-option" data-value="vpn-3">Site-to-Site-Berlin (IPsec)</div>
                    </div>
                </div>
            </div>
            <div class="help-text">Wird aus angelegten VPN-Komponenten befüllt</div>
        </div>

        <div class="subsection-header">Berechtigte Benutzergruppen</div>
        <div class="form-group">
            <label>
                Welche VPN-Benutzergruppen haben Zugriff auf dieses System?
                <span class="help-icon" data-tooltip="vpn-usergroups">?</span>
            </label>
            <textarea name="vpnusergroups" class="vpn-field" rows="3" placeholder="z.B. VPN-Admins, VPN-IT-Team, VPN-Developers, VPN-External-Partners"></textarea>
            <div class="help-text">Listen Sie die berechtigten Gruppen auf (eine pro Zeile oder kommagetrennt)</div>
        </div>

        <div class="subsection-header">Zugriffskonfiguration</div>
        <div class="form-row">
            <div class="form-group">
                <label>
                    Zugriffs-Typ
                    <span class="help-icon" data-tooltip="vpn-access-type">?</span>
                </label>
                <div class="custom-select" data-name="vpnaccesstype" data-index="0" data-category="vpn">
                    <div class="select-trigger">
                        <span class="placeholder">Bitte wählen</span>
                        <span class="arrow">▼</span>
                    </div>
                    <div class="select-dropdown">
                        <div class="select-options">
                            <div class="select-option" data-value="">Bitte wählen</div>
                            <div class="select-option" data-value="full">Voller Zugriff</div>
                            <div class="select-option" data-value="restricted">Eingeschränkter Zugriff</div>
                            <div class="select-option" data-value="port-specific">Nur bestimmte Ports</div>
                            <div class="select-option" data-value="read-only">Nur Lesezugriff</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label>
                    Erlaubte Dienste / Ports
                    <span class="help-icon" data-tooltip="vpn-allowed-services">?</span>
                </label>
                <input type="text" name="vpnallowedservices" class="vpn-field" placeholder="z.B. HTTPS/443, RDP/3389, SSH/22">
            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <label>
                    Zugriffs-Zeitfenster
                    <span class="help-icon" data-tooltip="vpn-access-hours">?</span>
                </label>
                <input type="text" name="vpnaccesshours" class="vpn-field" placeholder="z.B. 24/7, Mo-Fr 08:00-18:00">
            </div>
            <div class="form-group">
                <label>
                    Zusätzliche Authentifizierung
                    <span class="help-icon" data-tooltip="vpn-additional-auth">?</span>
                </label>
                <div class="custom-select" data-name="vpnaddauth" data-index="0" data-category="vpn">
                    <div class="select-trigger">
                        <span class="placeholder">Bitte wählen</span>
                        <span class="arrow">▼</span>
                    </div>
                    <div class="select-dropdown">
                        <div class="select-options">
                            <div class="select-option" data-value="">Bitte wählen</div>
                            <div class="select-option" data-value="none">Keine (nur VPN-Auth)</div>
                            <div class="select-option" data-value="system-auth">System-Authentifizierung</div>
                            <div class="select-option" data-value="mfa">MFA erforderlich</div>
                            <div class="select-option" data-value="jumphost">Über Jumphost</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="subsection-header">IP-Whitelist / Beschränkungen</div>
        <div class="form-group">
            <label>
                Erlaubte Quell-IP-Bereiche (VPN-Pool)
                <span class="help-icon" data-tooltip="vpn-allowed-ips">?</span>
            </label>
            <input type="text" name="vpnallowedips" class="vpn-field" placeholder="z.B. 10.8.0.0/24, 172.20.0.0/16">
            <div class="help-text">Aus welchen VPN-IP-Bereichen ist der Zugriff erlaubt?</div>
        </div>

        <div class="subsection-header">Zugeordnete VMs / Server</div>
        <div class="form-group">
            <label>
                Welche VMs / Server sind über VPN erreichbar?
                <span class="help-icon" data-tooltip="vpn-host-assignment">?</span>
            </label>
            <div class="help-text">Wählen Sie die Komponenten aus, die über VPN zugänglich sind</div>
            <div class="host-assignment-box">
                <div class="vpn-host-assignment" data-vpn-hostlist>
                    <div class="help-text">Keine Hosts verfügbar. Fügen Sie zuerst VMs oder Hardware Server hinzu.</div>
                </div>
            </div>
        </div>

        <div class="subsection-header">Sicherheits-Anforderungen</div>
        <div class="form-row">
            <div class="form-group">
                <label>
                    Endpoint Compliance erforderlich
                    <span class="help-icon" data-tooltip="vpn-endpoint-compliance">?</span>
                </label>
                <div class="custom-select" data-name="vpnendpointcompliance" data-index="0" data-category="vpn">
                    <div class="select-trigger">
                        <span class="placeholder">Bitte wählen</span>
                        <span class="arrow">▼</span>
                    </div>
                    <div class="select-dropdown">
                        <div class="select-options">
                            <div class="select-option" data-value="">Bitte wählen</div>
                            <div class="select-option" data-value="strict">Strikt (Compliance Check)</div>
                            <div class="select-option" data-value="moderate">Moderat</div>
                            <div class="select-option" data-value="none">Keine Prüfung</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label>
                    Logging für dieses System
                    <span class="help-icon" data-tooltip="vpn-logging">?</span>
                </label>
                <div class="custom-select" data-name="vpnlogging" data-index="0" data-category="vpn">
                    <div class="select-trigger">
                        <span class="placeholder">Bitte wählen</span>
                        <span class="arrow">▼</span>
                    </div>
                    <div class="select-dropdown">
                        <div class="select-options">
                            <div class="select-option" data-value="">Bitte wählen</div>
                            <div class="select-option" data-value="detailed">Detailliert (alle Zugriffe)</div>
                            <div class="select-option" data-value="normal">Normal (Connect/Disconnect)</div>
                            <div class="select-option" data-value="minimal">Minimal</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="subsection-header">Zusätzliche Informationen</div>
        <div class="form-group">
            <label>
                Systemspezifische VPN-Notizen
                <span class="help-icon" data-tooltip="vpn-notes">?</span>
            </label>
            <textarea name="vpnnotes" class="vpn-field" rows="3" placeholder="Besonderheiten des VPN-Zugriffs für dieses System, spezielle Regelungen, Ausnahmen..."></textarea>
        </div>
    </div>
</div>

<!-- Include help tooltips -->
{{include:pages/wizards/system/help/vpn-help.tpl}}
