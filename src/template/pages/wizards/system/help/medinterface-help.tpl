<div class="tooltip-definitions" style="display: none;">
    <div data-tooltip-id="interface-name">
        <strong>Schnittstellenname</strong>
        <p>Ein beschreibender Name für diese medizinische Schnittstelle.</p>
        <p><strong>Was ist eine Schnittstelle?</strong> Eine "Brücke" zwischen zwei medizinischen Systemen, die Daten austauschen.</p>
        <p><strong>Warum wichtig im Krankenhaus?</strong></p>
        <ul>
            <li>KIS muss mit Labor, Radiologie, PACS kommunizieren</li>
            <li>Verschiedene Systeme sprechen verschiedene "Sprachen"</li>
            <li>Schnittstelle übersetzt und vermittelt</li>
        </ul>
        <p><strong>Namens-Beispiele:</strong></p>
        <ul>
            <li>"KIS-Labor HL7" - KIS sendet/empfängt Labor-Befunde</li>
            <li>"PACS-RIS DICOM" - PACS und RIS tauschen Bilder aus</li>
            <li>"KIS-Abrechnungssystem" - Abrechnungsdaten-Export</li>
            <li>"Labor-Interface Roche" - Anbindung Labor-Gerät</li>
        </ul>
        <em>Gute Namen beschreiben: Welche Systeme? Welche Daten?</em>
    </div>

    <div data-tooltip-id="interface-type">
        <strong>Schnittstellentyp</strong>
        <p>Das verwendete Standard-Protokoll für den Datenaustausch.</p>
        <p><strong>Typen erklärt:</strong></p>
        <ul>
            <li><strong>HL7 v2.x:</strong>
                <ul>
                    <li>Health Level 7 - Standard für Gesundheitsdaten</li>
                    <li>Am weitesten verbreitet im Krankenhaus</li>
                    <li>Text-basierte Nachrichten (Pipes und Hütchen: |^~\&)</li>
                    <li>Für: Patientendaten, Befunde, Aufträge, ADT</li>
                    <li><em>Der "Klassiker" - praktisch überall verwendet!</em></li>
                </ul>
            </li>
            <li><strong>HL7 FHIR:</strong>
                <ul>
                    <li>Fast Healthcare Interoperability Resources</li>
                    <li>Moderner Standard (REST API, JSON/XML)</li>
                    <li>Zukunft der medizinischen Interoperabilität</li>
                    <li>Einfacher als HL7 v2, aber noch nicht überall</li>
                </ul>
            </li>
            <li><strong>DICOM:</strong>
                <ul>
                    <li>Digital Imaging and Communications in Medicine</li>
                    <li>Standard für medizinische Bilder</li>
                    <li>Röntgen, CT, MRT, Ultraschall</li>
                    <li>PACS und Bildgebungs-Modalitäten</li>
                </ul>
            </li>
            <li><strong>IHE XDS:</strong>
                <ul>
                    <li>Cross-Enterprise Document Sharing</li>
                    <li>Für elektronische Patientenakten</li>
                    <li>Dokumente-Austausch zwischen Einrichtungen</li>
                </ul>
            </li>
            <li><strong>REST API:</strong>
                <ul>
                    <li>Moderne Web-API (HTTP/JSON)</li>
                    <li>Flexibel, aber kein medizinischer Standard</li>
                    <li>Oft für eigene Entwicklungen</li>
                </ul>
            </li>
            <li><strong>SOAP/Web Services:</strong>
                <ul>
                    <li>Älterer Web-Service-Standard (XML)</li>
                    <li>Komplexer als REST</li>
                    <li>Noch in vielen Legacy-Systemen</li>
                </ul>
            </li>
            <li><strong>GDT/BDT:</strong>
                <ul>
                    <li>Gerätedatentransfer / Behandlungsdatentransfer</li>
                    <li>Deutscher Standard</li>
                    <li>Für Praxis-Software und Geräte</li>
                </ul>
            </li>
            <li><strong>xDT (LDT/ADT):</strong>
                <ul>
                    <li>LDT: Labordatentransfer</li>
                    <li>ADT: Abrechnungsdatentransfer</li>
                    <li>Deutsche Standards, verbreitet in Arztpraxen</li>
                </ul>
            </li>
            <li><strong>Proprietär:</strong>
                <ul>
                    <li>Hersteller-eigenes Protokoll</li>
                    <li>Keine offenen Standards</li>
                    <li>Dokumentation vom Hersteller nötig</li>
                </ul>
            </li>
        </ul>
        <p><strong>Entscheidung:</strong> Meist vom Quell- und Zielsystem vorgegeben!</p>
    </div>

    <div data-tooltip-id="data-direction">
        <strong>Datenflussrichtung</strong>
        <p>In welche Richtung fließen die Daten?</p>
        <p><strong>Richtungen erklärt:</strong></p>
        <ul>
            <li><strong>Ausgehend (Outbound):</strong>
                <ul>
                    <li>DIESES System SENDET Daten</li>
                    <li>Beispiel: KIS sendet Labor-Aufträge an Labor-System</li>
                    <li>Dieses System = Quelle/Sender</li>
                </ul>
            </li>
            <li><strong>Eingehend (Inbound):</strong>
                <ul>
                    <li>DIESES System EMPFÄNGT Daten</li>
                    <li>Beispiel: KIS empfängt Labor-Befunde vom Labor-System</li>
                    <li>Dieses System = Ziel/Empfänger</li>
                </ul>
            </li>
            <li><strong>Bidirektional:</strong>
                <ul>
                    <li>Daten fließen in BEIDE Richtungen</li>
                    <li>Beispiel: KIS ↔ PACS (Aufträge raus, Befunde rein)</li>
                    <li>Beide Systeme senden UND empfangen</li>
                </ul>
            </li>
        </ul>
        <p><strong>Perspektive:</strong> Immer aus Sicht des Systems, das Sie gerade dokumentieren!</p>
        <em>Tipp: Bei bidirektional können Sie auch zwei separate Schnittstellen dokumentieren (klarer)</em>
    </div>

    <div data-tooltip-id="source-system">
        <strong>Quellsystem / Sender</strong>
        <p>Das System, das die Daten sendet (die Quelle).</p>
        <p><strong>Beispiele:</strong></p>
        <ul>
            <li>"KIS Orbis" - Krankenhaus-Informationssystem sendet</li>
            <li>"Labor-System Roche cobas" - Laborgerät sendet Befunde</li>
            <li>"RIS Medavis" - Radiologie-IS sendet Anforderungen</li>
        </ul>
        <p><strong>Bei ausgehend:</strong> Das ist das System, das Sie gerade dokumentieren</p>
        <p><strong>Bei eingehend:</strong> Das ist das externe System</p>
    </div>

    <div data-tooltip-id="source-component">
        <strong>Quell-Komponente</strong>
        <p>Die konkrete VM oder der Server, auf dem das Quellsystem läuft (optional).</p>
        <p><strong>Warum hilfreich?</strong></p>
        <ul>
            <li>Schnelle Identifikation: Auf welchem Server läuft das?</li>
            <li>Troubleshooting: Welcher Server hat Problem?</li>
            <li>Firewall-Regeln: Welche IPs müssen freigegeben werden?</li>
        </ul>
        <p><strong>Beispiel:</strong> KIS läuft auf "kis-app-server-01" → Diese VM auswählen</p>
        <em>Nur auswählen, wenn die Komponente vorher als VM/Server angelegt wurde</em>
    </div>

    <div data-tooltip-id="connection-type">
        <strong>Verbindungstyp</strong>
        <p>WIE kommunizieren die Systeme miteinander?</p>
        <p><strong>Typen erklärt:</strong></p>
        <ul>
            <li><strong>Direkte Verbindung:</strong>
                <ul>
                    <li>System A → direkt → System B</li>
                    <li>TCP/IP-Verbindung mit Port</li>
                    <li>Einfach, aber unflexibel</li>
                    <li>Bei Änderungen: Beide Systeme anpassen</li>
                </ul>
            </li>
            <li><strong>Kommunikationsserver / Interface Engine:</strong>
                <ul>
                    <li>System A → Interface Engine → System B</li>
                    <li>Zentrale Vermittlungsstelle</li>
                    <li>Vorteile: Transformation, Routing, Überwachung</li>
                    <li>Beispiele: Mirth Connect, Rhapsody, Ensemble</li>
                    <li><em>Best Practice für viele Schnittstellen!</em></li>
                </ul>
            </li>
            <li><strong>File Share / Verzeichnis:</strong>
                <ul>
                    <li>System A schreibt Datei → System B liest Datei</li>
                    <li>Asynchron, keine direkte Verbindung</li>
                    <li>Gut für Batch-Verarbeitung</li>
                    <li>Problem: Zeitverzögerung, Fehlerbehandlung schwierig</li>
                </ul>
            </li>
            <li><strong>Message Queue / Broker:</strong>
                <ul>
                    <li>System A → Queue → System B</li>
                    <li>Warteschlange für Nachrichten</li>
                    <li>Entkopplung, Pufferung bei Lastspitzen</li>
                    <li>Beispiele: RabbitMQ, IBM MQ, Kafka</li>
                </ul>
            </li>
        </ul>
        <p><strong>Wann was?</strong></p>
        <ul>
            <li>2-3 Systeme, einfach → Direkt</li>
            <li>Viele Schnittstellen → Interface Engine</li>
            <li>Batch-Übertragung → File Share</li>
            <li>Hohe Lasten, Entkopplung → Message Queue</li>
        </ul>
    </div>

    <div data-tooltip-id="direct-port">
        <strong>Port (Direkte Verbindung)</strong>
        <p>Der TCP-Port, auf dem das Zielsystem lauscht.</p>
        <p><strong>Typische HL7-Ports:</strong></p>
        <ul>
            <li>2575 - Standard HL7 MLLP (aber variiert!)</li>
            <li>6661-6669 - Oft für HL7</li>
            <li>Herstellerspezifisch: Jeder kann eigenen Port wählen</li>
        </ul>
        <p><strong>DICOM-Ports:</strong></p>
        <ul>
            <li>104 - Standard DICOM (benötigt Root-Rechte)</li>
            <li>11112 - Alternativer DICOM-Port (häufig)</li>
        </ul>
        <p><strong>Web-basiert:</strong></p>
        <ul>
            <li>443 - HTTPS (REST, FHIR, SOAP)</li>
            <li>80 - HTTP (nicht empfohlen für Patientendaten!)</li>
        </ul>
        <em>Port muss in Firewall freigeschaltet sein!</em>
    </div>

    <div data-tooltip-id="direct-encryption">
        <strong>Verschlüsselung (Direkte Verbindung)</strong>
        <p>Wie werden die Daten während der Übertragung geschützt?</p>
        <p><strong>Optionen:</strong></p>
        <ul>
            <li><strong>TLS/SSL verschlüsselt:</strong>
                <ul>
                    <li>Daten werden verschlüsselt übertragen</li>
                    <li>Standard für HTTPS, auch für HL7 möglich</li>
                    <li><em>Empfohlen für Patientendaten!</em></li>
                </ul>
            </li>
            <li><strong>VPN-Tunnel:</strong>
                <ul>
                    <li>Verschlüsselte "Röhre" zwischen Netzwerken</li>
                    <li>Für standortübergreifende Verbindungen</li>
                </ul>
            </li>
            <li><strong>IPSec:</strong>
                <ul>
                    <li>Verschlüsselung auf IP-Ebene</li>
                    <li>Transparent für Anwendungen</li>
                </ul>
            </li>
            <li><strong>Keine Verschlüsselung:</strong>
                <ul>
                    <li>Nur für interne, isolierte Netzwerke!</li>
                    <li>Nicht DSGVO-konform für Patientendaten über Netzwerk-Grenzen</li>
                </ul>
            </li>
        </ul>
        <em>WICHTIG: Patientendaten MÜSSEN verschlüsselt übertragen werden!</em>
    </div>

    <div data-tooltip-id="commserver-select">
        <strong>Kommunikationsserver auswählen</strong>
        <p>Wählen Sie einen bestehenden Interface Engine oder geben Sie manuell ein.</p>
        <p><strong>Was ist eine Interface Engine?</strong> Zentrale Software, die Nachrichten zwischen Systemen vermittelt, transformiert und routet.</p>
        <p><strong>Vorteile:</strong></p>
        <ul>
            <li>Eine Stelle für alle Schnittstellen</li>
            <li>Zentrale Überwachung und Logging</li>
            <li>Nachrichten-Transformation (HL7 v2 → FHIR)</li>
            <li>Routing-Regeln (eine Nachricht an mehrere Ziele)</li>
            <li>Fehlerbehandlung und Wiederholung</li>
        </ul>
        <p><strong>Beliebte Produkte:</strong></p>
        <ul>
            <li>Mirth Connect (Open Source)</li>
            <li>Rhapsody (kommerziell)</li>
            <li>InterSystems Ensemble/HealthConnect</li>
            <li>Corepoint</li>
        </ul>
    </div>

    <div data-tooltip-id="commserver-channel">
        <strong>Channel / Route Name</strong>
        <p>Der Name des Channels oder der Route auf dem Kommunikationsserver.</p>
        <p><strong>Was ist ein Channel?</strong> Eine konfigurierte Schnittstellen-Verbindung in der Interface Engine - definiert Quelle, Ziel, Transformation.</p>
        <p><strong>Beispiele:</strong></p>
        <ul>
            <li>"KIS-to-Labor" - Channel für Labor-Kommunikation</li>
            <li>"ADT-Feed" - Patientenbewegungen</li>
            <li>"ORU-Results-Inbound" - Eingehende Befunde</li>
        </ul>
        <em>Hilft beim Troubleshooting - man weiß, wo man in der Interface Engine schauen muss</em>
    </div>

    <div data-tooltip-id="fileshare-path">
        <strong>File Share Pfad</strong>
        <p>Der Netzwerk-Pfad zum gemeinsamen Verzeichnis.</p>
        <p><strong>Format:</strong></p>
        <ul>
            <li><strong>Windows (UNC):</strong> \\fileserver\hl7\inbox</li>
            <li><strong>Linux:</strong> /mnt/interfaces/labor</li>
        </ul>
        <p><strong>Typisches Setup:</strong></p>
        <ul>
            <li>Sender schreibt in "outbox"</li>
            <li>Empfänger liest aus "inbox"</li>
            <li>Verarbeitete Dateien → "archive"</li>
            <li>Fehler → "error"</li>
        </ul>
        <em>Berechtigungen beachten: Sender braucht Schreib-, Empfänger Leserechte!</em>
    </div>

    <div data-tooltip-id="fileshare-protocol">
        <strong>File Share Protokoll</strong>
        <p>Das Protokoll für den Dateizugriff.</p>
        <p><strong>Protokolle:</strong></p>
        <ul>
            <li><strong>SMB/CIFS:</strong> Windows File Sharing (Standard Windows)</li>
            <li><strong>NFS:</strong> Network File System (Standard Linux/Unix)</li>
            <li><strong>FTP:</strong> File Transfer Protocol (veraltet, unsicher)</li>
            <li><strong>SFTP:</strong> SSH File Transfer (sicher, empfohlen)</li>
            <li><strong>WebDAV:</strong> Web-basiertes Dateisystem</li>
        </ul>
        <p><strong>Empfehlung:</strong> SFTP für externe Verbindungen, SMB/NFS intern</p>
    </div>

    <div data-tooltip-id="file-pattern">
        <strong>Dateiformat / -muster</strong>
        <p>Das Namens-Muster oder Format der Dateien.</p>
        <p><strong>Beispiele:</strong></p>
        <ul>
            <li>"*.hl7" - Alle Dateien mit Endung .hl7</li>
            <li>"ADT_*.xml" - XML-Dateien, die mit ADT_ beginnen</li>
            <li>"befund_YYYYMMDD_*.txt" - Befunde mit Datum</li>
            <li>"labor_*.dat" - Labor-Dateien</li>
        </ul>
        <em>Wildcard * = beliebige Zeichen</em>
    </div>

    <div data-tooltip-id="mq-system">
        <strong>Message Queue System</strong>
        <p>Die verwendete Message Queue Software.</p>
        <p><strong>Was ist eine Message Queue?</strong> Eine Warteschlange für Nachrichten - wie ein Postfach, das Nachrichten zwischenspeichert.</p>
        <p><strong>Systeme:</strong></p>
        <ul>
            <li><strong>RabbitMQ:</strong> Open Source, sehr beliebt</li>
            <li><strong>IBM MQ:</strong> Enterprise-Lösung</li>
            <li><strong>Apache Kafka:</strong> Für sehr hohe Datenmengen</li>
            <li><strong>ActiveMQ:</strong> Java-basiert, Open Source</li>
            <li><strong>Azure Service Bus:</strong> Cloud (Microsoft)</li>
            <li><strong>AWS SQS:</strong> Cloud (Amazon)</li>
        </ul>
    </div>

    <div data-tooltip-id="mq-queue">
        <strong>Queue / Topic Name</strong>
        <p>Der Name der Warteschlange oder des Topics.</p>
        <p><strong>Queue vs. Topic:</strong></p>
        <ul>
            <li><strong>Queue:</strong> Nachricht wird von EINEM Empfänger gelesen</li>
            <li><strong>Topic:</strong> Nachricht kann von MEHREREN Empfängern gelesen werden (Publish-Subscribe)</li>
        </ul>
        <p><strong>Namens-Beispiele:</strong></p>
        <ul>
            <li>"hospital.adt.queue" - ADT-Nachrichten</li>
            <li>"lab.results.topic" - Labor-Befunde (mehrere Abonnenten)</li>
            <li>"orders.radiology" - Radiologie-Aufträge</li>
        </ul>
    </div>

    <div data-tooltip-id="target-system">
        <strong>Zielsystem / Empfänger</strong>
        <p>Das System, das die Daten empfängt (das Ziel).</p>
        <p><strong>Beispiele:</strong></p>
        <ul>
            <li>"Labor-System Roche cobas" - Labor empfängt Aufträge</li>
            <li>"PACS Sectra" - Bildarchiv empfängt Bilder</li>
            <li>"Archivsystem" - Langzeitarchiv</li>
        </ul>
    </div>

    <div data-tooltip-id="target-component">
        <strong>Ziel-Komponente</strong>
        <p>Die konkrete Komponente (Load Balancer, VM, Server) des Zielsystems.</p>
        <p><strong>Warum auch Load Balancer?</strong> Oft läuft das Zielsystem hinter einem Load Balancer für Hochverfügbarkeit.</p>
        <p><strong>Reihenfolge der Auswahl:</strong></p>
        <ol>
            <li>Load Balancer (wenn vorhanden)</li>
            <li>VM oder Hardware-Server</li>
        </ol>
        <em>Bei Load Balancer: Traffic wird auf mehrere Backend-Server verteilt</em>
    </div>

    <div data-tooltip-id="data-types">
        <strong>Übertragene Datentypen</strong>
        <p>Welche Art von medizinischen Daten werden über diese Schnittstelle ausgetauscht?</p>
        <p><strong>Typen erklärt:</strong></p>
        <ul>
            <li><strong>Patientenstammdaten:</strong> Name, Geburtsdatum, Adresse, Versicherung</li>
            <li><strong>ADT:</strong> Admission/Discharge/Transfer - Aufnahme, Bewegungen, Entlassung</li>
            <li><strong>Aufträge/Anforderungen:</strong> Labor-Anforderungen, Radiologie-Aufträge</li>
            <li><strong>Laborbefunde:</strong> Ergebnisse aus Labor</li>
            <li><strong>Radiologie-Befunde:</strong> Befundtexte, nicht die Bilder</li>
            <li><strong>Medizinische Bilder:</strong> Röntgen, CT, MRT (DICOM)</li>
            <li><strong>Klinische Dokumente:</strong> Arztbriefe, OP-Berichte</li>
            <li><strong>Medikationsdaten:</strong> Verschreibungen, Medikamentenplan</li>
            <li><strong>Diagnosen:</strong> ICD-Codes</li>
            <li><strong>Prozeduren:</strong> OPS-Codes</li>
            <li><strong>Abrechnungsdaten:</strong> Für Kostenträger</li>
            <li><strong>Terminplanung:</strong> Termine, Ressourcen</li>
            <li><strong>Vitalparameter:</strong> Blutdruck, Temperatur, etc.</li>
        </ul>
        <em>Mehrfachauswahl möglich - eine Schnittstelle kann mehrere Datentypen übertragen</em>
    </div>

    <div data-tooltip-id="transport-protocol">
        <strong>Protokoll / Transport</strong>
        <p>Das technische Transport-Protokoll auf niedrigerer Ebene.</p>
        <p><strong>Protokolle:</strong></p>
        <ul>
            <li><strong>MLLP:</strong> Minimal Lower Layer Protocol - Standard für HL7 v2 über TCP</li>
            <li><strong>HTTPS/TLS:</strong> Verschlüsseltes Web-Protokoll (REST, FHIR, SOAP)</li>
            <li><strong>HTTP:</strong> Unverschlüsselt (nicht für Patientendaten!)</li>
            <li><strong>TCP/IP:</strong> Rohes TCP (z.B. für proprietäre Protokolle)</li>
            <li><strong>File-basiert:</strong> Via Dateisystem</li>
            <li><strong>FTP/SFTP:</strong> Dateiübertragung</li>
            <li><strong>Message Queue:</strong> Über MQ-System</li>
            <li><strong>DICOM Network:</strong> DICOM über Netzwerk</li>
        </ul>
    </div>

    <div data-tooltip-id="message-volume">
        <strong>Nachrichtenvolumen</strong>
        <p>Wie viele Nachrichten pro Tag werden übertragen?</p>
        <p><strong>Warum wichtig?</strong></p>
        <ul>
            <li>Kapazitätsplanung</li>
            <li>Performance-Dimensionierung</li>
            <li>Monitoring-Schwellwerte</li>
        </ul>
        <p><strong>Richtwerte:</strong></p>
        <ul>
            <li><strong>< 1.000:</strong> Niedrig (kleine Abteilung)</li>
            <li><strong>1.000-10.000:</strong> Mittel (normale Station/Abteilung)</li>
            <li><strong>10.000-100.000:</strong> Hoch (ganzes Krankenhaus, ADT)</li>
            <li><strong>> 100.000:</strong> Sehr hoch (große Klinik, Echtzeit-Monitoring)</li>
        </ul>
        <em>Bei Lastspitzen (z.B. Monatsende) kann es mehr sein!</em>
    </div>

    <div data-tooltip-id="interface-criticality">
        <strong>SLA / Kritikalität</strong>
        <p>Wie wichtig ist die Schnittstelle? Wie schnell müssen Nachrichten ankommen?</p>
        <p><strong>Stufen:</strong></p>
        <ul>
            <li><strong>Kritisch (Echtzeit):</strong>
                <ul>
                    <li>Sekunden-Bereich</li>
                    <li>Notaufnahme, OP, Intensivstation</li>
                    <li>Beispiel: Vitalparameter-Übertragung</li>
                </ul>
            </li>
            <li><strong>Hoch (< 5 Min):</strong>
                <ul>
                    <li>Wenige Minuten</li>
                    <li>Labor-Befunde, dringende Aufträge</li>
                    <li>Stationsbetrieb</li>
                </ul>
            </li>
            <li><strong>Mittel (< 1 Std):</strong>
                <ul>
                    <li>Innerhalb einer Stunde</li>
                    <li>Normale Labor-Befunde, Dokumentation</li>
                </ul>
            </li>
            <li><strong>Niedrig (täglich):</strong>
                <ul>
                    <li>Batch-Verarbeitung</li>
                    <li>Abrechnungsdaten, Statistiken</li>
                    <li>Archivierung</li>
                </ul>
            </li>
        </ul>
        <em>Kritikalität bestimmt Monitoring-Frequenz und Fehler-Eskalation!</em>
    </div>

    <div data-tooltip-id="timeout">
        <strong>Timeout</strong>
        <p>Wie lange wartet das System auf eine Antwort, bevor es einen Fehler meldet?</p>
        <p><strong>Typische Werte:</strong></p>
        <ul>
            <li><strong>10-30 Sekunden:</strong> Standard für die meisten Schnittstellen</li>
            <li><strong>60 Sekunden:</strong> Bei langsamen Systemen oder großen Datenmengen</li>
            <li><strong>5 Sekunden:</strong> Bei sehr schnellen, kritischen Schnittstellen</li>
        </ul>
        <p><strong>Was passiert bei Timeout?</strong></p>
        <ul>
            <li>Verbindung wird abgebrochen</li>
            <li>Fehler wird geloggt</li>
            <li>Je nach Konfiguration: Wiederholung</li>
        </ul>
        <em>Zu kurz = viele False-Positive-Fehler. Zu lang = lange Wartezeit bei echten Problemen</em>
    </div>

    <div data-tooltip-id="interface-notes">
        <strong>Anmerkungen / Besonderheiten</strong>
        <p>Zusätzliche wichtige Informationen zu dieser Schnittstelle.</p>
        <p><strong>Was dokumentieren:</strong></p>
        <ul>
            <li><strong>Transformationsregeln:</strong> z.B. "Geschlecht M/W wird zu 1/2 umgewandelt"</li>
            <li><strong>Mapping-Details:</strong> Welche Felder werden wie gemappt</li>
            <li><strong>Bekannte Einschränkungen:</strong> "System sendet keine Zeiten, nur Datumsangaben"</li>
            <li><strong>Besondere Formate:</strong> Datums-Format, Encoding</li>
            <li><strong>Wartungsfenster:</strong> Wann ist Schnittstelle geplant down</li>
            <li><strong>Fehlerbehandlung:</strong> Was passiert bei Fehlern</li>
            <li><strong>Ansprechpartner:</strong> Wer ist zuständig (beide Seiten)</li>
        </ul>
        <p><strong>Beispiel:</strong></p>
        <p>"HL7 v2.5 ADT-Messages. Mapping: PID-8 Geschlecht: M→1, W→2, U→3. Keine Wiederholung bei Fehler - manuelle Nachbearbeitung nötig. Wartung: Jeden Sonntag 02:00-04:00. Ansprechpartner Labor: Dr. Schmidt (Tel. 1234)"</p>
        <em>Je mehr Details, desto einfacher die Fehlersuche und Wartung!</em>
    </div>
</div>
