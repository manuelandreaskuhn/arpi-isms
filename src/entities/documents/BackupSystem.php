<?php
namespace ARPI\Entities\Documents;

use ARPI\ODM\Mapping\Annotations as ODM;
use MongoDB\BSON\ObjectId;

/**
 * Ein Backup-System innerhalb der IT-Infrastruktur.
 * 
 * Dieses Dokument modelliert die wesentlichen Eigenschaften und Konfigurationen
 * eines Backup-Systems, einschließlich der verwendeten Software, Storage-Architektur,
 * Backup-Features, Monitoring-Optionen und Verantwortlichkeiten.
 * 
 * @ODM\Document(collection="backup_systems")
 * @package Entities
 */
class BackupSystem
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
     * Name des Backup-Systems
     * z.B. Veeam-Prod, BackupCluster1, etc.
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $name;

    /**
     * Verwendete Backup-Software (ID)
     * Strukturierte Liste unter /data/backup-software.json
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $software;

    /**
     * Version der Backup-Software
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $version;

    /**
     * Lizenzmodell der Backup-Software
     * z.B. Per-Socket, Per-VM, Subscription, etc.
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $licensemodel;

    // ==================== Infrastruktur & Server ====================

    /**
     * ID des zugeordneten Servers (VM/Hardware)
     * Verlinkt auf: VM oder Hardware Dokument
     * 
     * @ODM\Field(type="string")
     * @var null|string
     */
    public ?string $serverid;

    /**
     * Hostname des Backup-Servers
     * Wenn serverid nicht gesetzt ist, wird der Hostname hier angegeben
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $serverhostname;

    /**
     * IP-Adresse des Backup-Servers
     * Wenn serverid nicht gesetzt ist, wird die IP-Adresse hier angegeben
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $serverip;

    /**
     * Betriebssystem des Backup-Servers
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $serveroperatingystem;

    /**
     * Physischer Standort des Backup-Servers
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
    public string $backupmanagementurl;

    // ==================== Storage-Konfiguration ====================

    /**
     * Anzahl der Storage-Stufen (2-tier oder 3-tier)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $storagelevels;

    // Primärer Storage (Stufe 1)

    /**
     * Typ des primären Storage
     * z.B. SAN, NAS, Cloud, etc.
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $primarystoragetype;

    /**
     * Kapazität des primären Storage in TB
     * 
     * @ODM\Field(type="float")
     * @var float
     */
    public float $primarystoragecapacity;

    /**
     * Pfad oder Repository des primären Storage
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $primarystoragepath;

    /**
     * Deduplizierung für primären Storage
     * Enabled / Disabled 
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $primarydeduplication;

    // Sekundärer Storage (Stufe 2)

    /**
     * Typ des sekundären Storage
     * z.B. SAN, NAS, Cloud, etc.
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $secondarystoragetype;

    /**
     * Kapazität des sekundären Storage in TB
     * 
     * @ODM\Field(type="float")
     * @var float
     */
    public float $secondarystoragecapacity;

    /**
     * Pfad oder Bucket des sekundären Storage
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $secondarystoragepath;

    /**
     * Deduplizierung für sekundären Storage
     * Enabled / Disabled
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $secondarydeduplication;

    /**
     * Frequenz der Replikation zum sekundären Storage
     * Werte: continuous, hourly, daily, weekly
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $secondaryreplicationfreq;

    /**
     * Immutability-Einstellung für sekundären Storage
     * Enabled / Disabled
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $secondaryimmutability;

    /**
     * Immutability-Zeitraum für sekundären Storage
     * (z.B. 30 Tage, 1 Jahr, etc.)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $secondaryimmutabilityperiod;

    // Tertiärer Storage (Stufe 3 / Archiv)

    /**
     * Typ des tertiären Archiv-Storage
     * z.B. Cloud Archive, Tape Library, etc.
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $tertiarystoragetype;

    /**
     * Kapazität des tertiären Storage in TB
     * 
     * @ODM\Field(type="float")
     * @var float
     */
    public float $tertiarystoragecapacity;

    /**
     * Pfad oder Bucket des tertiären Archiv-Storage
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $tertiarystoragepath;

    /**
     * Frequenz der Archivierung
     * Werte: continuous, hourly, daily, weekly
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $tertiaryarchivefreq;

    /**
     * Aufbewahrungsdauer im Archiv
     * (z.B. 30 Tage, 1 Jahr, etc.)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $tertiaryretention;

    /**
     * Immutability-Einstellung für tertiären Storage
     * Enabled / Disabled
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $tertiaryimmutability;

    /**
     * Immutability-Zeitraum für tertiären Storage
     * (z.B. 30 Tage, 1 Jahr, etc.)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $tertiaryimmutabilityperiod;

    // ==================== Backup-Features & Konfiguration ====================

    /**
     * Unterstützte Backup-Typen (Full, Incremental, etc.)
     * Werte: full, incremental, differential, forever-incremental
     * 
     * @ODM\Field(type="collection")
     * @var array
     */
    public array $backuptypes = [];

    /**
     * Kompressionsstufe
     * Werte: none, low, medium, high
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $compression;

    /**
     * Verschlüsselungsmethode
     * Werte: AES-256, AES-128, etc.
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $backupencryption;

    /**
     * Application-Aware Backup aktiviert
     * Enabled / Disabled
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $applicationaware;

    /**
     * Instant Recovery Unterstützung
     * Enabled / Disabled
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $instantrecovery;

    /**
     * Zusätzliche Features (Replikation, CDP, etc.)
     * Werte: replication, archiving, cdp, cloud-tier
     * 
     * @ODM\Field(type="collection")
     * @var array
     */
    public array $additionalfeatures = [];

    // ==================== Monitoring & Alerting ====================

    /**
     * Integrierte Monitoring-Plattform
     * (z.B. Nagios, Zabbix, Cloud-Monitoring, etc.)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $monitoringintegration;

    /**
     * Reporting-Frequenz
     * (z.B. daily, weekly, monthly)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $reporting;

    /**
     * E-Mail-Adresse für Alarme
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $alertemail;

    /**
     * Log-Aufbewahrungszeitraum
     * (z.B. 30 Tage, 1 Jahr, etc.)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $logretention;

    // ==================== Verantwortlichkeiten & Support ====================

    /**
     * Verantwortlicher Backup-Administrator
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $backupadmin;

    /**
     * Support-Vertrag Level
     * (24x7, Business Hours, etc.)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $supportcontract;

    /**
     * Enddatum des Support-Vertrags
     * (z.B. 31.12.2023)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $supportend;

    // ==================== Zusätzliche Informationen ====================

    /**
     * Notizen und Besonderheiten
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $backupsystemnotes;

    // ==================== Systemfelder ====================

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
        $this->uuid = \uniqid('backup_', true);
        $this->createdat = new \DateTime();
        $this->backuptypes = [];
        $this->additionalfeatures = [];
    }
}
