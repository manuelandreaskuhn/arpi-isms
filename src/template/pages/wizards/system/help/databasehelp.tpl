<div class="tooltip-definitions" style="display: none;">
    <div data-tooltip-id="db-name">
        <strong>Datenbankname</strong>
        <p>Der eindeutige Name Ihrer Datenbank-Instanz.</p>
        <p><strong>Best Practices:</strong></p>
        <ul>
            <li>Verwenden Sie einen sprechenden Namen</li>
            <li>Fügen Sie Umgebung hinzu (z.B. _PROD, _TEST)</li>
            <li>Vermeiden Sie Sonderzeichen</li>
        </ul>
        <p><strong>Beispiele:</strong></p>
        <ul>
            <li>"KIS_PROD" - KIS Produktiv-Datenbank</li>
            <li>"PACS_DB" - PACS Datenbank</li>
            <li>"LAB_MASTER" - Labor Hauptdatenbank</li>
            <li>"REPORTING_DW" - Reporting Data Warehouse</li>
        </ul>
        <em>Bei Oracle: Dies ist der SID oder Service Name</em>
    </div>

    <div data-tooltip-id="db-type">
        <strong>Datenbank-Typ</strong>
        <p>Das Datenbank-Management-System (DBMS), das Sie verwenden.</p>
        <p><strong>Gängige Systeme:</strong></p>
        <ul>
            <li><strong>Oracle Database:</strong> Enterprise-Lösung, sehr leistungsstark. Häufig in Krankenhäusern für KIS.</li>
            <li><strong>Microsoft SQL Server:</strong> Windows-nativ, gut integriert mit Microsoft-Produkten.</li>
            <li><strong>PostgreSQL:</strong> Open Source, sehr zuverlässig, zunehmend beliebt im Gesundheitswesen.</li>
            <li><strong>MySQL / MariaDB:</strong> Open Source, schnell, für Web-Anwendungen.</li>
            <li><strong>MongoDB:</strong> NoSQL, dokumentenbasiert, für flexible Datenstrukturen.</li>
            <li><strong>IBM Db2:</strong> Enterprise-Level, oft in Großkonzernen.</li>
        </ul>
        <p><strong>Entscheidungshilfe:</strong></p>
        <ul>
            <li>KIS/RIS/PACS → oft Oracle oder SQL Server</li>
            <li>Web-Anwendungen → PostgreSQL oder MySQL</li>
            <li>Big Data / Analytics → MongoDB oder Cassandra</li>
        </ul>
    </div>

    <div data-tooltip-id="db-version">
        <strong>Datenbank-Version</strong>
        <p>Die exakte Version Ihres Datenbank-Systems.</p>
        <p><strong>Warum wichtig?</strong></p>
        <ul>
            <li>Sicherheits-Updates und Patches</li>
            <li>Kompatibilität mit Anwendungen</li>
            <li>Verfügbare Features</li>
            <li>Support-Ende (End of Life)</li>
        </ul>
        <p><strong>Beispiele nach System:</strong></p>
        <ul>
            <li><strong>Oracle:</strong> 19c, 21c, 23c</li>
            <li><strong>SQL Server:</strong> 2019, 2022</li>
            <li><strong>PostgreSQL:</strong> 13.12, 15.4, 16.1</li>
            <li><strong>MySQL:</strong> 8.0.35, 8.2.0</li>
        </ul>
        <em>Tipp: Verwenden Sie `SELECT VERSION()` oder ähnliche Befehle zur Abfrage</em>
    </div>

    <div data-tooltip-id="db-charset">
        <strong>Zeichensatz / Charset</strong>
        <p>Definiert, welche Zeichen in der Datenbank gespeichert werden können.</p>
        <p><strong>Wichtig für:</strong></p>
        <ul>
            <li>Umlaute (ä, ö, ü, ß)</li>
            <li>Sonderzeichen</li>
            <li>Internationale Zeichen</li>
            <li>Emojis 😊</li>
        </ul>
        <p><strong>Empfohlene Charsets:</strong></p>
        <ul>
            <li><strong>UTF-8 / UTF8:</strong> Universal, unterstützt alle Sprachen (empfohlen!)</li>
            <li><strong>AL32UTF8 (Oracle):</strong> Oracle's UTF-8 Implementierung</li>
            <li><strong>utf8mb4 (MySQL):</strong> Echtes UTF-8 mit Emoji-Support</li>
            <li><strong>Latin1 / ISO-8859-1:</strong> Veraltet, nur westeuropäische Zeichen</li>
        </ul>
        <p><strong>WICHTIG:</strong> Falscher Charset = Probleme mit Umlauten und Sonderzeichen!</p>
        <em>Für neue Datenbanken IMMER UTF-8 wählen!</em>
    </div>

    <div data-tooltip-id="db-port">
        <strong>Datenbank-Port</strong>
        <p>Der Netzwerk-Port, über den auf die Datenbank zugegriffen wird.</p>
        <p><strong>Standard-Ports:</strong></p>
        <ul>
            <li><strong>Oracle:</strong> 1521</li>
            <li><strong>SQL Server:</strong> 1433</li>
            <li><strong>PostgreSQL:</strong> 5432</li>
            <li><strong>MySQL:</strong> 3306</li>
            <li><strong>MongoDB:</strong> 27017</li>
            <li><strong>Redis:</strong> 6379</li>
        </ul>
        <p><strong>Wichtig für:</strong></p>
        <ul>
            <li>Firewall-Konfiguration</li>
            <li>Connection Strings in Anwendungen</li>
            <li>Netzwerk-Sicherheit</li>
        </ul>
        <em>Standard-Ports verwenden = einfacher zu merken, aber potentiell unsicherer</em>
    </div>

    <div data-tooltip-id="db-tablespace">
        <strong>Tablespace / Schema</strong>
        <p>Logische Gruppierung von Datenbank-Objekten (Tabellen, Indizes, etc.)</p>
        <p><strong>Was ist das?</strong></p>
        <ul>
            <li><strong>Oracle Tablespace:</strong> Physischer Speicherbereich auf Festplatte</li>
            <li><strong>SQL Server Schema:</strong> Logischer Container für Objekte (wie ein Namespace)</li>
            <li><strong>PostgreSQL Schema:</strong> Ähnlich wie SQL Server</li>
        </ul>
        <p><strong>Typische Werte:</strong></p>
        <ul>
            <li><strong>Oracle:</strong> USERS, SYSTEM, SYSAUX, TEMP</li>
            <li><strong>SQL Server:</strong> dbo (default), custom schemas</li>
            <li><strong>PostgreSQL:</strong> public (default), custom schemas</li>
        </ul>
        <p><strong>Warum wichtig?</strong> Trennung von Daten, Berechtigungen, Organisation</p>
        <em>Bei Oracle: Verschiedene Tablespaces für Daten und Indizes = bessere Performance</em>
    </div>

    <div data-tooltip-id="db-cluster-check">
        <strong>Datenbank-Cluster / High Availability</strong>
        <p>Mehrere Datenbank-Server arbeiten zusammen für Hochverfügbarkeit.</p>
        <p><strong>Was ist ein Cluster?</strong> Mehrere Datenbank-Instanzen, die als eine Einheit arbeiten.</p>
        <p><strong>Vorteile:</strong></p>
        <ul>
            <li><strong>Hochverfügbarkeit:</strong> Bei Ausfall eines Servers übernimmt ein anderer</li>
            <li><strong>Load Balancing:</strong> Anfragen werden verteilt</li>
            <li><strong>Keine/Minimale Ausfallzeiten:</strong> Bei Wartung oder Fehler</li>
        </ul>
        <p><strong>Wann aktivieren?</strong></p>
        <ul>
            <li>Kritische Systeme (24/7 Betrieb)</li>
            <li>KIS, Notaufnahme-Systeme</li>
            <li>Hohe Verfügbarkeits-Anforderungen (>99%)</li>
        </ul>
        <em>WICHTIG: Cluster braucht mehr Ressourcen und ist komplexer zu verwalten!</em>
    </div>

    <div data-tooltip-id="cluster-type">
        <strong>Cluster-Typ</strong>
        <p>Die Art, wie die Datenbanken im Cluster zusammenarbeiten.</p>
        <p><strong>Typen erklärt:</strong></p>
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
        <p><strong>Empfehlung:</strong></p>
        <ul>
            <li>Standard-Fall → Active-Passive</li>
            <li>Höchste Performance → Active-Active</li>
            <li>Viele Lese-Zugriffe → Read Replicas</li>
        </ul>
    </div>

    <div data-tooltip-id="cluster-name">
        <strong>Cluster-Name</strong>
        <p>Eindeutiger Name für Ihren Datenbank-Cluster.</p>
        <p><strong>Best Practice:</strong></p>
        <ul>
            <li>Beschreibend und eindeutig</li>
            <li>System und Zweck erkennbar</li>
            <li>Umgebung einbeziehen</li>
        </ul>
        <p><strong>Beispiele:</strong></p>
        <ul>
            <li>"KIS-DB-CLUSTER-PROD" - KIS Produktions-Cluster</li>
            <li>"PACS-CLUSTER-01" - PACS Cluster, Instance 1</li>
            <li>"SQL-HA-CLUSTER-RZ1" - SQL HA Cluster im RZ1</li>
        </ul>
    </div>

    <div data-tooltip-id="cluster-nodes">
        <strong>Anzahl Knoten</strong>
        <p>Wie viele Server/Instanzen bilden den Cluster?</p>
        <p><strong>Typische Konfigurationen:</strong></p>
        <ul>
            <li><strong>2 Knoten:</strong> Minimum für HA (1 Primary + 1 Standby). Standard für kleinere Systeme.</li>
            <li><strong>3 Knoten:</strong> Empfohlen für Produktion (Quorum, bessere Fehlertoleranz)</li>
            <li><strong>5+ Knoten:</strong> Für sehr kritische Systeme oder geografisch verteilt</li>
        </ul>
        <p><strong>Faustregel:</strong> Ungerade Anzahl bei Quorum-basierten Systemen (z.B. 3, 5, 7)</p>
        <p><strong>Wichtig:</strong> Jeder zusätzliche Knoten = mehr Ressourcen und Komplexität</p>
        <em>Minimum: 2 Knoten für HA, empfohlen: 3 Knoten für Produktion</em>
    </div>

    <div data-tooltip-id="failover-mode">
        <strong>Failover-Modus</strong>
        <p>Wie wird bei Ausfall eines Knotens reagiert?</p>
        <p><strong>Modi erklärt:</strong></p>
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
        <p><strong>Entscheidung:</strong></p>
        <ul>
            <li>Kritische Systeme (Notaufnahme, OP) → Automatisch</li>
            <li>Normale Systeme → Automatisch oder Semi-Automatisch</li>
            <li>Test/Entwicklung → Manuell</li>
        </ul>
    </div>

    <div data-tooltip-id="db-host-assignment">
        <strong>Host-Zuordnung</strong>
        <p>Auf welchen Servern läuft diese Datenbank?</p>
        <p><strong>Wichtig für:</strong></p>
        <ul>
            <li>Übersicht: Wo läuft welche Datenbank?</li>
            <li>Ressourcen-Planung</li>
            <li>Backup-Planung</li>
            <li>Fehlersuche und Monitoring</li>
        </ul>
        <p><strong>Mehrere Hosts bei:</strong></p>
        <ul>
            <li>Cluster-Konfiguration (alle Cluster-Knoten)</li>
            <li>Replikation (Primary + Replicas)</li>
        </ul>
        <p><strong>Ein Host bei:</strong></p>
        <ul>
            <li>Standalone-Datenbank</li>
            <li>Entwicklungs-/Test-Umgebung</li>
        </ul>
        <em>Die Server müssen vorher als VMs oder Hardware angelegt worden sein!</em>
    </div>

    <div data-tooltip-id="db-size">
        <strong>Datenbankgröße</strong>
        <p>Aktueller Speicherplatz-Verbrauch der Datenbank in Gigabyte.</p>
        <p><strong>Warum wichtig?</strong></p>
        <ul>
            <li>Speicherplatz-Planung</li>
            <li>Backup-Dauer und -Größe</li>
            <li>Performance (sehr große DBs brauchen mehr Ressourcen)</li>
            <li>Lizenz-Kosten (bei kommerziellen Systemen)</li>
        </ul>
        <p><strong>Richtwerte im Krankenhaus:</strong></p>
        <ul>
            <li>Kleines System: 50-200 GB</li>
            <li>Mittleres KIS: 500-2000 GB (0.5-2 TB)</li>
            <li>Großes KIS: 2-10 TB</li>
            <li>PACS: 10-100+ TB (Bilder brauchen viel Platz!)</li>
        </ul>
        <p><strong>Tipp:</strong> Wachstum pro Jahr beachten! PACS kann 5-10 TB/Jahr wachsen.</p>
        <em>Zur Ermittlung: Abfrage `SELECT SUM(bytes)/1024/1024/1024 FROM dba_segments;` (Oracle)</em>
    </div>

    <div data-tooltip-id="max-connections">
        <strong>Maximale Verbindungen</strong>
        <p>Wie viele gleichzeitige Client-Verbindungen sind erlaubt?</p>
        <p><strong>Was zählt als Verbindung?</strong></p>
        <ul>
            <li>Jede Anwendungs-Session</li>
            <li>Jeder Web-User (bei Connection Pool weniger)</li>
            <li>Monitoring-Tools</li>
            <li>Backup-Verbindungen</li>
        </ul>
        <p><strong>Typische Werte:</strong></p>
        <ul>
            <li><strong>50-100:</strong> Kleine Anwendung, wenige Benutzer</li>
            <li><strong>100-500:</strong> Mittlere Anwendung (Standard-KIS)</li>
            <li><strong>500-1000:</strong> Große Anwendung, viele Benutzer</li>
            <li><strong>1000+:</strong> Sehr große Systeme oder Connection Pooling</li>
        </ul>
        <p><strong>WICHTIG:</strong> Jede Verbindung verbraucht RAM! Zu viele = Performance-Probleme</p>
        <p><strong>Faustregel:</strong> 1-5 MB RAM pro Verbindung</p>
        <em>Connection Pooling reduziert benötigte Verbindungen erheblich!</em>
    </div>

    <div data-tooltip-id="db-encryption">
        <strong>Verschlüsselung</strong>
        <p>Wie werden Daten in der Datenbank verschlüsselt?</p>
        <p><strong>Verschlüsselungs-Typen:</strong></p>
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
        <p><strong>DSGVO:</strong> Bei Patientendaten TDE oder Column-Level PFLICHT!</p>
        <em>Verschlüsselung kostet 5-15% Performance - aber Sicherheit geht vor!</em>
    </div>

    <div data-tooltip-id="db-authentication">
        <strong>Authentifizierung</strong>
        <p>Wie melden sich Benutzer an der Datenbank an?</p>
        <p><strong>Methoden erklärt:</strong></p>
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
        <p><strong>Empfehlung:</strong> AD/LDAP für zentrale Verwaltung, sonst Native DB Auth</p>
    </div>

    <div data-tooltip-id="db-notes">
        <strong>Notizen / Besonderheiten</strong>
        <p>Zusätzliche wichtige Informationen zu dieser Datenbank.</p>
        <p><strong>Was hier dokumentieren:</strong></p>
        <ul>
            <li>Besondere Konfigurationen oder Parameter</li>
            <li>Maintenance-Windows und Backup-Zeiten</li>
            <li>Bekannte Probleme oder Limitierungen</li>
            <li>Wichtige Ansprechpartner (DBA, Vendor-Support)</li>
            <li>Abhängigkeiten zu anderen Systemen</li>
            <li>Besondere Anforderungen (z.B. spezielle Patches)</li>
            <li>Lizenz-Informationen</li>
        </ul>
        <p><strong>Beispiel:</strong></p>
        <p>"Backup täglich 02:00 Uhr, Full jeden Sonntag. Wartungsfenster: Letzter Sonntag im Monat 01:00-05:00. DBA: Max Mustermann (Tel. 1234). Oracle Patch 35042068 installiert für Bug-Fix. Wichtig: Tablespace USERS auf 80% → erweitern!"</p>
        <em>Je mehr Details, desto einfacher für den nächsten Admin!</em>
    </div>
</div>
