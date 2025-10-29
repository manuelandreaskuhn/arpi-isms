<div class="tooltip-definitions" style="display: none;">
    <div data-tooltip-id="firewall-selection">
        <strong>Zentrale Firewall</strong>
        <p>Die Firewall-Appliance oder der Firewall-Dienst, auf dem diese Regel konfiguriert wird.</p>
        <p><strong>Was ist eine Firewall?</strong> Eine Firewall ist wie ein Türsteher für Ihr Netzwerk - sie entscheidet, wer rein und raus darf.</p>
        <p><strong>Typen von Firewalls:</strong></p>
        <ul>
            <li><strong>Perimeter Firewall:</strong> Schützt die Grenze zum Internet</li>
            <li><strong>Internal Firewall:</strong> Trennt verschiedene Bereiche im internen Netzwerk</li>
            <li><strong>DMZ Firewall:</strong> Schützt die DMZ (Demilitarisierte Zone)</li>
        </ul>
        <p><strong>Beispiele:</strong></p>
        <ul>
            <li>"FW-DMZ-01" - Firewall zwischen Internet und DMZ</li>
            <li>"FW-Internal-01" - Interne Segmentierungs-Firewall</li>
            <li>"FW-Datacenter-01" - Firewall vor dem Rechenzentrum</li>
        </ul>
        <em>Die Firewall muss vorher als Komponente angelegt worden sein</em>
    </div>

    <div data-tooltip-id="rule-name">
        <strong>Regelname / Policy</strong>
        <p>Ein beschreibender Name für diese Firewall-Regel.</p>
        <p><strong>Best Practices für Namen:</strong></p>
        <ul>
            <li>Beschreiben Sie die Funktion der Regel</li>
            <li>Verwenden Sie ein konsistentes Schema</li>
            <li>Vermeiden Sie Sonderzeichen</li>
        </ul>
        <p><strong>Namens-Schema Beispiele:</strong></p>
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
        <em>Gute Namen helfen später beim Troubleshooting!</em>
    </div>

    <div data-tooltip-id="rule-priority">
        <strong>Regel-Priorität</strong>
        <p>Die Reihenfolge, in der Firewall-Regeln geprüft werden.</p>
        <p><strong>Wie funktioniert das?</strong> Die Firewall prüft Regeln von oben nach unten (oder niedrigste zu höchster Prioritätszahl). Die ERSTE passende Regel wird angewendet!</p>
        <p><strong>Wichtig:</strong> Spezifische Regeln müssen VOR allgemeinen Regeln stehen!</p>
        <p><strong>Typisches Schema:</strong></p>
        <ul>
            <li><strong>1-99:</strong> Spezielle Ausnahmen, Deny-Regeln für kritische Systeme</li>
            <li><strong>100-999:</strong> Standard Allow-Regeln</li>
            <li><strong>1000-9999:</strong> Allgemeine Regeln</li>
            <li><strong>10000+:</strong> Catch-All, Default-Deny</li>
        </ul>
        <p><strong>Beispiel:</strong></p>
        <ul>
            <li>Priorität 10: "Deny-External-Database" (spezifisch!)</li>
            <li>Priorität 100: "Allow-Clients-Web" (allgemeiner)</li>
            <li>Priorität 10000: "Deny-All" (ganz am Ende)</li>
        </ul>
        <em>Niedrigere Zahl = höhere Priorität = wird zuerst geprüft</em>
    </div>

    <div data-tooltip-id="source-zone">
        <strong>Quell-Zone</strong>
        <p>Die Netzwerk-Zone, aus der der Traffic kommt.</p>
        <p><strong>Was ist eine Zone?</strong> Eine logische Gruppierung von Netzwerk-Bereichen mit ähnlichem Sicherheitslevel.</p>
        <p><strong>Typische Zonen:</strong></p>
        <ul>
            <li><strong>Internal / Inside:</strong> Internes vertrauenswürdiges Netzwerk</li>
            <li><strong>DMZ:</strong> Demilitarisierte Zone (halb-öffentliche Server)</li>
            <li><strong>External / Outside / Internet:</strong> Öffentliches Internet (nicht vertrauenswürdig)</li>
            <li><strong>Management:</strong> Management-Netzwerk für Administratoren</li>
            <li><strong>Guest:</strong> Gäste-WLAN</li>
            <li><strong>any:</strong> Beliebige Zone (Vorsicht bei Verwendung!)</li>
        </ul>
        <p><strong>Sicherheitsregeln:</strong></p>
        <ul>
            <li>Internal → DMZ: Erlaubt (sichere zu weniger sicher)</li>
            <li>DMZ → Internal: Kontrolliert/Eingeschränkt</li>
            <li>External → Internal: Meist verboten!</li>
        </ul>
        <em>Zonen helfen, Sicherheitsrichtlinien durchzusetzen</em>
    </div>

    <div data-tooltip-id="dest-zone">
        <strong>Ziel-Zone</strong>
        <p>Die Netzwerk-Zone, in die der Traffic geht.</p>
        <p><strong>Typische Traffic-Richtungen:</strong></p>
        <ul>
            <li><strong>Internal → External:</strong> Internet-Zugriff von innen</li>
            <li><strong>External → DMZ:</strong> Internet-Zugriff auf Web-Server in DMZ</li>
            <li><strong>Internal → DMZ:</strong> Interne Nutzer greifen auf DMZ-Services zu</li>
            <li><strong>DMZ → Internal:</strong> DMZ-Server greifen auf interne Datenbank zu (restriktiv!)</li>
        </ul>
        <p><strong>Sicherheitsprinzip:</strong> Von sicherer zu unsicherer Zone = großzügiger. Von unsicherer zu sicherer = restriktiver!</p>
    </div>

    <div data-tooltip-id="source-address">
        <strong>Quell-Adresse(n)</strong>
        <p>Die IP-Adresse oder das Netzwerk, von dem der Traffic ausgeht.</p>
        <p><strong>Mögliche Angaben:</strong></p>
        <ul>
            <li><strong>Einzelne IP:</strong> 10.0.1.100</li>
            <li><strong>IP-Bereich (CIDR):</strong> 10.0.1.0/24 (alle IPs von .0 bis .255)</li>
            <li><strong>Objekt-Name:</strong> "Client-Network", "Doctor-PCs"</li>
            <li><strong>Mehrere Adressen:</strong> 10.0.1.100, 10.0.1.101</li>
            <li><strong>any:</strong> Beliebige Quelle (Vorsicht!)</li>
        </ul>
        <p><strong>CIDR-Notation erklärt:</strong></p>
        <ul>
            <li>/32 = eine einzelne IP (z.B. 10.0.1.100/32)</li>
            <li>/24 = 256 IPs (z.B. 10.0.1.0/24 = .0 bis .255)</li>
            <li>/16 = 65.536 IPs (z.B. 10.0.0.0/16)</li>
            <li>/8 = 16,7 Mio IPs (z.B. 10.0.0.0/8)</li>
        </ul>
        <em>Tipp: Verwenden Sie Objekt-Namen statt IPs - einfacher zu verwalten!</em>
    </div>

    <div data-tooltip-id="dest-address">
        <strong>Ziel-Adresse(n)</strong>
        <p>Die IP-Adresse oder das Netzwerk, zu dem der Traffic geht.</p>
        <p><strong>Beispiele im Krankenhaus:</strong></p>
        <ul>
            <li>"172.16.1.10" - KIS-Server</li>
            <li>"192.168.100.0/24" - PACS-Netzwerk</li>
            <li>"KIS-Server-Group" - Objekt mit mehreren Servern</li>
            <li>"DMZ-Webserver" - Web-Server in DMZ</li>
        </ul>
        <p><strong>Best Practice:</strong> Erstellen Sie Adress-Objekte für wiederkehrende Ziele (z.B. "KIS-Cluster", "DB-Server-Pool")</p>
    </div>

    <div data-tooltip-id="service-port">
        <strong>Service / Ports</strong>
        <p>Der Netzwerk-Dienst oder Port, der erlaubt/blockiert werden soll.</p>
        <p><strong>Verschiedene Angabe-Formate:</strong></p>
        <ul>
            <li><strong>Service-Name:</strong> HTTPS, SSH, RDP, DNS</li>
            <li><strong>Protokoll/Port:</strong> TCP/443, UDP/53, TCP/3389</li>
            <li><strong>Port-Bereich:</strong> TCP/8000-8999</li>
            <li><strong>Service-Objekt:</strong> "KIS-Services" (Gruppe mehrerer Ports)</li>
        </ul>
        <p><strong>Wichtige Standard-Ports:</strong></p>
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
        <em>Wichtig: Nur die wirklich benötigten Ports freigeben (Principle of Least Privilege)!</em>
    </div>

    <div data-tooltip-id="rule-action">
        <strong>Regel-Aktion</strong>
        <p>Was soll mit dem Traffic passieren?</p>
        <p><strong>Aktionen erklärt:</strong></p>
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
        <p><strong>Faustregel:</strong></p>
        <ul>
            <li>Intern → Extern: Allow (mit Inspect bei Bedarf)</li>
            <li>Extern → Intern: Meistens Deny</li>
            <li>Spezifische Services: Allow mit Logging</li>
        </ul>
    </div>

    <div data-tooltip-id="rule-logging">
        <strong>Logging</strong>
        <p>Wie detailliert soll diese Regel protokolliert werden?</p>
        <p><strong>Logging-Optionen:</strong></p>
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
        <p><strong>Best Practice:</strong></p>
        <ul>
            <li>Deny-Regeln: IMMER loggen!</li>
            <li>Kritische Allow-Regeln: Session Start loggen</li>
            <li>Standard-Internet: Kein oder minimales Logging</li>
        </ul>
        <em>Logs helfen bei Fehlersuche und Sicherheits-Audits!</em>
    </div>

    <div data-tooltip-id="rule-status">
        <strong>Regel-Status</strong>
        <p>Ist die Regel aktuell aktiv?</p>
        <p><strong>Status-Optionen:</strong></p>
        <ul>
            <li><strong>Aktiviert:</strong> Regel ist aktiv und wird angewendet</li>
            <li><strong>Deaktiviert:</strong> Regel existiert, wird aber nicht angewendet (für Tests oder temporäre Deaktivierung)</li>
            <li><strong>Zeitgesteuert:</strong> Regel ist nur zu bestimmten Zeiten aktiv (siehe Zeitplan-Feld)</li>
        </ul>
        <p><strong>Wann deaktivieren?</strong></p>
        <ul>
            <li>Troubleshooting (Regel könnte Problem verursachen)</li>
            <li>Wartung</li>
            <li>Temporäre Änderungen testen</li>
        </ul>
        <em>Tipp: Deaktivierte Regeln nach einiger Zeit löschen, wenn nicht mehr benötigt!</em>
    </div>

    <div data-tooltip-id="nat-enabled">
        <strong>NAT aktivieren</strong>
        <p>Network Address Translation - Übersetzung von IP-Adressen.</p>
        <p><strong>Was ist NAT?</strong> NAT ändert die Quell- oder Ziel-IP-Adresse von Netzwerk-Paketen. Wie ein Übersetzer für IP-Adressen.</p>
        <p><strong>Wofür braucht man NAT?</strong></p>
        <ul>
            <li>Mehrere Geräte teilen sich eine öffentliche IP</li>
            <li>Verstecken interner IPs nach außen (Sicherheit)</li>
            <li>Port-Weiterleitung (z.B. Port 443 → interner Server)</li>
            <li>Server hat private IP, soll aber öffentlich erreichbar sein</li>
        </ul>
        <p><strong>Wann NAT aktivieren?</strong></p>
        <ul>
            <li>Internet-Zugriff von internem Netzwerk</li>
            <li>Externe Zugriffe auf interne Server (Port-Forwarding)</li>
            <li>DMZ-Server mit privaten IPs</li>
        </ul>
        <em>Nicht jede Regel braucht NAT - nur bei Adress-Übersetzung nötig!</em>
    </div>

    <div data-tooltip-id="nat-type">
        <strong>NAT-Typ</strong>
        <p>Die Art der Adress-Übersetzung.</p>
        <p><strong>NAT-Typen erklärt:</strong></p>
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
        <p><strong>Entscheidungshilfe:</strong></p>
        <ul>
            <li>Clients ins Internet → SNAT oder PAT</li>
            <li>Web-Server von außen erreichbar → DNAT</li>
            <li>Server braucht feste öffentliche IP → Static NAT</li>
        </ul>
    </div>

    <div data-tooltip-id="nat-pool">
        <strong>NAT Pool / Adresse</strong>
        <p>Die IP-Adresse(n), auf die übersetzt wird.</p>
        <p><strong>Optionen:</strong></p>
        <ul>
            <li><strong>Einzelne IP:</strong> 203.0.113.10 - alle Verbindungen nutzen diese IP</li>
            <li><strong>IP-Pool:</strong> "NAT-Pool-1" - Gruppe von mehreren öffentlichen IPs</li>
            <li><strong>Interface-IP:</strong> IP des ausgehenden Firewall-Interfaces (automatisch)</li>
        </ul>
        <p><strong>Beispiele:</strong></p>
        <ul>
            <li>Für Internet-Zugriff: Öffentliche IP Ihrer Firewall</li>
            <li>Für Load-Balancing: Pool von mehreren IPs</li>
            <li>Für DMZ-Server: Dedizierte öffentliche IP pro Server</li>
        </ul>
    </div>

    <div data-tooltip-id="nat-original">
        <strong>Original IP/Port</strong>
        <p>Die ursprüngliche (interne) IP-Adresse und Port VOR der Übersetzung.</p>
        <p><strong>Format:</strong> IP:Port oder nur IP</p>
        <p><strong>Beispiele:</strong></p>
        <ul>
            <li>"10.0.1.100:8080" - Interner Web-Server auf Port 8080</li>
            <li>"192.168.1.50:3389" - Interner RDP-Server</li>
            <li>"172.16.1.10" - Server (alle Ports)</li>
        </ul>
        <em>Dies ist, was intern existiert - nicht von außen sichtbar</em>
    </div>

    <div data-tooltip-id="nat-translated">
        <strong>Translated IP/Port</strong>
        <p>Die übersetzte (öffentliche) IP-Adresse und Port NACH der Übersetzung.</p>
        <p><strong>Beispiele:</strong></p>
        <ul>
            <li>"203.0.113.10:443" - Öffentliche IP auf HTTPS-Port</li>
            <li>"203.0.113.10:80" - Öffentliche IP auf HTTP-Port</li>
        </ul>
        <p><strong>Typisches Beispiel (Port-Forwarding):</strong></p>
        <ul>
            <li>Original: 10.0.1.100:8080 (intern)</li>
            <li>Translated: 203.0.113.10:443 (öffentlich)</li>
            <li>Ergebnis: Anfragen an öffentliche-IP:443 landen bei interner-Server:8080</li>
        </ul>
        <em>Dies sehen externe Clients - die "Außenansicht"</em>
    </div>

    <div data-tooltip-id="fw-host-assignment">
        <strong>Zugeordnete VMs / Server</strong>
        <p>Optional: Dokumentation, welche Server von dieser Regel betroffen sind.</p>
        <p><strong>Warum dokumentieren?</strong></p>
        <ul>
            <li>Schnelles Verständnis: Welche Server nutzen diese Regel?</li>
            <li>Impact-Analyse: Was passiert bei Regeländerung?</li>
            <li>Audits und Compliance</li>
            <li>Troubleshooting</li>
        </ul>
        <p><strong>Beispiel:</strong> Regel "Allow-Clients-KIS" → zugeordnet zu "KIS-Server-01", "KIS-Server-02"</p>
        <em>Hilft dem nächsten Admin zu verstehen, wofür die Regel ist!</em>
    </div>

    <div data-tooltip-id="valid-from">
        <strong>Gültig von</strong>
        <p>Ab wann ist die Regel aktiv?</p>
        <p><strong>Verwendung:</strong></p>
        <ul>
            <li>Für geplante Änderungen im Voraus konfigurieren</li>
            <li>Temporäre Zugänge (z.B. für Projekt)</li>
            <li>Compliance-Dokumentation</li>
        </ul>
        <p><strong>Beispiele:</strong></p>
        <ul>
            <li>"01.01.2024" - Ab Neujahr</li>
            <li>"sofort" oder leer - Ab jetzt</li>
            <li>"15.03.2024 09:00" - Spezifischer Zeitpunkt</li>
        </ul>
    </div>

    <div data-tooltip-id="valid-to">
        <strong>Gültig bis</strong>
        <p>Bis wann ist die Regel aktiv?</p>
        <p><strong>Verwendung:</strong></p>
        <ul>
            <li>Temporäre Zugänge (z.B. externe Dienstleister)</li>
            <li>Projekt-bezogene Regeln</li>
            <li>Automatisches Ablaufen von Sonderfreigaben</li>
        </ul>
        <p><strong>Beispiele:</strong></p>
        <ul>
            <li>"31.12.2024" - Bis Jahresende</li>
            <li>"unbegrenzt" oder leer - Kein Enddatum</li>
            <li>"+30 Tage" - 30 Tage ab Aktivierung</li>
        </ul>
        <em>Sicherheits-Tipp: Temporäre Regeln automatisch ablaufen lassen!</em>
    </div>

    <div data-tooltip-id="schedule">
        <strong>Zeitplan</strong>
        <p>Zeitfenster, in dem die Regel aktiv ist (innerhalb der Gültigkeitsdauer).</p>
        <p><strong>Anwendungsfälle:</strong></p>
        <ul>
            <li>Zugriffe nur während Geschäftszeiten</li>
            <li>Nachts restriktivere Regeln</li>
            <li>Wartungsfenster-Zugänge</li>
        </ul>
        <p><strong>Beispiele:</strong></p>
        <ul>
            <li>"Mo-Fr 08:00-18:00" - Wochentags, Geschäftszeiten</li>
            <li>"24/7" oder leer - Immer aktiv</li>
            <li>"Sa-So" - Nur am Wochenende</li>
            <li>"Mo-Fr 22:00-06:00" - Nachts unter der Woche</li>
        </ul>
        <p><strong>Beispiel-Szenario:</strong> Externe Dienstleister dürfen nur Mo-Fr 09-17 Uhr auf Wartungs-Server zugreifen</p>
    </div>

    <div data-tooltip-id="justification">
        <strong>Business Justification</strong>
        <p>Die geschäftliche Begründung: WARUM existiert diese Regel?</p>
        <p><strong>Wichtig für:</strong></p>
        <ul>
            <li>Audits und Compliance</li>
            <li>Nachvollziehbarkeit</li>
            <li>Entscheidung über Beibehaltung/Löschung</li>
            <li>Change-Management</li>
        </ul>
        <p><strong>Gute Begründungen enthalten:</strong></p>
        <ul>
            <li>Welche Benutzergruppe</li>
            <li>Welchen Zugriff</li>
            <li>Zu welchem Zweck</li>
            <li>Wer hat's genehmigt (optional)</li>
        </ul>
        <p><strong>Beispiele:</strong></p>
        <ul>
            <li>"Zugriff für Ärzte-Arbeitsplätze auf KIS-Produktiv-Server (HTTPS) - Standard-Betrieb"</li>
            <li>"PACS-Viewer benötigt Zugriff auf PACS-Archiv-Server (DICOM) - Bildabruf"</li>
            <li>"Externe Wartungsfirma XY benötigt RDP-Zugriff auf Backup-Server - Wartungsvertrag #12345"</li>
        </ul>
        <em>Eine Regel ohne Begründung sollte überprüft werden!</em>
    </div>

    <div data-tooltip-id="fw-notes">
        <strong>Notizen / Regeldetails</strong>
        <p>Zusätzliche wichtige Informationen zu dieser Regel.</p>
        <p><strong>Was hier dokumentieren:</strong></p>
        <ul>
            <li>Change-Ticket oder Genehmigungsnummer</li>
            <li>Kontaktperson / Anforderer</li>
            <li>Besondere Konfigurationen</li>
            <li>Bekannte Probleme</li>
            <li>Geplante Änderungen</li>
            <li>Zusammenhang mit anderen Regeln</li>
        </ul>
        <p><strong>Beispiel:</strong></p>
        <p>"Erstellt: 15.01.2024, Change-Ticket CHG00012345. Angefordert von Dr. Müller (Radiologie). Wichtig: Regel muss vor 'Deny-All-DMZ' (Prio 1000) stehen. Bei Performance-Problemen: Inspect deaktivieren. Review: jährlich im Q1"</p>
        <em>Gute Dokumentation spart Zeit beim Troubleshooting!</em>
    </div>
</div>
