<div class="tooltip-definitions" style="display: none;">
    <div data-tooltip-id="siem-name">
        <h2>SIEM-System Name</h2>
        <p>Ein eindeutiger Name für Ihr SIEM-System.</p>
        <div>
            <h3>Was ist ein SIEM?</h3>
            Security Information and Event Management - das "Nervenzentrum" Ihrer IT-Sicherheit!
        </div>
        <div>
            <h3>Warum SIEM essentiell ist:</h3>
            <ul>
                <li><strong>Zentrale Log-Sammlung:</strong> Alle Logs an einem Ort</li>
                <li><strong>Angriffs-Erkennung:</strong> Korreliert Events über Systeme hinweg</li>
                <li><strong>Compliance:</strong> Audit-Trail für DSGVO, KRITIS, etc.</li>
                <li><strong>Incident Response:</strong> Schnelle Reaktion auf Sicherheitsvorfälle</li>
                <li><strong>Threat Hunting:</strong> Proaktive Suche nach Bedrohungen</li>
            </ul>
        </div>
        <div>
            <h3>Namens-Beispiele:</h3>
            <ul>
                <li>"SIEM-Prod" - Produktiv-SIEM</li>
                <li>"Security-Monitoring" - Security Monitoring System</li>
                <li>"SOC-SIEM" - SIEM für Security Operations Center</li>
            </ul>
        </div>
        <em>SIEM ist Pflicht für KRITIS und empfohlen für jedes Unternehmen ab 50+ Mitarbeiter!</em>
    </div>

    <div data-tooltip-id="siem-software">
        <h2>SIEM-Software</h2>
        <p>Welche SIEM-Plattform wird verwendet?</p>
        <div>
            <h3>SIEM-Kategorien:</h3>
            <ul>
                <li><strong>Enterprise SIEM (Commercial):</strong>
                    <ul>
                        <li><strong>Splunk Enterprise Security:</strong>
                            <ul>
                                <li>Marktführer, sehr mächtig</li>
                                <li>Beste Visualisierungen und Dashboards</li>
                                <li>Teuer (Lizenz nach GB/Tag)</li>
                                <li>Große Community, viele Apps</li>
                                <li><em>Gold-Standard, aber teuer!</em></li>
                            </ul>
                        </li>
                        <li><strong>IBM QRadar:</strong>
                            <ul>
                                <li>Enterprise-fokussiert</li>
                                <li>Starke Korrelations-Engine</li>
                                <li>Lizenz nach Events/Sec (EPS)</li>
                                <li>Gut für große Umgebungen</li>
                            </ul>
                        </li>
                        <li><strong>Micro Focus ArcSight:</strong>
                            <ul>
                                <li>Sehr etabliert, seit Jahrzehnten</li>
                                <li>Komplex, braucht Expertise</li>
                                <li>Gut für Compliance</li>
                            </ul>
                        </li>
                        <li><strong>Microsoft Sentinel:</strong>
                            <ul>
                                <li>Cloud-native (Azure)</li>
                                <li>Gut integriert mit Microsoft-Produkten</li>
                                <li>Pay-as-you-go Modell</li>
                                <li>Modern, aber Microsoft-lastig</li>
                            </ul>
                        </li>
                        <li><strong>LogRhythm, Securonix:</strong> Weitere Enterprise-Lösungen</li>
                    </ul>
                </li>
                <li><strong>Open Source SIEM:</strong>
                    <ul>
                        <li><strong>Elastic Security (SIEM):</strong>
                            <ul>
                                <li>Basiert auf Elastic Stack (ELK)</li>
                                <li>Open Source + Commercial Options</li>
                                <li>Sehr flexibel, gute Performance</li>
                                <li>Große Community</li>
                                <li><em>Beste Open-Source-Option!</em></li>
                            </ul>
                        </li>
                        <li><strong>Wazuh:</strong>
                            <ul>
                                <li>Open Source Host-based IDS + SIEM</li>
                                <li>Kostenlos, gut dokumentiert</li>
                                <li>Gut für kleinere Umgebungen</li>
                            </ul>
                        </li>
                        <li><strong>OSSEC, AlienVault OSSIM:</strong> Weitere Open-Source-Optionen</li>
                    </ul>
                </li>
                <li><strong>Cloud SIEM:</strong>
                    <ul>
                        <li><strong>Sumo Logic, Datadog Security:</strong> SaaS SIEM</li>
                        <li><strong>Rapid7 InsightIDR:</strong> Cloud-basiert</li>
                        <li>Kein eigener Server nötig</li>
                        <li>Schnell einsatzbereit</li>
                    </ul>
                </li>
            </ul>
        </div>
        <em>Wahl hängt ab von: Budget, Größe, Expertise, Cloud vs On-Premise</em>
    </div>

    <div data-tooltip-id="siem-license">
        <h2>Lizenzmodell</h2>
        <p>Wie wird das SIEM lizenziert?</p>
        <div>
            <h3>Lizenz-Modelle erklärt:</h3>
            <ul>
                <li><strong>Per EPS (Events per Second):</strong>
                    <ul>
                        <li>Z.B. IBM QRadar</li>
                        <li>1.000 EPS, 5.000 EPS, 10.000 EPS</li>
                        <li>Überschreitung = Drosselung oder Mehrkosten</li>
                        <li>EPS schwer vorherzusagen!</li>
                    </ul>
                </li>
                <li><strong>Per GB/Tag:</strong>
                    <ul>
                        <li>Z.B. Splunk</li>
                        <li>50 GB/Tag, 100 GB/Tag, 500 GB/Tag</li>
                        <li>Einfacher zu kalkulieren</li>
                        <li>Kann teuer werden bei viel Traffic</li>
                    </ul>
                </li>
                <li><strong>Per Device/Log Source:</strong>
                    <ul>
                        <li>Pro angeschlossenes System</li>
                        <li>Einfach zu kalkulieren</li>
                        <li>Unabhängig von Log-Volume</li>
                    </ul>
                </li>
                <li><strong>Per User:</strong> Anzahl SIEM-Benutzer</li>
                <li><strong>Subscription / SaaS:</strong> Monatlich/Jährlich, meist Cloud</li>
                <li><strong>Perpetual:</strong> Einmalkauf (selten bei SIEM)</li>
                <li><strong>Open Source / Kostenlos:</strong> Elastic, Wazuh (Support extra)</li>
            </ul>
        </div>
        <em>SIEM-Lizenzen können sehr teuer sein - gut kalkulieren!</em>
    </div>

    <div data-tooltip-id="siem-deployment">
        <h2>Deployment-Typ</h2>
        <p>Wo läuft das SIEM?</p>
        <div>
            <h3>Deployment-Optionen:</h3>
            <ul>
                <li><strong>On-Premise:</strong>
                    <ul>
                        <li>Eigene Server im Rechenzentrum</li>
                        <li>Volle Kontrolle</li>
                        <li>Daten bleiben im Haus (DSGVO)</li>
                        <li>Wartung selbst machen</li>
                        <li><em>Standard für KRITIS</em></li>
                    </ul>
                </li>
                <li><strong>Cloud / SaaS:</strong>
                    <ul>
                        <li>Beim Anbieter gehostet</li>
                        <li>Schnelle Einrichtung</li>
                        <li>Kein Betrieb nötig</li>
                        <li>Pay-as-you-grow</li>
                        <li>Aber: Logs verlassen Organisation</li>
                    </ul>
                </li>
                <li><strong>Hybrid:</strong>
                    <ul>
                        <li>Log-Sammler On-Premise</li>
                        <li>Analyse in Cloud</li>
                        <li>Kompromiss</li>
                    </ul>
                </li>
            </ul>
        </div>
        <em>On-Premise bei sensiblen Daten (Patientendaten), Cloud bei kleinen Teams</em>
    </div>

    <div data-tooltip-id="siem-eps">
        <h2>Events per Second (EPS)</h2>
        <p>Wie viele Log-Events verarbeitet das SIEM pro Sekunde?</p>
        <div>
            <h3>Was ist EPS?</h3>
            Die "Geschwindigkeit" Ihres SIEMs - wie viele Events können pro Sekunde verarbeitet werden?
        </div>
        <div>
            <h3>Typische EPS-Werte:</h3>
            <ul>
                <li><strong>< 1.000 EPS:</strong> Kleine Umgebung (< 50 Geräte)</li>
                <li><strong>1.000-5.000 EPS:</strong> Mittelgroß (50-200 Geräte)</li>
                <li><strong>5.000-20.000 EPS:</strong> Groß (200-1000 Geräte)</li>
                <li><strong>> 20.000 EPS:</strong> Sehr groß (Enterprise, 1000+ Geräte)</li>
            </ul>
        </div>
        <div>
            <h3>Was beeinflusst EPS:</h3>
            <ul>
                <li>Anzahl Log-Quellen</li>
                <li>Wie "geschwätzig" die Systeme sind (Windows = viel, Linux = weniger)</li>
                <li>Log-Level (Debug = sehr viel, Error only = wenig)</li>
                <li>Spitzenzeiten (Montag morgen mehr als Sonntag nachts)</li>
            </ul>
        </div>
        <div>
            <h3>Wichtig:</h3>
            EPS-Lizenz groß genug dimensionieren - sonst werden Logs gedrosselt = blind für Angriffe!
        </div>
        <em>Faustformel: 10-50 EPS pro aktivem Gerät</em>
    </div>

    <div data-tooltip-id="siem-logsources">
        <h2>Log-Quellen Typen</h2>
        <p>Welche Arten von Systemen senden Logs an das SIEM?</p>
        <div>
            <h3>Wichtige Log-Quellen:</h3>
            <ul>
                <li><strong>Firewalls:</strong> Blocked Connections, Allowed Traffic - <em>essentiell!</em></li>
                <li><strong>IDS/IPS:</strong> Angriffs-Erkennungen</li>
                <li><strong>Server (Windows/Linux):</strong> System Events, Logins, Fehler</li>
                <li><strong>Active Directory:</strong> User Logins, Rechte-Änderungen - <em>sehr wichtig!</em></li>
                <li><strong>Datenbanken:</strong> SQL-Queries, Zugriffe</li>
                <li><strong>Anwendungen:</strong> Applikations-Logs, Fehler</li>
                <li><strong>Netzwerkgeräte:</strong> Switches, Router</li>
                <li><strong>Endpoints (EDR):</strong> Antivirus, EDR-Alerts</li>
                <li><strong>Cloud Services:</strong> Office 365, AWS, Azure</li>
                <li><strong>E-Mail Security:</strong> Spam-Filter, Mail-Gateway</li>
            </ul>
        </div>
        <div>
            <h3>Je mehr Quellen, desto besser die Sichtbarkeit!</h3>
            Minimum: Firewall + AD + Server
        </div>
        <em>Minimum: Firewall + AD + Server</em>
    </div>

    <div data-tooltip-id="siem-usecases">
        <h2>Use Cases / Detection Rules</h2>
        <p>Konfigurierte Erkennungsregeln für Sicherheitsvorfälle.</p>
        <div>
            <h3>Was sind Use Cases?</h3>
            Regeln die sagen: "Wenn X passiert, dann Alert auslösen" - wie Rauchmelder für IT-Angriffe.
        </div>
        <div>
            <h3>Beispiel Use Cases:</h3>
            <ul>
                <li><strong>Brute-Force-Angriff:</strong> 10 fehlgeschlagene Logins in 5 Min</li>
                <li><strong>Lateral Movement:</strong> Admin-Login von ungewöhnlichem System</li>
                <li><strong>Data Exfiltration:</strong> Ungewöhnlich viel ausgehender Traffic</li>
                <li><strong>Malware-Kommunikation:</strong> Verbindung zu bekannter C&C-Server</li>
                <li><strong>Privilege Escalation:</strong> User wird unerwartet Admin</li>
                <li><strong>Account Compromise:</strong> Login aus zwei Ländern gleichzeitig</li>
            </ul>
        </div>
        <div>
            <h3>Typische Anzahl:</h3>
            <ul>
                <li>50-100 Use Cases: Basis-Setup</li>
                <li>100-500: Gut konfiguriertes SIEM</li>
                <li>500+: Mature SOC mit vielen Custom Rules</li>
            </ul>
        </div>
        <em>Mehr Use Cases ≠ besser - Qualität vor Quantität (False Positives vermeiden)!</em>
    </div>

    <div data-tooltip-id="siem-ueba">
        <h2>Machine Learning / UEBA</h2>
        <p>Automatische Erkennung anomalen Verhaltens durch KI.</p>
        <div>
            <h3>Was ist UEBA?</h3>
            User and Entity Behavior Analytics - lernt "normales" Verhalten und erkennt Abweichungen.
        </div>
        <div>
            <h3>Was UEBA kann:</h3>
            <ul>
                <li>Erkennt Anomalien ohne vordefinierte Regeln</li>
                <li>Lernt Baseline: "User X loggt sich normalerweise 8-17 Uhr ein"</li>
                <li>Alert bei Abweichung: "User X Login um 3 Uhr nachts!"</li>
                <li>Erkennt Zero-Day-Angriffe (keine Signatur bekannt)</li>
                <li>Reduziert False Positives durch Kontext</li>
            </ul>
        </div>
        <div>
            <h3>Beispiel-Szenarien:</h3>
            <ul>
                <li>Kompromittierter Account: Nutzer lädt plötzlich 100 GB Daten</li>
                <li>Insider-Threat: Mitarbeiter greift auf ungewöhnliche Datenbanken zu</li>
                <li>Malware: System kommuniziert mit neuen, ungewöhnlichen IPs</li>
            </ul>
        </div>
        <div>
            <h3>Herausforderung:</h3>
            Braucht Zeit zum Lernen (2-4 Wochen) und kann False Positives erzeugen
        </div>
        <em>UEBA ist "next level" - sehr mächtig, aber komplex!</em>
    </div>

    <div data-tooltip-id="siem-threatintel">
        <h2>Threat Intelligence Integration</h2>
        <p>Integration externer Bedrohungs-Datenbanken.</p>
        <div>
            <h3>Was ist Threat Intelligence?</h3>
            Wissen über aktuelle Bedrohungen - "Steckbriefe" von Angreifern, Malware, C&C-Servern.
        </div>
        <div>
            <h3>Threat Intel Quellen:</h3>
            <ul>
                <li><strong>MISP:</strong> Open Source Threat Sharing Platform</li>
                <li><strong>AlienVault OTX:</strong> Open Threat Exchange (kostenlos)</li>
                <li><strong>Commercial Feeds:</strong> FireEye, CrowdStrike, Recorded Future (teuer, aber sehr aktuell)</li>
                <li><strong>Government:</strong> CERT-Bund, BSI, FBI Feeds</li>
            </ul>
        </div>
        <div>
            <h3>Was wird gematcht:</h3>
            <ul>
                <li>IP-Adressen (bekannte Angreifer-IPs)</li>
                <li>Domains (C&C-Server, Phishing-Sites)</li>
                <li>File-Hashes (bekannte Malware)</li>
                <li>Indicators of Compromise (IoCs)</li>
            </ul>
        </div>
        <div>
            <h3>Beispiel:</h3>
            Firewall-Log zeigt Verbindung zu IP 1.2.3.4 → SIEM matcht gegen Threat Intel → IP ist bekannter C&C-Server → High-Priority Alert!
        </div>
        <em>Threat Intel macht SIEM von reaktiv zu proaktiv!</em>
    </div>

    <div data-tooltip-id="siem-mitre">
        <h2>MITRE ATT&CK Framework</h2>
        <p>Standard-Framework für Angriffs-Taktiken und -Techniken.</p>
        <div>
            <h3>Was ist MITRE ATT&CK?</h3>
            Eine "Enzyklopädie" aller bekannten Angriffstechniken - wie ein "Playbook" von Hackern.
        </div>
        <div>
            <h3>Struktur:</h3>
            <ul>
                <li><strong>Tactics (Taktiken):</strong> Das "Warum" - z.B. "Initial Access", "Persistence", "Exfiltration"</li>
                <li><strong>Techniques (Techniken):</strong> Das "Wie" - z.B. "Spear Phishing", "PowerShell", "Data Encryption"</li>
                <li>14 Taktiken, 200+ Techniken, 600+ Sub-Techniken</li>
            </ul>
        </div>
        <div>
            <h3>Warum im SIEM wichtig:</h3>
            <ul>
                <li>Use Cases nach MITRE kategorisieren</li>
                <li>Sehen wo Lücken sind (Coverage-Matrix)</li>
                <li>Kommunikation mit SOC vereinfachen</li>
                <li>"Wir haben einen T1078 (Valid Accounts) Alert" statt "Login-Problem"</li>
            </ul>
        </div>
        <div>
            <h3>MITRE ATT&CK Navigator:</h3>
            Tool zur Visualisierung der Abdeckung
        </div>
        <em>MITRE ist DIE gemeinsame Sprache im Cyber Security!</em>
    </div>

    <div data-tooltip-id="siem-soar">
        <h2>SOAR Integration</h2>
        <p>Security Orchestration, Automation and Response.</p>
        <div>
            <h3>Was ist SOAR?</h3>
            Automatisierung von Incident-Response-Prozessen - "Roboter für SOC-Analysts".
        </div>
        <div>
            <h3>Was SOAR macht:</h3>
            <ul>
                <li><strong>Orchestration:</strong> Koordiniert Tools (SIEM, EDR, Firewall)</li>
                <li><strong>Automation:</strong> Automatische Reaktion auf Alerts</li>
                <li><strong>Response:</strong> Guided Playbooks für Analysten</li>
            </ul>
        </div>
        <div>
            <h3>Beispiel-Workflow (automatisch):</h3>
            <ol>
                <li>SIEM erkennt Malware auf PC</li>
                <li>SOAR isoliert PC vom Netzwerk (via EDR)</li>
                <li>SOAR blockiert Malware-IP auf Firewall</li>
                <li>SOAR erstellt Ticket in ServiceNow</li>
                <li>SOAR startet Forensik-Sammlung</li>
                <li>SOAR sendet Slack-Nachricht an SOC</li>
            </ol>
        </div>
        <div>
            <h3>SOAR-Plattformen:</h3>
            <ul>
                <li>Splunk SOAR (Phantom)</li>
                <li>Palo Alto Cortex XSOAR (Demisto)</li>
                <li>IBM Resilient</li>
                <li>Swimlane</li>
            </ul>
        </div>
        <div>
            <h3>Vorteil:</h3>
            Reaktionszeit von Stunden auf Sekunden reduzieren!
        </div>
        <em>SOAR = Force Multiplier für kleine SOC-Teams</em>
    </div>

    <div data-tooltip-id="siem-retention">
        <h2>Log-Retention (Aufbewahrung)</h2>
        <p>Wie lange werden Logs gespeichert?</p>
        <div>
            <h3>Compliance-Anforderungen:</h3>
            <ul>
                <li><strong>DSGVO:</strong> Minimal nötig, meist 6-12 Monate</li>
                <li><strong>KRITIS:</strong> Minimum 6 Monate</li>
                <li><strong>PCI DSS:</strong> Minimum 90 Tage online, 1 Jahr Archiv</li>
                <li><strong>SOX:</strong> 7 Jahre für finanzrelevante Logs</li>
                <li><strong>HIPAA:</strong> 6 Jahre für Healthcare</li>
            </ul>
        </div>
        <div>
            <h3>Typische Retention-Strategie:</h3>
            <ul>
                <li><strong>Hot Storage (Online):</strong> 90 Tage - schneller Zugriff</li>
                <li><strong>Warm Storage:</strong> 1 Jahr - langsamerer Zugriff</li>
                <li><strong>Cold Storage (Archiv):</strong> 7 Jahre - Tape/Cloud</li>
            </ul>
        </div>
        <div>
            <h3>Storage-Bedarf:</h3>
            Bei 100 GB/Tag:
            <ul>
                <li>90 Tage = 9 TB</li>
                <li>1 Jahr = 36,5 TB</li>
                <li>7 Jahre = 255 TB (komprimiert ~50 TB)</li>
            </ul>
        </div>
        <em>Längere Retention = mehr Forensik-Möglichkeiten, aber mehr Storage-Kosten!</em>
    </div>

    <div data-tooltip-id="siem-alerting">
        <h2>Alerting & Notification</h2>
        <p>Wie werden Sicherheitsvorfälle kommuniziert?</p>
        <div>
            <h3>Alert-Channels:</h3>
            <ul>
                <li><strong>E-Mail:</strong> Standard, aber langsam</li>
                <li><strong>SMS:</strong> Für kritische Alerts (Kosten!)</li>
                <li><strong>Slack / MS Teams:</strong> Modern, schnell, Team-Kollaboration</li>
                <li><strong>Webhook:</strong> Integration mit anderen Tools</li>
                <li><strong>SIEM Dashboard:</strong> Zentrale Übersicht</li>
            </ul>
        </div>
        <div>
            <h3>Alert-Fatigue Problem:</h3>
            <ul>
                <li>Zu viele Alerts = werden ignoriert</li>
                <li>Typisch: 90%+ False Positives am Anfang</li>
                <li>Tuning nötig: Schwellwerte anpassen, Whitelists</li>
            </ul>
        </div>
        <div>
            <h3>Alert-Priorisierung:</h3>
            <ul>
                <li><strong>Critical:</strong> SMS + Anruf (z.B. Ransomware)</li>
                <li><strong>High:</strong> Slack + Ticket (z.B. Brute-Force)</li>
                <li><strong>Medium:</strong> Nur Dashboard (z.B. Policy-Violation)</li>
                <li><strong>Low:</strong> Nur Logging (z.B. Information)</li>
            </ul>
        </div>
        <em>Gutes SIEM: 10-50 Alerts/Tag, nicht 1000!</em>
    </div>

    <div data-tooltip-id="siem-soc">
        <h2>SOC (Security Operations Center)</h2>
        <p>Das Team, das das SIEM überwacht.</p>
        <div>
            <h3>Was ist ein SOC?</h3>
            Das "Kontrollzentrum" für IT-Sicherheit - Analysten überwachen SIEM 24/7.
        </div>
        <div>
            <h3>SOC-Typen:</h3>
            <ul>
                <li><strong>Internes SOC:</strong>
                    <ul>
                        <li>Eigene Mitarbeiter</li>
                        <li>Im eigenen Rechenzentrum</li>
                        <li>Volle Kontrolle</li>
                        <li>Teuer (3-4 FTE für 24/7)</li>
                    </ul>
                </li>
                <li><strong>Externes SOC / MSSP:</strong>
                    <ul>
                        <li>Managed Security Service Provider</li>
                        <li>Outsourcing der Überwachung</li>
                        <li>24/7 ohne eigenes Personal</li>
                        <li>Günstiger, aber weniger Kontrolle</li>
                    </ul>
                </li>
                <li><strong>Hybrid:</strong>
                    <ul>
                        <li>MSSP für 24/7-Überwachung</li>
                        <li>Internes Team für Tier-2/3 und Incident Response</li>
                        <li>Guter Kompromiss</li>
                    </ul>
                </li>
            </ul>
        </div>
        <div>
            <h3>SOC-Betriebszeiten:</h3>
            <ul>
                <li><strong>24/7:</strong> Für kritische Infrastruktur (KRITIS) - <em>ideal</em></li>
                <li><strong>8x5:</strong> Nur Geschäftszeiten - günstiger, aber Lücken</li>
                <li><strong>Extended Hours:</strong> Z.B. 6-22 Uhr - Kompromiss</li>
            </ul>
        </div>
        <em>Ohne SOC ist SIEM nur teures Log-Storage - jemand muss die Alerts bearbeiten!</em>
    </div>

    <div data-tooltip-id="siem-notes">
        <h2>Notizen / SIEM-Besonderheiten</h2>
        <p>Zusätzliche wichtige Informationen zum SIEM-System.</p>
        <div>
            <h3>Was dokumentieren:</h3>
            <ul>
                <li>Spezielle Use Cases und Custom Rules</li>
                <li>Tuning-Historie (welche Regeln wurden angepasst)</li>
                <li>Bekannte False Positives und Whitelists</li>
                <li>Integration-Besonderheiten (Probleme mit bestimmten Log-Quellen)</li>
                <li>Performance-Probleme und Lösungen</li>
                <li>Geplante Erweiterungen (neue Log-Quellen)</li>
                <li>SOC-Prozesse und Playbooks</li>
                <li>Eskalations-Pfade</li>
            </ul>
        </div>
        <div>
            <h3>Beispiel:</h3>
            "Splunk Enterprise Security 7.1 on-premise. 150 Log-Quellen, ~3.500 EPS Average, Peaks 8.000 EPS. 180 Tage Hot Storage (15 TB), 2 Jahre Cold (Tape). 127 aktive Use Cases, Coverage 85% MITRE ATT&CK Tactics. UEBA aktiviert für AD-Accounts. Threat Intel: MISP + AlienVault OTX + FireEye (Commercial). SOAR: Splunk Phantom mit 23 Playbooks. Bekannte Issues: Windows DNS Logs erzeugen viele False Positives → gefiltert nach Whitelist. O365-Integration über MS Graph API (Rate-Limit beachten!). SOC: Hybrid - MSSP für L1 24/7 (SecureWorks), internes Team für L2/L3 (8x5). Kritische Alerts: Slack #security-alerts + SMS an On-Call. Eskalation: CISO bei Critical Incidents. Backup: Täglich nach S3, Tests quartalsweise."
        </div>
        <em>SIEM-Dokumentation ist essentiell - bei Incident keine Zeit zum Rätseln!</em>
    </div>
    
</div>
