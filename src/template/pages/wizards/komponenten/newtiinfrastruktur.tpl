<aside>
    <p>Assetmanagement</p>
    <i>›</i>
    <p>Komponenten</p>
    <i>›</i>
    <p>Neue TI-Infrastruktur anlegen</p>
</aside>

<form id="newTIInfrastrukturForm">

    <!-- Basis-Informationen -->
    <div class="form-section">
        <div class="section-title">
            <span>Basis-Informationen</span>
            <span class="section-badge">Pflicht</span>
            <span class="section-counter">0/3</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="form-row">
                <div class="form-group">
                    <label>
                        TI-Infrastruktur Name <span class="required">*</span>
                        <span class="help-icon" data-tooltip="ti-name">?</span>
                    </label>
                    <input type="text" id="tiname" required placeholder="z.B. TI-Anbindung-Hauptstandort, TI-Praxis-01">
                </div>
                <div class="form-group">
                    <label>Standort</label>
                    <input type="text" id="tilocation" placeholder="z.B. Hauptgebäude, Praxis, MVZ">
                </div>
            </div>

            <div class="form-group">
                <label>Beschreibung</label>
                <textarea id="tidescription" rows="2" placeholder="Kurze Beschreibung der TI-Anbindung und ihres Zwecks..."></textarea>
            </div>
        </div>
    </div>

    <!-- Konnektor-Konfiguration -->
    <div class="form-section collapsed">
        <div class="section-title">
            <span>Konnektor-Konfiguration</span>
            <span class="section-counter">0/6</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="form-row">
                <div class="form-group">
                    <label>
                        Konnektor-Hersteller <span class="required">*</span>
                        <span class="help-icon" data-tooltip="ti-konnektor-vendor">?</span>
                    </label>
                    <div class="custom-select" data-name="konnektorvendor">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="secunet">Secunet</div>
                                <div class="select-option" data-value="tsystems">T-Systems</div>
                                <div class="select-option" data-value="rise">RISE</div>
                                <div class="select-option" data-value="compugroup">CompuGroup Medical (CGM)</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>Konnektor-Modell</label>
                    <input type="text" id="konnektormodel" placeholder="z.B. Secunet SINA, eHealth-Konnektor">
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>
                        Firmware-Version
                        <span class="help-icon" data-tooltip="ti-konnektor-firmware">?</span>
                    </label>
                    <input type="text" id="konnektorfirmware" placeholder="z.B. 5.2.1, 2024-Q2">
                </div>
                <div class="form-group">
                    <label>Serial Number</label>
                    <input type="text" id="konnektorserial" placeholder="z.B. KON-2024-001234">
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Hostname / IP-Adresse</label>
                    <input type="text" id="konnektorip" placeholder="z.B. konnektor-01.local, 192.168.100.10">
                </div>
                <div class="form-group">
                    <label>Management-URL</label>
                    <input type="text" id="konnektorurl" placeholder="z.B. https://konnektor-01.local:8443">
                </div>
            </div>
        </div>
    </div>

    <!-- Gateway & Netzwerk -->
    <div class="form-section collapsed">
        <div class="section-title">
            <span>Gateway & Netzwerk</span>
            <span class="section-counter">0/4</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="form-row">
                <div class="form-group">
                    <label>
                        TI-Gateway / VPN-Zugangsdienst
                        <span class="help-icon" data-tooltip="ti-gateway">?</span>
                    </label>
                    <div class="custom-select" data-name="tigatewaytype">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="sia">Sichere Internetanbindung (SIA)</div>
                                <div class="select-option" data-value="vpn-zugd">VPN-Zugangsdienst (VPN-ZugD)</div>
                                <div class="select-option" data-value="dedicated">Dedizierte Leitung</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>Provider</label>
                    <input type="text" id="tiprovider" placeholder="z.B. Telekom, 1&1, Vodafone">
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Bandwidth</label>
                    <input type="text" id="tibandwidth" placeholder="z.B. 100 Mbit/s, 1 Gbit/s">
                </div>
                <div class="form-group">
                    <label>Netzwerk-Segment</label>
                    <input type="text" id="tinetworksegment" placeholder="z.B. VLAN 100, 10.200.0.0/24">
                </div>
            </div>
        </div>
    </div>

    <!-- SMC-B Karten -->
    <div class="form-section collapsed">
        <div class="section-title">
            <span>SMC-B Karten</span>
            <span class="section-counter">0/4</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="form-row">
                <div class="form-group">
                    <label>
                        SMC-B Kartentyp
                        <span class="help-icon" data-tooltip="ti-smcb">?</span>
                    </label>
                    <div class="custom-select" data-name="smcbtype">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="smcb-krankenhaus">SMC-B Krankenhaus</div>
                                <div class="select-option" data-value="smcb-praxis">SMC-B Arztpraxis</div>
                                <div class="select-option" data-value="smcb-apotheke">SMC-B Apotheke</div>
                                <div class="select-option" data-value="smcb-institution">SMC-B Institution</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>ICCSN (Kartennummer)</label>
                    <input type="text" id="smcbiccsn" placeholder="z.B. 80276...">
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Gültig bis</label>
                    <input type="text" id="smcbvalid" placeholder="z.B. 31.12.2025">
                </div>
                <div class="form-group">
                    <label>Kartenleser</label>
                    <input type="text" id="cardreader" placeholder="z.B. Cherry ST-2000, Reiner SCT">
                </div>
            </div>
        </div>
    </div>

    <!-- TI-Fachdienste -->
    <div class="form-section collapsed">
        <div class="section-title">
            <span>TI-Fachdienste</span>
            <span class="section-counter">0/9</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <label>
                Aktivierte Fachdienste
                <span class="help-icon" data-tooltip="ti-fachdienste">?</span>
            </label>
            <div class="checkbox-group">
                <div class="checkbox-item">
                    <input type="checkbox" id="ti-kim" name="tifachdienste" value="kim">
                    <label for="ti-kim">KIM (Kommunikation im Medizinwesen)</label>
                </div>
                <div class="checkbox-item">
                    <input type="checkbox" id="ti-erezept" name="tifachdienste" value="erezept">
                    <label for="ti-erezept">E-Rezept</label>
                </div>
                <div class="checkbox-item">
                    <input type="checkbox" id="ti-epa" name="tifachdienste" value="epa">
                    <label for="ti-epa">ePA (elektronische Patientenakte)</label>
                </div>
                <div class="checkbox-item">
                    <input type="checkbox" id="ti-nfdm" name="tifachdienste" value="nfdm">
                    <label for="ti-nfdm">NFDM (Notfalldatenmanagement)</label>
                </div>
                <div class="checkbox-item">
                    <input type="checkbox" id="ti-vsdm" name="tifachdienste" value="vsdm">
                    <label for="ti-vsdm">VSDM (Versichertenstammdaten)</label>
                </div>
                <div class="checkbox-item">
                    <input type="checkbox" id="ti-vsdd" name="tifachdienste" value="vsdd">
                    <label for="ti-vsdd">VSDD (Versichertenstammdaten-Dienst)</label>
                </div>
                <div class="checkbox-item">
                    <input type="checkbox" id="ti-tisqsig" name="tifachdienste" value="tisqsig">
                    <label for="ti-tisqsig">TI-SQSig (Qualifizierte Signatur)</label>
                </div>
                <div class="checkbox-item">
                    <input type="checkbox" id="ti-eml" name="tifachdienste" value="eml">
                    <label for="ti-eml">eML (elektronischer Medikationsplan)</label>
                </div>
                <div class="checkbox-item">
                    <input type="checkbox" id="ti-eau" name="tifachdienste" value="eau">
                    <label for="ti-eau">eAU (elektronische Arbeitsunfähigkeitsbescheinigung)</label>
                </div>
            </div>
        </div>
    </div>

    <!-- Sicherheit & Compliance -->
    <div class="form-section collapsed">
        <div class="section-title">
            <span>Sicherheit & Compliance</span>
            <span class="section-counter">0/4</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="form-row">
                <div class="form-group">
                    <label>
                        TI-Sicherheitsrichtlinien erfüllt
                        <span class="help-icon" data-tooltip="ti-security">?</span>
                    </label>
                    <div class="custom-select" data-name="tisecurity">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="vollstaendig">Vollständig erfüllt</div>
                                <div class="select-option" data-value="teilweise">Teilweise erfüllt</div>
                                <div class="select-option" data-value="nicht-erfuellt">Nicht erfüllt</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>Letzte Sicherheitsprüfung</label>
                    <input type="text" id="tilastsecuritycheck" placeholder="z.B. Q3 2024, 15.09.2024">
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>
                        Gematik-Zulassung
                        <span class="help-icon" data-tooltip="ti-gematik-zulassung">?</span>
                    </label>
                    <div class="custom-select" data-name="tigematikzulassung">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="zugelassen">Zugelassen</div>
                                <div class="select-option" data-value="zertifiziert">Zertifiziert</div>
                                <div class="select-option" data-value="in-zulassung">In Zulassung</div>
                                <div class="select-option" data-value="nicht-zugelassen">Nicht zugelassen</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>Zulassungsnummer / Zertifikat</label>
                    <input type="text" id="tizulassungsnummer" placeholder="z.B. P14-0123-2024">
                </div>
            </div>
        </div>
    </div>

    <!-- Verantwortlichkeiten -->
    <div class="form-section collapsed">
        <div class="section-title">
            <span>Verantwortlichkeiten & Support</span>
            <span class="section-counter">0/3</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="form-row">
                <div class="form-group">
                    <label>
                        TI-Verantwortlicher
                        <span class="help-icon" data-tooltip="ti-verantwortlicher">?</span>
                    </label>
                    <input type="text" id="tiverantwortlicher" placeholder="z.B. Dr. Müller, IT-Abteilung">
                </div>
                <div class="form-group">
                    <label>
                        TI-Support / Dienstleister
                        <span class="help-icon" data-tooltip="ti-support">?</span>
                    </label>
                    <input type="text" id="tisupport" placeholder="z.B. TI-Dienstleister, KV-Support">
                </div>
            </div>

            <div class="form-group">
                <label>Support-Vertrag / SLA</label>
                <input type="text" id="tisupportcontract" placeholder="z.B. 8/5 Support, 24/7 Hotline">
            </div>
        </div>
    </div>

    <!-- Notizen -->
    <div class="form-section collapsed">
        <div class="section-title">
            <span>Zusätzliche Informationen</span>
            <span class="section-counter">0/1</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="form-group">
                <label>
                    Notizen / TI-Besonderheiten
                    <span class="help-icon" data-tooltip="ti-notes">?</span>
                </label>
                <textarea id="tinotes" rows="4" placeholder="Zusätzliche Informationen zur TI-Infrastruktur, bekannte Probleme, Besonderheiten, Wartungsfenster..."></textarea>
            </div>
        </div>
    </div>

</form>

<!-- Include help tooltips -->
{{include:pages/wizards/komponenten/help/tiinfrastruktur-help.tpl}}
