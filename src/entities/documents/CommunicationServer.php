<?php
namespace ARPI\Entities\Documents;

use ARPI\ODM\Mapping\Annotations as ODM;
use MongoDB\BSON\ObjectId;

/**
 * Kommunikationsserver-Dokument
 * 
 * Dieses Dokument speichert detaillierte Informationen über Kommunikationsserver
 * innerhalb der IT-Infrastruktur, einschließlich technischer Konfiguration,
 * Protokolle, Hochverfügbarkeit, Sicherheit und Wartung.
 * 
 * @ODM\Document(collection="comm_servers")
 * @package Entities
 */
class CommunicationServer
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
     * Name des Kommunikationsservers
     * (z.B. "MailRelay01")
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $name;

    /**
     * Typ/Produkt des Kommunikationsservers
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $type;

    /**
     * Hersteller des Produkts
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $vendor;

    /**
     * Version der Software
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $version;

    /**
     * Kritikalität des Systems
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $criticality;

    // ==================== Technische Konfiguration ====================

    /**
     * ID des zugeordneten Servers (VM/Hardware)
     * Verlinkt auf: VM oder Hardware Dokument
     * 
     * @ODM\Field(type="string")
     * @var null|string
     */
    public ?string $serverid;

    /**
     * Hostname des Kommunikationsservers
     * Wenn serverid nicht gesetzt ist, wird der Hostname hier angegeben
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $serverhostname;

    /**
     * IP-Adresse des Kommunikationsservers
     * Wenn serverid nicht gesetzt ist, wird die IP-Adresse hier angegeben
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $serverip;

    /**
     * Betriebssystem des Kommunikationsservers
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $serveroperatingystem;

    /**
     * Physischer Standort des Kommunikationsservers
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $serverlocation;

    /**
     * URL der Management-Konsole
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $commservermanagementurl;

    /**
     * Umgebung (Produktion, Test, etc.)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $environment;

    // ==================== Protokolle & Standards ====================

    /**
     * Unterstützte Protokolle
     * 
     * @ODM\Field(type="collection")
     * @var array
     */
    public array $protocols = [];


    // ==================== Hochverfügbarkeit & Performance ====================

    /**
     * Hochverfügbarkeits-Konfiguration aktiviert
     * 
     * @ODM\Field(type="bool")
     * @var bool
     */
    public bool $serverhighavailability;

    /**
     * Cluster-Typ
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $serverclustertype;

    /**
     * Anzahl der Knoten im Cluster
     * 
     * @ODM\Field(type="int")
     * @var int
     */
    public int $servernodecount;

    // ==================== Monitoring & Logging ====================

    /**
     * Verwendetes Monitoring-Tool
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $monitoringtool;

    /**
     * Log-Retention in Tagen
     * 
     * @ODM\Field(type="int")
     * @var int
     */
    public int $monitoringlogretention;

    /**
     * SIEM-Integration aktiviert
     * 
     * @ODM\Field(type="bool")
     * @var bool
     */
    public bool $siemserverintegration;

    /**
     * SIEM-System ID/Name
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $siemserverid;

    /**
     * Log-Format für SIEM
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $siemlogformat;

    /**
     * Transport-Protokoll für SIEM
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $siemtransportprotocol;

    /**
     * An SIEM gesendete Log-Kategorien
     * 
     * @ODM\Field(type="collection")
     * @var array
     */
    public array $siemlogtypes = [];

    // ==================== Sicherheit & Zugriff ====================

    /**
     * Authentifizierungsmethode
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $serverauth;

    /**
     * TLS/SSL für Admin-Zugriff aktiviert
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $servertls;

    /**
     * Zugriffsberechtigung (Teams/Personen)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $serveraccesspermissions;

    // ==================== Wartung & Support ====================

    /**
     * Wartungsfenster
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $servermaintenancewindow;

    /**
     * Datum des letzten Updates
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $serverlastupdated;

    /**
     * Support-Kontakt
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $serversupportcontact;

    /**
     * Anmerkungen und Besonderheiten
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $notes;

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
     * Initialisiert Default Werte (z.B. leere Arrays)
     * @return void 
     */
    public function __construct()
    {
        $this->uuid = uniqid('commserver_', true);
        $this->createdat = new \DateTime();
        $this->protocols = [];
        $this->siemlogtypes = [];
        $this->serverhighavailability = false;
        $this->siemserverintegration = false;
    }
}
