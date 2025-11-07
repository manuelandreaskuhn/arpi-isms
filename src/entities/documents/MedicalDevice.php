<?php
namespace ARPI\Entities\Documents;

use ARPI\ODM\Mapping\Annotations as ODM;
use MongoDB\BSON\ObjectId;

/**
 * MedicalDevice-Dokument
 * 
 * Dieses Dokument speichert detaillierte Informationen über Medizingeräte
 * innerhalb der IT-Infrastruktur, einschließlich Klassifizierung,
 * IT-Integration, Wartung, Sicherheit und Verantwortlichkeiten.
 * 
 * @ODM\Document(collection="medicaldevices")
 * @package Entities
 */
class MedicalDevice
{
    /**
     * MongoDB Document ID
     * 
     * @ODM\Id
     * @var ObjectId
     */
    public ObjectId $id;

    /**
     * UUID zur eindeutigen Identifizierung des Datensatzes.
     * 
     * @ODM\Field(type="string")
     * @ODM\Index(unique=true)
     * @var string
     */
    public string $uuid;

    // ==================== Basis-Informationen ====================

    /**
     * Gerätename / Bezeichnung
     * (z.B. "CT-Scanner Raum 3", "Ultraschall-Station-A")
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $devicename;

    /**
     * Inventarnummer
     * (z.B. "MD-2024-001", "INV-12345")
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $inventorynumber;

    /**
     * Hersteller
     * (z.B. "Siemens Healthineers", "GE Healthcare")
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $manufacturer;

    /**
     * Modell / Typ
     * (z.B. "SOMATOM Force", "Discovery CT750")
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $model;

    /**
     * Seriennummer
     * (z.B. "SN123456789")
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $serialnumber;

    /**
     * Geräte-Kategorie
     * Werte: ct, mrt, roentgen, ultrasound, mammography, pet-ct, angiography,
     * lab-analyzer, blood-analyzer, mikroskope, pcr, monitor, ventilator,
     * infusion-pump, defibrillator, ecg, anesthesia, op-table, op-light,
     * surgical-robot, endoscopy, laser, dialysis, radiation-therapy,
     * physiotherapy, sterilization, incubator, other
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $devicecategory;

    // ==================== Medizinprodukt-Klassifizierung ====================

    /**
     * Risikoklasse (MDR)
     * Werte: class-i, class-iia, class-iib, class-iii, not-classified
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $riskclass;

    /**
     * CE-Kennzeichnung
     * Werte: yes, no, not-required
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $cemarking;

    /**
     * UDI (Unique Device Identification)
     * (z.B. "(01)04987654321115(11)220531(21)A1B2C3")
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $udi;

    /**
     * Benannte Stelle / Notified Body
     * (z.B. "TÜV SÜD, CE 0123")
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $notifiedbody;

    // ==================== Standort & Nutzung ====================

    /**
     * Standort / Raum
     * (z.B. "Gebäude A, Raum 3.12, Radiologie")
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $location;

    /**
     * Abteilung / Fachbereich
     * (z.B. "Radiologie", "Kardiologie", "Labor")
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $department;

    /**
     * Nutzungsstatus
     * Werte: in-use, standby, maintenance, repair, decommissioned, storage
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $usagestatus;

    /**
     * Betriebsstunden / Nutzungsgrad
     * (z.B. "24/7", "8-18 Uhr", "~200h/Monat")
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $operatinghours;

    /**
     * Anschaffungsdatum
     * (z.B. "15.03.2023")
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $purchasedate;

    /**
     * Inbetriebnahme
     * (z.B. "01.04.2023")
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $commissioningdate;

    // ==================== IT-Integration & Konnektivität ====================

    /**
     * Gerät ist netzwerkfähig / IT-vernetzt
     * 
     * @ODM\Field(type="bool")
     * @var bool
     */
    public bool $isnetworked;

    /**
     * Netzwerk-Anbindung
     * Werte: ethernet, wifi, both, bluetooth, serial, usb
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $networkconnection;

    /**
     * IP-Adresse
     * (z.B. "192.168.100.50")
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $ipaddress;

    /**
     * MAC-Adresse
     * (z.B. "00:1A:2B:3C:4D:5E")
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $macaddress;

    /**
     * Hostname / DNS Name
     * (z.B. "ct-scanner-03.hospital.local")
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $hostname;

    /**
     * PACS-Integration
     * Werte: direct, gateway, no, not-applicable
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $pacsintegration;

    /**
     * RIS/HIS-Integration
     * Werte: direct, gateway, no, not-applicable
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $rishisintegration;

    /**
     * Kommunikationsprotokoll (Gerät)
     * (z.B. "DICOM, HL7, FHIR, Modality Worklist, proprietary")
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $protocol;

    /**
     * Netzwerk-Segment / VLAN
     * (z.B. "Medical-VLAN-50, Isolated")
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $networksegment;

    // ==================== Gateway-Konfiguration ====================

    /**
     * Gateway / Konverter / Middleware wird verwendet
     * 
     * @ODM\Field(type="bool")
     * @var bool
     */
    public bool $hasgateway;

    /**
     * Gateway-Typ / Hersteller
     * Werte: vendor-gateway, dicom-gateway, hl7-interface, mirth,
     * integration-engine, protocol-converter, middleware, other
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $gatewaytype;

    /**
     * Gateway Modell / Produkt
     * (z.B. "Siemens syngo Gateway", "GE PACS Gateway")
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $gatewaymodel;

    /**
     * Gateway IP-Adresse
     * (z.B. "192.168.100.10")
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $gatewayip;

    /**
     * Gateway Hostname
     * (z.B. "gateway-ct-01.hospital.local")
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $gatewayhostname;

    /**
     * Verbindung Gerät → Gateway
     * (z.B. "Seriell RS-232, proprietary TCP, DICOM C-STORE")
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $devicetogateway;

    /**
     * Verbindung Gateway → PACS/RIS
     * (z.B. "DICOM, HL7 v2.x, FHIR")
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $gatewaytopacs;

    /**
     * Gateway-Funktionen
     * (z.B. "Protokoll-Konvertierung, DICOM Modality Worklist, Anonymisierung")
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $gatewayfunctions;

    /**
     * Gateway-Standort
     * Werte: ondevice, nearby, department, datacenter, cloud
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $gatewaylocation;

    /**
     * Gateway-Redundanz
     * Werte: yes, no, shared
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $gatewayredundancy;

    /**
     * Gateway-Notizen
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $gatewaynotes;

    // ==================== Wartung & Service ====================

    /**
     * Wartungsvertrag
     * Werte: full-service, preventive, on-demand, none
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $maintenancecontract;

    /**
     * Service-Partner
     * (z.B. "Siemens Service", "Fremd-Techniker")
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $servicepartner;

    /**
     * Wartungsintervall
     * (z.B. "jährlich", "halbjährlich", "quartalsweise")
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $maintenanceinterval;

    /**
     * Letzte Wartung
     * (z.B. "15.11.2024")
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $lastmaintenance;

    /**
     * Nächste Wartung (geplant)
     * (z.B. "15.05.2025")
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $nextmaintenance;

    /**
     * MTK-Prüfung (Medizintechnik)
     * (z.B. "jährlich, 24 Monate, letzte: 01.12.2024")
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $mtkcheck;

    // ==================== Software & Betriebssystem ====================

    /**
     * Betriebssystem
     * (z.B. "Windows 10 IoT", "Linux", "Embedded")
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $operatingsystem;

    /**
     * OS Version
     * (z.B. "Windows 10 21H2", "Ubuntu 20.04")
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $osversion;

    /**
     * Anwendungssoftware
     * (z.B. "Syngo CT Workplace", "Agfa IMPAX")
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $applicationsoftware;

    /**
     * Software-Version
     * (z.B. "v12.5", "Build 2024.1")
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $softwareversion;

    /**
     * Update-Politik
     * Werte: regular, controlled, frozen, end-of-life
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $updatepolicy;

    // ==================== IT-Sicherheit ====================

    /**
     * Antivirus / Endpoint Protection
     * Werte: installed, not-supported, compensated, none
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $antivirus;

    /**
     * Firewall / Netzwerk-Isolation
     * Werte: isolated, segmented, filtered, open
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $firewall;

    /**
     * Datenverschlüsselung
     * Werte: full, transfer, storage, none
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $encryption;

    /**
     * Zugriffskontrolle
     * Werte: multi-factor, password, card, biometric, none
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $accesscontrol;

    /**
     * Sicherheitsbewertung / Risikoanalyse
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $securityassessment;

    // ==================== Verantwortlichkeiten & Kontakte ====================

    /**
     * Medizinprodukte-Beauftragter
     * (z.B. "Dr. med. Schmidt, M.Eng.")
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $mpbeauftragter;

    /**
     * Technischer Ansprechpartner
     * (z.B. "IT-Abteilung", "Medizintechnik")
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $technicalcontact;

    /**
     * Medizinischer Ansprechpartner
     * (z.B. "Chefarzt Radiologie")
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $medicalcontact;

    /**
     * Notfall-Hotline / Support
     * (z.B. "+49 123 456789 (24/7)")
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $emergencycontact;

    // ==================== Zusätzliche Informationen ====================

    /**
     * Notizen / Besonderheiten
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $devicenotes;

    // ==================== Zeitstempel ====================

    /**
     * Erstellungsdatum
     * 
     * @ODM\Field(type="date")
     * @var \DateTime
     */
    public \DateTime $createdat;

    /**
     * Letztes Änderungsdatum
     * 
     * @ODM\Field(type="date")
     * @var \DateTime
     */
    public \DateTime $updatedat;
    

    /**
     * Initialisiert Default Werte
     * @return void 
     */
    public function __construct()
    {
        $this->uuid = \uniqid('meddevice_', true);
        $this->createdat = new \DateTime();
        $this->isnetworked = false;
        $this->hasgateway = false;
    }
}
