<div class="tooltip-definitions" style="display: none;">
    <div data-tooltip-id="proxy-enabled">
        <strong>System verwendet Proxy-Server</strong>
        <p>Nutzt dieses System einen Proxy für den Internet-Zugriff?</p>
        <p><strong>Was ist ein Proxy-Server?</strong> Ein Vermittler zwischen Ihrem System und dem Internet. Wie ein "Türsteher", der alle Anfragen kontrolliert.</p>
        <p><strong>Warum Proxies verwenden?</strong></p>
        <ul>
            <li><strong>Sicherheit:</strong> Zentrale Kontrolle und Filterung von Internet-Traffic</li>
            <li><strong>Protokollierung:</strong> Alle Internet-Zugriffe werden geloggt (Compliance)</li>
            <li><strong>Schutz:</strong> Malware-Filter, URL-Blacklisting</li>
            <li><strong>Performance:</strong> Caching häufig genutzter Inhalte</li>
            <li><strong>Bandbreiten-Kontrolle:</strong> Traffic-Management</li>
        </ul>
        <p><strong>Typische Szenarien:</strong></p>
        <ul>
            <li>Server braucht Internet-Updates → Proxy</li>
            <li>Anwendung lädt Daten aus Internet → Proxy</li>
            <li>System rein intern, kein Internet → Kein Proxy</li>
        </ul>
        <em>In Krankenhäusern: Fast alle Systeme mit Internet-Zugriff nutzen Proxy (Sicherheit!)</em>
    </div>

    <div data-tooltip-id="proxy-component">
        <strong>Proxy-Server Komponente</strong>
        <p>Welcher Proxy-Server wird verwendet?</p>
        <p><strong>Was ist eine Proxy-Komponente?</strong> Der konkrete Proxy-Server (Software oder Appliance), über den der Traffic läuft.</p>
        <p><strong>Gängige Proxy-Lösungen:</strong></p>
        <ul>
            <li><strong>Squid Proxy:</strong> Open Source, sehr verbreitet, Linux-basiert</li>
            <li><strong>Microsoft Forefront TMG:</strong> Veraltet, wird durch andere ersetzt</li>
            <li><strong>Zscaler:</strong> Cloud-basierter Proxy</li>
            <li><strong>Blue Coat / Symantec ProxySG:</strong> Enterprise Proxy-Appliance</li>
            <li><strong>Cisco WSA:</strong> Web Security Appliance</li>
            <li><strong>Palo Alto Networks:</strong> Next-Gen Firewall mit Proxy</li>
        </ul>
        <p><strong>Typische Setup-Varianten:</strong></p>
        <ul>
            <li><strong>Corporate Proxy:</strong> Zentral für ganze Organisation</li>
            <li><strong>DMZ Proxy:</strong> Spezieller Proxy für DMZ-Systeme</li>
            <li><strong>Dedizierter Proxy:</strong> Nur für spezielle Systeme (z.B. medizinische Geräte)</li>
        </ul>
        <em>Der Proxy muss vorher als Komponente im System angelegt worden sein</em>
    </div>

    <div data-tooltip-id="proxy-exceptions">
        <strong>Zusätzliche Proxy-Ausnahmen</strong>
        <p>Hosts oder Netzwerke, die NICHT über den Proxy zugreifen (für dieses spezifische System).</p>
        <p><strong>Was sind Proxy-Ausnahmen?</strong> Ziele, die direkt erreichbar sind, ohne durch den Proxy zu gehen.</p>
        <p><strong>Warum Ausnahmen?</strong></p>
        <ul>
            <li>Interne Ressourcen (bereits im lokalen Netz)</li>
            <li>Performance (direkt ist schneller)</li>
            <li>Technische Notwendigkeit (manche Protokolle funktionieren nicht durch Proxy)</li>
        </ul>
        <p><strong>Format-Beispiele:</strong></p>
        <ul>
            <li><strong>Einzelner Host:</strong> internal-api.example.com</li>
            <li><strong>Wildcard-Domain:</strong> *.internal.local</li>
            <li><strong>IP-Adresse:</strong> 192.168.1.100</li>
            <li><strong>IP-Bereich (CIDR):</strong> 192.168.100.0/24</li>
            <li><strong>Mehrere Einträge:</strong> Durch Komma oder Zeilenumbruch trennen</li>
        </ul>
        <p><strong>Typische Ausnahmen:</strong></p>
        <ul>
            <li>localhost, 127.0.0.1 - Lokaler Rechner</li>
            <li>*.local, *.internal - Interne Domains</li>
            <li>10.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16 - Private Netzwerke</li>
            <li>kis-server.krankenhaus.local - Internes KIS</li>
        </ul>
        <p><strong>Hinweis:</strong> Diese Ausnahmen sind ZUSÄTZLICH zu den globalen Proxy-Ausnahmen, die auf dem Proxy-Server selbst konfiguriert sind.</p>
        <em>Weniger Ausnahmen = bessere Kontrolle und Sicherheit</em>
    </div>

    <div data-tooltip-id="proxy-protocols">
        <strong>Verwendete Protokolle</strong>
        <p>Welche Netzwerk-Protokolle nutzt dieses System über den Proxy?</p>
        <p><strong>Protokolle erklärt:</strong></p>
        <ul>
            <li><strong>HTTP:</strong>
                <ul>
                    <li>Hypertext Transfer Protocol (unverschlüsselt)</li>
                    <li>Standard-Web-Protokoll auf Port 80</li>
                    <li>Heute meist durch HTTPS ersetzt</li>
                    <li><em>Nicht für sensible Daten verwenden!</em></li>
                </ul>
            </li>
            <li><strong>HTTPS:</strong>
                <ul>
                    <li>HTTP über TLS/SSL (verschlüsselt)</li>
                    <li>Port 443</li>
                    <li>Standard für moderne Web-Anwendungen</li>
                    <li>Proxy kann Inhalt nicht sehen (SSL-Bump für Inspektion)</li>
                    <li><em>Standard für Internet-Zugriffe heute</em></li>
                </ul>
            </li>
            <li><strong>FTP:</strong>
                <ul>
                    <li>File Transfer Protocol</li>
                    <li>Für Datei-Downloads/-Uploads</li>
                    <li>Port 21</li>
                    <li>Veraltet, meist durch SFTP/HTTPS ersetzt</li>
                </ul>
            </li>
        </ul>
        <p><strong>Mehrfachauswahl möglich!</strong> Ein System kann mehrere Protokolle nutzen.</p>
        <p><strong>Typische Szenarien:</strong></p>
        <ul>
            <li>Web-Anwendung → HTTPS (und eventuell HTTP für Redirects)</li>
            <li>Update-Server → HTTPS</li>
            <li>Legacy-System → HTTP, FTP</li>
            <li>Moderne Systeme → Nur HTTPS</li>
        </ul>
        <em>Trend: Alles geht zu HTTPS, HTTP und FTP werden obsolet</em>
    </div>

    <div data-tooltip-id="proxy-auth">
        <strong>Proxy-Authentifizierung</strong>
        <p>Wie authentifiziert sich dieses System am Proxy?</p>
        <p><strong>Authentifizierungs-Modi erklärt:</strong></p>
        <ul>
            <li><strong>System-Standard (vom Proxy):</strong>
                <ul>
                    <li>System nutzt die Standard-Authentifizierung des Proxys</li>
                    <li>Meist: Transparent (Kerberos, NTLM) oder IP-basiert</li>
                    <li>Keine zusätzliche Konfiguration nötig</li>
                    <li><em>Einfachste Variante - empfohlen</em></li>
                </ul>
            </li>
            <li><strong>Benutzerdefiniert:</strong>
                <ul>
                    <li>Spezielles Dienstkonto für dieses System</li>
                    <li>Username und Passwort explizit konfiguriert</li>
                    <li>Für Systeme, die nicht am Active Directory teilnehmen</li>
                    <li>Für dedizierte Service-Accounts</li>
                </ul>
            </li>
            <li><strong>Keine:</strong>
                <ul>
                    <li>Proxy erlaubt Zugriff ohne Authentifizierung</li>
                    <li>Meist IP-basierte Freigabe</li>
                    <li>Für Systeme in speziellen Netzsegmenten</li>
                    <li>Weniger sicher - nur wenn nötig</li>
                </ul>
            </li>
        </ul>
        <p><strong>Gängige Proxy-Authentifizierungs-Methoden:</strong></p>
        <ul>
            <li><strong>Transparent (NTLM/Kerberos):</strong> Windows-integriert, SSO</li>
            <li><strong>Basic Auth:</strong> Username/Passwort (Base64, unsicher ohne HTTPS)</li>
            <li><strong>Digest Auth:</strong> Verbesserte Basic Auth</li>
            <li><strong>IP-basiert:</strong> Freigabe nach IP-Adresse</li>
        </ul>
        <p><strong>Entscheidungshilfe:</strong></p>
        <ul>
            <li>Windows-Server in Domäne → System-Standard (transparente Auth)</li>
            <li>Linux-Server, Appliance → Benutzerdefiniert (Service-Account)</li>
            <li>Isoliertes System, Gerät → Keine (IP-Freigabe)</li>
        </ul>
        <em>Service-Accounts sollten starke Passwörter haben und regelmäßig rotiert werden</em>
    </div>

    <div data-tooltip-id="proxy-user">
        <strong>Benutzer / Dienstkonto</strong>
        <p>Das Dienstkonto für die Proxy-Authentifizierung (nur bei "Benutzerdefiniert").</p>
        <p><strong>Was ist ein Dienstkonto?</strong> Ein spezieller Benutzer-Account nur für technische Zwecke, nicht für menschliche Anmeldungen.</p>
        <p><strong>Format-Beispiele:</strong></p>
        <ul>
            <li><strong>Active Directory:</strong> DOMAIN\service-account oder service-account@domain.local</li>
            <li><strong>Lokaler Account:</strong> proxy-user</li>
            <li><strong>Vollständiger UPN:</strong> kis-proxy-service@krankenhaus.de</li>
        </ul>
        <p><strong>Beispiele:</strong></p>
        <ul>
            <li>"HOSPITAL\kis-proxy-svc" - KIS Proxy Service Account</li>
            <li>"DOMAIN\pacs-internet-access" - PACS Internet-Zugriff</li>
            <li>"proxy-labor-updates" - Labor-System Updates</li>
        </ul>
        <p><strong>Best Practices für Service-Accounts:</strong></p>
        <ul>
            <li><strong>Namens-Schema:</strong> Präfix "svc-" oder Suffix "-svc"</li>
            <li><strong>Beschreibung:</strong> Klar dokumentieren, wofür der Account ist</li>
            <li><strong>Berechtigungen:</strong> Minimal - nur Proxy-Zugriff</li>
            <li><strong>Passwort:</strong> Stark, mindestens 20 Zeichen, zufällig</li>
            <li><strong>Passwort-Ablauf:</strong> "Nie ablaufen" oft sinnvoll (aber dokumentieren!)</li>
            <li><strong>Monitoring:</strong> Ungewöhnliche Nutzung überwachen</li>
        </ul>
        <p><strong>Passwort-Speicherung:</strong></p>
        <ul>
            <li>NICHT im Klartext in Konfigurationsdateien</li>
            <li>Verschlüsselt in System-Konfiguration</li>
            <li>Oder in zentralem Secret-Management (z.B. HashiCorp Vault)</li>
        </ul>
        <em>Wichtig: Dokumentieren Sie, wo das Passwort gespeichert ist (z.B. Passwort-Safe)</em>
    </div>

    <div data-tooltip-id="proxy-notes">
        <strong>Systemspezifische Proxy-Notizen</strong>
        <p>Zusätzliche Informationen zur Proxy-Nutzung dieses speziellen Systems.</p>
        <p><strong>Was hier dokumentieren:</strong></p>
        <ul>
            <li><strong>Besondere Konfigurationen:</strong>
                <ul>
                    <li>Spezielle Proxy-Einstellungen in der Anwendung</li>
                    <li>Umgebungsvariablen (HTTP_PROXY, HTTPS_PROXY)</li>
                    <li>Konfigurationsdateien und deren Pfade</li>
                </ul>
            </li>
            <li><strong>Einschränkungen:</strong>
                <ul>
                    <li>Funktionen, die nicht durch Proxy funktionieren</li>
                    <li>Bekannte Probleme oder Workarounds</li>
                    <li>Performance-Beobachtungen</li>
                </ul>
            </li>
            <li><strong>Spezielle Anforderungen:</strong>
                <ul>
                    <li>Benötigte Proxy-Regeln oder Freigaben</li>
                    <li>Whitelisting von URLs</li>
                    <li>SSL-Inspection-Ausnahmen</li>
                </ul>
            </li>
            <li><strong>Troubleshooting-Hinweise:</strong>
                <ul>
                    <li>Wie Proxy-Verbindung testen?</li>
                    <li>Log-Dateien für Proxy-Probleme</li>
                    <li>Kontakt bei Proxy-Problemen</li>
                </ul>
            </li>
        </ul>
        <p><strong>Beispiel-Notiz:</strong></p>
        <p>"Proxy konfiguriert über /etc/environment (HTTP_PROXY=http://proxy.local:3128). System benötigt Zugriff auf updates.vendor.com ohne SSL-Inspection (Zertifikatsprüfung schlägt sonst fehl). Bei Proxy-Problemen: curl -I -x proxy.local:3128 http://www.google.com testen. Ansprechpartner Netzwerk: IT-Team (Tel. 1234)"</p>
        <p><strong>Häufige Probleme dokumentieren:</strong></p>
        <ul>
            <li>"SSL Certificate Verification Failed" → SSL-Inspection deaktivieren</li>
            <li>"Proxy Authentication Required" → Service-Account prüfen</li>
            <li>"Connection Timeout" → Firewall-Regel zum Proxy prüfen</li>
            <li>"407 Proxy Authentication Required" → Credentials falsch</li>
        </ul>
        <p><strong>Konfigurationspfade dokumentieren:</strong></p>
        <ul>
            <li><strong>Windows:</strong> System-Einstellungen, Registry, oder Anwendungs-Config</li>
            <li><strong>Linux:</strong> /etc/environment, ~/.bashrc, oder systemd-Dateien</li>
            <li><strong>Java-Anwendungen:</strong> -Dhttp.proxyHost und -Dhttp.proxyPort</li>
            <li><strong>Docker:</strong> HTTP_PROXY in daemon.json oder systemd override</li>
        </ul>
        <em>Je detaillierter die Dokumentation, desto einfacher das Troubleshooting!</em>
    </div>
</div>
