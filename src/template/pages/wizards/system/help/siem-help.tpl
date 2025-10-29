<div class="tooltip-definitions" style="display: none;">
    <div data-tooltip-id="siem-enabled">
        <strong>System ist an SIEM angebunden</strong>
        <p>Sendet dieses System Sicherheitslogs an ein zentrales SIEM?</p>
        <p><strong>Was ist ein SIEM?</strong> Security Information and Event Management - ein zentrales System zur Sammlung, Analyse und Überwachung von Sicherheits-Events aus allen IT-Systemen.</p>
        <p><strong>Warum SIEM wichtig ist:</strong></p>
        <ul>
            <li><strong>Zentralisierung:</strong> Alle Logs an einem Ort</li>
            <li><strong>Korrelation:</strong> Zusammenhänge zwischen Events erkennen</li>
            <li><strong>Threat Detection:</strong> Angriffe und Anomalien erkennen</li>
            <li><strong>Compliance:</strong> Nachweis für Audits (DSGVO, KRITIS)</li>
            <li><strong>Forensik:</strong> Bei Vorfällen nachvollziehen was passiert ist</li>
        </ul>
        <p><strong>Beispiel-Szenario:</strong> Angreifer versucht mehrfach Login auf verschiedenen Systemen → SIEM erkennt Muster → Alert an Security Team</p>
        <em>Kritische Systeme sollten IMMER an SIEM angebunden sein!</em>
    </div>

    <div data-tooltip-id="siem-component">
        <strong>SIEM-System Komponente</strong>
        <p>Welches SIEM-System wird verwendet?</p>
        <p><strong>Gängige SIEM-Lösungen:</strong></p>
        <ul>
            <li><strong>Splunk Enterprise Security:</strong>
                <ul>
                    <li>Marktführer, sehr mächtig</li>
                    <li>Gut für große Umgebungen</li>
                    <li>Teuer, aber umfassend</li>
                </ul>
            </li>
            <li><strong>IBM QRadar:</strong>
                <ul>
                    <li>Enterprise SIEM</li>
                    <li>Starke Korrelation</li>
                    <li>Flow-Analyse integriert</li>
                </ul>
            </li>
            <li><strong>Microsoft Sentinel:</strong>
                <ul>
                    <li>Cloud-native SIEM (Azure)</li>
                    <li>Gut integriert mit Microsoft-Produkten</li>
                    <li>Pay-as-you-go Modell</li>
                </ul>
            </li>
            <li><strong>Elastic (ELK Stack):</strong>
                <ul>
                    <li>Open Source Option</li>
                    <li>Flexibel, anpassbar</li>
                    <li>Gut für technische Teams</li>
                </ul>
            </li>
            <li><strong>ArcSight / LogRhythm / AlienVault:</strong> Weitere Enterprise-Optionen</li>
        </ul>
        <em>Das SIEM muss vorher als Komponente angelegt worden sein</em>
    </div>

    <div data-tooltip-id="siem-host-assignment">
        <strong>An SIEM angeschlossene Komponenten</strong>
        <p>Welche VMs und Server senden ihre Logs an das SIEM?</p>
        <p><strong>Warum dokumentieren?</strong></p>
        <ul>
            <li>Übersicht: Was wird überwacht?</li>
            <li>Lücken erkennen: Fehlt ein kritischer Server?</li>
            <li>Troubleshooting: Woher kommen Logs nicht an?</li>
            <li>Kapazitätsplanung: Wie viel Log-Volume?</li>
        </ul>
        <p><strong>Was sollte überwacht werden:</strong></p>
        <ul>
            <li><strong>Pflicht:</strong> Alle kritischen Systeme (KIS, PACS, Datenbanken)</li>
            <li><strong>Empfohlen:</strong> Alle produktiven Server</li>
            <li><strong>Optional:</strong> Test-Systeme, Entwicklung</li>
        </ul>
        <em>Mehr Abdeckung = bessere Sicherheit, aber auch mehr Kosten</em>
    </div>

    <div data-tooltip-id="siem-log-sources">
        <strong>Log-Quellen</strong>
        <p>Welche Arten von Logs werden gesammelt?</p>
        <p><strong>Log-Typen erklärt:</strong></p>
        <ul>
            <li><strong>System-Logs:</strong>
                <ul>
                    <li>Betriebssystem-Events (Windows Event Log, Syslog)</li>
                    <li>Systemstarts, Abstürze, Hardware-Fehler</li>
                    <li>Basis für alle Systeme</li>
                </ul>
            </li>
            <li><strong>Application-Logs:</strong>
                <ul>
                    <li>Logs der Anwendungen (KIS, PACS, etc.)</li>
                    <li>Fehler, Warnungen, Transaktionen</li>
                    <li>Wichtig für Fehleranalyse</li>
                </ul>
            </li>
            <li><strong>Security-Logs:</strong>
                <ul>
                    <li>Login-Versuche, Authentifizierung</li>
                    <li>Berechtigungs-Änderungen</li>
                    <li>Zugriffs-Versuche</li>
                    <li><em>Kritisch für Security!</em></li>
                </ul>
            </li>
            <li><strong>Audit-Logs:</strong>
                <ul>
                    <li>Wer hat was wann geändert</li>
                    <li>Compliance-relevant</li>
                    <li>Für Nachvollziehbarkeit</li>
                </ul>
            </li>
            <li><strong>Datenbank-Logs:</strong>
                <ul>
                    <li>DB-Queries, Änderungen</li>
                    <li>Privilegierte Zugriffe</li>
                    <li>Wichtig bei Patientendaten</li>
                </ul>
            </li>
            <li><strong>Netzwerk-Logs:</strong>
                <ul>
                    <li>Netzwerk-Traffic, Verbindungen</li>
                    <li>NetFlow, Packet Captures</li>
                </ul>
            </li>
            <li><strong>Firewall-Logs:</strong>
                <ul>
                    <li>Erlaubte und blockierte Verbindungen</li>
                    <li>Wichtig für Netzwerk-Sicherheit</li>
                </ul>
            </li>
            <li><strong>Web-Server-Logs:</strong>
                <ul>
                    <li>HTTP-Requests, Zugriffe</li>
                    <li>Für Web-Anwendungen</li>
                </ul>
            </li>
        </ul>
        <p><strong>Mindest-Set für kritische Systeme:</strong> System + Security + Application</p>
        <em>Mehr Log-Typen = bessere Sichtbarkeit, aber mehr Speicher und Kosten</em>
    </div>

    <div data-tooltip-id="siem-database-selection">
        <strong>Datenbanken mit Log-Übertragung</strong>
        <p>Welche Datenbanken senden Logs ans SIEM?</p>
        <p><strong>Warum Datenbank-Logs wichtig sind:</strong></p>
        <ul>
            <li>Patientendaten-Zugriffe nachvollziehen (DSGVO)</li>
            <li>Unbefugte Zugriffe erkennen</li>
            <li>SQL-Injection-Versuche detektieren</li>
            <li>Privilegierte Aktionen überwachen (DROP, ALTER)</li>
        </ul>
        <p><strong>Typische DB-Logs:</strong></p>
        <ul>
            <li>Login-Versuche</li>
            <li>Failed Queries</li>
            <li>Schema-Änderungen</li>
            <li>Privileged Access (Admin-Zugriffe)</li>
        </ul>
        <em>Bei Patientendaten: DB-Logging ist Pflicht (DSGVO Art. 32)!</em>
    </div>

    <div data-tooltip-id="siem-log-protocol">
        <strong>Log-Transport-Protokoll</strong>
        <p>Wie werden die Logs zum SIEM übertragen?</p>
        <p><strong>Protokolle erklärt:</strong></p>
        <ul>
            <li><strong>Syslog (UDP/TCP):</strong>
                <ul>
                    <li>Standard-Protokoll für Log-Übertragung</li>
                    <li>UDP: Schnell, aber kann Logs verlieren</li>
                    <li>TCP: Zuverlässiger, garantierte Zustellung</li>
                    <li>Port 514 (UDP) oder 601 (TCP)</li>
                    <li><em>Einfachste Methode</em></li>
                </ul>
            </li>
            <li><strong>Syslog über TLS:</strong>
                <ul>
                    <li>Verschlüsseltes Syslog</li>
                    <li>Für sensible Logs (Patientendaten)</li>
                    <li>Port 6514</li>
                    <li><em>Empfohlen für Produktion</em></li>
                </ul>
            </li>
            <li><strong>SIEM Forwarder/Agent:</strong>
                <ul>
                    <li>Software auf dem Server installiert</li>
                    <li>Liest Logs und sendet zu SIEM</li>
                    <li>Beispiele: Splunk Forwarder, Elastic Beats</li>
                    <li>Kann Logs vorverarbeiten und filtern</li>
                    <li><em>Flexibelste Lösung</em></li>
                </ul>
            </li>
            <li><strong>REST API:</strong>
                <ul>
                    <li>Moderne API-basierte Übertragung</li>
                    <li>Für Cloud-Services und moderne Apps</li>
                    <li>HTTPS-verschlüsselt</li>
                </ul>
            </li>
            <li><strong>File Collection:</strong>
                <ul>
                    <li>SIEM liest Log-Dateien direkt</li>
                    <li>Via SMB/NFS-Share</li>
                    <li>Für Legacy-Systeme</li>
                </ul>
            </li>
        </ul>
        <p><strong>Empfehlung:</strong> Syslog TLS für einfache Logs, Forwarder für komplexe Szenarien</p>
    </div>

    <div data-tooltip-id="siem-collector">
        <strong>SIEM Collector / Forwarder</strong>
        <p>Die Zwischenstation zwischen System und zentralem SIEM.</p>
        <p><strong>Was ist ein Collector?</strong> Ein dedizierter Server, der Logs von mehreren Systemen sammelt und gebündelt ans zentrale SIEM sendet.</p>
        <p><strong>Warum Collector verwenden?</strong></p>
        <ul>
            <li>Entlastung des zentralen SIEM</li>
            <li>Vorverarbeitung und Filterung</li>
            <li>Pufferung bei Netzwerkproblemen</li>
            <li>Standort-spezifische Sammlung</li>
        </ul>
        <p><strong>Typische Architektur:</strong></p>
        <ul>
            <li>Server → Forwarder (lokal) → Collector (pro Standort) → Zentral-SIEM</li>
        </ul>
        <p><strong>Beispiele:</strong></p>
        <ul>
            <li>"siem-forwarder-rz1" - Collector Rechenzentrum 1</li>
            <li>"Heavy Forwarder West" - Splunk Heavy Forwarder Standort West</li>
            <li>"Logstash-Cluster" - Elastic Logstash Cluster</li>
        </ul>
    </div>

    <div data-tooltip-id="siem-log-volume">
        <strong>Log-Volume (täglich)</strong>
        <p>Wie viel Log-Daten produziert dieses System pro Tag?</p>
        <p><strong>Warum wichtig?</strong></p>
        <ul>
            <li>Kapazitätsplanung SIEM-Storage</li>
            <li>Lizenz-Kosten (viele SIEMs lizenzieren nach GB/Tag)</li>
            <li>Netzwerk-Bandbreite</li>
        </ul>
        <p><strong>Richtwerte:</strong></p>
        <ul>
            <li><strong>< 100 MB/Tag:</strong> Kleiner Server, wenig Aktivität</li>
            <li><strong>100 MB - 1 GB/Tag:</strong> Normaler Server</li>
            <li><strong>1-10 GB/Tag:</strong> Großer Server, viel Aktivität</li>
            <li><strong>> 10 GB/Tag:</strong> Web-Server mit viel Traffic, große Datenbanken</li>
        </ul>
        <p><strong>Beispiele:</strong></p>
        <ul>
            <li>Fileserver: 200 MB/Tag</li>
            <li>KIS-Appserver: 2 GB/Tag</li>
            <li>Web-Frontend: 5 GB/Tag</li>
            <li>Firewall: 10+ GB/Tag</li>
        </ul>
        <em>Bei pay-per-GB: Genaue Messung = Kostenersparnis!</em>
    </div>

    <div data-tooltip-id="siem-eps">
        <strong>Events per Second (EPS)</strong>
        <p>Wie viele Log-Events pro Sekunde werden generiert?</p>
        <p><strong>Was sind EPS?</strong> Die Anzahl einzelner Log-Einträge pro Sekunde - wichtige Kennzahl für SIEM-Performance.</p>
        <p><strong>Warum EPS wichtig sind:</strong></p>
        <ul>
            <li>SIEM-Sizing (wie viele EPS kann SIEM verarbeiten?)</li>
            <li>Lizenz-Kosten (manche lizenzieren nach EPS)</li>
            <li>Echtzeit-Analyse möglich?</li>
        </ul>
        <p><strong>Richtwerte:</strong></p>
        <ul>
            <li><strong>1-10 EPS:</strong> Ruhiger Server</li>
            <li><strong>10-100 EPS:</strong> Normaler Betrieb</li>
            <li><strong>100-1000 EPS:</strong> Hohes Aufkommen</li>
            <li><strong>> 1000 EPS:</strong> Sehr hohe Last (Firewall, Web-Server)</li>
        </ul>
        <em>Spitzen-Zeiten beachten - EPS kann stark schwanken!</em>
    </div>

    <div data-tooltip-id="siem-use-cases">
        <strong>Aktive Use Cases</strong>
        <p>Welche Security-Szenarien werden für dieses System überwacht?</p>
        <p><strong>Was sind Use Cases?</strong> Vordefinierte Überwachungs-Regeln für spezifische Angriffsmuster oder Sicherheitsvorfälle.</p>
        <p><strong>Typische Use Cases:</strong></p>
        <ul>
            <li><strong>Failed Login Detection:</strong> Viele fehlgeschlagene Logins = Brute Force Angriff</li>
            <li><strong>Privilege Escalation:</strong> Normale User werden plötzlich Admin</li>
            <li><strong>Data Exfiltration:</strong> Ungewöhnlich große Daten-Transfers</li>
            <li><strong>Anomaly Detection:</strong> Abweichungen vom normalen Verhalten</li>
            <li><strong>Malware Detection:</strong> Bekannte Malware-Signaturen</li>
            <li><strong>Insider Threat:</strong> Verdächtiges Mitarbeiter-Verhalten</li>
            <li><strong>Compliance Violations:</strong> Verstöße gegen Richtlinien</li>
        </ul>
        <p><strong>Beispiel-Dokumentation:</strong> "Failed Login Detection (> 5 Versuche in 5 Min), Privileged Account Usage Monitoring, After-Hours Access Detection, Data Access Volume Anomaly"</p>
        <em>Je mehr Use Cases, desto besser die Security-Abdeckung</em>
    </div>

    <div data-tooltip-id="siem-mitre">
        <strong>MITRE ATT&CK Coverage</strong>
        <p>Welche Angriffstechniken nach MITRE ATT&CK Framework werden abgedeckt?</p>
        <p><strong>Was ist MITRE ATT&CK?</strong> Ein Framework, das alle bekannten Angriffstechniken kategorisiert - wie ein "Periodensystem" für Cyberangriffe.</p>
        <p><strong>Haupt-Taktiken (in Angriffs-Reihenfolge):</strong></p>
        <ul>
            <li><strong>Initial Access:</strong> Wie kommt Angreifer rein? (Phishing, Exploit)</li>
            <li><strong>Execution:</strong> Code ausführen</li>
            <li><strong>Persistence:</strong> Zugang sichern (Backdoors)</li>
            <li><strong>Privilege Escalation:</strong> Admin-Rechte erlangen</li>
            <li><strong>Defense Evasion:</strong> Erkennung umgehen</li>
            <li><strong>Credential Access:</strong> Passwörter stehlen</li>
            <li><strong>Discovery:</strong> Netzwerk erkunden</li>
            <li><strong>Lateral Movement:</strong> Zu anderen Systemen bewegen</li>
            <li><strong>Collection:</strong> Daten sammeln</li>
            <li><strong>Exfiltration:</strong> Daten rausschaffen</li>
        </ul>
        <p><strong>Beispiel:</strong> "Initial Access (Phishing Detection), Lateral Movement (Unusual RDP), Exfiltration (Large Data Transfer)"</p>
        <em>MITRE ATT&CK hilft, Lücken in der Detection zu finden</em>
    </div>

    <div data-tooltip-id="siem-alert-priority">
        <strong>Alert-Priorität</strong>
        <p>Wie kritisch sind Alerts von diesem System?</p>
        <p><strong>Prioritäten erklärt:</strong></p>
        <ul>
            <li><strong>Critical (P1):</strong>
                <ul>
                    <li>Sofortige Reaktion erforderlich</li>
                    <li>Aktiver Angriff oder Datenverlust</li>
                    <li>Beispiel: Ransomware-Detection, Data Breach</li>
                    <li>Response: Sofort (24/7)</li>
                </ul>
            </li>
            <li><strong>High (P2):</strong>
                <ul>
                    <li>Sehr wichtig, schnelle Reaktion nötig</li>
                    <li>Potentieller Sicherheitsvorfall</li>
                    <li>Beispiel: Malware-Fund, Privilege Escalation</li>
                    <li>Response: < 1 Stunde</li>
                </ul>
            </li>
            <li><strong>Medium (P3):</strong>
                <ul>
                    <li>Verdächtig, aber nicht kritisch</li>
                    <li>Beispiel: Failed Logins, Policy Violations</li>
                    <li>Response: < 4 Stunden</li>
                </ul>
            </li>
            <li><strong>Low (P4):</strong>
                <ul>
                    <li>Informativ, keine direkte Gefahr</li>
                    <li>Beispiel: Ungewöhnliche Aktivität</li>
                    <li>Response: Nächster Arbeitstag</li>
                </ul>
            </li>
            <li><strong>Informational:</strong>
                <ul>
                    <li>Nur zur Information, keine Aktion</li>
                    <li>Für Statistik und Trends</li>
                </ul>
            </li>
        </ul>
        <em>Kritikalität des Systems bestimmt Alert-Priorität</em>
    </div>

    <div data-tooltip-id="siem-alert-recipients">
        <strong>Alert-Empfänger</strong>
        <p>Wer wird bei Security-Alerts benachrichtigt?</p>
        <p><strong>Typische Empfänger:</strong></p>
        <ul>
            <li>SOC (Security Operations Center) E-Mail</li>
            <li>Security Team Verteiler</li>
            <li>System-Admin für dieses System</li>
            <li>Incident Response Team</li>
            <li>CISO (bei kritischen Alerts)</li>
        </ul>
        <p><strong>Beispiele:</strong></p>
        <ul>
            <li>"soc@krankenhaus.de"</li>
            <li>"security-team@example.com, kis-admin@example.com"</li>
            <li>"incident-response@example.com" (nur P1/P2)</li>
        </ul>
        <em>Alert-Fatigue vermeiden - nur relevante Empfänger!</em>
    </div>

    <div data-tooltip-id="siem-alert-count">
        <strong>Durchschnittliche Alert-Anzahl</strong>
        <p>Wie viele Alerts werden typischerweise generiert?</p>
        <p><strong>Warum wichtig?</strong></p>
        <ul>
            <li>Ressourcen-Planung (SOC-Kapazität)</li>
            <li>Tuning-Bedarf erkennen (zu viele False Positives?)</li>
            <li>Baseline für Anomalien</li>
        </ul>
        <p><strong>Beispiele:</strong></p>
        <ul>
            <li>"2-3/Tag" - Gut getunte Alerts</li>
            <li>"20-30/Tag" - Normal für kritisches System</li>
            <li>"100+/Tag" - Zu viel, Tuning nötig!</li>
        </ul>
        <em>Viele Alerts ≠ gute Security. Qualität > Quantität!</em>
    </div>

    <div data-tooltip-id="siem-response-sla">
        <strong>Incident Response Zeit (SLA)</strong>
        <p>Wie schnell muss auf Alerts reagiert werden?</p>
        <p><strong>SLA nach Priorität:</strong></p>
        <ul>
            <li><strong>Critical:</strong> 15-30 Minuten (24/7)</li>
            <li><strong>High:</strong> 1-2 Stunden</li>
            <li><strong>Medium:</strong> 4-8 Stunden (Geschäftszeiten)</li>
            <li><strong>Low:</strong> 24 Stunden</li>
        </ul>
        <p><strong>Beispiel:</strong> "15min (Critical), 1h (High), 4h (Medium), Next Business Day (Low)"</p>
        <em>SLA muss realistisch und erreichbar sein!</em>
    </div>

    <div data-tooltip-id="siem-soar">
        <strong>SOAR Integration</strong>
        <p>Gibt es automatisierte Reaktionen auf Security-Events?</p>
        <p><strong>Was ist SOAR?</strong> Security Orchestration, Automation and Response - automatisierte Reaktion auf Security-Vorfälle.</p>
        <p><strong>Optionen:</strong></p>
        <ul>
            <li><strong>Integriert:</strong>
                <ul>
                    <li>SOAR-Platform vorhanden</li>
                    <li>Automatische Reaktionen konfiguriert</li>
                    <li>Beispiele: User sperren, System isolieren, Ticket erstellen</li>
                    <li>Schnellere Response, weniger manueller Aufwand</li>
                </ul>
            </li>
            <li><strong>Manuelle Response:</strong>
                <ul>
                    <li>Alle Reaktionen manuell durch SOC</li>
                    <li>Langsamer, aber mehr Kontrolle</li>
                    <li>Typisch bei kleineren Organisationen</li>
                </ul>
            </li>
            <li><strong>Keine SOAR:</strong> Kein SOAR-System vorhanden</li>
        </ul>
        <p><strong>Typische SOAR-Aktionen:</strong></p>
        <ul>
            <li>Automatisches Ticket-Erstellen</li>
            <li>User-Account sperren bei Compromise</li>
            <li>System vom Netzwerk trennen</li>
            <li>Threat Intelligence abfragen</li>
            <li>E-Mail automatisch analysieren</li>
        </ul>
    </div>

    <div data-tooltip-id="siem-retention">
        <strong>Log-Retention</strong>
        <p>Wie lange werden Logs im SIEM aufbewahrt?</p>
        <p><strong>Warum Retention wichtig ist:</strong></p>
        <ul>
            <li>Compliance-Anforderungen (DSGVO, KRITIS)</li>
            <li>Forensische Analysen</li>
            <li>Trend-Analysen</li>
            <li>Kosten (mehr Retention = mehr Storage)</li>
        </ul>
        <p><strong>Typische Retention nach System-Typ:</strong></p>
        <ul>
            <li><strong>Kritische Systeme (KIS, PACS):</strong> 1-2 Jahre (Hot Storage) + 5-7 Jahre (Archive)</li>
            <li><strong>Normale Systeme:</strong> 90 Tage - 1 Jahr</li>
            <li><strong>Unkritische Systeme:</strong> 30-90 Tage</li>
        </ul>
        <p><strong>Gesetzliche Anforderungen:</strong></p>
        <ul>
            <li><strong>DSGVO:</strong> Zugriffe auf Patientendaten mind. 2 Jahre</li>
            <li><strong>KRITIS:</strong> Sicherheits-relevante Logs mind. 6 Monate</li>
            <li><strong>Strafrecht:</strong> Bei Verdacht auf Straftat bis Abschluss Ermittlungen</li>
        </ul>
        <p><strong>Hot vs. Cold Storage:</strong></p>
        <ul>
            <li>Hot: Schnell durchsuchbar, teuer (z.B. 90 Tage)</li>
            <li>Cold/Archive: Langsamer, günstig (z.B. danach 5+ Jahre)</li>
        </ul>
        <em>Bei Patientendaten: Mindestens 2 Jahre gemäß DSGVO!</em>
    </div>

    <div data-tooltip-id="siem-compliance">
        <strong>Compliance-Anforderungen</strong>
        <p>Welche regulatorischen Anforderungen gelten für dieses System?</p>
        <p><strong>Standards erklärt:</strong></p>
        <ul>
            <li><strong>DSGVO:</strong> Datenschutz-Grundverordnung - Pflicht für alle mit Patientendaten</li>
            <li><strong>PCI DSS:</strong> Payment Card Industry - wenn Kreditkarten verarbeitet werden</li>
            <li><strong>HIPAA:</strong> US Health Insurance Portability (für US-Geschäft)</li>
            <li><strong>KRITIS:</strong> Kritische Infrastruktur - besondere Meldepflichten</li>
        </ul>
        <em>Compliance bestimmt Log-Retention und Monitoring-Anforderungen</em>
    </div>

    <div data-tooltip-id="siem-dashboard">
        <strong>SIEM-Dashboard URL</strong>
        <p>Link zum spezifischen Dashboard für dieses System.</p>
        <p><strong>Warum Dashboard wichtig:</strong></p>
        <ul>
            <li>Schneller Zugriff für Admins</li>
            <li>Übersicht über Security-Status</li>
            <li>Direkter Zugang bei Incident</li>
        </ul>
        <p><strong>Beispiele:</strong></p>
        <ul>
            <li>"https://siem.example.com/dashboard/kis-prod"</li>
            <li>"https://splunk.hospital.de/app/search/kis_security_overview"</li>
        </ul>
    </div>

    <div data-tooltip-id="siem-reporting">
        <strong>Reporting-Frequenz</strong>
        <p>Wie oft werden Security-Reports erstellt?</p>
        <p><strong>Frequenzen:</strong></p>
        <ul>
            <li><strong>Echtzeit:</strong> Live-Dashboard, kontinuierliches Monitoring (SOC)</li>
            <li><strong>Täglich:</strong> Täglicher Security-Report (kritische Systeme)</li>
            <li><strong>Wöchentlich:</strong> Wöchentlicher Überblick (normale Systeme)</li>
            <li><strong>Monatlich:</strong> Management-Report, Trends</li>
        </ul>
        <p><strong>Typische Report-Inhalte:</strong></p>
        <ul>
            <li>Anzahl und Art der Alerts</li>
            <li>Top Security Events</li>
            <li>Compliance-Status</li>
            <li>Trends und Anomalien</li>
        </ul>
    </div>

    <div data-tooltip-id="siem-notes">
        <strong>Systemspezifische SIEM-Notizen</strong>
        <p>Zusätzliche wichtige Informationen zur SIEM-Integration.</p>
        <p><strong>Was dokumentieren:</strong></p>
        <ul>
            <li><strong>Spezielle Filterregeln:</strong> Welche Events werden ausgefiltert und warum?</li>
            <li><strong>Bekannte False Positives:</strong> Alerts, die regelmäßig fälschlicherweise auslösen</li>
            <li><strong>Tuning-Historie:</strong> Welche Anpassungen wurden vorgenommen?</li>
            <li><strong>Ausnahmen:</strong> Welche Aktivitäten sind erlaubt, würden aber normalerweise alerten?</li>
            <li><strong>Integration-Details:</strong> Besonderheiten der Anbindung</li>
        </ul>
        <p><strong>Beispiel:</strong></p>
        <p>"Failed Login Alerts für Service-Account 'backup-svc' ausgeschaltet (Normal-Betrieb 20+ Failed Logins/Tag bei automatischen Retries). Custom Parsing Rule für KIS-spezifisches Log-Format. Ausnahme: Admin-Zugriff von 10.0.1.50 außerhalb Geschäftszeiten (Monitoring-System). Last Tuning: Q2/2024"</p>
        <em>Gute Dokumentation spart Zeit beim Incident Response!</em>
    </div>
</div>
