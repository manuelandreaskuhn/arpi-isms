<?php
namespace ARPI\Entities\Documents;

use ARPI\ODM\Mapping\Annotations as ODM;
use MongoDB\BSON\ObjectId;

/**
 * Firewall-Dokument
 * 
 * Dieses Dokument speichert detaillierte Informationen über Firewalls
 * innerhalb der IT-Infrastruktur, einschließlich Netzwerk-Konfiguration,
 * Security-Features, High Availability, Logging und Monitoring.
 * 
 * @ODM\Document(collection="firewalls")
 * @package Entities
 */
class Firewall
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
     * Name der Firewall
     * (z.B. "FW-DMZ-01", "Perimeter-Firewall")
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $name;

    /**
     * Typ/Hersteller der Firewall
     * (z.B. "palo-alto", "fortinet", "checkpoint")
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $type;

    /**
     * Modell und Version
     * (z.B. "PA-3220", "FortiGate 200F", "v9.1")
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $model;

    /**
     * Seriennummer
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $serialnumber;

    // ==================== Netzwerk-Konfiguration ====================

    /**
     * Management IP-Adresse
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $managementip;

    /**
     * URL der Management-Konsole
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $managementurl;

    /**
     * Standort/Zone der Firewall
     * (z.B. "Perimeter", "DMZ", "Internal")
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $location;

    /**
     * Funktion der Firewall
     * (z.B. "perimeter", "internal", "dmz", "datacenter", "ngfw")
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $function;

    /**
     * Externes Interface / IP
     * (Public/Internet-facing Interface)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $externalif;

    /**
     * Internes Interface / IP
     * (Internes Netzwerk Interface)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $internalif;

    /**
     * DMZ Interface / IP
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $dmzif;

    /**
     * Weitere Zonen
     * (z.B. "Guest, Management, VPN")
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $otherzones;

    // ==================== Security Features ====================

    /**
     * IPS/IDS Status
     * Werte: enabled, ids-only, disabled
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $ips;

    /**
     * Application Control Status
     * Werte: enabled, disabled
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $appcontrol;

    /**
     * URL Filtering Status
     * Werte: enabled, disabled
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $urlfilter;

    /**
     * Anti-Malware / Virus Scan Status
     * Werte: enabled, disabled
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $antimalware;

    /**
     * SSL/TLS Inspection Status
     * Werte: full, partial, disabled
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $sslinspection;

    /**
     * DDoS Protection Status
     * Werte: enabled, disabled
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $ddos;

    // ==================== High Availability & Redundanz ====================

    /**
     * High Availability aktiviert
     * 
     * @ODM\Field(type="bool")
     * @var bool
     */
    public bool $serverhighavailability;

    /**
     * HA-Modus
     * Werte: active-passive, active-active, cluster
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $hamode;

    /**
     * Partner/Standby Firewall
     * (Name der HA-Partner-Firewall)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $partnerfirewall;

    // ==================== Logging & Monitoring ====================

    /**
     * Log Level
     * Werte: all, deny-only, security-events, minimal
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $loglevel;

    /**
     * SIEM Integration
     * (z.B. "Splunk", "QRadar", "Syslog-Server")
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $siem;

    /**
     * Log Retention in Tagen
     * 
     * @ODM\Field(type="int")
     * @var int
     */
    public int $logretention;

    /**
     * Monitoring / Alerting
     * (z.B. "SNMP", "Prometheus", "E-Mail")
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $monitoring;

    // ==================== Zusätzliche Informationen ====================

    /**
     * Notizen und Besonderheiten
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $fwnotes;

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
        $this->uuid = \uniqid('firewall_', true);
        $this->createdat = new \DateTime();
        $this->serverhighavailability = false;
    }
}
