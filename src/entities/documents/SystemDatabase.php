<?php
namespace ARPI\Entities\Documents;

use ARPI\ODM\Mapping\Annotations as ODM;

/**
 * Eine Datenbank innerhalb eines Systems
 * 
 * @ODM\EmbeddedDocument
 * @package Entities
 */
class SystemDatabase
{
    /**
     * Name der Datenbank
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $databaseName;

    /**
     * Datenbank-Typ (MySQL, PostgreSQL, etc.)
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $databaseType = null;

    /**
     * Version
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $version = null;

    /**
     * Ist die Datenbank geclustert?
     * 
     * @ODM\Field(type="bool")
     * @var bool
     */
    public bool $isClustered = false;

    /**
     * Host IDs (Referenzen zu VMs/Hardware)
     * 
     * @ODM\Field(type="collection")
     * @var array
     */
    public array $hostIds = [];

    /**
     * Host Namen
     * 
     * @ODM\Field(type="collection")
     * @var array
     */
    public array $hostNames = [];

    /**
     * Cluster-Typ
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $clusterType = null;

    /**
     * Anzahl Nodes
     * 
     * @ODM\Field(type="int", nullable=true)
     * @var null|int
     */
    public ?int $nodeCount = null;

    /**
     * Port
     * 
     * @ODM\Field(type="int", nullable=true)
     * @var null|int
     */
    public ?int $port = null;

    /**
     * Authentifizierungs-Methode
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $authenticationMethod = null;

    /**
     * Verschlüsselung aktiviert?
     * 
     * @ODM\Field(type="bool")
     * @var bool
     */
    public bool $encryptionEnabled = false;

    /**
     * Backup-Schedule
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $backupSchedule = null;

    /**
     * Notizen
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $notes = null;
}
