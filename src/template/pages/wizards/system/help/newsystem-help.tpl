<div class="tooltip-definitions" style="display: none;">
    <div data-tooltip-id="system-name">
        <strong>Systemname</strong>
        <p>Der eindeutige Name zur Identifikation des IT-Systems.</p>
        <p><strong>Was ist ein IT-System?</strong> Eine Sammlung von zusammengehörigen Komponenten (Server, Datenbanken, Software), die gemeinsam eine Funktion erfüllen.</p>
        <p><strong>Best Practices für Namen:</strong></p>
        <ul>
            <li>Beschreibend und eindeutig</li>
            <li>Funktion erkennbar</li>
            <li>Umgebung einbeziehen (Produktiv/Test)</li>
        </ul>
        <p><strong>Beispiele:</strong></p>
        <ul>
            <li>"KIS-Produktiv" - Krankenhaus-Informationssystem Produktiv</li>
            <li>"Radiologie-PACS" - Bildarchivierungssystem Radiologie</li>
            <li>"Labor-Interface" - Labor-Schnittstellensystem</li>
            <li>"Backup-System-RZ1" - Backup im Rechenzentrum 1</li>
        </ul>
        <em>Ein guter Name sagt sofort, worum es sich handelt!</em>
    </div>

    <div data-tooltip-id="software-product">
        <strong>Software / Produkt</strong>
        <p>Name der Hauptsoftware oder des Produkts.</p>
        <p><strong>Beispiele im Krankenhaus:</strong></p>
        <ul>
            <li>"Orbis" - KIS von Dedalus</li>
            <li>"iMedOne" - KIS von Dräger</li>
            <li>"Sectra PACS" - Bildarchiv</li>
            <li>"SAP ERP" - Verwaltungssoftware</li>
            <li>"Veeam Backup & Replication" - Backup-Software</li>
        </ul>
    </div>

    <div data-tooltip-id="vendor">
        <strong>Hersteller</strong>
        <p>Der Hersteller oder Anbieter der Software.</p>
        <p><strong>Wichtig für:</strong></p>
        <ul>
            <li>Support-Anfragen</li>
            <li>Lizenzverwaltung</li>
            <li>Update-Planung</li>
            <li>Vertragsmanagement</li>
        </ul>
        <p><strong>Beispiele:</strong> Dedalus, Siemens Healthineers, GE Healthcare, Dräger, Philips</p>
    </div>

    <div data-tooltip-id="version">
        <strong>Version</strong>
        <p>Die installierte Software-Version.</p>
        <p><strong>Warum wichtig?</strong></p>
        <ul>
            <li>Sicherheits-Updates identifizieren</li>
            <li>Kompatibilität prüfen</li>
            <li>Support-Ende (End of Life) planen</li>
        </ul>
        <p><strong>Beispiele:</strong> 2024.1, 8.2.5, v12.3, Release 2023 Q4</p>
        <em>Regelmäßig aktualisieren - alte Versionen haben oft Sicherheitslücken!</em>
    </div>

    <div data-tooltip-id="license-type">
        <strong>Lizenztyp</strong>
        <p>Wie ist die Software lizenziert?</p>
        <p><strong>Typen erklärt:</strong></p>
        <ul>
            <li><strong>Kommerziell:</strong> Einmalkauf, perpetuelle Lizenz. Zahlung einmalig, Updates oft kostenpflichtig.</li>
            <li><strong>Subscription:</strong> Monatliche/Jährliche Zahlung (SaaS). Laufende Kosten, Updates inklusive.</li>
            <li><strong>Open Source:</strong> Kostenlos, Quellcode verfügbar. Gut für Budget, aber ggf. weniger Support.</li>
            <li><strong>Eigenentwicklung:</strong> Selbst programmiert. Volle Kontrolle, aber eigener Wartungsaufwand.</li>
        </ul>
        <em>Wichtig für Budgetplanung und Compliance!</em>
    </div>

    <div data-tooltip-id="department">
        <strong>Fachbereich</strong>
        <p>Welcher Fachbereich nutzt dieses System primär?</p>
        <p><strong>Warum wichtig?</strong></p>
        <ul>
            <li>Klare Zuständigkeiten</li>
            <li>Ressourcen-Zuordnung</li>
            <li>Priorisierung bei Störungen</li>
        </ul>
        <p><strong>Beispiele:</strong></p>
        <ul>
            <li>Radiologie - PACS, RIS</li>
            <li>Labor - LIS, Labor-Geräte</li>
            <li>IT - Infrastruktur-Systeme</li>
            <li>Verwaltung - Abrechnungssysteme</li>
        </ul>
    </div>

    <div data-tooltip-id="criticality">
        <strong>Kritikalität</strong>
        <p>Wie wichtig ist dieses System für den Betrieb?</p>
        <p><strong>Stufen erklärt:</strong></p>
        <ul>
            <li><strong>Kritisch (24/7):</strong>
                <ul>
                    <li>Muss IMMER verfügbar sein</li>
                    <li>Ausfall = Patientengefährdung oder Betriebsunterbrechung</li>
                    <li>Beispiele: Notaufnahme-KIS, OP-Systeme, Intensivstation</li>
                    <li>Wartung nur mit Failover</li>
                </ul>
            </li>
            <li><strong>Hoch:</strong>
                <ul>
                    <li>Sehr wichtig, kurze Ausfallzeiten tolerierbar</li>
                    <li>Beispiele: Stations-KIS, Standard-PACS</li>
                    <li>Wartungsfenster nötig</li>
                </ul>
            </li>
            <li><strong>Mittel:</strong>
                <ul>
                    <li>Wichtig, aber Ausfälle verkraftbar</li>
                    <li>Beispiele: Archiv-Systeme, Berichtssysteme</li>
                </ul>
            </li>
            <li><strong>Niedrig:</strong>
                <ul>
                    <li>Nice-to-have, Ausfall unkritisch</li>
                    <li>Beispiele: Test-Systeme, Entwicklungsumgebungen</li>
                </ul>
            </li>
        </ul>
        <em>Kritikalität bestimmt Backup-Häufigkeit, Wartungsfenster und Monitoring!</em>
    </div>

    <div data-tooltip-id="environment">
        <strong>Umgebung</strong>
        <p>In welcher Umgebung läuft dieses System?</p>
        <p><strong>Umgebungen erklärt:</strong></p>
        <ul>
            <li><strong>Produktion:</strong> Das "echte" System, wo Patientendaten verarbeitet werden. Höchste Sicherheit und Stabilität.</li>
            <li><strong>Test/Staging:</strong> Kopie der Produktion zum Testen von Updates und Änderungen. Keine echten Patientendaten!</li>
            <li><strong>Entwicklung:</strong> Für Softwareentwicklung und Experimente. Instabil, häufige Änderungen.</li>
            <li><strong>Schulung:</strong> Für Mitarbeiter-Trainings. Spezielle Testdaten.</li>
        </ul>
        <p><strong>Best Practice:</strong> Änderungen IMMER erst in Test, dann in Produktion!</p>
        <em>NIEMALS direkt in Produktion entwickeln oder testen!</em>
    </div>

    <div data-tooltip-id="hosting">
        <strong>Hosting / Standort</strong>
        <p>Wo läuft das System physisch?</p>
        <p><strong>Optionen erklärt:</strong></p>
        <ul>
            <li><strong>On-Premise (eigenes RZ):</strong>
                <ul>
                    <li>Server im eigenen Rechenzentrum</li>
                    <li>Volle Kontrolle, aber volle Verantwortung</li>
                    <li>Hohe Investitionskosten</li>
                    <li>Für sensible Patientendaten oft gewünscht</li>
                </ul>
            </li>
            <li><strong>Dienstleister-Rechenzentrum:</strong>
                <ul>
                    <li>Server bei externem Provider (Colocation)</li>
                    <li>Provider kümmert sich um Infrastruktur</li>
                    <li>Daten bleiben in Deutschland (wichtig für DSGVO)</li>
                </ul>
            </li>
            <li><strong>Cloud (Public Cloud):</strong>
                <ul>
                    <li>Azure, AWS, Google Cloud</li>
                    <li>Sehr flexibel, pay-per-use</li>
                    <li>Standort beachten (EU-Region für DSGVO)</li>
                    <li>Für neue Projekte oft erste Wahl</li>
                </ul>
            </li>
            <li><strong>Hybrid:</strong>
                <ul>
                    <li>Teil On-Premise, Teil Cloud</li>
                    <li>Sensible Daten lokal, Rest in Cloud</li>
                    <li>Komplex, aber flexibel</li>
                </ul>
            </li>
        </ul>
        <em>Trend: Immer mehr Krankenhäuser gehen in die Cloud (mit EU-Servern)</em>
    </div>

    <div data-tooltip-id="cloud-provider">
        <strong>Cloud-Anbieter</strong>
        <p>Bei welchem Cloud-Provider läuft das System?</p>
        <p><strong>Wichtige Anbieter:</strong></p>
        <ul>
            <li><strong>Microsoft Azure:</strong> In Deutschland sehr beliebt, deutsche Rechenzentren</li>
            <li><strong>AWS (Amazon):</strong> Marktführer, sehr umfangreich</li>
            <li><strong>Google Cloud:</strong> Stark in Big Data und KI</li>
            <li><strong>IBM Cloud:</strong> Für Legacy-Systeme</li>
            <li><strong>Deutsche Anbieter:</strong> IONOS, T-Systems (für höchste Datenschutz-Anforderungen)</li>
        </ul>
        <em>Wichtig: Server-Standort für DSGVO-Compliance (EU-Region wählen!)</em>
    </div>

    <div data-tooltip-id="data-classification">
        <strong>Datenschutz-Klassifizierung</strong>
        <p>Welche Art von Daten werden verarbeitet?</p>
        <p><strong>Klassifizierungen:</strong></p>
        <ul>
            <li><strong>Patientendaten (DSGVO):</strong>
                <ul>
                    <li>Gesundheitsdaten sind "besonders schützenswert"</li>
                    <li>Höchste Sicherheitsanforderungen</li>
                    <li>Verschlüsselung PFLICHT</li>
                    <li>Beispiele: KIS, PACS, Labor-Systeme</li>
                </ul>
            </li>
            <li><strong>Personenbezogene Daten:</strong>
                <ul>
                    <li>Namen, Adressen, aber keine Gesundheitsdaten</li>
                    <li>Hohe Anforderungen</li>
                    <li>Beispiele: HR-Systeme, Terminverwaltung</li>
                </ul>
            </li>
            <li><strong>Interne Daten:</strong>
                <ul>
                    <li>Geschäftsinterne Informationen</li>
                    <li>Mittlere Anforderungen</li>
                    <li>Beispiele: Interne Wikis, Dokumentation</li>
                </ul>
            </li>
            <li><strong>Öffentlich:</strong>
                <ul>
                    <li>Darf veröffentlicht werden</li>
                    <li>Beispiele: Öffentliche Website, Pressemitteilungen</li>
                </ul>
            </li>
        </ul>
        <em>DSGVO-Verstöße können sehr teuer werden - bis zu 4% des Jahresumsatzes!</em>
    </div>

    <div data-tooltip-id="encryption">
        <strong>Verschlüsselung</strong>
        <p>Wie werden die Daten verschlüsselt?</p>
        <p><strong>Verschlüsselungs-Typen:</strong></p>
        <ul>
            <li><strong>In Transit & At Rest:</strong>
                <ul>
                    <li>Während Übertragung UND auf Festplatte verschlüsselt</li>
                    <li>Höchste Sicherheit</li>
                    <li><em>Empfohlen für Patientendaten!</em></li>
                </ul>
            </li>
            <li><strong>Nur In Transit (TLS/SSL):</strong>
                <ul>
                    <li>Nur während Netzwerk-Übertragung verschlüsselt</li>
                    <li>Auf Festplatte unverschlüsselt</li>
                    <li>Risiko: Bei Diebstahl lesbar</li>
                </ul>
            </li>
            <li><strong>Nur At Rest:</strong>
                <ul>
                    <li>Nur auf Festplatte verschlüsselt</li>
                    <li>Übertragung unverschlüsselt</li>
                    <li>Risiko: Abfangen im Netzwerk möglich</li>
                </ul>
            </li>
            <li><strong>Keine:</strong>
                <ul>
                    <li>NUR für öffentliche, unkritische Daten!</li>
                    <li>Nicht DSGVO-konform für Patientendaten</li>
                </ul>
            </li>
        </ul>
        <em>Patientendaten ohne Verschlüsselung = DSGVO-Verstoß!</em>
    </div>

    <div data-tooltip-id="authentication">
        <strong>Authentifizierung</strong>
        <p>Wie melden sich Benutzer am System an?</p>
        <p><strong>Methoden erklärt:</strong></p>
        <ul>
            <li><strong>Multi-Faktor (MFA):</strong>
                <ul>
                    <li>Passwort + zweiter Faktor (SMS, App, Token)</li>
                    <li>Sehr sicher - auch bei gestohlenem Passwort geschützt</li>
                    <li><em>Empfohlen für Admin-Zugänge!</em></li>
                </ul>
            </li>
            <li><strong>Single Sign-On (SSO):</strong>
                <ul>
                    <li>Einmal anmelden, Zugriff auf alle Systeme</li>
                    <li>Bequem für Benutzer</li>
                    <li>Zentrale Verwaltung</li>
                </ul>
            </li>
            <li><strong>Active Directory:</strong>
                <ul>
                    <li>Windows-Domänen-Anmeldung</li>
                    <li>Standard in vielen Krankenhäusern</li>
                    <li>Zentrale Benutzerverwaltung</li>
                </ul>
            </li>
            <li><strong>Lokale Benutzer:</strong>
                <ul>
                    <li>Benutzer direkt im System angelegt</li>
                    <li>Einfach, aber dezentral</li>
                    <li>Mehr Verwaltungsaufwand</li>
                </ul>
            </li>
            <li><strong>Zertifikatsbasiert:</strong>
                <ul>
                    <li>Authentifizierung über digitale Zertifikate</li>
                    <li>Sehr sicher</li>
                    <li>Für Heilberufsausweis (HBA)</li>
                </ul>
            </li>
        </ul>
        <em>Für kritische Systeme: MFA ist Pflicht!</em>
    </div>

    <div data-tooltip-id="compliance">
        <strong>Compliance & Zertifizierungen</strong>
        <p>Welche gesetzlichen und normativen Anforderungen erfüllt das System?</p>
        <p><strong>Wichtige Standards:</strong></p>
        <ul>
            <li><strong>DSGVO-konform:</strong> Datenschutz-Grundverordnung - Pflicht für Patientendaten!</li>
            <li><strong>BSI-Grundschutz:</strong> IT-Sicherheitsstandard des Bundesamts für Sicherheit</li>
            <li><strong>B3S (Medizinische Versorgung):</strong> Branchenspezifischer Sicherheitsstandard für Krankenhäuser</li>
            <li><strong>ISO 27001:</strong> Internationaler Standard für Informationssicherheit</li>
            <li><strong>KRITIS-relevant:</strong> System ist Teil kritischer Infrastruktur - besondere Meldepflichten!</li>
            <li><strong>Medizinprodukt:</strong> Unterliegt Medizinprodukte-Gesetz - CE-Kennzeichnung nötig</li>
        </ul>
        <em>Mehrfachauswahl möglich - ein System kann mehrere Standards erfüllen</em>
    </div>

    <div data-tooltip-id="last-audit">
        <strong>Letzte Sicherheitsüberprüfung</strong>
        <p>Wann wurde das System zuletzt auf Sicherheit geprüft?</p>
        <p><strong>Arten von Prüfungen:</strong></p>
        <ul>
            <li>Penetrationstest (Ethical Hacking)</li>
            <li>Schwachstellen-Scan</li>
            <li>Sicherheitsaudit</li>
            <li>DSGVO-Assessment</li>
        </ul>
        <p><strong>Empfohlene Frequenz:</strong></p>
        <ul>
            <li>Kritische Systeme: Jährlich</li>
            <li>Normale Systeme: Alle 2 Jahre</li>
            <li>Nach größeren Updates: Immer</li>
        </ul>
        <em>Dokumentation wichtig für Audits und Compliance!</em>
    </div>

    <div data-tooltip-id="it-components">
        <strong>Zugehörige IT-Objekte</strong>
        <p>Aus welchen technischen Komponenten besteht das System?</p>
        <p><strong>Was Sie hier dokumentieren:</strong> Die "Bausteine" des Systems</p>
        <p><strong>Komponenten erklärt:</strong></p>
        <ul>
            <li><strong>Virtuelle Maschinen:</strong> VMs auf VMware, Hyper-V, Proxmox</li>
            <li><strong>Hardware Server:</strong> Physische Server (Bare Metal)</li>
            <li><strong>Datenbank:</strong> Oracle, SQL Server, PostgreSQL, etc.</li>
            <li><strong>Backup-System:</strong> Backup-Konfiguration und -Strategie</li>
            <li><strong>Load Balancer:</strong> Lastverteilung für Hochverfügbarkeit</li>
            <li><strong>Firewall:</strong> Netzwerk-Sicherheit und Zugriffskontrolle</li>
            <li><strong>Client-Arbeitsplätze:</strong> Wie greifen Benutzer zu?</li>
            <li><strong>Medizingeräte:</strong> Angebundene med. Geräte (CT, MRT, etc.)</li>
            <li><strong>TI-Infrastruktur:</strong> Gematik Telematikinfrastruktur</li>
            <li><strong>Proxy-Server:</strong> Proxy für Internet-Zugriff</li>
            <li><strong>SIEM-System:</strong> Security Information & Event Management</li>
            <li><strong>VPN-Zugang:</strong> Fernzugriff via VPN</li>
            <li><strong>Medizinische Schnittstellen:</strong> HL7, DICOM, FHIR</li>
            <li><strong>Container:</strong> Docker, Kubernetes, etc.</li>
        </ul>
        <p><strong>Warum wichtig?</strong></p>
        <ul>
            <li>Vollständige Dokumentation</li>
            <li>Abhängigkeiten erkennen</li>
            <li>Impact-Analyse bei Änderungen</li>
            <li>Disaster Recovery Planung</li>
        </ul>
        <em>Wählen Sie alle zutreffenden Komponenten - ein System hat meist mehrere!</em>
    </div>
</div>
