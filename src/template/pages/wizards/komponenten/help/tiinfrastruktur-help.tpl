<div class="tooltip-definitions" style="display: none;">
    <div data-tooltip-id="ti-name">
        <strong>TI-Infrastruktur Name</strong>
        <p>Ein eindeutiger Name für Ihre Telematikinfrastruktur-Anbindung.</p>
        <p><strong>Was ist die Telematikinfrastruktur (TI)?</strong> Das geschützte Netzwerk des deutschen Gesundheitswesens - wie ein "Intranet für Ärzte, Krankenhäuser und Apotheken".</p>
        <p><strong>Warum TI essentiell ist:</strong></p>
        <ul>
            <li><strong>Gesetzliche Pflicht:</strong> Krankenhäuser und Arztpraxen MÜSSEN angeschlossen sein</li>
            <li><strong>E-Rezept:</strong> Elektronische Rezepte nur über TI</li>
            <li><strong>ePA:</strong> Elektronische Patientenakte</li>
            <li><strong>KIM:</strong> Sichere Kommunikation zwischen Ärzten</li>
            <li><strong>VSDM:</strong> Versichertenstammdaten online prüfen</li>
        </ul>
        <p><strong>Namens-Beispiele:</strong></p>
        <ul>
            <li>"TI-Anbindung-Hauptstandort" - TI am Hauptstandort</li>
            <li>"TI-Praxis-01" - TI in Praxis 1</li>
            <li>"TI-MVZ-Kardiologie" - TI im MVZ Kardiologie</li>
        </ul>
        <em>TI ist für alle Leistungserbringer im deutschen Gesundheitswesen Pflicht!</em>
    </div>

    <div data-tooltip-id="ti-konnektor-vendor">
        <strong>Konnektor-Hersteller</strong>
        <p>Welcher Hersteller liefert den TI-Konnektor?</p>
        <p><strong>Was ist ein Konnektor?</strong> Die "Firewall" und "VPN-Gateway" zur Telematikinfrastruktur - das zentrale Verbindungsgerät!</p>
        <p><strong>Zugelassene Hersteller:</strong></p>
        <ul>
            <li><strong>Secunet:</strong>
                <ul>
                    <li>Marktführer in Deutschland</li>
                    <li>SINA-Technologie (Secure Inter-Network Architecture)</li>
                    <li>Sehr sicher, bewährt</li>
                    <li>Teurer als Konkurrenz</li>
                    <li><em>Meist im Krankenhaus-Umfeld</em></li>
                </ul>
            </li>
            <li><strong>T-Systems:</strong>
                <ul>
                    <li>Deutsche Telekom Tochter</li>
                    <li>eHealth-Konnektor</li>
                    <li>Gut integriert mit Telekom-Infrastruktur</li>
                    <li>Mittelpreisig</li>
                </ul>
            </li>
            <li><strong>RISE:</strong>
                <ul>
                    <li>RISE eHealth Konnektor</li>
                    <li>Kleinere Hersteller</li>
                    <li>Günstiger</li>
                    <li>Oft in Arztpraxen</li>
                </ul>
            </li>
            <li><strong>CompuGroup Medical (CGM):</strong>
                <ul>
                    <li>CGM LAUER-FISCHER Konnektor</li>
                    <li>Gut integriert mit CGM-Praxissoftware</li>
                    <li>Für Praxen und kleinere Einrichtungen</li>
                </ul>
            </li>
        </ul>
        <p><strong>Wichtig:</strong> Nur Gematik-zugelassene Konnektoren dürfen betrieben werden!</p>
        <em>Konnektor ist das Herzstück der TI-Anbindung - ohne ihn keine TI!</em>
    </div>

    <div data-tooltip-id="ti-konnektor-firmware">
        <strong>Firmware-Version</strong>
        <p>Die installierte Software-Version auf dem Konnektor.</p>
        <p><strong>Warum Firmware-Updates kritisch sind:</strong></p>
        <ul>
            <li><strong>Sicherheit:</strong> Patches für Sicherheitslücken</li>
            <li><strong>Neue Fachdienste:</strong> Z.B. E-Rezept braucht aktuelle Firmware</li>
            <li><strong>Compliance:</strong> Alte Versionen verlieren Zulassung</li>
            <li><strong>Bug-Fixes:</strong> Stabilität und Performance</li>
        </ul>
        <p><strong>Update-Prozess:</strong></p>
        <ul>
            <li>Oft automatisch über Nacht</li>
            <li>Manche Hersteller: Manuelles Update nötig</li>
            <li>Downtime von 5-30 Minuten</li>
            <li>Koordination mit Fachdiensten wichtig</li>
        </ul>
        <p><strong>Beispiel-Versionen:</strong> "5.2.1", "PTV4+ Update 5", "2024-Q2"</p>
        <em>Firmware MUSS aktuell gehalten werden - alte Versionen = Sicherheitsrisiko!</em>
    </div>

    <div data-tooltip-id="ti-gateway">
        <strong>TI-Gateway / VPN-Zugangsdienst</strong>
        <p>Wie ist der Konnektor mit der Telematikinfrastruktur verbunden?</p>
        <p><strong>Verbindungstypen erklärt:</strong></p>
        <ul>
            <li><strong>Sichere Internetanbindung (SIA):</strong>
                <ul>
                    <li>VPN über normales Internet</li>
                    <li>Verschlüsselter Tunnel</li>
                    <li>Günstiger, flexibler</li>
                    <li>Abhängig von Internet-Qualität</li>
                    <li><em>Standard für Arztpraxen</em></li>
                </ul>
            </li>
            <li><strong>VPN-Zugangsdienst (VPN-ZugD):</strong>
                <ul>
                    <li>Managed VPN vom Provider</li>
                    <li>Höhere Verfügbarkeit</li>
                    <li>Garantierte Bandbreite</li>
                    <li>Teurer als SIA</li>
                    <li><em>Oft bei Krankenhäusern</em></li>
                </ul>
            </li>
            <li><strong>Dedizierte Leitung:</strong>
                <ul>
                    <li>Eigene Standleitung zur TI</li>
                    <li>Höchste Verfügbarkeit</li>
                    <li>Sehr teuer</li>
                    <li>Nur bei sehr großen Einrichtungen</li>
                </ul>
            </li>
        </ul>
        <p><strong>Bandbreite-Empfehlung:</strong></p>
        <ul>
            <li>Arztpraxis: 16-50 Mbit/s</li>
            <li>MVZ: 50-100 Mbit/s</li>
            <li>Krankenhaus: 100 Mbit/s - 1 Gbit/s</li>
        </ul>
        <em>SIA reicht meist aus - VPN-ZugD nur bei hohen Verfügbarkeits-Anforderungen!</em>
    </div>

    <div data-tooltip-id="ti-smcb">
        <strong>SMC-B Karten</strong>
        <p>Die "Ausweiskarte" der Einrichtung für die TI.</p>
        <p><strong>Was ist SMC-B?</strong> Security Module Card Typ B - Chipkarte die Institution identifiziert (wie "Personalausweis für Krankenhaus").</p>
        <p><strong>SMC-B Typen:</strong></p>
        <ul>
            <li><strong>SMC-B Krankenhaus:</strong> Für Krankenhäuser und große Kliniken</li>
            <li><strong>SMC-B Arztpraxis:</strong> Für niedergelassene Ärzte</li>
            <li><strong>SMC-B Apotheke:</strong> Für Apotheken</li>
            <li><strong>SMC-B Institution:</strong> Für andere Institutionen (MVZ, Pflegeheime)</li>
        </ul>
        <p><strong>Was steht auf SMC-B:</strong></p>
        <ul>
            <li>ICCSN: Eindeutige Kartennummer (wie Seriennummer)</li>
            <li>Institutionskennzeichen (IK-Nummer)</li>
            <li>Zertifikate für Verschlüsselung und Signatur</li>
            <li>Gültigkeitsdatum (meist 5 Jahre)</li>
        </ul>
        <p><strong>Wichtig:</strong></p>
        <ul>
            <li>SMC-B muss im Kartenleser am Konnektor stecken</li>
            <li>Ohne SMC-B: Keine TI-Nutzung möglich</li>
            <li>Bei Ablauf: Rechtzeitig neue Karte beantragen (6 Monate vorher!)</li>
        </ul>
        <p><strong>Beantragung:</strong> Über Kostenträger (Krankenkasse) oder KV (Kassenärztliche Vereinigung)</p>
        <em>SMC-B ist das "Herz" der TI-Authentifizierung - gut aufbewahren!</em>
    </div>

    <div data-tooltip-id="ti-fachdienste">
        <strong>TI-Fachdienste</strong>
        <p>Die "Apps" der Telematikinfrastruktur - konkrete Anwendungen.</p>
        <p><strong>Fachdienste erklärt:</strong></p>
        <ul>
            <li><strong>KIM (Kommunikation im Medizinwesen):</strong>
                <ul>
                    <li>Sichere E-Mail für Ärzte</li>
                    <li>Ende-zu-Ende verschlüsselt</li>
                    <li>Arztbriefe, Befunde verschicken</li>
                    <li><em>Ersetzt Fax!</em></li>
                </ul>
            </li>
            <li><strong>E-Rezept:</strong>
                <ul>
                    <li>Elektronisches Rezept</li>
                    <li>Patient bekommt Code statt Zettel</li>
                    <li>Apotheke löst online ein</li>
                    <li><em>Seit 2024 Pflicht!</em></li>
                </ul>
            </li>
            <li><strong>ePA (elektronische Patientenakte):</strong>
                <ul>
                    <li>Digitale Akte für jeden Versicherten</li>
                    <li>Patient hat volle Kontrolle</li>
                    <li>Arzt kann (mit Einwilligung) Daten einsehen</li>
                    <li>Opt-Out seit 2025</li>
                </ul>
            </li>
            <li><strong>NFDM (Notfalldatenmanagement):</strong>
                <ul>
                    <li>Notfalldaten auf eGK (elektronische Gesundheitskarte)</li>
                    <li>Medikation, Allergien, Vorerkrankungen</li>
                    <li>Für Notfälle</li>
                </ul>
            </li>
            <li><strong>VSDM (Versichertenstammdaten-Management):</strong>
                <ul>
                    <li>Online-Prüfung der Versichertendaten</li>
                    <li>Adresse, Versichertenstatus aktuell?</li>
                    <li><em>Seit Jahren Pflicht</em></li>
                </ul>
            </li>
            <li><strong>eML (elektronischer Medikationsplan):</strong>
                <ul>
                    <li>Alle Medikamente zentral</li>
                    <li>Wechselwirkungen erkennen</li>
                </ul>
            </li>
            <li><strong>eAU (elektronische Arbeitsunfähigkeitsbescheinigung):</strong>
                <ul>
                    <li>Digitale Krankmeldung</li>
                    <li>Direkt an Krankenkasse</li>
                    <li>Kein gelber Zettel mehr</li>
                </ul>
            </li>
        </ul>
        <em>Nicht alle Fachdienste sind sofort verfügbar - Roll-Out läuft gestaffelt!</em>
    </div>

    <div data-tooltip-id="ti-security">
        <strong>TI-Sicherheitsrichtlinien</strong>
        <p>Erfüllt die Installation die Gematik-Sicherheitsanforderungen?</p>
        <p><strong>Was wird geprüft:</strong></p>
        <ul>
            <li><strong>Netzwerk-Segmentierung:</strong> TI in separatem VLAN?</li>
            <li><strong>Firewall-Regeln:</strong> Nur notwendige Ports offen?</li>
            <li><strong>Physische Sicherheit:</strong> Konnektor in gesichertem Raum?</li>
            <li><strong>Zugriffskontrolle:</strong> Wer darf Konnektor administrieren?</li>
            <li><strong>Logging:</strong> Werden Zugriffe protokolliert?</li>
            <li><strong>Backup:</strong> Konnektor-Konfiguration gesichert?</li>
        </ul>
        <p><strong>Compliance-Level:</strong></p>
        <ul>
            <li><strong>Vollständig erfüllt:</strong> Alle Anforderungen umgesetzt - <em>ideal</em></li>
            <li><strong>Teilweise erfüllt:</strong> Kleinere Abweichungen, aber akzeptabel</li>
            <li><strong>Nicht erfüllt:</strong> Sicherheitslücken vorhanden - <em>kritisch!</em></li>
        </ul>
        <p><strong>Prüfung:</strong> Sollte jährlich durch TI-Dienstleister oder internen Sicherheitsbeauftragten erfolgen</p>
        <em>TI-Sicherheit ist Pflicht - bei Verstößen drohen Sanktionen!</em>
    </div>

    <div data-tooltip-id="ti-gematik-zulassung">
        <strong>Gematik-Zulassung</strong>
        <p>Ist das System von der Gematik zugelassen?</p>
        <p><strong>Was ist Gematik?</strong> Gesellschaft für Telematikanwendungen der Gesundheitskarte - "TÜV für TI-Komponenten".</p>
        <p><strong>Zulassungs-Status:</strong></p>
        <ul>
            <li><strong>Zugelassen:</strong>
                <ul>
                    <li>Komponente hat alle Tests bestanden</li>
                    <li>Darf produktiv betrieben werden</li>
                    <li>Zulassungsnummer vorhanden</li>
                </ul>
            </li>
            <li><strong>Zertifiziert:</strong>
                <ul>
                    <li>Höhere Stufe als Zulassung</li>
                    <li>Intensive Tests durchlaufen</li>
                </ul>
            </li>
            <li><strong>In Zulassung:</strong>
                <ul>
                    <li>Zulassungsverfahren läuft</li>
                    <li>Noch nicht produktiv nutzbar</li>
                </ul>
            </li>
            <li><strong>Nicht zugelassen:</strong>
                <ul>
                    <li>Keine Zulassung</li>
                    <li>Darf NICHT in TI betrieben werden!</li>
                </ul>
            </li>
        </ul>
        <p><strong>Wichtig:</strong> Nur zugelassene Komponenten dürfen an TI angeschlossen werden!</p>
        <p><strong>Zulassungsnummer:</strong> Format z.B. "P14-0123-2024" (Product 14, laufende Nummer, Jahr)</p>
        <em>Ohne Gematik-Zulassung = illegal und Betrieb untersagt!</em>
    </div>

    <div data-tooltip-id="ti-verantwortlicher">
        <strong>TI-Verantwortlicher</strong>
        <p>Wer ist für die TI-Infrastruktur verantwortlich?</p>
        <p><strong>Aufgaben des TI-Verantwortlichen:</strong></p>
        <ul>
            <li>Betrieb und Wartung des Konnektors</li>
            <li>Überwachung der Verfügbarkeit</li>
            <li>Koordination mit TI-Dienstleister</li>
            <li>Störungsmanagement</li>
            <li>Firmware-Updates</li>
            <li>SMC-B Verwaltung (Verlängerung, Austausch)</li>
            <li>Sicherheitsaudits</li>
        </ul>
        <p><strong>Typischerweise:</strong></p>
        <ul>
            <li>In Klinik: IT-Abteilung + Medizintechnik</li>
            <li>In Praxis: Praxisinhaber + IT-Dienstleister</li>
            <li>Oft: Externer TI-Dienstleister</li>
        </ul>
        <em>TI-Betrieb ist komplex - externes Know-how oft notwendig!</em>
    </div>

    <div data-tooltip-id="ti-support">
        <strong>TI-Support / Dienstleister</strong>
        <p>Wer unterstützt bei TI-Problemen?</p>
        <p><strong>Support-Quellen:</strong></p>
        <ul>
            <li><strong>Konnektor-Hersteller:</strong> Secunet, T-Systems Support-Hotline</li>
            <li><strong>TI-Dienstleister:</strong> Spezialisierte IT-Unternehmen für TI</li>
            <li><strong>KV-Support:</strong> Kassenärztliche Vereinigung (für Ärzte)</li>
            <li><strong>Praxissoftware-Hersteller:</strong> CGM, Medatixx, etc.</li>
            <li><strong>Provider-Support:</strong> Telekom, Vodafone (für Netzwerk)</li>
        </ul>
        <p><strong>Typische SLAs:</strong></p>
        <ul>
            <li><strong>8/5 Support:</strong> Mo-Fr 8-17 Uhr - für Praxen ausreichend</li>
            <li><strong>24/7 Hotline:</strong> Für Krankenhäuser (Notaufnahme!)</li>
            <li><strong>4h Reaktionszeit:</strong> Bei kritischen Störungen</li>
        </ul>
        <p><strong>Kosten:</strong> Support-Vertrag oft 500-2000€/Jahr (je nach Größe)</p>
        <em>TI-Support ist essentiell - ohne läuft bei Störung nichts!</em>
    </div>

    <div data-tooltip-id="ti-notes">
        <strong>Notizen / TI-Besonderheiten</strong>
        <p>Zusätzliche wichtige Informationen zur TI-Infrastruktur.</p>
        <p><strong>Was dokumentieren:</strong></p>
        <ul>
            <li>Spezielle Konfigurationen (z.B. besondere Firewall-Regeln)</li>
            <li>Bekannte Probleme und Workarounds</li>
            <li>Kontakte (Konnektor-Support, SMC-B Beantragung)</li>
            <li>Wartungsfenster (z.B. Firmware-Updates nachts)</li>
            <li>Abhängigkeiten (welche Systeme brauchen TI?)</li>
            <li>Historische Incidents (Ausfälle, Ursachen)</li>
            <li>Geplante Änderungen (neue Fachdienste aktivieren)</li>
        </ul>
        <p><strong>Beispiel:</strong> "Secunet SINA Konnektor V5.2.1, angeschlossen über VPN-ZugD (Telekom). SMC-B Krankenhaus gültig bis 31.08.2026 (ICCSN 80276...). Aktivierte Fachdienste: VSDM, KIM, E-Rezept. ePA-Aktivierung geplant Q2/2025. Bekanntes Problem: Nach Firmware-Update gelegentlich KIM-Verbindung gestört → Neustart Konnektor hilft. Wartungsfenster: Sonntag 02:00-04:00 Uhr. TI-Verantwortlich: IT-Abteilung (Müller), Support: Secunet Hotline +49...2000 (24/7), TI-Dienstleister: HealthIT GmbH (Vertrag bis 31.12.2025). Netzwerk: VLAN 100 (10.200.0.0/24), Konnektor-IP 10.200.0.10. Firewall-Regel FW-TI-001: Nur Port 443 zu Gematik, Port 443+995+993 zu KIM. SMC-B-Verlängerung beantragen bis 28.02.2026!"</p>
        <em>TI-Dokumentation ist Gold wert - bei Störung keine Zeit zum Suchen!</em>
    </div>
</div>
