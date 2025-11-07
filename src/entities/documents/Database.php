<?php
namespace ARPI\Entities\Documents;

use ARPI\ODM\Mapping\Annotations as ODM;
use MongoDB\BSON\ObjectId;

/**
 * Eine Datenbank in der CMDB.
 * 
 * @ODM\Document(collection="databases")
 * @package Entities
 */
class Database
{
    /**
     * MongoDB Object ID
     * 
     * @ODM\Id
     * @var ObjectId
     */
    public ObjectId $id;

    /**
     * UUID
     * 
     * @ODM\Field(type="string")
     * @ODM\Index(unique=true)
     * @var string
     */
    public string $uuid;

    /**
     * Datenbankname
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $dbname;

    /**
     * Datenbank-Typ (oracle, mssql, mysql, postgresql, mongodb, etc.)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $dbtype;

    /**
     * Version
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var string|null
     */
    public ?string $dbversion = null;

    /**
     * Zeichensatz / Charset
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var string|null
     */
    public ?string $charset = null;

    /**
     * Ist Cluster
     * 
     * @ODM\Field(type="bool")
     * @var bool
     */
    public bool $iscluster = false;

    /**
     * Cluster-Typ
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var string|null
     */
    public ?string $clustertype = null;

    /**
     * Cluster-Name
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var string|null
     */
    public ?string $clustername = null;

    /**
     * Anzahl Cluster-Knoten
     * 
     * @ODM\Field(type="int", nullable=true)
     * @var int|null
     */
    public ?int $clusternodes = null;

    /**
     * Failover-Modus
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var string|null
     */
    public ?string $failovermode = null;

    /**
     * Zugeordnete VM IDs
     * 
     * @ODM\Field(type="collection")
     * @var array
     */
    public array $assignedvms = [];

    /**
     * Zugeordnete Hardware IDs
     * 
     * @ODM\Field(type="collection")
     * @var array
     */
    public array $assignedhardware = [];

    /**
     * Datenbankgröße in GB
     * 
     * @ODM\Field(type="int", nullable=true)
     * @var int|null
     */
    public ?int $dbsizeingb = null;

    /**
     * Maximale Verbindungen
     * 
     * @ODM\Field(type="int", nullable=true)
     * @var int|null
     */
    public ?int $maxconnections = null;

    /**
     * Backup-Strategie
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var string|null
     */
    public ?string $backupstrategy = null;

    /**
     * Backup Retention in Tagen
     * 
     * @ODM\Field(type="int", nullable=true)
     * @var int|null
     */
    public ?int $backupretention = null;

    /**
     * Verschlüsselung
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var string|null
     */
    public ?string $encryption = null;

    /**
     * Authentifizierung
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var string|null
     */
    public ?string $authentication = null;

    /**
     * Port
     * 
     * @ODM\Field(type="int", nullable=true)
     * @var int|null
     */
    public ?int $port = null;

    /**
     * Tablespace / Schema
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var string|null
     */
    public ?string $tablespace = null;

    /**
     * Notizen
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var string|null
     */
    public ?string $notes = null;

    /**
     * Initialisiert Default Werte
     * @return void 
     */
    public function __construct() {
        $this->uuid = \uniqid('database_', true);
        $this->assignedvms = [];
        $this->assignedhardware = [];
        $this->iscluster = false;
    }
}
