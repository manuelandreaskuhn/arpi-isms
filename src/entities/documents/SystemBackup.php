<?php
namespace ARPI\Entities\Documents;

use ARPI\ODM\Mapping\Annotations as ODM;

/**
 * Backup-Konfiguration innerhalb eines Systems
 * 
 * @ODM\EmbeddedDocument
 * @package Entities
 */
class SystemBackup
{
    /**
     * Name des Backups
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $backupName;

    /**
     * Backup-Typ
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $backupType = null;

    /**
     * Backup-Strategie
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $backupStrategy = null;

    /**
     * Backup-Server ID (Referenz)
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $backupServerId = null;

    /**
     * Backup-Server Name
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $backupServerName = null;

    /**
     * Backup-System ID (Referenz)
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $backupSystemId = null;

    /**
     * Backup-System Name
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $backupSystemName = null;

    /**
     * Backup-Schedule
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $schedule = null;

    /**
     * Retention in Tagen
     * 
     * @ODM\Field(type="int", nullable=true)
     * @var null|int
     */
    public ?int $retentionDays = null;

    /**
     * Storage-Speicherort
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $storageLocation = null;

    /**
     * Verschlüsselung aktiviert?
     * 
     * @ODM\Field(type="bool")
     * @var bool
     */
    public bool $encryptionEnabled = false;

    /**
     * RTO in Stunden
     * 
     * @ODM\Field(type="int", nullable=true)
     * @var null|int
     */
    public ?int $rtoHours = null;

    /**
     * RPO in Stunden
     * 
     * @ODM\Field(type="int", nullable=true)
     * @var null|int
     */
    public ?int $rpoHours = null;

    /**
     * Ziel-Host IDs
     * 
     * @ODM\Field(type="collection")
     * @var array
     */
    public array $targetHostIds = [];

    /**
     * Ziel-Host Namen
     * 
     * @ODM\Field(type="collection")
     * @var array
     */
    public array $targetHostNames = [];

    /**
     * Notizen
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $notes = null;
}
