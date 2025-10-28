<div class="entry-content">
    <!-- Proxy-Konfiguration -->
    <div class="subsection-header">Proxy-Konfiguration</div>
    <div class="form-group">
        <label class="cluster-label">
            <input type="checkbox" class="proxy-enabled-check">
            <span>System verwendet Proxy-Server</span>
        </label>
    </div>

    <div class="proxy-config" style="display:none;">
        <div class="form-group">
            <label>Proxy-Server Komponente <span class="required">*</span></label>
            <div class="custom-select" data-name="proxyid" data-index="0" data-category="proxy">
                <div class="select-trigger">
                    <span class="placeholder">Bitte wählen</span>
                    <span class="arrow">▼</span>
                </div>
                <div class="select-dropdown">
                    <div class="select-options">
                        <div class="select-option" data-value="">Bitte wählen</div>
                        <div class="select-option" data-value="proxy-1">Proxy-01 (Corporate-Proxy)</div>
                        <div class="select-option" data-value="proxy-2">Proxy-DMZ (Squid Proxy)</div>
                    </div>
                </div>
            </div>
            <div class="help-text">Wird aus angelegten Proxy-Komponenten befüllt</div>
        </div>

        <div class="subsection-header">Systemspezifische Proxy-Ausnahmen</div>
        <div class="form-group">
            <label>Zusätzliche Ausnahmen für dieses System</label>
            <textarea name="proxyexceptions" class="proxy-field" rows="3" placeholder="z.B. internal-api.example.com, 192.168.100.0/24"></textarea>
            <div class="help-text">Zusätzliche Hosts oder Netzwerke, die für dieses System den Proxy umgehen sollen</div>
        </div>

        <div class="subsection-header">Proxy-Nutzung</div>
        <div class="form-row">
            <div class="form-group">
                <label>Verwendete Protokolle</label>
                <div class="checkbox-group">
                    <div class="checkbox-item">
                        <input type="checkbox" name="proxyprotocols" value="http">
                        <label>HTTP</label>
                    </div>
                    <div class="checkbox-item">
                        <input type="checkbox" name="proxyprotocols" value="https">
                        <label>HTTPS</label>
                    </div>
                    <div class="checkbox-item">
                        <input type="checkbox" name="proxyprotocols" value="ftp">
                        <label>FTP</label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label>Proxy-Authentifizierung</label>
                <div class="custom-select" data-name="proxyauth" data-index="0" data-category="proxy">
                    <div class="select-trigger">
                        <span class="placeholder">Bitte wählen</span>
                        <span class="arrow">▼</span>
                    </div>
                    <div class="select-dropdown">
                        <div class="select-options">
                            <div class="select-option" data-value="">Bitte wählen</div>
                            <div class="select-option" data-value="system-default">System-Standard (vom Proxy)</div>
                            <div class="select-option" data-value="custom">Benutzerdefiniert</div>
                            <div class="select-option" data-value="none">Keine</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="form-group">
            <label>Benutzer / Dienstkonto (falls benutzerdefiniert)</label>
            <input type="text" name="proxyuser" class="proxy-field" placeholder="z.B. DOMAIN\system-service-account">
        </div>

        <div class="subsection-header">Zusätzliche Informationen</div>
        <div class="form-group">
            <label>Systemspezifische Proxy-Notizen</label>
            <textarea name="proxynotes" class="proxy-field" rows="3" placeholder="Besonderheiten der Proxy-Nutzung für dieses System, spezielle Konfigurationen..."></textarea>
        </div>
    </div>
</div>
