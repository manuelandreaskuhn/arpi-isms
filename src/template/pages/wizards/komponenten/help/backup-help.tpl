<div class="tooltip-definitions" style="display: none;">
    <div data-tooltip-id="backup-system-name">
        <strong>Backup-System Name</strong>
        <p>Ein eindeutiger Name für Ihr Backup-System.</p>
        <p><strong>Was ist ein Backup-System?</strong> Die zentrale Lösung, die alle Backups erstellt, verwaltet und wiederherstellt - Ihre "Lebensversicherung" für Daten.</p>
        <p><strong>Warum Backups essentiell sind:</strong></p>
        <ul>
            <li><strong>Ransomware:</strong> Verschlüsselte Daten können wiederhergestellt werden</li>
            <li><strong>Hardware-Ausfall:</strong> Festplatten gehen kaputt</li>
            <li><strong>Menschliche Fehler:</strong> Versehentliches Löschen</li>
            <li><strong>Compliance:</strong> Gesetzliche Aufbewahrungspflichten</li>
        </ul>
        <p><strong>Namens-Beispiele:</strong></p>
        <ul>
            <li>"Veeam-Prod" - Produktiv-Backup mit Veeam</li>
            <li>"Backup-Server-01" - Erster Backup-Server</li>
            <li>"Azure-Backup-Cloud" - Cloud-Backup auf Azure</li>
        </ul>
        <em>3-2-1 Regel: 3 Kopien, 2 verschiedene Medien, 1 Offsite!</em>
    </div>

    <div data-tooltip-id="backup-software">
        <strong>Backup-Software</strong>
        <p>Die verwendete Backup-Software-Lösung.</p>
        <p><strong>Software-Kategorien:</strong></p>
        <ul>
            <li><strong>Enterprise Backup:</strong>
                <ul>
                    <li><strong>Veeam:</strong> Marktführer für VM-Backup, sehr zuverlässig</li>
                    <li><strong>Commvault:</strong> All-in-One Enterprise-Lösung</li>
                    <li><strong>Veritas NetBackup:</strong> Traditionelle Enterprise-Lösung</li>
                    <li><strong>IBM Spectrum Protect:</strong> Früher Tivoli, für Großunternehmen</li>
                </ul>
            </li>
            <li><strong>VMware / Virtualisierung:</strong>
                <ul>
                    <li><strong>Veeam für VMware:</strong> Spezialisiert auf VMware-Umgebungen</li>
                    <li><strong>Altaro:</strong> Günstiger, gut für kleine/mittlere Umgebungen</li>
                    <li><strong>Nakivo:</strong> Alternative zu Veeam</li>
                </ul>
            </li>
            <li><strong>Windows / Microsoft:</strong>
                <ul>
                    <li><strong>Windows Server Backup:</strong> Kostenlos, basic Features</li>
                    <li><strong>Azure Backup:</strong> Cloud-nativer Microsoft-Service</li>
                    <li><strong>System Center DPM:</strong> Enterprise für Microsoft-Stack</li>
                </ul>
            </li>
            <li><strong>Open Source:</strong>
                <ul>
                    <li><strong>Bacula/Bareos:</strong> Professionell, kostenlos</li>
                    <li><strong>Restic:</strong> Modern, verschlüsselt, dedupliziert</li>
                </ul>
            </li>
            <li><strong>Cloud Backup:</strong>
                <ul>
                    <li><strong>AWS Backup:</strong> Native AWS-Integration</li>
                    <li><strong>Acronis:</strong> Hybrid Cloud-Backup</li>
                </ul>
            </li>
        </ul>
        <em>Wahl hängt ab von: Umgebung, Budget, Features, Support-Bedarf</em>
    </div>

    <div data-tooltip-id="backup-version">
        <strong>Version</strong>
        <p>Die installierte Version der Backup-Software.</p>
        <p><strong>Warum Version wichtig ist:</strong></p>
        <ul>
            <li>Neue Features und Verbesserungen</li>
            <li>Sicherheits-Patches</li>
            <li>Kompatibilität (z.B. neue VMware-Versionen)</li>
            <li>Support-Ende (End of Life)</li>
        </ul>
        <p><strong>Beispiele:</strong> "v12.1", "2024 Update 2", "Version 11.0.1.1261"</p>
        <em>Regelmäßige Updates wichtig - aber erst in Test-Umgebung testen!</em>
    </div>

    <div data-tooltip-id="backup-license-model">
        <strong>Lizenzmodell</strong>
        <p>Wie wird die Backup-Software lizenziert?</p>
        <p><strong>Lizenzmodelle erklärt:</strong></p>
        <ul>
            <li><strong>Per Socket / CPU:</strong> Pro physischem CPU-Sockel (z.B. Veeam) - gut für viele kleine VMs</li>
            <li><strong>Per VM / Instance:</strong> Pro gesicherter VM - wird teuer bei vielen VMs</li>
            <li><strong>Per TB:</strong> Pro Terabyte gesicherte Daten - planbar bei bekanntem Datenvolumen</li>
            <li><strong>Per Host / Agent:</strong> Pro Server mit Backup-Agent</li>
            <li><strong>Subscription / SaaS:</strong> Monatliche Zahlung, Cloud-Modell</li>
            <li><strong>Perpetual:</strong> Einmalkauf, Updates oft kostenpflichtig</li>
            <li><strong>Kostenlos / Community:</strong> Open Source oder Free-Edition</li>
        </ul>
        <em>Lizenzkosten können explodieren - Wachstum einplanen!</em>
    </div>

    <div data-tooltip-id="backup-server-id">
        <strong>Backup-Server / Hostname</strong>
        <p>Der Server, auf dem die Backup-Software läuft.</p>
        <p><strong>Was läuft auf dem Backup-Server?</strong></p>
        <ul>
            <li>Backup-Software (z.B. Veeam Backup & Replication)</li>
            <li>Management-Konsole</li>
            <li>Job-Scheduling</li>
            <li>Katalog/Datenbank der Backups</li>
        </ul>
        <p><strong>Wichtig:</strong> Backup-Server ist NICHT der Storage - nur die Steuerung!</p>
        <em>Kann VM oder physischer Server sein - wählen Sie aus bereits angelegten Komponenten</em>
    </div>

    <div data-tooltip-id="backup-os">
        <strong>Betriebssystem</strong>
        <p>Das OS auf dem Backup-Server.</p>
        <p><strong>Typische Backup-Server-OS:</strong></p>
        <ul>
            <li><strong>Windows Server:</strong> Für Veeam, DPM, Commvault</li>
            <li><strong>Linux:</strong> Für Bacula, Bareos, Restic</li>
            <li><strong>Appliance:</strong> Vorgefertigte virtuelle oder physische Appliance</li>
        </ul>
    </div>

    <div data-tooltip-id="backup-location">
        <strong>Standort</strong>
        <p>Wo steht der Backup-Server physisch?</p>
        <p><strong>Wichtig für:</strong></p>
        <ul>
            <li>Disaster Recovery Planung</li>
            <li>Netzwerk-Performance</li>
            <li>Compliance (Daten müssen in DE/EU bleiben)</li>
        </ul>
        <p><strong>Beispiele:</strong> "RZ1", "Backup-Raum", "Cloud (Frankfurt)", "Offsite-Location Berlin"</p>
    </div>

    <div data-tooltip-id="backup-mgmt-url">
        <strong>Management-URL</strong>
        <p>Die Web-Adresse zur Backup-Management-Konsole.</p>
        <p><strong>Warum wichtig?</strong> Schneller Zugriff bei Problemen oder Restore-Anforderungen</p>
        <p><strong>Beispiele:</strong></p>
        <ul>
            <li>"https://backup.example.com:9443" - Veeam Konsole</li>
            <li>"https://commvault.local/webconsole"</li>
        </ul>
    </div>

    <div data-tooltip-id="storage-levels">
        <strong>Storage-Stufen</strong>
        <p>Wie viele Backup-Ebenen haben Sie?</p>
        <p><strong>Was sind Storage-Stufen?</strong> Verschiedene Speicher-Ebenen für unterschiedliche Backup-Generationen - wie Sicherheitsstufen.</p>
        <p><strong>2-Stufig (Primär + Sekundär):</strong></p>
        <ul>
            <li><strong>Stufe 1 (Primär):</strong> Schneller lokaler Storage für tägliche Backups</li>
            <li><strong>Stufe 2 (Sekundär):</strong> Offsite/Cloud für Disaster Recovery</li>
            <li><em>Minimum für Produktiv-Umgebung!</em></li>
        </ul>
        <p><strong>3-Stufig (+ Archiv):</strong></p>
        <ul>
            <li><strong>Stufe 1:</strong> Schneller Storage (SSD/NAS) - letzte 2-4 Wochen</li>
            <li><strong>Stufe 2:</strong> Offsite/Cloud - mehrere Monate</li>
            <li><strong>Stufe 3 (Archiv):</strong> Langzeit (Tape/Glacier) - Jahre</li>
            <li>Für Compliance und lange Aufbewahrung</li>
        </ul>
        <p><strong>3-2-1 Backup-Regel:</strong></p>
        <ul>
            <li><strong>3</strong> Kopien der Daten</li>
            <li><strong>2</strong> verschiedene Medientypen (z.B. Disk + Cloud)</li>
            <li><strong>1</strong> Kopie Offsite (geografisch getrennt)</li>
        </ul>
        <em>3-2-1 ist Best Practice - schützt vor allen Szenarien!</em>
    </div>

    <div data-tooltip-id="primary-storage-type">
        <strong>Storage-Typ (Primär)</strong>
        <p>Welcher Speicher wird für die ersten Backup-Kopien verwendet?</p>
        <p><strong>Typen erklärt:</strong></p>
        <ul>
            <li><strong>Lokale Festplatten:</strong> Direkt im Backup-Server - schnell, günstig, aber Single Point of Failure</li>
            <li><strong>NAS:</strong> Network Attached Storage - zentral, gut für mittelgroße Umgebungen</li>
            <li><strong>SAN:</strong> Storage Area Network - Enterprise, sehr schnell, teuer</li>
            <li><strong>Deduplizierungs-Appliance:</strong> Spezial-Hardware (Dell EMC DataDomain) - spart enorm Speicher</li>
            <li><strong>Object Storage:</strong> S3-kompatibel - flexibel, Cloud oder On-Premise</li>
            <li><strong>Tape Library:</strong> Traditionell, günstig pro TB, langsam</li>
            <li><strong>Cloud Storage:</strong> AWS, Azure - flexibel, pay-per-use</li>
        </ul>
        <p><strong>Empfehlung für Primär-Storage:</strong> Schnell und lokal - SSD-basiertes NAS oder Dedup-Appliance</p>
    </div>

    <div data-tooltip-id="primary-storage-capacity">
        <strong>Kapazität (TB)</strong>
        <p>Wie viel Speicherplatz in Terabyte?</p>
        <p><strong>Wie viel braucht man?</strong> Hängt ab von:</p>
        <ul>
            <li>Menge der zu sichernden Daten</li>
            <li>Anzahl der Backup-Generationen (z.B. 14 Tage)</li>
            <li>Änderungsrate der Daten</li>
            <li>Kompression und Deduplizierung (spart 50-95%!)</li>
        </ul>
        <p><strong>Faustregel:</strong> Quell-Daten × Generationen × 0.5 (mit Dedup) = Backup-Storage</p>
        <p><strong>Beispiel:</strong> 10 TB Daten, 14 Tage, 50% Dedup = ~70 TB Backup-Storage</p>
    </div>

    <div data-tooltip-id="primary-deduplication">
        <strong>Deduplizierung (Primär)</strong>
        <p>Wird Datendeduplizierung verwendet?</p>
        <p><strong>Was ist Deduplizierung?</strong> Gleiche Datenblöcke werden nur einmal gespeichert - spart massiv Speicher!</p>
        <p><strong>Beispiel:</strong> 100 VMs mit Windows Server - Windows-Dateien werden nur einmal gespeichert statt 100x</p>
        <p><strong>Einsparung:</strong></p>
        <ul>
            <li>Full Backups: 10-20x weniger Speicher</li>
            <li>VMs: 15-30x Einsparung möglich</li>
            <li>Office-Daten: 5-10x Einsparung</li>
        </ul>
        <p><strong>Nachteile:</strong> Braucht CPU-Power und RAM, etwas langsamer</p>
        <em>Für Backup fast immer aktivieren - Speicher-Einsparung ist enorm!</em>
    </div>

    <div data-tooltip-id="secondary-storage-type">
        <strong>Storage-Typ (Sekundär)</strong>
        <p>Wohin werden Backups repliziert/kopiert für Disaster Recovery?</p>
        <p><strong>Warum Sekundär-Storage?</strong> Falls Primär-Storage ausfällt oder Standort betroffen (Feuer, Ransomware)</p>
        <p><strong>Optionen:</strong></p>
        <ul>
            <li><strong>NAS (Offsite):</strong> An anderem Standort</li>
            <li><strong>Tape (Offsite):</strong> Zu Dienstleister (Iron Mountain) - sehr sicher</li>
            <li><strong>Cloud (AWS S3):</strong> Amazon Cloud - sehr zuverlässig</li>
            <li><strong>Cloud (Azure Blob):</strong> Microsoft Cloud</li>
            <li><strong>Externes Rechenzentrum:</strong> Partner-RZ, Colocation</li>
        </ul>
        <p><strong>Best Practice:</strong> Geografisch getrennt (> 50 km) und anderes Medium als Primär</p>
        <em>Cloud ist oft einfachste Offsite-Lösung!</em>
    </div>

    <div data-tooltip-id="secondary-replication-freq">
        <strong>Replikationsfrequenz</strong>
        <p>Wie oft werden Backups zum Sekundär-Storage kopiert?</p>
        <p><strong>Optionen:</strong></p>
        <ul>
            <li><strong>Kontinuierlich:</strong> Sofort nach Backup - minimaler Datenverlust</li>
            <li><strong>Stündlich:</strong> Für sehr kritische Daten</li>
            <li><strong>Täglich:</strong> Standard für die meisten Umgebungen</li>
            <li><strong>Wöchentlich:</strong> Für unkritische oder große Datenmengen</li>
        </ul>
        <p><strong>Trade-off:</strong> Häufiger = aktueller, aber mehr Netzwerk-Traffic und Kosten</p>
    </div>

    <div data-tooltip-id="secondary-immutability">
        <strong>Immutability (Unveränderbarkeit)</strong>
        <p>Können Backups gelöscht oder geändert werden?</p>
        <p><strong>Was ist Immutability?</strong> Backups werden "eingefroren" und können für definierte Zeit NICHT gelöscht werden - selbst von Admins nicht!</p>
        <p><strong>Warum wichtig?</strong> Ransomware-Schutz!</p>
        <ul>
            <li>Ransomware verschlüsselt Daten UND löscht Backups</li>
            <li>Mit Immutability: Backups bleiben unberührt</li>
            <li>Auch vor versehentlichem Admin-Fehler geschützt</li>
        </ul>
        <p><strong>Technologien:</strong></p>
        <ul>
            <li>Veeam Immutable Backup</li>
            <li>AWS S3 Object Lock</li>
            <li>Azure Immutable Blobs</li>
        </ul>
        <p><strong>Periode:</strong> Typisch 14-90 Tage - sollte länger sein als Ransomware-Erkennung dauert</p>
        <em>Immutability ist Pflicht für Ransomware-Schutz!</em>
    </div>

    <div data-tooltip-id="tertiary-storage-type">
        <strong>Storage-Typ (Archiv)</strong>
        <p>Langzeit-Archivierung für Compliance und alte Backups.</p>
        <p><strong>Archiv-Optionen:</strong></p>
        <ul>
            <li><strong>Tape Archiv (LTO):</strong> 
                <ul>
                    <li>Traditionell, sehr günstig pro TB</li>
                    <li>LTO-8: 12 TB pro Kassette</li>
                    <li>Offline = sicher vor Ransomware</li>
                    <li>Langsam bei Restore</li>
                </ul>
            </li>
            <li><strong>AWS Glacier:</strong> Cloud-Archiv, sehr günstig ($1/TB/Monat), Restore dauert Stunden</li>
            <li><strong>Azure Archive:</strong> Microsoft-Pendant zu Glacier</li>
            <li><strong>Externer Tresor:</strong> Tape zu Iron Mountain - maximal sicher</li>
        </ul>
        <p><strong>Wann Archiv nötig?</strong></p>
        <ul>
            <li>Gesetzliche Aufbewahrungspflicht (7-10 Jahre)</li>
            <li>Compliance (DSGVO, HGB)</li>
            <li>Sehr alte Daten, selten benötigt</li>
        </ul>
        <em>Tape stirbt nicht - ist noch immer günstigste Langzeit-Speicherung!</em>
    </div>

    <div data-tooltip-id="tertiary-archive-freq">
        <strong>Archivierungsfrequenz</strong>
        <p>Wie oft werden Backups ins Langzeit-Archiv verschoben?</p>
        <p><strong>Typisch:</strong></p>
        <ul>
            <li><strong>Wöchentlich:</strong> Jeden Sonntag vollständiges Backup archivieren</li>
            <li><strong>Monatlich:</strong> Monats-Ende Backup für Langzeit</li>
            <li><strong>Quartalsweise:</strong> Quartalsabschlüsse</li>
            <li><strong>Jährlich:</strong> Jahresabschluss-Backups</li>
        </ul>
        <p><strong>GoBD-Konform:</strong> Monatliches Archiv für 7-10 Jahre</p>
    </div>

    <div data-tooltip-id="backup-types">
        <strong>Unterstützte Backup-Typen</strong>
        <p>Welche Arten von Backups können erstellt werden?</p>
        <p><strong>Backup-Typen erklärt:</strong></p>
        <ul>
            <li><strong>Full Backup:</strong>
                <ul>
                    <li>Komplette Kopie aller Daten</li>
                    <li>Schnellster Restore, aber viel Speicher und Zeit</li>
                    <li>Basis für alle anderen Typen</li>
                </ul>
            </li>
            <li><strong>Incremental:</strong>
                <ul>
                    <li>Nur Änderungen seit letztem Backup (egal ob Full oder Incremental)</li>
                    <li>Sehr schnell, wenig Speicher</li>
                    <li>Restore langsamer (braucht Full + alle Incrementals)</li>
                    <li><em>Standard für tägliche Backups</em></li>
                </ul>
            </li>
            <li><strong>Differential:</strong>
                <ul>
                    <li>Änderungen seit letztem FULL Backup</li>
                    <li>Mittelweg: Schneller Restore als Incremental</li>
                    <li>Wächst über Zeit (bis zum nächsten Full)</li>
                </ul>
            </li>
            <li><strong>Forever Incremental:</strong>
                <ul>
                    <li>Ein Full, dann nur noch Incrementals - ewig</li>
                    <li>Synthetische Fulls aus Incrementals erstellt</li>
                    <li>Sehr effizient, moderne Methode</li>
                    <li>Veeam, Rubrik nutzen das</li>
                </ul>
            </li>
        </ul>
        <p><strong>Typischer Backup-Plan:</strong> Sonntag Full, Mo-Sa Incremental</p>
    </div>

    <div data-tooltip-id="backup-compression">
        <strong>Kompression</strong>
        <p>Werden Backup-Daten komprimiert?</p>
        <p><strong>Kompression-Level:</strong></p>
        <ul>
            <li><strong>Hoch:</strong> Maximale Platzersparnis, langsamer - für Archiv</li>
            <li><strong>Mittel:</strong> Guter Kompromiss - Standard</li>
            <li><strong>Niedrig:</strong> Schnell, wenig Ersparnis - für kritische Backups</li>
            <li><strong>Keine:</strong> Nur wenn Daten schon komprimiert (Videos, Bilder)</li>
        </ul>
        <p><strong>Einsparung:</strong> 30-70% je nach Datentyp (Office-Docs komprimieren gut, Bilder wenig)</p>
        <em>Fast immer aktivieren - Speicher-Einsparung lohnt sich!</em>
    </div>

    <div data-tooltip-id="backup-encryption">
        <strong>Verschlüsselung</strong>
        <p>Werden Backups verschlüsselt?</p>
        <p><strong>Verschlüsselungs-Standard:</strong></p>
        <ul>
            <li><strong>AES-256:</strong> Militär-Grade, unknackbar, Standard</li>
            <li><strong>AES-128:</strong> Auch sicher, etwas schneller</li>
        </ul>
        <p><strong>Warum verschlüsseln?</strong></p>
        <ul>
            <li>DSGVO-Pflicht für Patientendaten</li>
            <li>Schutz bei Diebstahl (Tape, externe Festplatte)</li>
            <li>Cloud-Backups: Niemand kann mitlesen</li>
        </ul>
        <p><strong>WICHTIG:</strong> Verschlüsselungs-Key sicher aufbewahren - ohne Key keine Restore!</p>
        <em>Für Patientendaten: Verschlüsselung ist Pflicht!</em>
    </div>

    <div data-tooltip-id="application-aware">
        <strong>Application-Aware Backup</strong>
        <p>Werden Anwendungen beim Backup "eingefroren" für Konsistenz?</p>
        <p><strong>Was ist Application-Aware?</strong></p>
        <ul>
            <li>Backup-Software kommuniziert mit Anwendung (DB, Exchange)</li>
            <li>Anwendung wird in konsistenten Zustand versetzt</li>
            <li>Backup wird erstellt</li>
            <li>Anwendung wird fortgesetzt</li>
        </ul>
        <p><strong>Technologien:</strong></p>
        <ul>
            <li><strong>VSS (Windows):</strong> Volume Shadow Copy Service</li>
            <li><strong>Quiesce (VMware):</strong> Einfrieren der VM</li>
        </ul>
        <p><strong>Ja (Application-Aware):</strong></p>
        <ul>
            <li>Datenbank-Backups konsistent</li>
            <li>Transaktions-Logs werden geflusht</li>
            <li>Sauberer Restore möglich</li>
        </ul>
        <p><strong>Nein (Crash-Consistent):</strong></p>
        <ul>
            <li>Wie bei Stromausfall</li>
            <li>OS recovered beim Restore</li>
            <li>Kann zu Daten-Inkonsistenzen führen</li>
        </ul>
        <em>Für Datenbanken: Application-Aware ist Pflicht!</em>
    </div>

    <div data-tooltip-id="instant-recovery">
        <strong>Instant Recovery / VM</strong>
        <p>Kann eine VM direkt vom Backup gestartet werden?</p>
        <p><strong>Was ist Instant Recovery?</strong> VM wird SOFORT vom Backup-Storage gebootet - ohne Restore-Wartezeit!</p>
        <p><strong>Wie funktioniert's?</strong></p>
        <ol>
            <li>Backup-Datei wird als Datastore gemountet</li>
            <li>VM startet direkt davon (innerhalb Minuten!)</li>
            <li>Im Hintergrund: Daten werden zu Production-Storage migriert</li>
            <li>Nach Migration: VM läuft normal</li>
        </ol>
        <p><strong>Vorteile:</strong></p>
        <ul>
            <li>RTO (Recovery Time Objective) von Minuten statt Stunden</li>
            <li>Bei kritischen Systemen lebensrettend</li>
            <li>Für Tests: VM starten ohne Restore</li>
        </ul>
        <p><strong>Unterstützt von:</strong> Veeam, Nakivo, Rubrik, Cohesity</p>
        <em>Instant Recovery macht Backup-Restore von Stunden zu Minuten!</em>
    </div>

    <div data-tooltip-id="backup-replication">
        <strong>Backup-Replikation</strong>
        <p>Werden Backups automatisch zu anderem Standort kopiert?</p>
        <p><strong>Was ist Backup-Replikation?</strong> Automatisches Kopieren von Backups zu Sekundär-Standort für Disaster Recovery</p>
        <p><strong>Unterschied zu normalem Backup:</strong></p>
        <ul>
            <li>Backup: Produktiv-Daten → Backup-Storage</li>
            <li>Replikation: Backup-Storage → Remote Backup-Storage</li>
        </ul>
        <em>Essentiell für echtes Disaster Recovery!</em>
    </div>

    <div data-tooltip-id="backup-cdp">
        <strong>CDP (Continuous Data Protection)</strong>
        <p>Kontinuierliche Datensicherung in Echtzeit.</p>
        <p><strong>Was ist CDP?</strong> Jede Änderung wird sofort gesichert - nicht nur zu Backup-Zeiten!</p>
        <p><strong>RPO (Recovery Point Objective):</strong> Sekunden statt Stunden!</p>
        <p><strong>Wann sinnvoll?</strong> Für sehr kritische Datenbanken (Notaufnahme, OP-Daten)</p>
        <p><strong>Nachteil:</strong> Hoher Ressourcen-Verbrauch, teuer</p>
    </div>

    <div data-tooltip-id="monitoring-integration">
        <strong>Monitoring-Integration</strong>
        <p>Wie wird das Backup-System überwacht?</p>
        <p><strong>Warum Monitoring kritisch ist:</strong> Backups laufen nachts - ohne Monitoring merkt niemand, wenn sie scheitern!</p>
        <p><strong>Monitoring-Tools:</strong></p>
        <ul>
            <li>PRTG, Zabbix, Nagios</li>
            <li>E-Mail-Alerts</li>
            <li>Veeam ONE (für Veeam)</li>
            <li>SIEM-Integration</li>
        </ul>
        <p><strong>Was überwachen:</strong></p>
        <ul>
            <li>Backup Success/Failure</li>
            <li>Backup-Dauer (zu lang = Problem)</li>
            <li>Storage-Kapazität</li>
            <li>Letzte erfolgreiche Backup-Zeit</li>
        </ul>
        <em>Backup ohne Monitoring = keine Ahnung ob es funktioniert!</em>
    </div>

    <div data-tooltip-id="backup-reporting">
        <strong>Reporting</strong>
        <p>Wie oft werden Backup-Reports erstellt?</p>
        <p><strong>Report-Frequenzen:</strong></p>
        <ul>
            <li><strong>Täglich:</strong> E-Mail mit Job-Status - für kritische Systeme</li>
            <li><strong>Wöchentlich:</strong> Zusammenfassung - Standard</li>
            <li><strong>Monatlich:</strong> Management-Report mit Statistiken</li>
            <li><strong>Nur bei Fehlern:</strong> Alert-basiert - kann gefährlich sein (keine Bestätigung bei Erfolg)</li>
        </ul>
        <em>Mindestens wöchentlich - so sieht man Trends und Probleme frühzeitig</em>
    </div>

    <div data-tooltip-id="log-retention">
        <strong>Log-Aufbewahrung</strong>
        <p>Wie lange werden Backup-Logs aufbewahrt?</p>
        <p><strong>Warum Logs wichtig:</strong></p>
        <ul>
            <li>Troubleshooting bei Restore-Problemen</li>
            <li>Compliance-Nachweis</li>
            <li>Audit-Trail</li>
        </ul>
        <p><strong>Empfohlene Aufbewahrung:</strong></p>
        <ul>
            <li>Minimum: 90 Tage</li>
            <li>Empfohlen: 1 Jahr</li>
            <li>Compliance: 7-10 Jahre (DSGVO, GoBD)</li>
        </ul>
    </div>

    <div data-tooltip-id="backup-admin">
        <strong>Backup-Administrator</strong>
        <p>Wer ist verantwortlich für das Backup-System?</p>
        <p><strong>Aufgaben des Backup-Admins:</strong></p>
        <ul>
            <li>Überwachung der Backup-Jobs</li>
            <li>Restore-Durchführung</li>
            <li>Kapazitäts-Planung</li>
            <li>Regelmäßige Restore-Tests</li>
            <li>Updates und Patches</li>
        </ul>
        <em>Backup-Admin sollte 24/7 erreichbar sein!</em>
    </div>

    <div data-tooltip-id="support-contract">
        <strong>Support-Vertrag</strong>
        <p>Welchen Support-Level haben Sie?</p>
        <p><strong>Support-Level:</strong></p>
        <ul>
            <li><strong>24/7 Support:</strong> Anruf jederzeit, kritisch für Produktiv-Backups</li>
            <li><strong>Business Hours:</strong> Mo-Fr 9-17 Uhr</li>
            <li><strong>Basic Support:</strong> E-Mail-Support, langsame Response</li>
            <li><strong>Kein Support:</strong> Community, Open Source</li>
        </ul>
        <p><strong>Was kostet Support-Ausfall?</strong> Wenn Restore nicht funktioniert und kein Support = Katastrophe!</p>
        <em>Bei kritischen Backups: 24/7 Support ist Pflicht!</em>
    </div>

    <div data-tooltip-id="backup-notes">
        <strong>Notizen / Besonderheiten</strong>
        <p>Zusätzliche wichtige Informationen zum Backup-System.</p>
        <p><strong>Was dokumentieren:</strong></p>
        <ul>
            <li>Spezielle Backup-Fenster</li>
            <li>Ausnahmen und Sonder-Konfigurationen</li>
            <li>Bekannte Probleme und Workarounds</li>
            <li>Restore-Prozeduren</li>
            <li>Kontakte (Vendor, Support)</li>
            <li>Verschlüsselungs-Key-Standort (sicher!)</li>
            <li>Letzte Restore-Tests (wann, erfolgreich?)</li>
        </ul>
        <p><strong>WICHTIG:</strong> Ein Backup ist nur so gut wie der letzte erfolgreiche Restore-Test!</p>
        <em>Backup-Strategie ohne regelmäßige Restore-Tests ist wertlos!</em>
    </div>
</div>
