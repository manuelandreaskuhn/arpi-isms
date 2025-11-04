<aside>
    <p>Assetmanagement</p>
    <i>›</i>
    <p>Komponenten</p>
    <i>›</i>
    <p>Neues Medizingerät anlegen</p>
</aside>

<form id="newMedicalDeviceForm">

    <!-- Basis-Informationen -->
    <div class="form-section">
        <div class="section-title">
            <span>Basis-Informationen</span>
            <span class="section-badge">Pflicht</span>
            <span class="section-counter">0/5</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="form-row">
                <div class="form-group">
                    <label>
                        Gerätename / Bezeichnung <span class="required">*</span>
                        <span class="help-icon" data-tooltip="meddevice-name">?</span>
                    </label>
                    <input type="text" id="devicename" required placeholder="z.B. CT-Scanner Raum 3, Ultraschall-Station-A">
                </div>
                <div class="form-group">
                    <label>
                        Inventarnummer <span class="required">*</span>
                        <span class="help-icon" data-tooltip="meddevice-inventory">?</span>
                    </label>
                    <input type="text" id="inventorynumber" required placeholder="z.B. MD-2024-001, INV-12345">
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>
                        Hersteller <span class="required">*</span>
                        <span class="help-icon" data-tooltip="meddevice-manufacturer">?</span>
                    </label>
                    <input type="text" id="manufacturer" required placeholder="z.B. Siemens Healthineers, GE Healthcare">
                </div>
                <div class="form-group">
                    <label>Modell / Typ</label>
                    <input type="text" id="model" placeholder="z.B. SOMATOM Force, Discovery CT750">
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Seriennummer</label>
                    <input type="text" id="serialnumber" placeholder="z.B. SN123456789">
                </div>
                <div class="form-group">
                    <label>
                        Geräte-Kategorie <span class="required">*</span>
                        <span class="help-icon" data-tooltip="meddevice-category">?</span>
                    </label>
                    <div class="custom-select" data-name="devicecategory">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-group-header">Bildgebung / Diagnostik</div>
                                <div class="select-option" data-value="ct">Computertomograph (CT)</div>
                                <div class="select-option" data-value="mrt">Magnetresonanztomograph (MRT)</div>
                                <div class="select-option" data-value="roentgen">Röntgengerät</div>
                                <div class="select-option" data-value="ultrasound">Ultraschall / Sonographie</div>
                                <div class="select-option" data-value="mammography">Mammographie</div>
                                <div class="select-option" data-value="pet-ct">PET-CT</div>
                                <div class="select-option" data-value="angiography">Angiographie</div>
                                <div class="select-group-header">Labor / Diagnostik</div>
                                <div class="select-option" data-value="lab-analyzer">Laboranalyse-Gerät</div>
                                <div class="select-option" data-value="blood-analyzer">Blutanalysegerät</div>
                                <div class="select-option" data-value="mikroskope">Mikroskop</div>
                                <div class="select-option" data-value="pcr">PCR-Gerät</div>
                                <div class="select-group-header">Intensiv / Überwachung</div>
                                <div class="select-option" data-value="monitor">Patientenmonitor</div>
                                <div class="select-option" data-value="ventilator">Beatmungsgerät</div>
                                <div class="select-option" data-value="infusion-pump">Infusionspumpe</div>
                                <div class="select-option" data-value="defibrillator">Defibrillator</div>
                                <div class="select-option" data-value="ecg">EKG-Gerät</div>
                                <div class="select-option" data-value="anesthesia">Anästhesiegerät</div>
                                <div class="select-group-header">OP / Chirurgie</div>
                                <div class="select-option" data-value="op-table">OP-Tisch</div>
                                <div class="select-option" data-value="op-light">OP-Leuchte</div>
                                <div class="select-option" data-value="surgical-robot">Chirurgie-Roboter</div>
                                <div class="select-option" data-value="endoscopy">Endoskop</div>
                                <div class="select-option" data-value="laser">Laser-Gerät</div>
                                <div class="select-group-header">Therapie</div>
                                <div class="select-option" data-value="dialysis">Dialysegerät</div>
                                <div class="select-option" data-value="radiation-therapy">Strahlentherapie</div>
                                <div class="select-option" data-value="physiotherapy">Physiotherapie-Gerät</div>
                                <div class="select-group-header">Sonstige</div>
                                <div class="select-option" data-value="sterilization">Sterilisationsgerät</div>
                                <div class="select-option" data-value="incubator">Inkubator</div>
                                <div class="select-option" data-value="other">Sonstige</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Medizinprodukt-Klassifizierung -->
    <div class="form-section collapsed">
        <div class="section-title">
            <span>Medizinprodukt-Klassifizierung</span>
            <span class="section-counter">0/4</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="form-row">
                <div class="form-group">
                    <label>
                        Risikoklasse (MDR) <span class="required">*</span>
                        <span class="help-icon" data-tooltip="meddevice-riskclass">?</span>
                    </label>
                    <div class="custom-select" data-name="riskclass">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="class-i">Klasse I (geringes Risiko)</div>
                                <div class="select-option" data-value="class-iia">Klasse IIa (mittleres Risiko)</div>
                                <div class="select-option" data-value="class-iib">Klasse IIb (erhöhtes Risiko)</div>
                                <div class="select-option" data-value="class-iii">Klasse III (hohes Risiko)</div>
                                <div class="select-option" data-value="not-classified">Nicht klassifiziert</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>
                        CE-Kennzeichnung
                        <span class="help-icon" data-tooltip="meddevice-ce">?</span>
                    </label>
                    <div class="custom-select" data-name="cemarking">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="yes">Ja, vorhanden</div>
                                <div class="select-option" data-value="no">Nein</div>
                                <div class="select-option" data-value="not-required">Nicht erforderlich</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>
                        UDI (Unique Device Identification)
                        <span class="help-icon" data-tooltip="meddevice-udi">?</span>
                    </label>
                    <input type="text" id="udi" placeholder="z.B. (01)04987654321115(11)220531(21)A1B2C3">
                </div>
                <div class="form-group">
                    <label>
                        Benannte Stelle / Notified Body
                        <span class="help-icon" data-tooltip="meddevice-notified-body">?</span>
                    </label>
                    <input type="text" id="notifiedbody" placeholder="z.B. TÜV SÜD, CE 0123">
                </div>
            </div>
        </div>
    </div>

    <!-- Standort & Nutzung -->
    <div class="form-section collapsed">
        <div class="section-title">
            <span>Standort & Nutzung</span>
            <span class="section-counter">0/5</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="form-row">
                <div class="form-group">
                    <label>
                        Standort / Raum <span class="required">*</span>
                        <span class="help-icon" data-tooltip="meddevice-location">?</span>
                    </label>
                    <input type="text" id="location" required placeholder="z.B. Gebäude A, Raum 3.12, Radiologie">
                </div>
                <div class="form-group">
                    <label>Abteilung / Fachbereich</label>
                    <input type="text" id="department" placeholder="z.B. Radiologie, Kardiologie, Labor">
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>
                        Nutzungsstatus
                        <span class="help-icon" data-tooltip="meddevice-usage-status">?</span>
                    </label>
                    <div class="custom-select" data-name="usagestatus">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="in-use">In Betrieb</div>
                                <div class="select-option" data-value="standby">Standby / Reserve</div>
                                <div class="select-option" data-value="maintenance">Wartung / Instandhaltung</div>
                                <div class="select-option" data-value="repair">Reparatur</div>
                                <div class="select-option" data-value="decommissioned">Außer Betrieb</div>
                                <div class="select-option" data-value="storage">Lager</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>Betriebsstunden / Nutzungsgrad</label>
                    <input type="text" id="operatinghours" placeholder="z.B. 24/7, 8-18 Uhr, ~200h/Monat">
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Anschaffungsdatum</label>
                    <input type="text" id="purchasedate" placeholder="z.B. 15.03.2023">
                </div>
                <div class="form-group">
                    <label>Inbetriebnahme</label>
                    <input type="text" id="commissioningdate" placeholder="z.B. 01.04.2023">
                </div>
            </div>
        </div>
    </div>

    <!-- IT-Integration & Konnektivität -->
    <div class="form-section collapsed">
        <div class="section-title">
            <span>IT-Integration & Konnektivität</span>
            <span class="section-counter">0/6</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="form-group">
                <label class="cluster-label">
                    <input type="checkbox" id="device-network-check">
                    <span>Gerät ist netzwerkfähig / IT-vernetzt</span>
                    <span class="help-icon" data-tooltip="meddevice-network">?</span>
                </label>
            </div>

            <div id="device-network-config" style="display:none;">
                <div class="form-row">
                    <div class="form-group">
                        <label>
                            Netzwerk-Anbindung
                            <span class="help-icon" data-tooltip="meddevice-network-connection">?</span>
                        </label>
                        <div class="custom-select" data-name="networkconnection">
                            <div class="select-trigger">
                                <span class="placeholder">Bitte wählen</span>
                                <span class="arrow">▼</span>
                            </div>
                            <div class="select-dropdown">
                                <div class="select-options">
                                    <div class="select-option" data-value="">Bitte wählen</div>
                                    <div class="select-option" data-value="ethernet">Ethernet (LAN)</div>
                                    <div class="select-option" data-value="wifi">WLAN</div>
                                    <div class="select-option" data-value="both">Ethernet & WLAN</div>
                                    <div class="select-option" data-value="bluetooth">Bluetooth</div>
                                    <div class="select-option" data-value="serial">Seriell (RS-232, etc.)</div>
                                    <div class="select-option" data-value="usb">USB</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>IP-Adresse</label>
                        <input type="text" id="ipaddress" placeholder="z.B. 192.168.100.50">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label>MAC-Adresse</label>
                        <input type="text" id="macaddress" placeholder="z.B. 00:1A:2B:3C:4D:5E">
                    </div>
                    <div class="form-group">
                        <label>Hostname / DNS Name</label>
                        <input type="text" id="hostname" placeholder="z.B. ct-scanner-03.hospital.local">
                    </div>
                </div>

                <div class="subsection-header">Integrationen & Schnittstellen</div>
                <div class="form-row">
                    <div class="form-group">
                        <label>
                            PACS-Integration
                            <span class="help-icon" data-tooltip="meddevice-pacs">?</span>
                        </label>
                        <div class="custom-select" data-name="pacsintegration">
                            <div class="select-trigger">
                                <span class="placeholder">Bitte wählen</span>
                                <span class="arrow">▼</span>
                            </div>
                            <div class="select-dropdown">
                                <div class="select-options">
                                    <div class="select-option" data-value="">Bitte wählen</div>
                                    <div class="select-option" data-value="direct">Direkt verbunden</div>
                                    <div class="select-option" data-value="gateway">Über Gateway / Konverter</div>
                                    <div class="select-option" data-value="no">Nicht verbunden</div>
                                    <div class="select-option" data-value="not-applicable">Nicht zutreffend</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>
                            RIS/HIS-Integration
                            <span class="help-icon" data-tooltip="meddevice-ris-his">?</span>
                        </label>
                        <div class="custom-select" data-name="rishisintegration">
                            <div class="select-trigger">
                                <span class="placeholder">Bitte wählen</span>
                                <span class="arrow">▼</span>
                            </div>
                            <div class="select-dropdown">
                                <div class="select-options">
                                    <div class="select-option" data-value="">Bitte wählen</div>
                                    <div class="select-option" data-value="direct">Direkt verbunden</div>
                                    <div class="select-option" data-value="gateway">Über Gateway / Konverter</div>
                                    <div class="select-option" data-value="no">Nicht verbunden</div>
                                    <div class="select-option" data-value="not-applicable">Nicht zutreffend</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label>
                            Kommunikationsprotokoll (Gerät)
                            <span class="help-icon" data-tooltip="meddevice-protocol">?</span>
                        </label>
                        <input type="text" id="protocol" placeholder="z.B. DICOM, HL7, FHIR, Modality Worklist, proprietary">
                    </div>
                    <div class="form-group">
                        <label>Netzwerk-Segment / VLAN</label>
                        <input type="text" id="networksegment" placeholder="z.B. Medical-VLAN-50, Isolated">
                    </div>
                </div>

                <!-- Gateway-Konfiguration -->
                <div class="subsection-header">Gateway / Konverter (falls vorhanden)</div>
                <div class="form-group">
                    <label class="cluster-label">
                        <input type="checkbox" id="device-gateway-check">
                        <span>Gateway / Konverter / Middleware wird verwendet</span>
                        <span class="help-icon" data-tooltip="meddevice-gateway">?</span>
                    </label>
                </div>

                <div id="device-gateway-config" style="display:none;">
                    <div class="form-row">
                        <div class="form-group">
                            <label>Gateway-Typ / Hersteller</label>
                            <div class="custom-select" data-name="gatewaytype">
                                <div class="select-trigger">
                                    <span class="placeholder">Bitte wählen</span>
                                    <span class="arrow">▼</span>
                                </div>
                                <div class="select-dropdown">
                                    <div class="select-options">
                                        <div class="select-option" data-value="">Bitte wählen</div>
                                        <div class="select-option" data-value="vendor-gateway">Hersteller-Gateway (OEM)</div>
                                        <div class="select-option" data-value="dicom-gateway">DICOM Gateway / Router</div>
                                        <div class="select-option" data-value="hl7-interface">HL7 Interface Engine</div>
                                        <div class="select-option" data-value="mirth">Mirth Connect</div>
                                        <div class="select-option" data-value="integration-engine">Integration Engine</div>
                                        <div class="select-option" data-value="protocol-converter">Protokoll-Konverter</div>
                                        <div class="select-option" data-value="middleware">Middleware / Broker</div>
                                        <div class="select-option" data-value="other">Sonstige</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Gateway Modell / Produkt</label>
                            <input type="text" id="gatewaymodel" placeholder="z.B. Siemens syngo Gateway, GE PACS Gateway">
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label>Gateway IP-Adresse</label>
                            <input type="text" id="gatewayip" placeholder="z.B. 192.168.100.10">
                        </div>
                        <div class="form-group">
                            <label>Gateway Hostname</label>
                            <input type="text" id="gatewayhostname" placeholder="z.B. gateway-ct-01.hospital.local">
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label>Verbindung Gerät → Gateway</label>
                            <input type="text" id="devicetogateway" placeholder="z.B. Seriell RS-232, proprietary TCP, DICOM C-STORE">
                            <div class="help-text">Protokoll zwischen Gerät und Gateway</div>
                        </div>
                        <div class="form-group">
                            <label>Verbindung Gateway → PACS/RIS</label>
                            <input type="text" id="gatewaytopacs" placeholder="z.B. DICOM, HL7 v2.x, FHIR">
                            <div class="help-text">Protokoll zwischen Gateway und Zielsystem</div>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label>
                                Gateway-Funktionen
                                <span class="help-icon" data-tooltip="meddevice-gateway-functions">?</span>
                            </label>
                            <textarea id="gatewayfunctions" rows="2" placeholder="z.B. Protokoll-Konvertierung, DICOM Modality Worklist, Anonymisierung, Bildkompression, Metadaten-Anpassung"></textarea>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label>Gateway-Standort</label>
                            <div class="custom-select" data-name="gatewaylocation">
                                <div class="select-trigger">
                                    <span class="placeholder">Bitte wählen</span>
                                    <span class="arrow">▼</span>
                                </div>
                                <div class="select-dropdown">
                                    <div class="select-options">
                                        <div class="select-option" data-value="">Bitte wählen</div>
                                        <div class="select-option" data-value="ondevice">Auf Gerät integriert</div>
                                        <div class="select-option" data-value="nearby">Lokal (gleicher Raum)</div>
                                        <div class="select-option" data-value="department">Abteilungs-Server</div>
                                        <div class="select-option" data-value="datacenter">Rechenzentrum</div>
                                        <div class="select-option" data-value="cloud">Cloud-basiert</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Gateway-Redundanz</label>
                            <div class="custom-select" data-name="gatewayredundancy">
                                <div class="select-trigger">
                                    <span class="placeholder">Bitte wählen</span>
                                    <span class="arrow">▼</span>
                                </div>
                                <div class="select-dropdown">
                                    <div class="select-options">
                                        <div class="select-option" data-value="">Bitte wählen</div>
                                        <div class="select-option" data-value="yes">Redundant / HA</div>
                                        <div class="select-option" data-value="no">Nicht redundant (Single Point)</div>
                                        <div class="select-option" data-value="shared">Gemeinsam genutzt</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label>Gateway-Notizen</label>
                        <textarea id="gatewaynotes" rows="2" placeholder="Zusätzliche Informationen zum Gateway, Besonderheiten, Einschränkungen, Wartungshinweise..."></textarea>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Wartung & Service -->
    <div class="form-section collapsed">
        <div class="section-title">
            <span>Wartung & Service</span>
            <span class="section-counter">0/6</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="form-row">
                <div class="form-group">
                    <label>
                        Wartungsvertrag
                        <span class="help-icon" data-tooltip="meddevice-maintenance-contract">?</span>
                    </label>
                    <div class="custom-select" data-name="maintenancecontract">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="full-service">Full-Service</div>
                                <div class="select-option" data-value="preventive">Präventivwartung</div>
                                <div class="select-option" data-value="on-demand">Bei Bedarf / Störung</div>
                                <div class="select-option" data-value="none">Kein Vertrag</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>Service-Partner</label>
                    <input type="text" id="servicepartner" placeholder="z.B. Siemens Service, Fremd-Techniker">
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Wartungsintervall</label>
                    <input type="text" id="maintenanceinterval" placeholder="z.B. jährlich, halbjährlich, quartalsweise">
                </div>
                <div class="form-group">
                    <label>Letzte Wartung</label>
                    <input type="text" id="lastmaintenance" placeholder="z.B. 15.11.2024">
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Nächste Wartung (geplant)</label>
                    <input type="text" id="nextmaintenance" placeholder="z.B. 15.05.2025">
                </div>
                <div class="form-group">
                    <label>
                        MTK-Prüfung (Medizintechnik)
                        <span class="help-icon" data-tooltip="meddevice-mtk">?</span>
                    </label>
                    <input type="text" id="mtkcheck" placeholder="z.B. jährlich, 24 Monate, letzte: 01.12.2024">
                </div>
            </div>
        </div>
    </div>

    <!-- Software & Betriebssystem -->
    <div class="form-section collapsed">
        <div class="section-title">
            <span>Software & Betriebssystem</span>
            <span class="section-counter">0/5</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="form-row">
                <div class="form-group">
                    <label>
                        Betriebssystem
                        <span class="help-icon" data-tooltip="meddevice-os">?</span>
                    </label>
                    <input type="text" id="operatingsystem" placeholder="z.B. Windows 10 IoT, Linux, Embedded">
                </div>
                <div class="form-group">
                    <label>OS Version</label>
                    <input type="text" id="osversion" placeholder="z.B. Windows 10 21H2, Ubuntu 20.04">
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Anwendungssoftware</label>
                    <input type="text" id="applicationsoftware" placeholder="z.B. Syngo CT Workplace, Agfa IMPAX">
                </div>
                <div class="form-group">
                    <label>Software-Version</label>
                    <input type="text" id="softwareversion" placeholder="z.B. v12.5, Build 2024.1">
                </div>
            </div>

            <div class="form-group">
                <label>
                    Update-Politik
                    <span class="help-icon" data-tooltip="meddevice-update-policy">?</span>
                </label>
                <div class="custom-select" data-name="updatepolicy">
                    <div class="select-trigger">
                        <span class="placeholder">Bitte wählen</span>
                        <span class="arrow">▼</span>
                    </div>
                    <div class="select-dropdown">
                        <div class="select-options">
                            <div class="select-option" data-value="">Bitte wählen</div>
                            <div class="select-option" data-value="regular">Regelmäßige Updates</div>
                            <div class="select-option" data-value="controlled">Kontrollierte Updates (mit Freigabe)</div>
                            <div class="select-option" data-value="frozen">Eingefroren (keine Updates)</div>
                            <div class="select-option" data-value="end-of-life">End-of-Life (keine Updates verfügbar)</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- IT-Sicherheit -->
    <div class="form-section collapsed">
        <div class="section-title">
            <span>IT-Sicherheit</span>
            <span class="section-counter">0/5</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="form-row">
                <div class="form-group">
                    <label>
                        Antivirus / Endpoint Protection
                        <span class="help-icon" data-tooltip="meddevice-antivirus">?</span>
                    </label>
                    <div class="custom-select" data-name="antivirus">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="installed">Installiert & Aktuell</div>
                                <div class="select-option" data-value="not-supported">Nicht unterstützt (Hersteller)</div>
                                <div class="select-option" data-value="compensated">Kompensiert (Netzwerk-Segmentierung)</div>
                                <div class="select-option" data-value="none">Nicht vorhanden</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>
                        Firewall / Netzwerk-Isolation
                        <span class="help-icon" data-tooltip="meddevice-firewall">?</span>
                    </label>
                    <div class="custom-select" data-name="firewall">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="isolated">Isoliertes Netzwerk</div>
                                <div class="select-option" data-value="segmented">Segmentiert (VLAN)</div>
                                <div class="select-option" data-value="filtered">Gefiltert (Firewall-Regeln)</div>
                                <div class="select-option" data-value="open">Offen / Standard-Netzwerk</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>
                        Datenverschlüsselung
                        <span class="help-icon" data-tooltip="meddevice-encryption">?</span>
                    </label>
                    <div class="custom-select" data-name="encryption">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="full">Volle Verschlüsselung (Storage & Transfer)</div>
                                <div class="select-option" data-value="transfer">Nur Übertragung (TLS/SSL)</div>
                                <div class="select-option" data-value="storage">Nur Speicherung</div>
                                <div class="select-option" data-value="none">Keine</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>
                        Zugriffskontrolle
                        <span class="help-icon" data-tooltip="meddevice-access-control">?</span>
                    </label>
                    <div class="custom-select" data-name="accesscontrol">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="multi-factor">Multi-Faktor</div>
                                <div class="select-option" data-value="password">Passwort</div>
                                <div class="select-option" data-value="card">Chipkarte / Badge</div>
                                <div class="select-option" data-value="biometric">Biometrisch</div>
                                <div class="select-option" data-value="none">Keine / Offen</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label>
                    Sicherheitsbewertung / Risikoanalyse
                    <span class="help-icon" data-tooltip="meddevice-security-assessment">?</span>
                </label>
                <textarea id="securityassessment" rows="3" placeholder="Ergebnis der Sicherheitsbewertung, identifizierte Risiken, Kompensationsmaßnahmen..."></textarea>
            </div>
        </div>
    </div>

    <!-- Verantwortlichkeiten -->
    <div class="form-section collapsed">
        <div class="section-title">
            <span>Verantwortlichkeiten & Kontakte</span>
            <span class="section-counter">0/4</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="form-row">
                <div class="form-group">
                    <label>
                        Medizinprodukte-Beauftragter
                        <span class="help-icon" data-tooltip="meddevice-mp-beauftragter">?</span>
                    </label>
                    <input type="text" id="mpbeauftragter" placeholder="z.B. Dr. med. Schmidt, M.Eng.">
                </div>
                <div class="form-group">
                    <label>Technischer Ansprechpartner</label>
                    <input type="text" id="technicalcontact" placeholder="z.B. IT-Abteilung, Medizintechnik">
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Medizinischer Ansprechpartner</label>
                    <input type="text" id="medicalcontact" placeholder="z.B. Chefarzt Radiologie">
                </div>
                <div class="form-group">
                    <label>Notfall-Hotline / Support</label>
                    <input type="text" id="emergencycontact" placeholder="z.B. +49 123 456789 (24/7)">
                </div>
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
                    Notizen / Besonderheiten
                    <span class="help-icon" data-tooltip="meddevice-notes">?</span>
                </label>
                <textarea id="devicenotes" rows="4" placeholder="Zusätzliche Informationen zum Gerät, bekannte Probleme, Besonderheiten im Betrieb, Dokumentation..."></textarea>
            </div>
        </div>
    </div>

</form>

<!-- Include help tooltips -->
{{include:pages/wizards/komponenten/help/medicaldevice-help.tpl}}
