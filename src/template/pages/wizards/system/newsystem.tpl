<aside>
    <p>Assetmanagement</p>
    <i>›</i>
    <p>Systeme</p>
    <i>›</i>
    <p>Neues System anlegen</p>
</aside>


<form id="newSystemForm">

    <!-- Basis Informationen -->
    <div class="form-section">
        <div class="section-title">
            <span>Basis-Informationen</span>
            <span class="section-badge">Pflicht</span>
            <span class="section-counter">0/1</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="form-group">
                <label>Systemname <span class="required">*</span></label>
                <input type="text" id="systemName" required placeholder="z.B. KIS-Produktiv, Radiologie-PACS">
                <div class="help-text">Eindeutiger Name zur Identifikation des Systems</div>
            </div>
        </div>
    </div>

    <!-- Software-Informationen -->
    <div class="form-section collapsed">
        <div class="section-title">
            <span>Software-Informationen</span>
            <span class="section-counter">0/4</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="form-row">
                <div class="form-group">
                    <label>Software / Produkt</label>
                    <input type="text" id="software" placeholder="z.B. SAP ERP, Orbis KIS">
                </div>
                <div class="form-group">
                    <label>Hersteller</label>
                    <input type="text" id="vendor" placeholder="z.B. Dedalus, Siemens">
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label>Version</label>
                    <input type="text" id="version" placeholder="z.B. 2024.1">
                </div>
                <div class="form-group">
                    <label>Lizenztyp</label>
                    <div class="custom-select" data-name="licenseType">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-search">
                                <input type="search" placeholder="Suchen...">
                            </div>
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="commercial">Kommerziell</div>
                                <div class="select-option" data-value="subscription">Subscription</div>
                                <div class="select-option" data-value="opensource">Open Source</div>
                                <div class="select-option" data-value="inhouse">Eigenentwicklung</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!-- Kategorisierung -->
    <div class="form-section collapsed">
        <div class="section-title">
            <span>Kategorisierung</span>
            <span class="section-counter">0/5</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="form-row">
                <div class="form-group">
                    <label>Fachbereich</label>
                    <div class="custom-select" data-name="department" data-multi="true">
                        <div class="select-trigger">
                            <span class="placeholder">Auswählen...</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-search">
                                <input type="search" placeholder="Suchen...">
                            </div>
                            <div class="select-options">
                                <div class="select-group-header">Diagnostik & Bildgebung</div>
                                <div class="select-option" data-value="radiology">Radiologie</div>
                                <div class="select-option" data-value="nuclearmedicine">Nuklearmedizin</div>
                                <div class="select-option" data-value="laboratorymedicine">Laboratoriumsmedizin</div>
                                <div class="select-option" data-value="pathology">Pathologie</div>
                                <div class="select-option" data-value="microbiology">Mikrobiologie</div>
                                <div class="select-option" data-value="functionaldiagnostics">Funktionsdiagnostik</div>

                                <div class="select-group-header">Klinische Fachrichtungen</div>
                                <div class="select-option" data-value="internalmedicine">Innere Medizin</div>
                                <div class="select-option" data-value="surgery">Chirurgie</div>
                                <div class="select-option" data-value="anesthesiology">Anästhesiologie</div>
                                <div class="select-option" data-value="neurology">Neurologie</div>
                                <div class="select-option" data-value="neurosurgery">Neurochirurgie</div>
                                <div class="select-option" data-value="gynecology">Gynäkologie und Geburtshilfe</div>
                                <div class="select-option" data-value="pediatrics">Pädiatrie (Kinder- und Jugendmedizin)</div>
                                <div class="select-option" data-value="geriatrics">Geriatrie (Altersmedizin)</div>
                                <div class="select-option" data-value="psychiatry">Psychiatrie und Psychotherapie</div>
                                <div class="select-option" data-value="psychosomatics">Psychosomatik</div>
                                <div class="select-option" data-value="urology">Urologie</div>
                                <div class="select-option" data-value="dermatology">Dermatologie</div>
                                <div class="select-option" data-value="ent">HNO (Hals-Nasen-Ohren-Heilkunde)</div>
                                <div class="select-option" data-value="ophthalmology">Augenheilkunde</div>
                                <div class="select-option" data-value="oncology">Onkologie / Hämatologie</div>
                                <div class="select-option" data-value="orthopedics">Orthopädie</div>
                                <div class="select-option" data-value="rheumatology">Rheumatologie</div>
                                <div class="select-option" data-value="endocrinology">Endokrinologie / Diabetologie</div>
                                <div class="select-option" data-value="infectiology">Infektiologie</div>
                                <div class="select-option" data-value="palliativecare">Palliativmedizin</div>
                                <div class="select-option" data-value="paintherapy">Schmerztherapie</div>
                                <div class="select-option" data-value="emergencymedicine">Notfallmedizin / Zentrale Notaufnahme</div>
                                <div class="select-option" data-value="intensivecare">Intensivmedizin</div>

                                <div class="select-group-header">Verwaltung & Organisation</div>
                                <div class="select-option" data-value="hospitaladministration">Krankenhausverwaltung</div>
                                <div class="select-option" data-value="patientadmission">Patientenaufnahme & -management</div>
                                <div class="select-option" data-value="controlling">Controlling & Finanzen</div>
                                <div class="select-option" data-value="humanresources">Personalwesen</div>
                                <div class="select-option" data-value="qualitymanagement">Qualitätsmanagement</div>
                                <div class="select-option" data-value="legal">Rechtsabteilung</div>
                                <div class="select-option" data-value="publicrelations">Öffentlichkeitsarbeit / Marketing</div>
                                <div class="select-option" data-value="it">IT-Abteilung / Medizininformatik</div>

                                <div class="select-group-header">Technischer & infrastruktureller Dienst</div>
                                <div class="select-option" data-value="technicalservice">Technischer Dienst / Haustechnik</div>
                                <div class="select-option" data-value="medicaltechnology">Medizintechnik</div>
                                <div class="select-option" data-value="cleaning">Reinigung & Hygiene</div>
                                <div class="select-option" data-value="security">Sicherheitsdienst</div>
                                <div class="select-option" data-value="transport">Transportdienst</div>
                                <div class="select-option" data-value="laundry">Wäscherei</div>
                                <div class="select-option" data-value="kitchen">Küche & Verpflegung</div>
                                <div class="select-option" data-value="archive">Archiv / Dokumentation</div>

                                <div class="select-group-header">Bildung & Forschung</div>
                                <div class="select-option" data-value="academicteaching">Akademisches Lehrzentrum</div>
                                <div class="select-option" data-value="medicalschools">Pflege- und Medizinschulen</div>
                                <div class="select-option" data-value="research">Forschungsabteilungen</div>
                                <div class="select-option" data-value="studycoordination">Studienkoordination / Ethikkommission</div>

                                <div class="select-group-header">Pflege & Therapie</div>
                                <div class="select-option" data-value="nursingmanagement">Pflegedienstleitung</div>
                                <div class="select-option" data-value="wardnursing">Stationspflege</div>
                                <div class="select-option" data-value="operatingroomnursing">OP- und Anästhesiepflege</div>
                                <div class="select-option" data-value="intensivecarenursing">Intensivpflege</div>
                                <div class="select-option" data-value="physiotherapy">Physiotherapie</div>
                                <div class="select-option" data-value="occupationaltherapy">Ergotherapie</div>
                                <div class="select-option" data-value="speechtherapy">Logopädie</div>
                                <div class="select-option" data-value="socialservice">Sozialdienst</div>
                                <div class="select-option" data-value="pastoralcare">Seelsorge</div>
                            </div>
                        </div>
                    </div>
                    <div class="selected-badges" data-target="department"></div>

                </div>
                <div class="form-group">
                    <label>Kritikalität</label>
                    <div class="custom-select" data-name="criticality">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="critical">Kritisch (24/7)</div>
                                <div class="select-option" data-value="high">Hoch</div>
                                <div class="select-option" data-value="medium">Mittel</div>
                                <div class="select-option" data-value="low">Niedrig</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label>Umgebung</label>
                    <div class="custom-select" data-name="environment">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="production">Produktion</div>
                                <div class="select-option" data-value="staging">Test/Staging</div>
                                <div class="select-option" data-value="development">Entwicklung</div>
                                <div class="select-option" data-value="training">Schulung</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>Hosting / Standort</label>
                    <div class="custom-select" data-name="hosting">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="onpremise">On-Premise (eigenes RZ)</div>
                                <div class="select-option" data-value="datacenter">Dienstleister-Rechenzentrum</div>
                                <div class="select-option" data-value="cloud">Cloud (Public Cloud)</div>
                                <div class="select-option" data-value="hybrid">Hybrid (On-Premise + Cloud)</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group" id="cloudProviderGroup" style="display: none;">
                <label>Cloud-Anbieter</label>
                <input type="text" id="cloudProvider" placeholder="z.B. Microsoft Azure, AWS, Google Cloud">
            </div>
        </div>
    </div>


    <!-- IT-Sicherheit -->
    <div class="form-section collapsed">
        <div class="section-title">
            <span>IT-Sicherheit & Compliance</span>
            <span class="section-counter">0/5</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <div class="form-row">
                <div class="form-group">
                    <label>Datenschutz-Klassifizierung</label>
                    <div class="custom-select" data-name="dataClassification">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="patient">Patientendaten (DSGVO)</div>
                                <div class="select-option" data-value="personal">Personenbezogene Daten</div>
                                <div class="select-option" data-value="internal">Interne Daten</div>
                                <div class="select-option" data-value="public">Öffentlich</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>Verschlüsselung</label>
                    <div class="custom-select" data-name="encryption">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="both">In Transit & At Rest</div>
                                <div class="select-option" data-value="transit">Nur in Transit (TLS/SSL)</div>
                                <div class="select-option" data-value="rest">Nur At Rest</div>
                                <div class="select-option" data-value="none">Keine</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label>Authentifizierung</label>
                    <div class="custom-select" data-name="authentication">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="mfa">Multi-Faktor (MFA)</div>
                                <div class="select-option" data-value="sso">Single Sign-On (SSO)</div>
                                <div class="select-option" data-value="ad">Active Directory</div>
                                <div class="select-option" data-value="local">Lokale Benutzer</div>
                                <div class="select-option" data-value="cert">Zertifikatsbasiert</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <label>Compliance & Zertifizierungen</label>
            <div class="checkbox-group">
                <div class="checkbox-item">
                    <input type="checkbox" id="dsgvo" name="compliance" value="dsgvo">
                    <label for="dsgvo">DSGVO-konform</label>
                </div>
                <div class="checkbox-item">
                    <input type="checkbox" id="bsi" name="compliance" value="bsi">
                    <label for="bsi">BSI-Grundschutz</label>
                </div>
                <div class="checkbox-item">
                    <input type="checkbox" id="b3s" name="compliance" value="b3s">
                    <label for="b3s">B3S: Medizinische Versorgung</label>
                </div>
                <div class="checkbox-item">
                    <input type="checkbox" id="iso27001" name="compliance" value="iso27001">
                    <label for="iso27001">ISO 27001</label>
                </div>
                <div class="checkbox-item">
                    <input type="checkbox" id="kritis" name="compliance" value="kritis">
                    <label for="kritis">KRITIS-relevant</label>
                </div>
                <div class="checkbox-item">
                    <input type="checkbox" id="medizinprodukt" name="compliance" value="medizinprodukt">
                    <label for="medizinprodukt">Medizinprodukt</label>
                </div>
            </div>
            <div class="form-group" style="margin-top: 20px;">
                <label>Letzte Sicherheitsüberprüfung</label>
                <input type="text" id="lastAudit" placeholder="z.B. Q2 2024, oder Datum">
            </div>
        </div>
    </div>


    <!-- IT-Objekte -->
    <div class="form-section collapsed">
        <div class="section-title">
            <span>IT-Komponenten</span>
            <span class="section-counter">0/1</span>
            <span class="section-toggle-icon">▼</span>
        </div>
        <div class="section-content">
            <label>Zugehörige IT-Objekte</label>
            <div class="help-text">Wählen Sie die IT-Komponenten aus, aus denen das System besteht oder mit denen es verbunden ist.</div>
            <div class="checkbox-group">
                <div class="checkbox-item">
                    <input type="checkbox" id="vm" name="components" value="vm">
                    <label for="vm">Virtuelle Maschinen</label>
                </div>
                <div class="checkbox-item">
                    <input type="checkbox" id="hardware" name="components" value="hardware">
                    <label for="hardware">Hardware Server</label>
                </div>
                <div class="checkbox-item">
                    <input type="checkbox" id="network" name="components" value="network">
                    <label for="network">Netzwerk-Komponenten</label>
                </div>
                <div class="checkbox-item">
                    <input type="checkbox" id="storage" name="components" value="storage">
                    <label for="storage">Storage / SAN</label>
                </div>
                <div class="checkbox-item">
                    <input type="checkbox" id="database" name="components" value="database">
                    <label for="database">Datenbank</label>
                </div>
                <div class="checkbox-item">
                    <input type="checkbox" id="backup" name="components" value="backup">
                    <label for="backup">Backup-System</label>
                </div>
                <div class="checkbox-item">
                    <input type="checkbox" id="loadbalancer" name="components" value="loadbalancer">
                    <label for="loadbalancer">Load Balancer</label>
                </div>
                <div class="checkbox-item">
                    <input type="checkbox" id="firewall" name="components" value="firewall">
                    <label for="firewall">Firewall</label>
                </div>
                <div class="checkbox-item">
                    <input type="checkbox" id="client" name="components" value="client">
                    <label for="client">Client-Arbeitsplätze</label>
                </div>
                <div class="checkbox-item">
                    <input type="checkbox" id="meddevice" name="components" value="meddevice">
                    <label for="meddevice">Medizingeräte</label>
                </div>
            </div>

        </div>
    </div>


</form>