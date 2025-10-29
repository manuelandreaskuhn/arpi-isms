<div class="entry-content">
    <!-- Grundlegende Informationen -->
    <div class="subsection-header">Grundlegende Informationen</div>
    <div class="form-row">
        <div class="form-group">
            <label>Schnittstellenname</label>
            <input type="text" name="interfaceName" placeholder="z.B. KIS-Labor HL7, PACS-RIS DICOM">
            <div class="help-text">Beschreibender Name für diese Schnittstelle</div>
        </div>
        <div class="form-group">
            <label>Schnittstellentyp <span class="required">*</span></label>
            <div class="custom-select" data-name="interfaceType">
                <div class="select-trigger">
                    <span class="placeholder">Bitte wählen</span>
                    <span class="arrow">▼</span>
                </div>
                <div class="select-dropdown">
                    <div class="select-options">
                        <div class="select-option" data-value="">Bitte wählen</div>
                        <div class="select-option" data-value="hl7v2">HL7 v2.x</div>
                        <div class="select-option" data-value="fhir">HL7 FHIR</div>
                        <div class="select-option" data-value="dicom">DICOM</div>
                        <div class="select-option" data-value="xds">IHE XDS</div>
                        <div class="select-option" data-value="rest">REST API</div>
                        <div class="select-option" data-value="soap">SOAP/Web Services</div>
                        <div class="select-option" data-value="gdtbdt">GDT/BDT</div>
                        <div class="select-option" data-value="xdt">xDT (LDT/ADT)</div>
                        <div class="select-option" data-value="proprietary">Proprietär</div>
                        <div class="select-option" data-value="other">Sonstiges</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="form-group">
        <label>Datenflussrichtung</label>
        <div class="custom-select" data-name="dataDirection">
            <div class="select-trigger">
                <span class="placeholder">Bitte wählen</span>
                <span class="arrow">▼</span>
            </div>
            <div class="select-dropdown">
                <div class="select-options">
                    <div class="select-option" data-value="">Bitte wählen</div>
                    <div class="select-option" data-value="outbound">Ausgehend (dieses System sendet)</div>
                    <div class="select-option" data-value="inbound">Eingehend (dieses System empfängt)</div>
                    <div class="select-option" data-value="bidirectional">Bidirektional</div>
                </div>
            </div>
        </div>
    </div>

    <!-- Quellsystem -->
    <div class="interface-source-section">
        <h4 class="subsection-title">Quellsystem / Sender</h4>
        <div class="form-row">
            <div class="form-group">
                <label>Quellsystem</label>
                <input type="text" name="sourceSystem" placeholder="z.B. KIS, Labor-System">
                <div class="help-text">Name des sendenden Systems</div>
            </div>
            <div class="form-group">
                <label>Quell-Komponente (optional)</label>
                <div class="custom-select" data-name="sourceComponent">
                    <div class="select-trigger">
                        <span class="placeholder">Keine spezifische Auswahl</span>
                        <span class="arrow">▼</span>
                    </div>
                    <div class="select-dropdown">
                        <div class="select-options interface-source-components">
                            <div class="select-option" data-value="">Keine spezifische Auswahl</div>
                            <!-- Will be populated dynamically -->
                        </div>
                    </div>
                </div>
                <div class="help-text">Wählen Sie eine VM oder einen Server als Quell-Komponente</div>
            </div>
        </div>
    </div>

    <!-- Verbindungsart -->
    <div class="interface-connection-section">
        <h4 class="subsection-title">Verbindungsart & Übertragung</h4>
        <div class="form-group">
            <label>Verbindungstyp</label>
            <div class="custom-select" data-name="connectionType">
                <div class="select-trigger">
                    <span class="placeholder">Bitte wählen</span>
                    <span class="arrow">▼</span>
                </div>
                <div class="select-dropdown">
                    <div class="select-options">
                        <div class="select-option" data-value="">Bitte wählen</div>
                        <div class="select-option" data-value="direct">Direkte Verbindung</div>
                        <div class="select-option" data-value="commserver">Kommunikationsserver / Interface Engine</div>
                        <div class="select-option" data-value="fileshare">File Share / Verzeichnis</div>
                        <div class="select-option" data-value="messagequeue">Message Queue / Broker</div>
                    </div>
                </div>
            </div>
            <div class="help-text">Wählen Sie, wie die Systeme miteinander kommunizieren</div>
        </div>

        <!-- Direkte Verbindung -->
        <div class="connection-direct" style="display: none;">
            <div class="form-row">
                <div class="form-group">
                    <label>Port</label>
                    <input type="text" name="targetPort" placeholder="z.B. 2575, 443, 11112">
                </div>
                <div class="form-group">
                    <label>Verschlüsselung</label>
                    <div class="custom-select" data-name="directEncryption">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="tls">TLS/SSL verschlüsselt</div>
                                <div class="select-option" data-value="vpn">VPN-Tunnel</div>
                                <div class="select-option" data-value="ipsec">IPSec</div>
                                <div class="select-option" data-value="none">Keine Verschlüsselung</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Kommunikationsserver -->
        <div class="connection-commserver" style="display: none;">
            <div class="form-group">
                <label>Kommunikationsserver / Interface Engine</label>
                <input type="text" name="commServerName" placeholder="z.B. HL7 Interface Engine, Mirth Connect">
                <div class="help-text">Name des Kommunikationsservers, der die Nachrichten vermittelt</div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label>Server-Hostname/IP</label>
                    <input type="text" name="commServerHost" placeholder="z.B. hl7server.example.com">
                </div>
                <div class="form-group">
                    <label>Server-Komponente (optional)</label>
                    <div class="custom-select" data-name="commServerComponent">
                        <div class="select-trigger">
                            <span class="placeholder">Keine spezifische Auswahl</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options interface-commserver-components">
                                <div class="select-option" data-value="">Keine spezifische Auswahl</div>
                                <!-- Will be populated dynamically -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label>Channel/Route Name (optional)</label>
                <input type="text" name="commServerChannel" placeholder="z.B. KIS-to-Labor, ADT-Feed">
                <div class="help-text">Name des Channels oder der Route auf dem Kommunikationsserver</div>
            </div>
            <div class="form-group">
                <label>Verschlüsselung zum/vom Server</label>
                <div class="custom-select" data-name="commServerEncryption">
                    <div class="select-trigger">
                        <span class="placeholder">Bitte wählen</span>
                        <span class="arrow">▼</span>
                    </div>
                    <div class="select-dropdown">
                        <div class="select-options">
                            <div class="select-option" data-value="">Bitte wählen</div>
                            <div class="select-option" data-value="tls">TLS/SSL verschlüsselt</div>
                            <div class="select-option" data-value="vpn">VPN-Tunnel</div>
                            <div class="select-option" data-value="ipsec">IPSec</div>
                            <div class="select-option" data-value="none">Keine Verschlüsselung</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- File Share -->
        <div class="connection-fileshare" style="display: none;">
            <div class="form-group">
                <label>File Share Pfad</label>
                <input type="text" name="fileSharePath" placeholder="z.B. \\fileserver\hl7\inbox, /mnt/interfaces/labor">
                <div class="help-text">UNC-Pfad oder Mount-Point des File Shares</div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label>File Share Server</label>
                    <input type="text" name="fileShareServer" placeholder="z.B. fileserver01.example.com">
                </div>
                <div class="form-group">
                    <label>Protokoll</label>
                    <div class="custom-select" data-name="fileShareProtocol">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="smb">SMB/CIFS</div>
                                <div class="select-option" data-value="nfs">NFS</div>
                                <div class="select-option" data-value="ftp">FTP</div>
                                <div class="select-option" data-value="sftp">SFTP</div>
                                <div class="select-option" data-value="webdav">WebDAV</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label>Dateiformat/-muster</label>
                    <input type="text" name="filePattern" placeholder="z.B. *.hl7, ADT_*.xml">
                </div>
                <div class="form-group">
                    <label>Verschlüsselung</label>
                    <div class="custom-select" data-name="fileShareEncryption">
                        <div class="select-trigger">
                            <span class="placeholder">Bitte wählen</span>
                            <span class="arrow">▼</span>
                        </div>
                        <div class="select-dropdown">
                            <div class="select-options">
                                <div class="select-option" data-value="">Bitte wählen</div>
                                <div class="select-option" data-value="smb3">SMB 3.0 Encryption</div>
                                <div class="select-option" data-value="ssh">SSH/SFTP</div>
                                <div class="select-option" data-value="vpn">VPN-Tunnel</div>
                                <div class="select-option" data-value="fileenc">Datei-Level-Verschlüsselung</div>
                                <div class="select-option" data-value="none">Keine Verschlüsselung</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Message Queue -->
        <div class="connection-messagequeue" style="display: none;">
            <div class="form-group">
                <label>Message Queue System</label>
                <input type="text" name="mqSystemName" placeholder="z.B. RabbitMQ, IBM MQ, Kafka">
                <div class="help-text">Name und Typ des Message Queue Systems</div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label>Queue/Topic Name</label>
                    <input type="text" name="mqQueueName" placeholder="z.B. hospital.adt.queue">
                </div>
                <div class="form-group">
                    <label>Broker Hostname/IP</label>
                    <input type="text" name="mqBrokerHost" placeholder="z.B. mq.example.com">
                </div>
            </div>
            <div class="form-group">
                <label>Verschlüsselung</label>
                <div class="custom-select" data-name="mqEncryption">
                    <div class="select-trigger">
                        <span class="placeholder">Bitte wählen</span>
                        <span class="arrow">▼</span>
                    </div>
                    <div class="select-dropdown">
                        <div class="select-options">
                            <div class="select-option" data-value="">Bitte wählen</div>
                            <div class="select-option" data-value="tls">TLS/SSL verschlüsselt</div>
                            <div class="select-option" data-value="vpn">VPN-Tunnel</div>
                            <div class="select-option" data-value="none">Keine Verschlüsselung</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Zielsystem -->
    <div class="interface-target-section">
        <h4 class="subsection-title">Zielsystem / Empfänger</h4>
        <div class="form-row">
            <div class="form-group">
                <label>Zielsystem</label>
                <input type="text" name="targetSystem" placeholder="z.B. Radiologie-PACS, Archiv">
                <div class="help-text">Name des empfangenden Systems</div>
            </div>
            <div class="form-group">
                <label>Ziel-Komponente (optional)</label>
                <div class="custom-select" data-name="targetComponent">
                    <div class="select-trigger">
                        <span class="placeholder">Keine spezifische Auswahl</span>
                        <span class="arrow">▼</span>
                    </div>
                    <div class="select-dropdown">
                        <div class="select-options interface-target-components">
                            <div class="select-option" data-value="">Keine spezifische Auswahl</div>
                            <!-- Will be populated dynamically -->
                        </div>
                    </div>
                </div>
                <div class="help-text">Wählen Sie Load Balancer, VM oder Server als Ziel-Komponente</div>
            </div>
        </div>
    </div>

    <!-- Übertragene Daten -->
    <div class="subsection-header">Übertragene Datentypen</div>
    <div class="help-text">Wählen Sie alle medizinischen Datentypen, die über diese Schnittstelle übertragen werden</div>
    <div class="checkbox-group interface-data-types">
        <div class="checkbox-item">
            <input type="checkbox" name="dataTypes" value="patientdata">
            <label>Patientenstammdaten</label>
        </div>
        <div class="checkbox-item">
            <input type="checkbox" name="dataTypes" value="admission">
            <label>Aufnahme-/Bewegungsdaten (ADT)</label>
        </div>
        <div class="checkbox-item">
            <input type="checkbox" name="dataTypes" value="orders">
            <label>Aufträge/Anforderungen</label>
        </div>
        <div class="checkbox-item">
            <input type="checkbox" name="dataTypes" value="labresults">
            <label>Laborbefunde</label>
        </div>
        <div class="checkbox-item">
            <input type="checkbox" name="dataTypes" value="radresults">
            <label>Radiologie-Befunde</label>
        </div>
        <div class="checkbox-item">
            <input type="checkbox" name="dataTypes" value="images">
            <label>Medizinische Bilder (DICOM)</label>
        </div>
        <div class="checkbox-item">
            <input type="checkbox" name="dataTypes" value="documents">
            <label>Klinische Dokumente</label>
        </div>
        <div class="checkbox-item">
            <input type="checkbox" name="dataTypes" value="medication">
            <label>Medikationsdaten</label>
        </div>
        <div class="checkbox-item">
            <input type="checkbox" name="dataTypes" value="diagnosis">
            <label>Diagnosen</label>
        </div>
        <div class="checkbox-item">
            <input type="checkbox" name="dataTypes" value="procedures">
            <label>Prozeduren/OPS</label>
        </div>
        <div class="checkbox-item">
            <input type="checkbox" name="dataTypes" value="billing">
            <label>Abrechnungsdaten</label>
        </div>
        <div class="checkbox-item">
            <input type="checkbox" name="dataTypes" value="scheduling">
            <label>Terminplanung</label>
        </div>
        <div class="checkbox-item">
            <input type="checkbox" name="dataTypes" value="vitals">
            <label>Vitalparameter</label>
        </div>
        <div class="checkbox-item">
            <input type="checkbox" name="dataTypes" value="other">
            <label>Sonstiges</label>
        </div>
    </div>
    <!-- Technische Details -->
    <div class="subsection-header">Technische Details</div>
    <div class="form-row">
        <div class="form-group">
            <label>Protokoll/Transport</label>
            <div class="custom-select" data-name="transportProtocol">
                <div class="select-trigger">
                    <span class="placeholder">Bitte wählen</span>
                    <span class="arrow">▼</span>
                </div>
                <div class="select-dropdown">
                    <div class="select-options">
                        <div class="select-option" data-value="">Bitte wählen</div>
                        <div class="select-option" data-value="mllp">MLLP (HL7 Standard)</div>
                        <div class="select-option" data-value="https">HTTPS/TLS</div>
                        <div class="select-option" data-value="http">HTTP</div>
                        <div class="select-option" data-value="tcp">TCP/IP</div>
                        <div class="select-option" data-value="file">File-basiert</div>
                        <div class="select-option" data-value="ftp">FTP/SFTP</div>
                        <div class="select-option" data-value="mq">Message Queue</div>
                        <div class="select-option" data-value="dicomnet">DICOM Network</div>
                        <div class="select-option" data-value="other">Sonstiges</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label>Nachrichtenvolumen (pro Tag)</label>
            <input type="text" name="messageVolume" placeholder="z.B. ca. 10.000 Nachrichten">
        </div>
    </div>

    <div class="form-row">
        <div class="form-group">
            <label>SLA / Kritikalität</label>
            <div class="custom-select" data-name="interfaceCriticality">
                <div class="select-trigger">
                    <span class="placeholder">Bitte wählen</span>
                    <span class="arrow">▼</span>
                </div>
                <div class="select-dropdown">
                    <div class="select-options">
                        <div class="select-option" data-value="">Bitte wählen</div>
                        <div class="select-option" data-value="critical">Kritisch (Echtzeit)</div>
                        <div class="select-option" data-value="high">Hoch (< 5 Min)</div>
                        <div class="select-option" data-value="medium">Mittel (< 1 Std)</div>
                        <div class="select-option" data-value="low">Niedrig (täglich)</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label>Timeout (Sekunden)</label>
            <input type="text" name="timeoutSeconds" placeholder="z.B. 30">
        </div>
    </div>

    <div class="form-group">
        <label>Anmerkungen / Besonderheiten</label>
        <textarea name="interfaceNotes" rows="3" placeholder="z.B. Transformationsregeln, Mapping-Details, bekannte Einschränkungen..."></textarea>
    </div>
</div>
