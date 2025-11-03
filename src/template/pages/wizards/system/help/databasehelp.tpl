<div class="tooltip-definitions" style="display: none;">
    <div data-tooltip-id="db-name">
        <h2>Datenbankname</h2>
        <p>Der eindeutige Name Ihrer Datenbank-Instanz.</p>
        <div>
            <h3>Best Practices:</h3>
            <ul>
                <li>Verwenden Sie einen sprechenden Namen</li>
                <li>Fügen Sie Umgebung hinzu (z.B. _PROD, _TEST)</li>
                <li>Vermeiden Sie Sonderzeichen</li>
            </ul>
        </div>
        <div>
            <h3>Beispiele:</h3>
            <ul>
                <li>"KIS_PROD" - KIS Produktiv-Datenbank</li>
                <li>"PACS_DB" - PACS Datenbank</li>
                <li>"LAB_MASTER" - Labor Hauptdatenbank</li>
                <li>"REPORTING_DW" - Reporting Data Warehouse</li>
            </ul>
        </div>
        <em>Bei Oracle: Dies ist der SID oder Service Name</em>
    </div>

    <div data-tooltip-id="db-type">
        <h2>Datenbank-Typ</h2>
        <p>Das Datenbank-Management-System (DBMS), das Sie verwenden.</p>
        <div>
            <h3>Gängige Systeme:</h3>
            <ul>
                <li><strong>Oracle Database:</strong> Enterprise-Lösung, sehr leistungsstark. Häufig in Krankenhäusern für KIS.</li>
                <li><strong>Microsoft SQL Server:</strong> Windows-nativ, gut integriert mit Microsoft-Produkten.</li>
                <li><strong>PostgreSQL:</strong> Open Source, sehr zuverlässig, zunehmend beliebt im Gesundheitswesen.</li>
                <li><strong>MySQL / MariaDB:</strong> Open Source, schnell, für Web-Anwendungen.</li>
                <li><strong>MongoDB:</strong> NoSQL, dokumentenbasiert, für flexible Datenstrukturen.</li>
                <li><strong>IBM Db2:</strong> Enterprise-Level, oft in Großkonzernen.</li>
            </ul>
        </div>
        <div>
            <h3>Entscheidungshilfe:</h3>
            <ul>
                <li>KIS/RIS/PACS → oft Oracle oder SQL Server</li>
                <li>Web-Anwendungen → PostgreSQL oder MySQL</li>
                <li>Big Data / Analytics → MongoDB oder Cassandra</li>
            </ul>
        </div>
    </div>

    <div data-tooltip-id="db-version">
        <h2>Datenbank-Version</h2>
        <p>Die exakte Version Ihres Datenbank-Systems.</p>
        <div>
            <h3>Warum wichtig?</h3>
            <ul>
                <li>Sicherheits-Updates und Patches</li>
                <li>Kompatibilität mit Anwendungen</li>
                <li>Verfügbare Features</li>
                <li>Support-Ende (End of Life)</li>
            </ul>
        </div>
        <div>
            <h3>Beispiele nach System:</h3>
            <ul>
                <li><strong>Oracle:</strong> 19c, 21c, 23c</li>
                <li><strong>SQL Server:</strong> 2019, 2022</li>
                <li><strong>PostgreSQL:</strong> 13.12, 15.4, 16.1</li>
                <li><strong>MySQL:</strong> 8.0.35, 8.2.0</li>
            </ul>
        </div>
        <em>Tipp: Verwenden Sie `SELECT VERSION()` oder ähnliche Befehle zur Abfrage</em>
    </div>

    <div data-tooltip-id="db-charset">
        <h2>Zeichensatz / Charset</h2>
        <p>Definiert, welche Zeichen in der Datenbank gespeichert werden können.</p>
        <div>
            <h3>Wichtig für:</h3>
            <ul>
                <li>Umlaute (ä, ö, ü, ß)</li>
                <li>Sonderzeichen</li>
                <li>Internationale Zeichen</li>
            </ul>
        </div>
        <div>
            <h3>Empfohlene Charsets:</h3>
            <ul>
                <li><strong>UTF-8 / UTF8:</strong> Universal, unterstützt alle Sprachen (empfohlen!)</li>
                <li><strong>AL32UTF8 (Oracle):</strong> Oracle's UTF-8 Implementierung</li>
                <li><strong>utf8mb4 (MySQL):</strong> Echtes UTF-8 mit Emoji-Support</li>
                <li><strong>Latin1 / ISO-8859-1:</strong> Veraltet, nur westeuropäische Zeichen</li>
            </ul>
        </div>
        <div>
            <h3>WICHTIG:</h3>
            Falscher Charset = Probleme mit Umlauten und Sonderzeichen!
        </div>
        <em>Für neue Datenbanken IMMER UTF-8 wählen!</em>
    </div>

    <div data-tooltip-id="db-port">
        <h2>Datenbank-Port</h2>
        <p>Der Netzwerk-Port, über den auf die Datenbank zugegriffen wird.</p>
        <div>
            <h3>Standard-Ports:</h3>
            <ul>
                <li><strong>Oracle:</strong> 1521</li>
                <li><strong>SQL Server:</strong> 1433</li>
                <li><strong>PostgreSQL:</strong> 5432</li>
                <li><strong>MySQL:</strong> 3306</li>
                <li><strong>MongoDB:</strong> 27017</li>
                <li><strong>Redis:</strong> 6379</li>
            </ul>
        </div>
        <div>
            <h3>Wichtig für:</h3>
            <ul>
                <li>Firewall-Konfiguration</li>
                <li>Connection Strings in Anwendungen</li>
                <li>Netzwerk-Sicherheit</li>
            </ul>
        </div>
        <em>Standard-Ports verwenden = einfacher zu merken, aber potentiell unsicherer</em>
    </div>

    <div data-tooltip-id="db-tablespace">
        <h2>Tablespace / Schema</h2>
        <p>Logische Gruppierung von Datenbank-Objekten (Tabellen, Indizes, etc.)</p>
        <div>
            <h3>Was ist das?</h3>
            <ul>
                <li><strong>Oracle Tablespace:</strong> Physischer Speicherbereich auf Festplatte</li>
                <li><strong>SQL Server Schema:</strong> Logischer Container für Objekte (wie ein Namespace)</li>
                <li><strong>PostgreSQL Schema:</strong> Ähnlich wie SQL Server</li>
            </ul>
        </div>
        <div>
            <h3>Typische Werte:</h3>
            <ul>
                <li><strong>Oracle:</strong> USERS, SYSTEM, SYSAUX, TEMP</li>
                <li><strong>SQL Server:</strong> dbo (default), custom schemas</li>
                <li><strong>PostgreSQL:</strong> public (default), custom schemas</li>
            </ul>
        </div>
        <div>
            <h3>Warum wichtig?</h3>
            Trennung von Daten, Berechtigungen, Organisation
        </div>
        <em>Bei Oracle: Verschiedene Tablespaces für Daten und Indizes = bessere Performance</em>
    </div>

    <div data-tooltip-id="db-cluster-check">
        <h2>Datenbank-Cluster / High Availability</h2>
        <p>Mehrere Datenbank-Server arbeiten zusammen für Hochverfügbarkeit.</p>
        <div>
            <h3>Was ist ein Cluster?</h3>
            Mehrere Datenbank-Instanzen, die als eine Einheit arbeiten.
        </div>
        <div>
            <h3>Vorteile:</h3>
            <ul>
                <li><strong>Hochverfügbarkeit:</strong> Bei Ausfall eines Servers übernimmt ein anderer</li>
                <li><strong>Load Balancing:</strong> Anfragen werden verteilt</li>
                <li><strong>Keine/Minimale Ausfallzeiten:</strong> Bei Wartung oder Fehler</li>
            </ul>
        </div>
        <div>
            <h3>Wann aktivieren?</h3>
            <ul>
                <li>Kritische Systeme (24/7 Betrieb)</li>
                <li>KIS, Notaufnahme-Systeme</li>
                <li>Hohe Verfügbarkeits-Anforderungen (>99%)</li>
            </ul>
        </div>
        <em>WICHTIG: Cluster braucht mehr Ressourcen und ist komplexer zu verwalten!</em>
    </div>

    <div data-tooltip-id="cluster-type">
        <h2>Cluster-Typ</h2>
        <p>Die Art, wie die Datenbanken im Cluster zusammenarbeiten.</p>
        <div>
            <h3>Typen erklärt:</h3>
            <ul>
                <li><strong>Active-Active (Multi-Master):</strong>
                    <ul>
                        <li>Alle Knoten können Lese- UND Schreib-Anfragen verarbeiten</li>
                        <li>Beste Performance und Lastverteilung</li>
                        <li>Komplex, Konflikt-Management nötig</li>
                        <li>Beispiel: Oracle RAC, MySQL Cluster</li>
                    </ul>
                </li>
                <li><strong>Active-Passive (Primary-Standby):</strong>
                    <ul>
                        <li>Ein Knoten aktiv (Primary), andere im Standby</li>
                        <li>Bei Ausfall: Automatischer Failover zu Standby</li>
                        <li>Einfacher als Active-Active</li>
                        <li>Standby kann für Backups/Reports genutzt werden</li>
                        <li>Beispiel: SQL Server AlwaysOn, PostgreSQL Streaming Replication</li>
                    </ul>
                </li>
                <li><strong>Read Replicas:</strong>
                    <ul>
                        <li>Ein Master (Schreiben), mehrere Replicas (nur Lesen)</li>
                        <li>Entlastet Master bei vielen Lese-Anfragen</li>
                        <li>Gut für Reporting und Analytics</li>
                        <li>Einfachste Cluster-Form</li>
                    </ul>
                </li>
            </ul>
        </div>
        <div>
            <h3>Empfehlung:</h3>
            <ul>
                <li>Standard-Fall → Active-Passive</li>
                <li>Höchste Performance → Active-Active</li>
                <li>Viele Lese-Zugriffe → Read Replicas</li>
            </ul>
        </div>
    </div>

    <div data-tooltip-id="cluster-name">
        <h2>Cluster-Name</h2>
        <p>Eindeutiger Name für Ihren Datenbank-Cluster.</p>
        <div>
            <h3>Best Practice:</h3>
            <ul>
                <li>Beschreibend und eindeutig</li>
                <li>System und Zweck erkennbar</li>
                <li>Umgebung einbeziehen</li>
            </ul>
        </div>
        <div>
            <h3>Beispiele:</h3>
            <ul>
                <li>"KIS-DB-CLUSTER-PROD" - KIS Produktions-Cluster</li>
                <li>"PACS-CLUSTER-01" - PACS Cluster, Instance 1</li>
                <li>"SQL-HA-CLUSTER-RZ1" - SQL HA Cluster im RZ1</li>
            </ul>
        </div>
    </div>

    <div data-tooltip-id="cluster-nodes">
        <h2>Anzahl Knoten</h2>
        <p>Wie viele Server/Instanzen bilden den Cluster?</p>
        <div>
            <h3>Typische Konfigurationen:</h3>
            <ul>
                <li><strong>2 Knoten:</strong> Minimum für HA (1 Primary + 1 Standby). Standard für kleinere Systeme.</li>
                <li><strong>3 Knoten:</strong> Empfohlen für Produktion (Quorum, bessere Fehlertoleranz)</li>
                <li><strong>5+ Knoten:</strong> Für sehr kritische Systeme oder geografisch verteilt</li>
            </ul>
        </div>
        <div>
            <h3>Faustregel:</h3>
            Ungerade Anzahl bei Quorum-basierten Systemen (z.B. 3, 5, 7)
        </div>
        <div>
            <h3>Wichtig:</h3>
            Jeder zusätzliche Knoten = mehr Ressourcen und Komplexität
        </div>
        <em>Minimum: 2 Knoten für HA, empfohlen: 3 Knoten für Produktion</em>
    </div>

    <div data-tooltip-id="failover-mode">
        <h2>Failover-Modus</h2>
        <p>Wie wird bei Ausfall eines Knotens reagiert?</p>
        <div>
            <h3>Modi erklärt:</h3>
            <ul>
                <li><strong>Automatisch:</strong>
                    <ul>
                        <li>System erkennt Ausfall und schaltet selbstständig um</li>
                        <li>Keine manuelle Intervention nötig</li>
                        <li>Typisch: 30 Sekunden bis 2 Minuten Ausfallzeit</li>
                        <li><em>Empfohlen für kritische 24/7 Systeme!</em></li>
                    </ul>
                </li>
                <li><strong>Manuell:</strong>
                    <ul>
                        <li>Administrator muss Failover manuell auslösen</li>
                        <li>Mehr Kontrolle, aber längere Ausfallzeit</li>
                        <li>Für Test-Systeme oder wenn manuelle Prüfung gewünscht</li>
                    </ul>
                </li>
                <li><strong>Semi-Automatisch:</strong>
                    <ul>
                        <li>System erkennt Fehler, wartet auf Bestätigung</li>
                        <li>Administrator muss Failover freigeben</li>
                        <li>Kompromiss zwischen Kontrolle und Geschwindigkeit</li>
                    </ul>
                </li>
            </ul>
        </div>
        <div>
            <h3>Entscheidung:</h3>
            <ul>
                <li>Kritische Systeme (Notaufnahme, OP) → Automatisch</li>
                <li>Normale Systeme → Automatisch oder Semi-Automatisch</li>
                <li>Test/Entwicklung → Manuell</li>
            </ul>
        </div>
    </div>

    <div data-tooltip-id="db-host-assignment">
        <h2>Host-Zuordnung</h2>
        <p>Auf welchen Servern läuft diese Datenbank?</p>
        <div>
            <h3>Wichtig für:</h3>
            <ul>
                <li>Übersicht: Wo läuft welche Datenbank?</li>
                <li>Ressourcen-Planung</li>
                <li>Backup-Planung</li>
                <li>Fehlersuche und Monitoring</li>
            </ul>
        </div>
        <div>
            <h3>Mehrere Hosts bei:</h3>
            <ul>
                <li>Cluster-Konfiguration (alle Cluster-Knoten)</li>
                <li>Replikation (Primary + Replicas)</li>
            </ul>
        </div>
        <div>
            <h3>Ein Host bei:</h3>
            <ul>
                <li>Standalone-Datenbank</li>
                <li>Entwicklungs-/Test-Umgebung</li>
            </ul>
        </div>
        <em>Die Server müssen vorher als VMs oder Hardware angelegt worden sein!</em>
    </div>

    <div data-tooltip-id="db-size">
        <h2>Datenbankgröße</h2>
        <p>Aktueller Speicherplatz-Verbrauch der Datenbank in Gigabyte.</p>
        <div>
            <h3>Warum wichtig?</h3>
            <ul>
                <li>Speicherplatz-Planung</li>
                <li>Backup-Dauer und -Größe</li>
                <li>Performance (sehr große DBs brauchen mehr Ressourcen)</li>
                <li>Lizenz-Kosten (bei kommerziellen Systemen)</li>
            </ul>
        </div>
        <div>
            <h3>Richtwerte im Krankenhaus:</h3>
            <ul>
                <li>Kleines System: 50-200 GB</li>
                <li>Mittleres KIS: 500-2000 GB (0.5-2 TB)</li>
                <li>Großes KIS: 2-10 TB</li>
                <li>PACS: 10-100+ TB (Bilder brauchen viel Platz!)</li>
            </ul>
        </div>
        <div>
            <h3>Tipp:</h3>
            Wachstum pro Jahr beachten! PACS kann 5-10 TB/Jahr wachsen.
        </div>
        <em>Zur Ermittlung: Abfrage `SELECT SUM(bytes)/1024/1024/1024 FROM dba_segments;` (Oracle)</em>
    </div>

    <div data-tooltip-id="max-connections">
        <h2>Maximale Verbindungen</h2>
        <p>Wie viele gleichzeitige Client-Verbindungen sind erlaubt?</p>
        <div>
            <h3>Was zählt als Verbindung?</h3>
            <ul>
                <li>Jede Anwendungs-Session</li>
                <li>Jeder Web-User (bei Connection Pool weniger)</li>
                <li>Monitoring-Tools</li>
                <li>Backup-Verbindungen</li>
            </ul>
        </div>
        <div>
            <h3>Typische Werte:</h3>
            <ul>
                <li><strong>50-100:</strong> Kleine Anwendung, wenige Benutzer</li>
                <li><strong>100-500:</strong> Mittlere Anwendung (Standard-KIS)</li>
                <li><strong>500-1000:</strong> Große Anwendung, viele Benutzer</li>
                <li><strong>1000+:</strong> Sehr große Systeme oder Connection Pooling</li>
            </ul>
        </div>
        <div>
            <h3>WICHTIG:</h3>
            Jede Verbindung verbraucht RAM! Zu viele = Performance-Probleme
        </div>
        <div>
            <h3>Faustregel:</h3>
            1-5 MB RAM pro Verbindung
        </div>
        <em>Connection Pooling reduziert benötigte Verbindungen erheblich!</em>
    </div>

    <div data-tooltip-id="db-encryption">
        <h2>Verschlüsselung</h2>
        <p>Wie werden Daten in der Datenbank verschlüsselt?</p>
        <div>
            <h3>Verschlüsselungs-Typen:</h3>
            <ul>
                <li><strong>TDE (Transparent Data Encryption):</strong>
                    <ul>
                        <li>Verschlüsselt die komplette Datenbank auf Datei-Ebene</li>
                        <li>Transparent für Anwendungen (kein Code-Change)</li>
                        <li>Schützt vor Diebstahl der Datenbank-Dateien</li>
                        <li><em>Empfohlen für Patientendaten!</em></li>
                    </ul>
                </li>
                <li><strong>Column-Level Encryption:</strong>
                    <ul>
                        <li>Nur bestimmte Spalten werden verschlüsselt (z.B. Sozialversicherungsnummer)</li>
                        <li>Anwendung muss Ver-/Entschlüsselung unterstützen</li>
                        <li>Granulare Kontrolle, aber komplexer</li>
                    </ul>
                </li>
                <li><strong>Nur Verbindungs-Verschlüsselung (TLS):</strong>
                    <ul>
                        <li>Daten werden während Übertragung verschlüsselt</li>
                        <li>Auf Festplatte unverschlüsselt!</li>
                        <li>Minimum für Patientendaten-Übertragung</li>
                    </ul>
                </li>
                <li><strong>Keine:</strong> NUR für Entwicklung/Test ohne sensible Daten!</li>
            </ul>
        </div>
        <div>
            <h3>DSGVO:</h3>
            Bei Patientendaten TDE oder Column-Level PFLICHT!
        </div>
        <em>Verschlüsselung kostet 5-15% Performance - aber Sicherheit geht vor!</em>
    </div>

    <div data-tooltip-id="db-authentication">
        <h2>Authentifizierung</h2>
        <p>Wie melden sich Benutzer an der Datenbank an?</p>
        <div>
            <h3>Methoden erklärt:</h3>
            <ul>
                <li><strong>Integrierte Windows-Authentifizierung:</strong>
                    <ul>
                        <li>Nutzt Windows-Domain-Konto</li>
                        <li>Keine Passwort-Eingabe nötig (Single Sign-On)</li>
                        <li>Zentrale Verwaltung über Active Directory</li>
                        <li>Nur bei SQL Server auf Windows</li>
                    </ul>
                </li>
                <li><strong>LDAP / Active Directory:</strong>
                    <ul>
                        <li>Zentrale Benutzer-Verwaltung</li>
                        <li>Funktioniert mit allen Plattformen</li>
                        <li>Benutzer werden gegen AD/LDAP geprüft</li>
                    </ul>
                </li>
                <li><strong>Native Datenbank-Authentifizierung:</strong>
                    <ul>
                        <li>Benutzer werden in der Datenbank selbst verwaltet</li>
                        <li>Unabhängig von anderen Systemen</li>
                        <li>Mehr Verwaltungsaufwand</li>
                    </ul>
                </li>
                <li><strong>Kerberos:</strong>
                    <ul>
                        <li>Ticket-basierte Authentifizierung</li>
                        <li>Sehr sicher, aber komplex</li>
                        <li>Für hohe Sicherheitsanforderungen</li>
                    </ul>
                </li>
                <li><strong>Zertifikatsbasiert:</strong>
                    <ul>
                        <li>Authentifizierung über digitale Zertifikate</li>
                        <li>Höchste Sicherheit</li>
                        <li>Für spezielle Anforderungen (z.B. Audit-Compliance)</li>
                    </ul>
                </li>
            </ul>
        </div>
        <div>
            <h3>Empfehlung:</h3>
            AD/LDAP für zentrale Verwaltung, sonst Native DB Auth
        </div>
    </div>

    <div data-tooltip-id="db-notes">
        <h2>Notizen / Besonderheiten</h2>
        <p>Zusätzliche wichtige Informationen zu dieser Datenbank.</p>
        <div>
            <h3>Was hier dokumentieren:</h3>
            <ul>
                <li>Besondere Konfigurationen oder Parameter</li>
                <li>Maintenance-Windows und Backup-Zeiten</li>
                <li>Bekannte Probleme oder Limitierungen</li>
                <li>Wichtige Ansprechpartner (DBA, Vendor-Support)</li>
                <li>Abhängigkeiten zu anderen Systemen</li>
                <li>Besondere Anforderungen (z.B. spezielle Patches)</li>
                <li>Lizenz-Informationen</li>
            </ul>
        </div>
        <div>
            <h3>Beispiel:</h3>
            "Backup täglich 02:00 Uhr, Full jeden Sonntag. Wartungsfenster: Letzter Sonntag im Monat 01:00-05:00. DBA: Max Mustermann (Tel. 1234). Oracle Patch 35042068 installiert für Bug-Fix. Wichtig: Tablespace USERS auf 80% → erweitern!"
        </div>
        <em>Je mehr Details, desto einfacher für den nächsten Admin!</em>
    </div>
</div>
