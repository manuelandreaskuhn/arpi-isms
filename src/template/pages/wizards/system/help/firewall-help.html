<div class="tooltip-definitions" style="display: none;">
    <div data-tooltip-id="firewall-selection">
        <h2>Zentrale Firewall</h2>
        <p>Die Firewall-Appliance oder der Firewall-Dienst, auf dem diese Regel konfiguriert wird.</p>
        <div>
            <h3>Was ist eine Firewall?</h3>
            Eine Firewall ist wie ein Türsteher für Ihr Netzwerk - sie entscheidet, wer rein und raus darf.
        </div>
        <div>
            <h3>Typen von Firewalls:</h3>
            <ul>
                <li><strong>Perimeter Firewall:</strong> Schützt die Grenze zum Internet</li>
                <li><strong>Internal Firewall:</strong> Trennt verschiedene Bereiche im internen Netzwerk</li>
                <li><strong>DMZ Firewall:</strong> Schützt die DMZ (Demilitarisierte Zone)</li>
            </ul>
        </div>
        <div>
            <h3>Beispiele:</h3>
            <ul>
                <li>"FW-DMZ-01" - Firewall zwischen Internet und DMZ</li>
                <li>"FW-Internal-01" - Interne Segmentierungs-Firewall</li>
                <li>"FW-Datacenter-01" - Firewall vor dem Rechenzentrum</li>
            </ul>
        </div>
        <em>Die Firewall muss vorher als Komponente angelegt worden sein</em>
    </div>

    <div data-tooltip-id="rule-name">
        <h2>Regelname / Policy</h2>
        <p>Ein beschreibender Name für diese Firewall-Regel.</p>
        <div>
            <h3>Best Practices für Namen:</h3>
            <ul>
                <li>Beschreiben Sie die Funktion der Regel</li>
                <li>Verwenden Sie ein konsistentes Schema</li>
                <li>Vermeiden Sie Sonderzeichen</li>
            </ul>
        </div>
        <div>
            <h3>Namens-Schema Beispiele:</h3>
            <ul>
                <li><strong>[Aktion]-[Quelle]-[Ziel]-[Service]</strong>
                    <ul>
                        <li>"Allow-Clients-KIS-HTTPS"</li>
                        <li>"Deny-External-Internal-All"</li>
                    </ul>
                </li>
                <li><strong>[Zweck]-[Nummer]</strong>
                    <ul>
                        <li>"KIS-Zugriff-001"</li>
                        <li>"PACS-Routing-002"</li>
                    </ul>
                </li>
            </ul>
        </div>
        <em>Gute Namen helfen später beim Troubleshooting!</em>
    </div>

    <div data-tooltip-id="rule-priority">
        <h2>Regel-Priorität</h2>
        <p>Die Reihenfolge, in der Firewall-Regeln geprüft werden.</p>
        <div>
            <h3>Wie funktioniert das?</h3>
            Die Firewall prüft Regeln von oben nach unten (oder niedrigste zu höchster Prioritätszahl). Die ERSTE passende Regel wird angewendet!
        </div>
        <div>
            <h3>Wichtig:</h3>
            Spezifische Regeln müssen VOR allgemeinen Regeln stehen!
        </div>
        <div>
            <h3>Typisches Schema:</h3>
            <ul>
                <li><strong>1-99:</strong> Spezielle Ausnahmen, Deny-Regeln für kritische Systeme</li>
                <li><strong>100-999:</strong> Standard Allow-Regeln</li>
                <li><strong>1000-9999:</strong> Allgemeine Regeln</li>
                <li><strong>10000+:</strong> Catch-All, Default-Deny</li>
            </ul>
        </div>
        <div>
            <h3>Beispiel:</h3>
            <ul>
                <li>Priorität 10: "Deny-External-Database" (spezifisch!)</li>
                <li>Priorität 100: "Allow-Clients-Web" (allgemeiner)</li>
                <li>Priorität 10000: "Deny-All" (ganz am Ende)</li>
            </ul>
        </div>
        <em>Niedrigere Zahl = höhere Priorität = wird zuerst geprüft</em>
    </div>

    <div data-tooltip-id="source-zone">
        <h2>Quell-Zone</h2>
        <p>Die Netzwerk-Zone, aus der der Traffic kommt.</p>
        <div>
            <h3>Was ist eine Zone?</h3>
            Eine logische Gruppierung von Netzwerk-Bereichen mit ähnlichem Sicherheitslevel.
        </div>
        <div>
            <h3>Typische Zonen:</h3>
            <ul>
                <li><strong>Internal / Inside:</strong> Internes vertrauenswürdiges Netzwerk</li>
                <li><strong>DMZ:</strong> Demilitarisierte Zone (halb-öffentliche Server)</li>
                <li><strong>External / Outside / Internet:</strong> Öffentliches Internet (nicht vertrauenswürdig)</li>
                <li><strong>Management:</strong> Management-Netzwerk für Administratoren</li>
                <li><strong>Guest:</strong> Gäste-WLAN</li>
                <li><strong>any:</strong> Beliebige Zone (Vorsicht bei Verwendung!)</li>
            </ul>
        </div>
        <div>
            <h3>Sicherheitsregeln:</h3>
            <ul>
                <li>Internal → DMZ: Erlaubt (sichere zu weniger sicher)</li>
                <li>DMZ → Internal: Kontrolliert/Eingeschränkt</li>
                <li>External → Internal: Meist verboten!</li>
            </ul>
        </div>
        <em>Zonen helfen, Sicherheitsrichtlinien durchzusetzen</em>
    </div>

    <div data-tooltip-id="dest-zone">
        <h2>Ziel-Zone</h2>
        <p>Die Netzwerk-Zone, in die der Traffic geht.</p>
        <div>
            <h3>Typische Traffic-Richtungen:</h3>
            <ul>
                <li><strong>Internal → External:</strong> Internet-Zugriff von innen</li>
                <li><strong>External → DMZ:</strong> Internet-Zugriff auf Web-Server in DMZ</li>
                <li><strong>Internal → DMZ:</strong> Interne Nutzer greifen auf DMZ-Services zu</li>
                <li><strong>DMZ → Internal:</strong> DMZ-Server greifen auf interne Datenbank zu (restriktiv!)</li>
            </ul>
        </div>
        <div>
            <h3>Sicherheitsprinzip:</h3>
            Von sicherer zu unsicherer Zone = großzügiger. Von unsicherer zu sicherer = restriktiver!
        </div>
    </div>

    <div data-tooltip-id="source-address">
        <h2>Quell-Adresse(n)</h2>
        <p>Die IP-Adresse oder das Netzwerk, von dem der Traffic ausgeht.</p>
        <div>
            <h3>Mögliche Angaben:</h3>
            <ul>
                <li><strong>Einzelne IP:</strong> 10.0.1.100</li>
                <li><strong>IP-Bereich (CIDR):</strong> 10.0.1.0/24 (alle IPs von .0 bis .255)</li>
                <li><strong>Objekt-Name:</strong> "Client-Network", "Doctor-PCs"</li>
                <li><strong>Mehrere Adressen:</strong> 10.0.1.100, 10.0.1.101</li>
                <li><strong>any:</strong> Beliebige Quelle (Vorsicht!)</li>
            </ul>
        </div>
        <div>
            <h3>CIDR-Notation erklärt:</h3>
            <ul>
                <li>/32 = eine einzelne IP (z.B. 10.0.1.100/32)</li>
                <li>/24 = 256 IPs (z.B. 10.0.1.0/24 = .0 bis .255)</li>
                <li>/16 = 65.536 IPs (z.B. 10.0.0.0/16)</li>
                <li>/8 = 16,7 Mio IPs (z.B. 10.0.0.0/8)</li>
            </ul>
        </div>
        <em>Tipp: Verwenden Sie Objekt-Namen statt IPs - einfacher zu verwalten!</em>
    </div>

    <div data-tooltip-id="dest-address">
        <h2>Ziel-Adresse(n)</h2>
        <p>Die IP-Adresse oder das Netzwerk, zu dem der Traffic geht.</p>
        <div>
            <h3>Beispiele im Krankenhaus:</h3>
            <ul>
                <li>"172.16.1.10" - KIS-Server</li>
                <li>"192.168.100.0/24" - PACS-Netzwerk</li>
                <li>"KIS-Server-Group" - Objekt mit mehreren Servern</li>
                <li>"DMZ-Webserver" - Web-Server in DMZ</li>
            </ul>
        </div>
        <div>
            <h3>Best Practice:</h3>
            Erstellen Sie Adress-Objekte für wiederkehrende Ziele (z.B. "KIS-Cluster", "DB-Server-Pool")
        </div>
    </div>

    <div data-tooltip-id="service-port">
        <h2>Service / Ports</h2>
        <p>Der Netzwerk-Dienst oder Port, der erlaubt/blockiert werden soll.</p>
        <div>
            <h3>Verschiedene Angabe-Formate:</h3>
            <ul>
                <li><strong>Service-Name:</strong> HTTPS, SSH, RDP, DNS</li>
                <li><strong>Protokoll/Port:</strong> TCP/443, UDP/53, TCP/3389</li>
                <li><strong>Port-Bereich:</strong> TCP/8000-8999</li>
                <li><strong>Service-Objekt:</strong> "KIS-Services" (Gruppe mehrerer Ports)</li>
            </ul>
        </div>
        <div>
            <h3>Wichtige Standard-Ports:</h3>
            <ul>
                <li><strong>TCP/443:</strong> HTTPS (Web verschlüsselt)</li>
                <li><strong>TCP/80:</strong> HTTP (Web unverschlüsselt)</li>
                <li><strong>TCP/22:</strong> SSH (Secure Shell)</li>
                <li><strong>TCP/3389:</strong> RDP (Remote Desktop)</li>
                <li><strong>TCP/1433:</strong> MS SQL Server</li>
                <li><strong>TCP/1521:</strong> Oracle Database</li>
                <li><strong>UDP/53:</strong> DNS</li>
                <li><strong>TCP/587:</strong> SMTP (E-Mail)</li>
            </ul>
        </div>
        <em>Wichtig: Nur die wirklich benötigten Ports freigeben (Principle of Least Privilege)!</em>
    </div>

    <div data-tooltip-id="rule-action">
        <h2>Regel-Aktion</h2>
        <p>Was soll mit dem Traffic passieren?</p>
        <div>
            <h3>Aktionen erklärt:</h3>
            <ul>
                <li><strong>Allow / Permit:</strong>
                    <ul>
                        <li>Traffic wird durchgelassen</li>
                        <li>Normale Verbindung wird aufgebaut</li>
                        <li>Verwenden für legitimen Traffic</li>
                    </ul>
                </li>
                <li><strong>Deny / Block / Drop:</strong>
                    <ul>
                        <li>Traffic wird verworfen (ohne Antwort)</li>
                        <li>Sender bekommt KEINE Fehlermeldung</li>
                        <li>Wirkt als ob Ziel nicht existiert</li>
                        <li><em>Empfohlen für externe Angreifer - keine Info preisgeben!</em></li>
                    </ul>
                </li>
                <li><strong>Reject:</strong>
                    <ul>
                        <li>Traffic wird blockiert MIT Fehlermeldung</li>
                        <li>Sender bekommt "Connection refused" oder ICMP-Fehler</li>
                        <li>Schnellere Erkennung für legitime Clients</li>
                        <li>Verwendet intern, NICHT für externe Blockierungen</li>
                    </ul>
                </li>
                <li><strong>Inspect / Deep Packet Inspection:</strong>
                    <ul>
                        <li>Traffic wird durchgelassen UND auf Inhalt geprüft</li>
                        <li>Schutz vor Malware, Exploits, Datenlecks</li>
                        <li>Kostet Performance</li>
                        <li>Für kritische oder risikoreiche Verbindungen</li>
                    </ul>
                </li>
            </ul>
        </div>
        <div>
            <h3>Faustregel:</h3>
            <ul>
                <li>Intern → Extern: Allow (mit Inspect bei Bedarf)</li>
                <li>Extern → Intern: Meistens Deny</li>
                <li>Spezifische Services: Allow mit Logging</li>
            </ul>
        </div>
    </div>

    <div data-tooltip-id="rule-logging">
        <h2>Logging</h2>
        <p>Wie detailliert soll diese Regel protokolliert werden?</p>
        <div>
            <h3>Logging-Optionen:</h3>
            <ul>
                <li><strong>Alle Pakete loggen:</strong>
                    <ul>
                        <li>Jedes einzelne Paket wird protokolliert</li>
                        <li>Sehr detailliert, aber RIESIGE Log-Dateien!</li>
                        <li>Nur für Troubleshooting kurzfristig aktivieren</li>
                    </ul>
                </li>
                <li><strong>Session Start:</strong>
                    <ul>
                        <li>Nur Beginn einer Verbindung wird geloggt</li>
                        <li>Gut für Audit-Zwecke</li>
                        <li>Moderate Log-Größe</li>
                        <li><em>Empfohlen für wichtige Allow-Regeln</em></li>
                    </ul>
                </li>
                <li><strong>Session End:</strong>
                    <ul>
                        <li>Nur Ende der Verbindung mit Statistik</li>
                        <li>Zeigt Datenvolumen und Dauer</li>
                        <li>Gut für Analyse</li>
                    </ul>
                </li>
                <li><strong>Kein Logging:</strong>
                    <ul>
                        <li>Keine Protokollierung</li>
                        <li>Für Massendaten (z.B. Internet-Browsing aller Nutzer)</li>
                        <li>Spart Speicher und Performance</li>
                    </ul>
                </li>
            </ul>
        </div>
        <div>
            <h3>Best Practice:</h3>
            <ul>
                <li>Deny-Regeln: IMMER loggen!</li>
                <li>Kritische Allow-Regeln: Session Start loggen</li>
                <li>Standard-Internet: Kein oder minimales Logging</li>
            </ul>
        </div>
        <em>Logs helfen bei Fehlersuche und Sicherheits-Audits!</em>
    </div>

    <div data-tooltip-id="rule-status">
        <h2>Regel-Status</h2>
        <p>Ist die Regel aktuell aktiv?</p>
        <div>
            <h3>Status-Optionen:</h3>
            <ul>
                <li><strong>Aktiviert:</strong> Regel ist aktiv und wird angewendet</li>
                <li><strong>Deaktiviert:</strong> Regel existiert, wird aber nicht angewendet (für Tests oder temporäre Deaktivierung)</li>
                <li><strong>Zeitgesteuert:</strong> Regel ist nur zu bestimmten Zeiten aktiv (siehe Zeitplan-Feld)</li>
            </ul>
        </div>
        <div>
            <h3>Wann deaktivieren?</h3>
            <ul>
                <li>Troubleshooting (Regel könnte Problem verursachen)</li>
                <li>Wartung</li>
                <li>Temporäre Änderungen testen</li>
            </ul>
        </div>
        <em>Tipp: Deaktivierte Regeln nach einiger Zeit löschen, wenn nicht mehr benötigt!</em>
    </div>

    <div data-tooltip-id="nat-enabled">
        <h2>NAT aktivieren</h2>
        <p>Network Address Translation - Übersetzung von IP-Adressen.</p>
        <div>
            <h3>Was ist NAT?</h3>
            NAT ändert die Quell- oder Ziel-IP-Adresse von Netzwerk-Paketen. Wie ein Übersetzer für IP-Adressen.
        </div>
        <div>
            <h3>Wofür braucht man NAT?</h3>
            <ul>
                <li>Mehrere Geräte teilen sich eine öffentliche IP</li>
                <li>Verstecken interner IPs nach außen (Sicherheit)</li>
                <li>Port-Weiterleitung (z.B. Port 443 → interner Server)</li>
                <li>Server hat private IP, soll aber öffentlich erreichbar sein</li>
            </ul>
        </div>
        <div>
            <h3>Wann NAT aktivieren?</h3>
            <ul>
                <li>Internet-Zugriff von internem Netzwerk</li>
                <li>Externe Zugriffe auf interne Server (Port-Forwarding)</li>
                <li>DMZ-Server mit privaten IPs</li>
            </ul>
        </div>
        <em>Nicht jede Regel braucht NAT - nur bei Adress-Übersetzung nötig!</em>
    </div>

    <div data-tooltip-id="nat-type">
        <h2>NAT-Typ</h2>
        <p>Die Art der Adress-Übersetzung.</p>
        <div>
            <h3>NAT-Typen erklärt:</h3>
            <ul>
                <li><strong>Source NAT (SNAT):</strong>
                    <ul>
                        <li>Ändert die QUELL-IP-Adresse</li>
                        <li>Typisch: Interne Clients → Internet</li>
                        <li>Beispiel: 10.0.1.100 → 203.0.113.10 (öffentliche IP)</li>
                        <li><em>Standard für Internet-Zugriff!</em></li>
                    </ul>
                </li>
                <li><strong>Destination NAT (DNAT):</strong>
                    <ul>
                        <li>Ändert die ZIEL-IP-Adresse</li>
                        <li>Typisch: Internet → interner Server</li>
                        <li>Beispiel: Anfrage an 203.0.113.10 → wird zu 10.0.1.100</li>
                        <li>Für öffentlich erreichbare Services</li>
                    </ul>
                </li>
                <li><strong>PAT (Port Address Translation):</strong>
                    <ul>
                        <li>Wie SNAT, aber MIT Port-Änderung</li>
                        <li>Viele interne IPs teilen sich EINE öffentliche IP</li>
                        <li>Unterscheidung über verschiedene Ports</li>
                        <li>Standard für Firmen mit wenigen öffentlichen IPs</li>
                    </ul>
                </li>
                <li><strong>Static NAT (1:1):</strong>
                    <ul>
                        <li>Feste Zuordnung: interne IP ↔ öffentliche IP</li>
                        <li>Immer die gleiche Übersetzung</li>
                        <li>Für Server, die immer erreichbar sein müssen</li>
                    </ul>
                </li>
            </ul>
        </div>
        <div>
            <h3>Entscheidungshilfe:</h3>
            <ul>
                <li>Clients ins Internet → SNAT oder PAT</li>
                <li>Web-Server von außen erreichbar → DNAT</li>
                <li>Server braucht feste öffentliche IP → Static NAT</li>
            </ul>
        </div>
    </div>

    <div data-tooltip-id="nat-pool">
        <h2>NAT Pool / Adresse</h2>
        <p>Die IP-Adresse(n), auf die übersetzt wird.</p>
        <div>
            <h3>Optionen:</h3>
            <ul>
                <li><strong>Einzelne IP:</strong> 203.0.113.10 - alle Verbindungen nutzen diese IP</li>
                <li><strong>IP-Pool:</strong> "NAT-Pool-1" - Gruppe von mehreren öffentlichen IPs</li>
                <li><strong>Interface-IP:</strong> IP des ausgehenden Firewall-Interfaces (automatisch)</li>
            </ul>
        </div>
        <div>
            <h3>Beispiele:</h3>
            <ul>
                <li>Für Internet-Zugriff: Öffentliche IP Ihrer Firewall</li>
                <li>Für Load-Balancing: Pool von mehreren IPs</li>
                <li>Für DMZ-Server: Dedizierte öffentliche IP pro Server</li>
            </ul>
        </div>
    </div>

    <div data-tooltip-id="nat-original">
        <h2>Original IP/Port</h2>
        <p>Die ursprüngliche (interne) IP-Adresse und Port VOR der Übersetzung.</p>
        <div>
            <h3>Format:</h3>
            IP:Port oder nur IP
        </div>
        <div>
            <h3>Beispiele:</h3>
            <ul>
                <li>"10.0.1.100:8080" - Interner Web-Server auf Port 8080</li>
                <li>"192.168.1.50:3389" - Interner RDP-Server</li>
                <li>"172.16.1.10" - Server (alle Ports)</li>
            </ul>
        </div>
        <em>Dies ist, was intern existiert - nicht von außen sichtbar</em>
    </div>

    <div data-tooltip-id="nat-translated">
        <h2>Translated IP/Port</h2>
        <p>Die übersetzte (öffentliche) IP-Adresse und Port NACH der Übersetzung.</p>
        <div>
            <h3>Beispiele:</h3>
            <ul>
                <li>"203.0.113.10:443" - Öffentliche IP auf HTTPS-Port</li>
                <li>"203.0.113.10:80" - Öffentliche IP auf HTTP-Port</li>
            </ul>
        </div>
        <div>
            <h3>Typisches Beispiel (Port-Forwarding):</h3>
            <ul>
                <li>Original: 10.0.1.100:8080 (intern)</li>
                <li>Translated: 203.0.113.10:443 (öffentlich)</li>
                <li>Ergebnis: Anfragen an öffentliche-IP:443 landen bei interner-Server:8080</li>
            </ul>
        </div>
        <em>Dies sehen externe Clients - die "Außenansicht"</em>
    </div>

    <div data-tooltip-id="fw-host-assignment">
        <h2>Zugeordnete VMs / Server</h2>
        <p>Optional: Dokumentation, welche Server von dieser Regel betroffen sind.</p>
        <div>
            <h3>Warum dokumentieren?</h3>
            <ul>
                <li>Schnelles Verständnis: Welche Server nutzen diese Regel?</li>
                <li>Impact-Analyse: Was passiert bei Regeländerung?</li>
                <li>Audits und Compliance</li>
                <li>Troubleshooting</li>
            </ul>
        </div>
        <div>
            <h3>Beispiel:</h3>
            Regel "Allow-Clients-KIS" → zugeordnet zu "KIS-Server-01", "KIS-Server-02"
        </div>
        <em>Hilft dem nächsten Admin zu verstehen, wofür die Regel ist!</em>
    </div>

    <div data-tooltip-id="valid-from">
        <h2>Gültig von</h2>
        <p>Ab wann ist die Regel aktiv?</p>
        <div>
            <h3>Verwendung:</h3>
            <ul>
                <li>Für geplante Änderungen im Voraus konfigurieren</li>
                <li>Temporäre Zugänge (z.B. für Projekt)</li>
                <li>Compliance-Dokumentation</li>
            </ul>
        </div>
        <div>
            <h3>Beispiele:</h3>
            <ul>
                <li>"01.01.2024" - Ab Neujahr</li>
                <li>"sofort" oder leer - Ab jetzt</li>
                <li>"15.03.2024 09:00" - Spezifischer Zeitpunkt</li>
            </ul>
        </div>
    </div>

    <div data-tooltip-id="valid-to">
        <h2>Gültig bis</h2>
        <p>Bis wann ist die Regel aktiv?</p>
        <div>
            <h3>Verwendung:</h3>
            <ul>
                <li>Temporäre Zugänge (z.B. externe Dienstleister)</li>
                <li>Projekt-bezogene Regeln</li>
                <li>Automatisches Ablaufen von Sonderfreigaben</li>
            </ul>
        </div>
        <div>
            <h3>Beispiele:</h3>
            <ul>
                <li>"31.12.2024" - Bis Jahresende</li>
                <li>"unbegrenzt" oder leer - Kein Enddatum</li>
                <li>"+30 Tage" - 30 Tage ab Aktivierung</li>
            </ul>
        </div>
        <em>Sicherheits-Tipp: Temporäre Regeln automatisch ablaufen lassen!</em>
    </div>

    <div data-tooltip-id="schedule">
        <h2>Zeitplan</h2>
        <p>Zeitfenster, in dem die Regel aktiv ist (innerhalb der Gültigkeitsdauer).</p>
        <div>
            <h3>Anwendungsfälle:</h3>
            <ul>
                <li>Zugriffe nur während Geschäftszeiten</li>
                <li>Nachts restriktivere Regeln</li>
                <li>Wartungsfenster-Zugänge</li>
            </ul>
        </div>
        <div>
            <h3>Beispiele:</h3>
            <ul>
                <li>"Mo-Fr 08:00-18:00" - Wochentags, Geschäftszeiten</li>
                <li>"24/7" oder leer - Immer aktiv</li>
                <li>"Sa-So" - Nur am Wochenende</li>
                <li>"Mo-Fr 22:00-06:00" - Nachts unter der Woche</li>
            </ul>
        </div>
        <div>
            <h3>Beispiel-Szenario:</h3>
            Externe Dienstleister dürfen nur Mo-Fr 09-17 Uhr auf Wartungs-Server zugreifen
        </div>
    </div>

    <div data-tooltip-id="justification">
        <h2>Business Justification</h2>
        <p>Die geschäftliche Begründung: WARUM existiert diese Regel?</p>
        <div>
            <h3>Wichtig für:</h3>
            <ul>
                <li>Audits und Compliance</li>
                <li>Nachvollziehbarkeit</li>
                <li>Entscheidung über Beibehaltung/Löschung</li>
                <li>Change-Management</li>
            </ul>
        </div>
        <div>
            <h3>Gute Begründungen enthalten:</h3>
            <ul>
                <li>Welche Benutzergruppe</li>
                <li>Welchen Zugriff</li>
                <li>Zu welchem Zweck</li>
                <li>Wer hat's genehmigt (optional)</li>
            </ul>
        </div>
        <div>
            <h3>Beispiele:</h3>
            <ul>
                <li>"Zugriff für Ärzte-Arbeitsplätze auf KIS-Produktiv-Server (HTTPS) - Standard-Betrieb"</li>
                <li>"PACS-Viewer benötigt Zugriff auf PACS-Archiv-Server (DICOM) - Bildabruf"</li>
                <li>"Externe Wartungsfirma XY benötigt RDP-Zugriff auf Backup-Server - Wartungsvertrag #12345"</li>
            </ul>
        </div>
        <em>Eine Regel ohne Begründung sollte überprüft werden!</em>
    </div>

    <div data-tooltip-id="fw-notes">
        <h2>Notizen / Regeldetails</h2>
        <p>Zusätzliche wichtige Informationen zu dieser Regel.</p>
        <div>
            <h3>Was hier dokumentieren:</h3>
            <ul>
                <li>Change-Ticket oder Genehmigungsnummer</li>
                <li>Kontaktperson / Anforderer</li>
                <li>Besondere Konfigurationen</li>
                <li>Bekannte Probleme</li>
                <li>Geplante Änderungen</li>
                <li>Zusammenhang mit anderen Regeln</li>
            </ul>
        </div>
        <div>
            <h3>Beispiel:</h3>
            "Erstellt: 15.01.2024, Change-Ticket CHG00012345. Angefordert von Dr. Müller (Radiologie). Wichtig: Regel muss vor 'Deny-All-DMZ' (Prio 1000) stehen. Bei Performance-Problemen: Inspect deaktivieren. Review: jährlich im Q1"
        </div>
        <em>Gute Dokumentation spart Zeit beim Troubleshooting!</em>
    </div>
</div>
