<div class="tooltip-definitions" style="display: none;">
    <div data-tooltip-id="ti-connected">
        <strong>System nutzt TI-Infrastruktur</strong>
        <p>Ist dieses System an die Telematikinfrastruktur (TI) angebunden?</p>
        <p><strong>Was ist die Telematikinfrastruktur (TI)?</strong> Das geschützte Netzwerk des deutschen Gesundheitswesens für den sicheren Austausch von Patientendaten zwischen Ärzten, Krankenhäusern, Apotheken und Krankenkassen.</p>
        <p><strong>Warum TI wichtig ist:</strong></p>
        <ul>
            <li><strong>Gesetzliche Pflicht:</strong> Viele Leistungserbringer müssen TI nutzen</li>
            <li><strong>Sichere Kommunikation:</strong> Verschlüsselter Datenaustausch (KIM)</li>
            <li><strong>E-Rezept:</strong> Digitale Verschreibungen</li>
            <li><strong>ePA:</strong> Elektronische Patientenakte</li>
            <li><strong>Notfalldaten:</strong> Lebensrettende Informationen verfügbar</li>
        </ul>
        <p><strong>Typische TI-angebundene Systeme:</strong></p>
        <ul>
            <li>Praxisverwaltungssysteme (PVS)</li>
            <li>Krankenhausinformationssysteme (KIS)</li>
            <li>Apothekenverwaltungssysteme (AVS)</li>
        </ul>
        <em>Ohne TI keine E-Rezepte und kein KIM!</em>
    </div>

    <div data-tooltip-id="ti-component">
        <strong>TI-Infrastruktur Komponente</strong>
        <p>Welche TI-Anbindung wird verwendet?</p>
        <p><strong>Was ist eine TI-Komponente?</strong> Die Hardware/Software-Kombination (Konnektor + Kartenterminals), die den Zugang zur TI ermöglicht.</p>
        <p><strong>Hauptkomponenten der TI:</strong></p>
        <ul>
            <li><strong>Konnektor:</strong>
                <ul>
                    <li>Das "Herzstück" der TI-Anbindung</li>
                    <li>Verschlüsselungsgerät und Gateway zur TI</li>
                    <li>Hersteller: Secunet, CGM, T-Systems, Rise, Achelos</li>
                </ul>
            </li>
            <li><strong>Kartenterminals:</strong>
                <ul>
                    <li>Zum Lesen von eGK (elektronische Gesundheitskarte)</li>
                    <li>Zum Lesen von HBA (Heilberufsausweis)</li>
                    <li>Zum Lesen von SMC-B (Security Module Card Betriebsstätte)</li>
                </ul>
            </li>
        </ul>
        <p><strong>Beispiele:</strong></p>
        <ul>
            <li>"TI-Anbindung-Hauptstandort (Secunet)" - Secunet Konnektor</li>
            <li>"TI-Praxis-01 (T-Systems)" - T-Systems Konnektor</li>
        </ul>
        <em>Die TI-Komponente muss vorher als Infrastruktur angelegt worden sein</em>
    </div>

    <div data-tooltip-id="ti-dienste">
        <strong>Aktive Fachdienste</strong>
        <p>Welche TI-Dienste nutzt dieses System?</p>
        <p><strong>Fachdienste erklärt:</strong></p>
        <ul>
            <li><strong>KIM (Kommunikation im Medizinwesen):</strong>
                <ul>
                    <li>Sicherer E-Mail-Dienst für das Gesundheitswesen</li>
                    <li>Ende-zu-Ende verschlüsselt</li>
                    <li>Für Arztbriefe, Befunde, Überweisungen</li>
                    <li>Ersetzt unsichere Fax-Kommunikation</li>
                    <li><em>Pflicht ab 2024 für viele Ärzte!</em></li>
                </ul>
            </li>
            <li><strong>E-Rezept:</strong>
                <ul>
                    <li>Digitales Rezept statt Papier</li>
                    <li>Patient kann Apotheke frei wählen</li>
                    <li>Weniger Fälschungen</li>
                    <li>In App oder auf eGK gespeichert</li>
                </ul>
            </li>
            <li><strong>ePA (elektronische Patientenakte):</strong>
                <ul>
                    <li>Digitale Akte des Patienten</li>
                    <li>Befunde, Diagnosen, Medikation</li>
                    <li>Patient hat Kontrolle über Zugriffe</li>
                    <li>Opt-In für Patienten</li>
                </ul>
            </li>
            <li><strong>NFDM (Notfalldatenmanagement):</strong>
                <ul>
                    <li>Notfalldaten auf der eGK</li>
                    <li>Allergien, Medikation, Vorerkrankungen</li>
                    <li>Lebensrettend im Notfall</li>
                    <li>Schneller Zugriff ohne Bewusstsein des Patienten</li>
                </ul>
            </li>
            <li><strong>VSDM (Versichertenstammdaten):</strong>
                <ul>
                    <li>Prüfung der Versichertendaten online</li>
                    <li>Aktuelle Adresse, Versicherungsstatus</li>
                    <li>Pflicht seit 2019</li>
                </ul>
            </li>
            <li><strong>TI-SQSig (Qualifizierte Signatur):</strong>
                <ul>
                    <li>Rechtssichere elektronische Unterschrift</li>
                    <li>Für Arztbriefe, Verordnungen</li>
                    <li>Ersetzt händische Unterschrift</li>
                </ul>
            </li>
            <li><strong>eML (elektronischer Medikationsplan):</strong>
                <ul>
                    <li>Digitaler Medikamentenplan auf eGK</li>
                    <li>Alle Ärzte/Apotheken sehen Medikation</li>
                    <li>Vermeidung gefährlicher Wechselwirkungen</li>
                </ul>
            </li>
            <li><strong>eAU (elektronische AU-Bescheinigung):</strong>
                <ul>
                    <li>Digitale Arbeitsunfähigkeitsbescheinigung</li>
                    <li>Direkt an Krankenkasse</li>
                    <li>Kein "gelber Schein" mehr</li>
                </ul>
            </li>
        </ul>
        <em>Mehrfachauswahl möglich - ein System kann mehrere Dienste nutzen</em>
    </div>

    <div data-tooltip-id="ti-kim-active">
        <strong>KIM ist aktiv konfiguriert</strong>
        <p>Ist der KIM-Dienst (Kommunikation im Medizinwesen) für dieses System eingerichtet?</p>
        <p><strong>Was bedeutet "aktiv konfiguriert"?</strong> Das System ist technisch mit KIM verbunden und kann KIM-Nachrichten senden/empfangen.</p>
        <p><strong>Voraussetzungen für KIM:</strong></p>
        <ul>
            <li>TI-Konnektor vorhanden und aktiv</li>
            <li>KIM-Account bei einem Anbieter</li>
            <li>KIM-Adresse registriert</li>
            <li>KIM-Client oder Integration im Primärsystem</li>
        </ul>
    </div>

    <div data-tooltip-id="kim-address">
        <strong>KIM-Adresse(n)</strong>
        <p>Die E-Mail-ähnlichen Adressen für KIM-Kommunikation.</p>
        <p><strong>Format einer KIM-Adresse:</strong> name@anbieter.kim.telematik</p>
        <p><strong>Beispiele:</strong></p>
        <ul>
            <li>"praxis.mueller@cgm.kim.telematik" - Praxis Dr. Müller bei CGM</li>
            <li>"kardiologie@krankenhaus.kim.telematik" - Kardiologie-Abteilung</li>
            <li>"labor@akquinet.kim.telematik" - Labor bei akquinet</li>
        </ul>
        <p><strong>Mehrere Adressen:</strong> Unterschiedliche Abteilungen oder Standorte können eigene Adressen haben</p>
        <p><strong>Wichtig:</strong></p>
        <ul>
            <li>KIM-Adressen sind öffentlich im Verzeichnisdienst</li>
            <li>Ende-zu-Ende-Verschlüsselung garantiert</li>
            <li>Nur im Gesundheitswesen nutzbar</li>
        </ul>
        <em>Format ist ähnlich wie E-Mail, aber viel sicherer!</em>
    </div>

    <div data-tooltip-id="kim-provider">
        <strong>KIM-Anbieter</strong>
        <p>Bei welchem Anbieter ist der KIM-Account registriert?</p>
        <p><strong>Zugelassene KIM-Anbieter:</strong></p>
        <ul>
            <li><strong>Telekom:</strong>
                <ul>
                    <li>Deutsche Telekom Healthcare Solutions</li>
                    <li>Großer Anbieter, viele Features</li>
                </ul>
            </li>
            <li><strong>CGM (CompuGroup Medical):</strong>
                <ul>
                    <li>Größter Anbieter von Praxissoftware</li>
                    <li>Oft direkt mit PVS integriert</li>
                </ul>
            </li>
            <li><strong>akquinet:</strong>
                <ul>
                    <li>IT-Dienstleister, auch für Krankenhäuser</li>
                </ul>
            </li>
            <li><strong>KV Telematik:</strong>
                <ul>
                    <li>Angebot der Kassenärztlichen Vereinigungen</li>
                    <li>Oft günstiger für KV-Mitglieder</li>
                </ul>
            </li>
        </ul>
        <p><strong>Was der Anbieter macht:</strong></p>
        <ul>
            <li>Betreibt KIM-Server (Postfach)</li>
            <li>Verschlüsselt Nachrichten</li>
            <li>Stellt Verbindung zur TI her</li>
            <li>Support bei Problemen</li>
        </ul>
        <em>Anbieter-Wechsel ist möglich, aber aufwändig</em>
    </div>

    <div data-tooltip-id="kim-client">
        <strong>KIM-Client</strong>
        <p>Die Software zum Senden und Empfangen von KIM-Nachrichten.</p>
        <p><strong>Client-Typen:</strong></p>
        <ul>
            <li><strong>Primärsystem-Integration:</strong>
                <ul>
                    <li>KIM direkt im PVS/KIS eingebaut</li>
                    <li>Nahtloses Arbeiten</li>
                    <li>Am komfortabelsten</li>
                    <li><em>Beste Lösung wenn verfügbar</em></li>
                </ul>
            </li>
            <li><strong>KIM-Desktop / Standalone-Client:</strong>
                <ul>
                    <li>Separate Anwendung (wie E-Mail-Client)</li>
                    <li>Outlook-ähnliche Oberfläche</li>
                    <li>Wenn Primärsystem kein KIM hat</li>
                </ul>
            </li>
            <li><strong>Webmail:</strong>
                <ul>
                    <li>Browser-basiert</li>
                    <li>Kein Download nötig</li>
                    <li>Von überall nutzbar</li>
                </ul>
            </li>
        </ul>
        <p><strong>Beispiele:</strong></p>
        <ul>
            <li>"CGM ALBIS KIM-Integration"</li>
            <li>"Telekom KIM-Client Desktop"</li>
            <li>"akquinet KIMail"</li>
        </ul>
    </div>

    <div data-tooltip-id="kim-encryption">
        <strong>KIM-Verschlüsselung</strong>
        <p>Wie werden KIM-Nachrichten verschlüsselt?</p>
        <p><strong>Verschlüsselungs-Standards:</strong></p>
        <ul>
            <li><strong>S/MIME (Standard):</strong>
                <ul>
                    <li>Standard für sichere E-Mails</li>
                    <li>Von TI vorgeschrieben</li>
                    <li>Zertifikat-basiert</li>
                    <li>Ende-zu-Ende-Verschlüsselung</li>
                    <li><em>Empfohlener Standard</em></li>
                </ul>
            </li>
            <li><strong>PGP:</strong>
                <ul>
                    <li>Alternative Verschlüsselung</li>
                    <li>Weniger verbreitet in TI</li>
                    <li>Key-basiert</li>
                </ul>
            </li>
            <li><strong>Nur TLS (Transport):</strong>
                <ul>
                    <li>KEINE Ende-zu-Ende-Verschlüsselung!</li>
                    <li>Nur Transportweg verschlüsselt</li>
                    <li>Anbieter kann mitlesen</li>
                    <li><em>Nicht empfohlen für sensible Daten!</em></li>
                </ul>
            </li>
        </ul>
        <p><strong>Wichtig:</strong> S/MIME ist Pflicht für qualifizierte Kommunikation nach gematik-Spezifikation</p>
    </div>

    <div data-tooltip-id="ti-erezept-active">
        <strong>E-Rezept ist aktiv konfiguriert</strong>
        <p>Ist das System für E-Rezepte eingerichtet?</p>
        <p><strong>Was bedeutet das?</strong> Das System kann elektronische Rezepte erstellen, signieren und an die TI übermitteln.</p>
        <p><strong>Voraussetzungen:</strong></p>
        <ul>
            <li>TI-Anbindung aktiv</li>
            <li>E-Rezept-Fachdienst freigeschaltet</li>
            <li>Software unterstützt E-Rezept</li>
            <li>HBA (Heilberufsausweis) vorhanden</li>
        </ul>
        <p><strong>Prozess:</strong></p>
        <ol>
            <li>Arzt erstellt Verordnung im System</li>
            <li>Signatur mit HBA (Heilberufsausweis)</li>
            <li>Upload zur TI (E-Rezept-Fachdienst)</li>
            <li>Patient erhält Code/Token in App oder auf eGK</li>
            <li>Apotheke löst E-Rezept ein</li>
        </ol>
    </div>

    <div data-tooltip-id="erezept-module">
        <strong>E-Rezept-Modul</strong>
        <p>Die Software-Komponente für E-Rezepte.</p>
        <p><strong>Varianten:</strong></p>
        <ul>
            <li><strong>Primärsystem-Integration:</strong>
                <ul>
                    <li>E-Rezept direkt im PVS/KIS</li>
                    <li>Nahtloser Workflow</li>
                    <li>Automatische Datenübernahme</li>
                    <li><em>Beste Lösung</em></li>
                </ul>
            </li>
            <li><strong>Standalone-Modul:</strong>
                <ul>
                    <li>Separate Anwendung</li>
                    <li>Wenn Primärsystem noch kein E-Rezept hat</li>
                    <li>Manuelle Dateneingabe</li>
                </ul>
            </li>
        </ul>
        <p><strong>Beispiele:</strong></p>
        <ul>
            <li>"CGM TURBOMED E-Rezept-Modul"</li>
            <li>"Medatixx E-Rezept-Integration"</li>
            <li>"gematik E-Rezept App Professional"</li>
        </ul>
    </div>

    <div data-tooltip-id="erezept-version">
        <strong>Fachdienst-Version</strong>
        <p>Die Version des E-Rezept-Fachdienstes der gematik.</p>
        <p><strong>Was ist der Fachdienst?</strong> Der zentrale Service in der TI, der E-Rezepte speichert und verwaltet.</p>
        <p><strong>Versionen:</strong></p>
        <ul>
            <li><strong>E-Rezept FD v1.0:</strong> Erste Version (veraltet)</li>
            <li><strong>E-Rezept FD v1.1:</strong> Erweiterte Features</li>
            <li><strong>E-Rezept FD v1.2:</strong> Verbesserungen</li>
            <li><strong>E-Rezept FD v1.3:</strong> Aktuellste Version</li>
        </ul>
        <p><strong>Warum Version wichtig ist:</strong></p>
        <ul>
            <li>Kompatibilität mit Apotheken</li>
            <li>Verfügbare Features</li>
            <li>Bugfixes und Sicherheit</li>
        </ul>
        <em>Immer die neueste unterstützte Version nutzen!</em>
    </div>

    <div data-tooltip-id="erezept-types">
        <strong>Unterstützte Rezept-Typen</strong>
        <p>Welche Arten von Rezepten können ausgestellt werden?</p>
        <p><strong>Rezept-Typen:</strong></p>
        <ul>
            <li><strong>GKV (Gesetzliche Krankenversicherung):</strong>
                <ul>
                    <li>Standard-Rezept (rosa)</li>
                    <li>Abrechnung über Krankenkasse</li>
                    <li>Größter Anteil der Rezepte</li>
                </ul>
            </li>
            <li><strong>PKV (Private Krankenversicherung):</strong>
                <ul>
                    <li>Privatrezept (blau)</li>
                    <li>Patient zahlt, reicht bei Kasse ein</li>
                    <li>Andere Abrechnungslogik</li>
                </ul>
            </li>
            <li><strong>Direktabrechnung:</strong>
                <ul>
                    <li>Selbstzahler-Rezept</li>
                    <li>Patient zahlt direkt</li>
                    <li>Keine Erstattung</li>
                </ul>
            </li>
        </ul>
        <p><strong>Wichtig:</strong> Nicht jedes System unterstützt alle Typen - Lizenzabhängig!</p>
    </div>

    <div data-tooltip-id="erezept-avs">
        <strong>AVS-Anbindung</strong>
        <p>Anbindung an Apothekenverwaltungssysteme (nur relevant für Apotheken).</p>
        <p><strong>Was ist AVS?</strong> Die Software, die Apotheken zur Verwaltung verwenden - wie PVS für Arztpraxen.</p>
        <p><strong>Bekannte AVS-Anbieter:</strong></p>
        <ul>
            <li><strong>ADG:</strong> IXOS (größter Anbieter)</li>
            <li><strong>Noventi (ehem. AVWL):</strong> awinta</li>
            <li><strong>CGM:</strong> LAUER-FISCHER</li>
            <li><strong>pharmatechnik:</strong> WIPRA</li>
        </ul>
        <p><strong>Für Krankenhäuser/Praxen:</strong> Meist nicht relevant, Feld leer lassen</p>
        <em>Nur ausfüllen wenn System selbst eine Apotheke ist!</em>
    </div>

    <div data-tooltip-id="ti-notes">
        <strong>Systemspezifische TI-Notizen</strong>
        <p>Zusätzliche wichtige Informationen zur TI-Integration dieses Systems.</p>
        <p><strong>Was dokumentieren:</strong></p>
        <ul>
            <li><strong>Spezielle Konfigurationen:</strong>
                <ul>
                    <li>Abweichungen von Standard-Setup</li>
                    <li>Workarounds für bekannte Probleme</li>
                    <li>Firewall-Regeln für TI-Traffic</li>
                </ul>
            </li>
            <li><strong>Kartenterminal-Zuordnung:</strong>
                <ul>
                    <li>Welches Terminal für welchen Arbeitsplatz?</li>
                    <li>Standorte der Terminals</li>
                </ul>
            </li>
            <li><strong>Ansprechpartner:</strong>
                <ul>
                    <li>TI-Anbieter-Support</li>
                    <li>Interner TI-Verantwortlicher</li>
                    <li>Software-Hersteller Support</li>
                </ul>
            </li>
            <li><strong>Bekannte Einschränkungen:</strong>
                <ul>
                    <li>Features die noch nicht funktionieren</li>
                    <li>Geplante Updates/Erweiterungen</li>
                </ul>
            </li>
            <li><strong>Troubleshooting-Hinweise:</strong>
                <ul>
                    <li>Häufige Fehler und Lösungen</li>
                    <li>Neustart-Prozeduren</li>
                    <li>Log-Dateien-Pfade</li>
                </ul>
            </li>
        </ul>
        <p><strong>Beispiel:</strong></p>
        <p>"Konnektor: Secunet SINA v3.1.2. Kartenterminals: 5x ORGA 6141 (Anmeldung, Zimmer 101-104). KIM-Client läuft auf separatem Server (kim-client-01). Firewall-Regel: Port 443 zu konnektor.ti-dienste.de. Support: Secunet Hotline 0800-xxx, intern: Max Mustermann (IT). Bekanntes Problem: Nach Windows-Update Konnektor-Treiber neu installieren. Logs: C:\ProgramData\Secunet\Logs"</p>
        <em>Gute TI-Dokumentation spart Stunden bei Störungen!</em>
    </div>
</div>
