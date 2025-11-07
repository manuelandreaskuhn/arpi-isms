<?php

namespace ARPI\Entities\Documents;

use ARPI\ODM\Mapping\Annotations as ODM;
use MongoDB\BSON\ObjectId;

/**
 * SIEM Entity
 * 
 * Repräsentiert ein SIEM-System (Security Information and Event Management) im Asset-Management
 * 
 * @ODM\Document(collection="siems")
 */
class Siem
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
     * SIEM-System Name / Bezeichnung
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $name;

    /**
     * SIEM-Software (splunk, qradar, arcsight, sentinel, etc.)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $software;

    /**
     * SIEM-Software Version
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $version;

    /**
     * Lizenzmodell (per-eps, per-gb, per-device, per-user, subscription, perpetual, free)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $licensemodel;

    // ==================== INFRASTRUKTUR ====================

    /**
     * Deployment-Typ (on-premise, cloud, hybrid)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $deployment;

    /**
     * SIEM-Server ID (Referenz zu VM oder Hardware-Komponente)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $serverid;

    /**
     * SIEM-Server Hostname (manuell eingegeben)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $hostname;

    /**
     * Management-URL
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $mgmturl;

    /**
     * IP-Adresse des SIEM-Systems
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $ipaddress;

    /**
     * Betriebssystem
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $operatingsystem;

    /**
     * Standort des SIEM-Systems
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $location;

    // ==================== LOG-QUELLEN & INTEGRATION ====================

    /**
     * Anzahl Log-Quellen
     * 
     * @ODM\Field(type="int")
     * @var int
     */
    public int $logsources;

    /**
     * Events per Second (EPS)
     * 
     * @ODM\Field(type="int")
     * @var int
     */
    public int $eps;

    /**
     * Log-Volume pro Tag
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $logvolume;

    /**
     * Storage-Kapazität
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $storage;

    /**
     * Integrierte Log-Quellen Typen (Array: firewalls, ids-ips, servers, ad, databases, etc.)
     * 
     * @ODM\Field(type="array")
     * @var array
     */
    public array $logsourcetypes = [];

    // ==================== DETECTION & ANALYTICS ====================

    /**
     * Anzahl aktiver Use Cases / Detection Rules
     * 
     * @ODM\Field(type="int")
     * @var int
     */
    public int $usecases;

    /**
     * Anzahl Correlation Rules
     * 
     * @ODM\Field(type="int")
     * @var int
     */
    public int $correlationrules;

    /**
     * Machine Learning / UEBA aktiviert (enabled, disabled)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $ueba;

    /**
     * Threat Intelligence Integration (enabled, disabled)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $threatintel;

    /**
     * Threat Intelligence Feeds
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $threatfeeds;

    /**
     * Verwendete Detection Frameworks (Array: mitre, killchain, nist, sigma)
     * 
     * @ODM\Field(type="array")
     * @var array
     */
    public array $frameworks = [];

    // ==================== INCIDENT RESPONSE & SOAR ====================

    /**
     * Incident Management System
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $incidentmgmt;

    /**
     * Ticketing-System Integration
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $ticketing;

    /**
     * SOAR Integration (integrated, external, none)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $soar;

    /**
     * SOAR-Plattform
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $soarplatform;

    // ==================== COMPLIANCE & REPORTING ====================

    /**
     * Log-Retention in Tagen
     * 
     * @ODM\Field(type="int")
     * @var int
     */
    public int $retention;

    /**
     * Archivierung aktiviert (enabled, disabled)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $archiving;

    /**
     * Unterstützte Compliance-Standards (Array: pci-dss, hipaa, gdpr, iso27001, nist, sox, kritis)
     * 
     * @ODM\Field(type="array")
     * @var array
     */
    public array $compliance = [];

    // ==================== ALERTING & NOTIFICATION ====================

    /**
     * Alert-Empfänger E-Mail-Adressen
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $alertmail;

    /**
     * Alert-Frequenz (durchschnittlich)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $alertfreq;

    /**
     * Notification-Kanäle (Array: email, sms, slack, teams, webhook)
     * 
     * @ODM\Field(type="array")
     * @var array
     */
    public array $notifications = [];

    /**
     * Dashboard-URL
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $dashboard;

    // ==================== SOC INTEGRATION ====================

    /**
     * SOC-Typ (internal, external, hybrid, none)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $soctype;

    /**
     * SOC-Betriebszeiten (24-7, business, extended)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $sochours;

    /**
     * SOC-Verantwortlicher
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $socresponsible;

    /**
     * MSSP / Externer Dienstleister
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $mssp;

    // ==================== VERANTWORTLICHKEITEN ====================

    /**
     * SIEM-Administrator
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $admin;

    /**
     * Support-Vertrag (24-7, business, basic, none)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $support;

    /**
     * Support-Kontakt
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $supportcontact;

    // ==================== ZUSÄTZLICHE INFORMATIONEN ====================

    /**
     * Notizen / SIEM-Besonderheiten
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $notes;

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
        $this->uuid = \uniqid('siem_', true);
        $this->createdat = new \DateTime();
        $this->updatedat = new \DateTime();
        $this->logsourcetypes = [];
        $this->frameworks = [];
        $this->compliance = [];
        $this->notifications = [];
    }
}
