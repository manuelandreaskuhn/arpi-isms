<?php
namespace ARPI\Entities\Documents;

use ARPI\ODM\Mapping\Annotations as ODM;
use MongoDB\BSON\ObjectId;

/**
 * Eine Virtuelle Maschine in der CMDB.
 * 
 * @ODM\Document(collection="virtualmachines")
 * @package Entities
 */
class VM
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
     * Hostname der VM
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $hostname;

    /**
     * IP Adresse
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var string|null
     */
    public ?string $ipaddress = null;

    /**
     * Betriebssystem
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var string|null
     */
    public ?string $operatingsystem = null;

    /**
     * Rolle der VM
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var string|null
     */
    public ?string $serverrole = null;

    /**
     * Anzahl der vCPUs
     * 
     * @ODM\Field(type="int", nullable=true)
     * @var int|null
     */
    public ?int $vcpu = null;

    /**
     * RAM in GB
     * 
     * @ODM\Field(type="int", nullable=true)
     * @var int|null
     */
    public ?int $ramingb = null;

    /**
     * Speicherplatz in GB
     * 
     * @ODM\Field(type="int", nullable=true)
     * @var int|null
     */
    public ?int $storageingb = null;

    /**
     * Hypervisor auf dem die VM läuft
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var string|null
     */
    public ?string $hypervisor = null;


    /**
     * Initialisiert Default Werte (z.B. leere Arrays)
     * @return void 
     */
    public function __construct() {
        // Default Werte hier setzen, falls benötigt
    }

}
