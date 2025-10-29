<div class="tooltip-definitions" style="display: none;">
    <div data-tooltip-id="vpn-enabled">
        <strong>System ist über VPN erreichbar</strong>
        <p>Kann auf dieses System über VPN (Virtual Private Network) zugegriffen werden?</p>
        <p><strong>Was ist VPN?</strong> Ein verschlüsselter "Tunnel" über das Internet, mit dem man sicher auf entfernte Systeme zugreifen kann - als wäre man vor Ort im Netzwerk.</p>
        <p><strong>Warum VPN wichtig ist:</strong></p>
        <ul>
            <li><strong>Remote-Zugriff:</strong> Mitarbeiter können von zu Hause arbeiten</li>
            <li><strong>Sicherheit:</strong> Verschlüsselte Verbindung über unsichere Netze</li>
            <li><strong>Flexibilität:</strong> Zugriff von überall auf der Welt</li>
            <li><strong>Standort-Verbindung:</strong> Verschiedene Standorte sicher verbinden</li>
        </ul>
        <p><strong>Typische VPN-Szenarien:</strong></p>
        <ul>
            <li><strong>Home Office:</strong> Mitarbeiter verbinden sich von zu Hause</li>
            <li><strong>Administratoren:</strong> IT-Admins greifen remote auf Server zu</li>
            <li><strong>Externe Dienstleister:</strong> Wartungsfirmen benötigen Zugang</li>
            <li><strong>Site-to-Site:</strong> Zweigstellen mit Hauptstandort verbinden</li>
        </ul>
        <em>VPN ist essentiell für modernes, flexibles Arbeiten!</em>
    </div>

    <div data-tooltip-id="vpn-component">
        <strong>VPN-Komponente</strong>
        <p>Welche VPN-Lösung wird für den Zugriff verwendet?</p>
        <p><strong>Was ist eine VPN-Komponente?</strong> Die Software oder Hardware, die VPN-Verbindungen ermöglicht und verwaltet.</p>
        <p><strong>VPN-Typen:</strong></p>
        <ul>
            <li><strong>Remote Access VPN:</strong>
                <ul>
                    <li>Einzelne Benutzer verbinden sich</li>
                    <li>Client-Software auf Laptop/PC</li>
                    <li>Beispiele: Cisco AnyConnect, OpenVPN, WireGuard</li>
                    <li><em>Für Home Office und Remote-Admins</em></li>
                </ul>
            </li>
            <li><strong>Site-to-Site VPN:</strong>
                <ul>
                    <li>Verbindet ganze Netzwerke</li>
                    <li>Meist IPsec-basiert</li>
                    <li>Transparent für Endbenutzer</li>
                    <li><em>Für Zweigstellen-Anbindung</em></li>
                </ul>
            </li>
        </ul>
        <p><strong>Gängige VPN-Lösungen:</strong></p>
        <ul>
            <li><strong>Cisco AnyConnect:</strong> Enterprise-Standard, sehr sicher</li>
            <li><strong>OpenVPN:</strong> Open Source, flexibel</li>
            <li><strong>WireGuard:</strong> Modern, sehr schnell</li>
            <li><strong>IPsec:</strong> Für Site-to-Site</li>
            <li><strong>Fortinet FortiClient:</strong> Integriert mit FortiGate</li>
            <li><strong>Palo Alto GlobalProtect:</strong> Enterprise-Lösung</li>
        </ul>
        <p><strong>Beispiele:</strong></p>
        <ul>
            <li>"Corporate-VPN (Cisco AnyConnect)" - Haupt-VPN für alle Mitarbeiter</li>
            <li>"Admin-VPN (OpenVPN)" - Spezielles VPN nur für IT-Admins</li>
            <li>"Site-to-Site-Berlin (IPsec)" - Verbindung zur Berliner Zweigstelle</li>
        </ul>
        <em>Die VPN-Komponente muss vorher im System angelegt sein</em>
    </div>

    <div data-tooltip-id="vpn-usergroups">
        <strong>Berechtigte Benutzergruppen</strong>
        <p>Welche Benutzergruppen dürfen über VPN auf dieses System zugreifen?</p>
        <p><strong>Warum Gruppen-basiert?</strong> Aus Sicherheitsgründen sollte nicht jeder VPN-Benutzer auf jedes System zugreifen können - Prinzip der minimalen Berechtigung!</p>
        <p><strong>Typische VPN-Benutzergruppen:</strong></p>
        <ul>
            <li><strong>VPN-Admins:</strong> IT-Administratoren, voller Zugriff auf alle Systeme</li>
            <li><strong>VPN-IT-Team:</strong> IT-Support-Mitarbeiter, eingeschränkter Zugriff</li>
            <li><strong>VPN-Developers:</strong> Entwickler, Zugriff auf Test-/Entwicklungssysteme</li>
            <li><strong>VPN-Management:</strong> Führungskräfte, Zugriff auf Reports/Dashboards</li>
            <li><strong>VPN-External-Partners:</strong> Externe Dienstleister, sehr eingeschränkt</li>
            <li><strong>VPN-Home-Office:</strong> Reguläre Mitarbeiter, Zugriff auf File-Server, E-Mail</li>
        </ul>
        <p><strong>Best Practices:</strong></p>
        <ul>
            <li>So wenige Gruppen wie nötig</li>
            <li>Klare Namenskonvention (z.B. "VPN-" Präfix)</li>
            <li>Regelmäßige Überprüfung der Mitgliedschaften</li>
            <li>Zeitlich begrenzte Zugriffe für Externe</li>
        </ul>
        <p><strong>Beispiel-Dokumentation:</strong></p>
        <ul>
            <li>"VPN-Admins (voller Zugriff für Wartung)"</li>
            <li>"VPN-DB-Team (nur Datenbank-Zugriff)"</li>
            <li>"VPN-Wartung-Vendor-XY (bis 31.12.2024)"</li>
        </ul>
        <em>Weniger Berechtigungen = höhere Sicherheit!</em>
    </div>

    <div data-tooltip-id="vpn-access-type">
        <strong>Zugriffs-Typ</strong>
        <p>Welche Art von Zugriff haben VPN-Benutzer auf dieses System?</p>
        <p><strong>Zugriffs-Level erklärt:</strong></p>
        <ul>
            <li><strong>Voller Zugriff:</strong>
                <ul>
                    <li>Alle Ports und Dienste erreichbar</li>
                    <li>Wie lokaler Zugriff im Netzwerk</li>
                    <li>Nur für vertrauenswürdige Admins</li>
                    <li><em>Höchstes Risiko!</em></li>
                </ul>
            </li>
            <li><strong>Eingeschränkter Zugriff:</strong>
                <ul>
                    <li>Nur bestimmte Funktionen/Dienste</li>
                    <li>Basiert auf Firewall-Regeln</li>
                    <li>Guter Kompromiss Sicherheit/Funktionalität</li>
                    <li><em>Empfohlen für reguläre Admins</em></li>
                </ul>
            </li>
            <li><strong>Nur bestimmte Ports:</strong>
                <ul>
                    <li>Explizite Port-Liste (z.B. nur HTTPS/443)</li>
                    <li>Sehr granular steuerbar</li>
                    <li>Gut für spezielle Aufgaben</li>
                    <li>Beispiel: Nur Web-Interface, kein SSH</li>
                </ul>
            </li>
            <li><strong>Nur Lesezugriff:</strong>
                <ul>
                    <li>Nur Monitoring, keine Änderungen</li>
                    <li>Für Reporting und Überwachung</li>
                    <li>Minimales Risiko</li>
                    <li>Für Management oder Audits</li>
                </ul>
            </li>
        </ul>
        <p><strong>Entscheidungshilfe:</strong></p>
        <ul>
            <li>Produktiv-System, Wartung → Eingeschränkt</li>
            <li>Kritisches System → Nur bestimmte Ports</li>
            <li>Monitoring/Dashboards → Nur Lesezugriff</li>
            <li>Test-System → Voller Zugriff OK</li>
        </ul>
    </div>

    <div data-tooltip-id="vpn-allowed-services">
        <strong>Erlaubte Dienste / Ports</strong>
        <p>Welche Dienste/Ports sind über VPN erreichbar?</p>
        <p><strong>Format:</strong> Dienst/Port oder nur Port</p>
        <p><strong>Häufige VPN-Zugriffe:</strong></p>
        <ul>
            <li><strong>HTTPS/443:</strong> Web-Interface, Management-Konsolen</li>
            <li><strong>RDP/3389:</strong> Remote Desktop (Windows Server)</li>
            <li><strong>SSH/22:</strong> Secure Shell (Linux Server)</li>
            <li><strong>HTTPS/8443:</strong> Alternative Management-Ports</li>
            <li><strong>SMB/445:</strong> Dateifreigaben (File-Server)</li>
            <li><strong>SQL/1433 oder 5432:</strong> Datenbank-Zugriff (nur Admins!)</li>
        </ul>
        <p><strong>Beispiele:</strong></p>
        <ul>
            <li>"HTTPS/443, RDP/3389" - Web + Remote Desktop</li>
            <li>"SSH/22" - Nur SSH für Linux-Admin</li>
            <li>"HTTPS/443, 8443" - Web auf mehreren Ports</li>
            <li>"All Services" - Bei vollem Zugriff</li>
        </ul>
        <p><strong>Sicherheits-Prinzip:</strong> Nur die wirklich benötigten Ports öffnen!</p>
        <em>Weniger offene Ports = kleinere Angriffsfläche</em>
    </div>

    <div data-tooltip-id="vpn-access-hours">
        <strong>Zugriffs-Zeitfenster</strong>
        <p>Wann ist VPN-Zugriff auf dieses System erlaubt?</p>
        <p><strong>Warum Zeitfenster wichtig sind:</strong></p>
        <ul>
            <li>Reduziert Angriffsfenster</li>
            <li>Verhindert unbefugte Zugriffe außerhalb Arbeitszeiten</li>
            <li>Compliance-Anforderung bei sensiblen Systemen</li>
        </ul>
        <p><strong>Typische Zeitfenster:</strong></p>
        <ul>
            <li><strong>24/7:</strong> Rund um die Uhr (kritische Systeme, Admins)</li>
            <li><strong>Mo-Fr 07:00-19:00:</strong> Erweiterte Geschäftszeiten</li>
            <li><strong>Mo-Fr 08:00-18:00:</strong> Standard-Geschäftszeiten</li>
            <li><strong>Mo-So 06:00-22:00:</strong> Breites Fenster für Home Office</li>
            <li><strong>Nach Anfrage:</strong> Externe Dienstleister nur bei Bedarf</li>
        </ul>
        <p><strong>Beispiele:</strong></p>
        <ul>
            <li>"24/7" - Produktiv-Server mit On-Call-Support</li>
            <li>"Mo-Fr 08:00-18:00" - Normale Büro-Systeme</li>
            <li>"Mo-Fr 06:00-22:00, Sa-So 10:00-16:00" - Home Office Flexibilität</li>
        </ul>
        <em>Außerhalb der Zeiten: Zugriff automatisch blockiert!</em>
    </div>

    <div data-tooltip-id="vpn-additional-auth">
        <strong>Zusätzliche Authentifizierung</strong>
        <p>Welche zusätzliche Sicherheitsstufe ist nach VPN-Verbindung erforderlich?</p>
        <p><strong>Defense in Depth - Mehrschichtige Sicherheit:</strong></p>
        <ul>
            <li><strong>Keine (nur VPN-Auth):</strong>
                <ul>
                    <li>Nach VPN-Login direkt Zugriff</li>
                    <li>VPN-Authentifizierung reicht aus</li>
                    <li>Für unkritische Systeme OK</li>
                    <li>Einfachste Variante</li>
                </ul>
            </li>
            <li><strong>System-Authentifizierung:</strong>
                <ul>
                    <li>Separate Anmeldung am Zielsystem</li>
                    <li>Username/Passwort nochmal eingeben</li>
                    <li>Standard bei Server-Zugriff (RDP, SSH)</li>
                    <li><em>Empfohlenes Minimum</em></li>
                </ul>
            </li>
            <li><strong>MFA erforderlich:</strong>
                <ul>
                    <li>Multi-Faktor-Authentifizierung zusätzlich</li>
                    <li>Passwort + Zweiter Faktor (App, SMS, Token)</li>
                    <li>Höchste Sicherheit</li>
                    <li><em>Für kritische Systeme Pflicht!</em></li>
                </ul>
            </li>
            <li><strong>Über Jumphost:</strong>
                <ul>
                    <li>Erst Verbindung zu Jumphost/Bastion</li>
                    <li>Von dort weiter zum Zielsystem</li>
                    <li>Zentrale Kontrolle und Logging</li>
                    <li>Best Practice für Produktiv-Systeme</li>
                </ul>
            </li>
        </ul>
        <p><strong>Was ist ein Jumphost?</strong> Ein Sprungbrett-Server - man verbindet sich erst dorthin, und von dort weiter. Alle Zugriffe werden zentral geloggt.</p>
        <p><strong>Empfehlung nach System-Kritikalität:</strong></p>
        <ul>
            <li>Unkritisch → Nur VPN-Auth</li>
            <li>Normal → System-Authentifizierung</li>
            <li>Kritisch → MFA erforderlich</li>
            <li>Sehr kritisch → Jumphost + MFA</li>
        </ul>
    </div>

    <div data-tooltip-id="vpn-allowed-ips">
        <strong>Erlaubte Quell-IP-Bereiche (VPN-Pool)</strong>
        <p>Aus welchen IP-Bereichen des VPN-Netzes darf zugegriffen werden?</p>
        <p><strong>Was sind VPN-Pools?</strong> Wenn sich Benutzer per VPN verbinden, bekommen sie eine IP aus einem definierten Bereich (Pool).</p>
        <p><strong>Warum einschränken?</strong></p>
        <ul>
            <li>Verschiedene VPN-Pools für verschiedene Benutzergruppen</li>
            <li>Zusätzliche Sicherheitsebene</li>
            <li>Granulare Kontrolle möglich</li>
        </ul>
        <p><strong>Typische VPN-IP-Bereiche:</strong></p>
        <ul>
            <li><strong>10.8.0.0/24:</strong> Standard OpenVPN (256 Adressen)</li>
            <li><strong>172.20.0.0/16:</strong> Großer Bereich für viele User (65.536 Adressen)</li>
            <li><strong>192.168.100.0/24:</strong> Admin-VPN (256 Adressen)</li>
            <li><strong>10.9.0.0/24:</strong> External-Partner-VPN (256 Adressen)</li>
        </ul>
        <p><strong>Beispiele:</strong></p>
        <ul>
            <li>"10.8.0.0/24" - Nur Standard-VPN-Pool</li>
            <li>"10.8.0.0/24, 192.168.100.0/24" - Standard + Admin-Pool</li>
            <li>"172.20.0.0/16" - Großer Corporate-Pool</li>
        </ul>
        <p><strong>Best Practice:</strong> Kritische Systeme nur aus Admin-VPN-Pool erreichbar machen!</p>
        <em>Mehrere Pools = granularere Zugriffskontrolle</em>
    </div>

    <div data-tooltip-id="vpn-host-assignment">
        <strong>Zugeordnete VMs / Server</strong>
        <p>Welche VMs und Server sind über dieses VPN erreichbar?</p>
        <p><strong>Warum dokumentieren?</strong></p>
        <ul>
            <li>Übersicht: Welche Systeme sind von außen erreichbar?</li>
            <li>Sicherheits-Audit: Zu viele Systeme exponiert?</li>
            <li>Troubleshooting: Warum ist System nicht erreichbar?</li>
            <li>Compliance: Dokumentationspflicht</li>
        </ul>
        <p><strong>Typisches VPN-Zugriffs-Szenario:</strong></p>
        <ul>
            <li>Home Office User → VPN → Fileserver, Mail</li>
            <li>Admin → Admin-VPN → Alle Server</li>
            <li>Externe Wartung → Partner-VPN → Nur spezifische Systeme</li>
        </ul>
        <em>Nicht alle Systeme sollten über VPN erreichbar sein!</em>
    </div>

    <div data-tooltip-id="vpn-endpoint-compliance">
        <strong>Endpoint Compliance erforderlich</strong>
        <p>Muss das Endgerät (Laptop/PC) bestimmte Sicherheitsanforderungen erfüllen?</p>
        <p><strong>Was ist Endpoint Compliance?</strong> Prüfung, ob der Computer des Benutzers sicher ist, bevor VPN-Zugriff gewährt wird.</p>
        <p><strong>Compliance-Level:</strong></p>
        <ul>
            <li><strong>Strikt (Compliance Check):</strong>
                <ul>
                    <li>Antivirus installiert und aktuell?</li>
                    <li>Firewall aktiviert?</li>
                    <li>Betriebssystem auf aktuellem Patch-Level?</li>
                    <li>Festplattenverschlüsselung aktiv?</li>
                    <li>Keine Jailbreak/Root-Zugriff</li>
                    <li>Bei Nicht-Erfüllung: Zugriff verweigert!</li>
                    <li><em>Für kritische Systeme empfohlen</em></li>
                </ul>
            </li>
            <li><strong>Moderat:</strong>
                <ul>
                    <li>Basis-Checks (Antivirus, Firewall)</li>
                    <li>Warnungen bei Problemen</li>
                    <li>Zugriff meist trotzdem erlaubt</li>
                </ul>
            </li>
            <li><strong>Keine Prüfung:</strong>
                <ul>
                    <li>Jedes Gerät kann sich verbinden</li>
                    <li>Höheres Risiko</li>
                    <li>Für unkritische Systeme oder wenn technisch nicht möglich</li>
                </ul>
            </li>
        </ul>
        <p><strong>Compliance-Technologien:</strong></p>
        <ul>
            <li>Cisco AnyConnect Network Access Manager</li>
            <li>Microsoft Intune Compliance Policies</li>
            <li>Palo Alto GlobalProtect HIP (Host Information Profile)</li>
        </ul>
        <em>Compliance verhindert, dass unsichere Geräte das Netzwerk gefährden!</em>
    </div>

    <div data-tooltip-id="vpn-logging">
        <strong>Logging für dieses System</strong>
        <p>Wie detailliert werden VPN-Zugriffe auf dieses System protokolliert?</p>
        <p><strong>Logging-Level:</strong></p>
        <ul>
            <li><strong>Detailliert (alle Zugriffe):</strong>
                <ul>
                    <li>Jede einzelne Verbindung wird geloggt</li>
                    <li>Timestamps, User, Quell-IP, Ziel-Port</li>
                    <li>Traffic-Volumen</li>
                    <li>Sehr große Log-Dateien</li>
                    <li><em>Für kritische Systeme mit Patientendaten!</em></li>
                </ul>
            </li>
            <li><strong>Normal (Connect/Disconnect):</strong>
                <ul>
                    <li>Nur Verbindungsauf- und -abbau</li>
                    <li>Wer hat wann Zugriff erhalten?</li>
                    <li>Moderate Log-Größe</li>
                    <li><em>Standard für normale Systeme</em></li>
                </ul>
            </li>
            <li><strong>Minimal:</strong>
                <ul>
                    <li>Nur Fehler und Probleme</li>
                    <li>Kleine Logs</li>
                    <li>Für unkritische Systeme</li>
                </ul>
            </li>
        </ul>
        <p><strong>Warum Logging wichtig ist:</strong></p>
        <ul>
            <li><strong>Compliance:</strong> DSGVO, KRITIS verlangen Logging</li>
            <li><strong>Forensik:</strong> Bei Sicherheitsvorfall nachvollziehen</li>
            <li><strong>Audit:</strong> Wer hat wann worauf zugegriffen?</li>
            <li><strong>Troubleshooting:</strong> Warum funktioniert Zugriff nicht?</li>
        </ul>
        <p><strong>Aufbewahrung:</strong></p>
        <ul>
            <li>Kritische Systeme: 1-2 Jahre</li>
            <li>Normale Systeme: 90 Tage</li>
            <li>Gesetzliche Anforderungen beachten!</li>
        </ul>
        <em>Bei Patientendaten: Detailliertes Logging ist Pflicht!</em>
    </div>

    <div data-tooltip-id="vpn-notes">
        <strong>Systemspezifische VPN-Notizen</strong>
        <p>Zusätzliche wichtige Informationen zum VPN-Zugriff auf dieses System.</p>
        <p><strong>Was dokumentieren:</strong></p>
        <ul>
            <li><strong>Spezielle Regelungen:</strong>
                <ul>
                    <li>Ausnahmegenehmigungen</li>
                    <li>Zeitlich befristete Zugriffe</li>
                    <li>Besondere Freigaben</li>
                </ul>
            </li>
            <li><strong>Firewall-Regeln:</strong>
                <ul>
                    <li>Spezielle VPN-Firewall-Rules</li>
                    <li>NAT-Konfigurationen</li>
                    <li>Port-Weiterleitungen</li>
                </ul>
            </li>
            <li><strong>Bekannte Probleme:</strong>
                <ul>
                    <li>Timeouts bei bestimmten Aktionen</li>
                    <li>Kompatibilitätsprobleme</li>
                    <li>Workarounds</li>
                </ul>
            </li>
            <li><strong>Kontakte:</strong>
                <ul>
                    <li>VPN-Administrator</li>
                    <li>System-Owner</li>
                    <li>Genehmigungsprozess für neue User</li>
                </ul>
            </li>
        </ul>
        <p><strong>Beispiel:</strong></p>
        <p>"VPN-Zugriff nur für IT-Admins und Wartungsfirma XY (Vertrag bis 31.12.2024). Firewall-Regel FW-VPN-001 erlaubt Zugriff. Bei Session-Timeout nach 4h automatische Trennung → Reconnect nötig. MFA Pflicht für alle Zugriffe (Duo Push). Ansprechpartner VPN: Max Mustermann (Tel. 1234), System-Owner: IT-Team. Neue Zugriffe: Ticket an IT-Service Desk."</p>
        <p><strong>Troubleshooting-Hinweise:</strong></p>
        <ul>
            <li>Häufige Fehler dokumentieren</li>
            <li>Test-Prozeduren beschreiben</li>
            <li>Eskalationspfade festhalten</li>
        </ul>
        <em>Gute VPN-Dokumentation spart Zeit bei Support-Anfragen!</em>
    </div>
</div>
