<?php

namespace ARPI\Entities\Documents;

use ARPI\ODM\Mapping\Annotations as ODM;
use MongoDB\BSON\ObjectId;

/**
 * TiInfrastruktur Entity
 * 
 * Repräsentiert eine Telematikinfrastruktur-Anbindung im Asset-Management
 * 
 * @ODM\Document(collection="tiinfrastrukturen")
 */
class TiInfrastruktur
{
    /**
     * Eindeutige ID (MongoDB ObjectID)
     * 
     * @ODM\Id
     * @var ObjectId
     */
    public ObjectId $id;

    /**
     * UUID für externe Referenzierung
     * 
     * @ODM\Field(type="string")
     * @ODM\Index(unique=true)
     * @var string
     */
    public string $uuid;

    // ==================== BASIS-INFORMATIONEN ====================

    /**
     * TI-Infrastruktur Name / Bezeichnung
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $name;

    /**
     * Standort der TI-Anbindung
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $location;

    /**
     * Beschreibung der TI-Anbindung
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $description;

    // ==================== KONNEKTOR-KONFIGURATION ====================

    /**
     * Konnektor-Hersteller (secunet, tsystems, rise, compugroup)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $konnektorvendor;

    /**
     * Konnektor-Modell
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $konnektormodel;

    /**
     * Konnektor Firmware-Version
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $konnektorfirmware;

    /**
     * Konnektor Serial Number
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $konnektorserial;

    /**
     * Konnektor Hostname / IP-Adresse
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $konnektorip;

    /**
     * Konnektor Management-URL
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $konnektorurl;

    // ==================== GATEWAY & NETZWERK ====================

    /**
     * TI-Gateway Typ (sia, vpn-zugd, dedicated)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $tigatewaytype;

    /**
     * TI-Gateway Provider
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $tiprovider;

    /**
     * TI-Anbindung Bandwidth
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $tibandwidth;

    /**
     * TI-Netzwerk-Segment
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $tinetworksegment;

    // ==================== SMC-B KARTEN ====================

    /**
     * SMC-B Kartentyp (smcb-krankenhaus, smcb-praxis, smcb-apotheke, smcb-institution)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $smcbtype;

    /**
     * SMC-B ICCSN (Kartennummer)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $smcbiccsn;

    /**
     * SMC-B Gültig bis
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $smcbvalid;

    /**
     * Kartenleser
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $cardreader;

    // ==================== TI-FACHDIENSTE ====================

    /**
     * Aktivierte TI-Fachdienste (Array: kim, erezept, epa, nfdm, vsdm, vsdd, tisqsig, eml, eau)
     * 
     * @ODM\Field(type="array")
     * @var array
     */
    public array $tifachdienste = [];

    // ==================== SICHERHEIT & COMPLIANCE ====================

    /**
     * TI-Sicherheitsrichtlinien Status (vollstaendig, teilweise, nicht-erfuellt)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $tisecurity;

    /**
     * Letzte Sicherheitsprüfung
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $tilastsecuritycheck;

    /**
     * Gematik-Zulassung Status (zugelassen, zertifiziert, in-zulassung, nicht-zugelassen)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $tigematikzulassung;

    /**
     * Zulassungsnummer / Zertifikat
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $tizulassungsnummer;

    // ==================== VERANTWORTLICHKEITEN ====================

    /**
     * TI-Verantwortlicher
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $tiverantwortlicher;

    /**
     * TI-Support / Dienstleister
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $tisupport;

    /**
     * Support-Vertrag / SLA
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $tisupportcontract;

    // ==================== ZUSÄTZLICHE INFORMATIONEN ====================

    /**
     * Notizen / TI-Besonderheiten
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $tinotes;

    // ==================== METADATEN ====================

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
     * Constructor
     */
    public function __construct()
    {
        $this->uuid = \uniqid('ti_', true);
        $this->createdat = new \DateTime();
        $this->updatedat = new \DateTime();
        $this->tifachdienste = [];
    }
}
