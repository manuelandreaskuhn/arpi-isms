<?php
namespace ARPI\Entities\Documents;

use ARPI\ODM\Mapping\Annotations as ODM;

/**
 * Eine virtuelle Maschine innerhalb eines Systems
 * 
 * @ODM\EmbeddedDocument
 * @package Entities
 */
class SystemVirtualMachine
{
    /**
     * Hostname der VM
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $hostname;

    /**
     * IP-Adresse der VM
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $ipAddress = null;

    /**
     * Betriebssystem
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $operatingSystem = null;

    /**
     * Anzahl CPU-Cores
     * 
     * @ODM\Field(type="int", nullable=true)
     * @var null|int
     */
    public ?int $cpuCores = null;

    /**
     * RAM in GB
     * 
     * @ODM\Field(type="int", nullable=true)
     * @var null|int
     */
    public ?int $ramGb = null;

    /**
     * Storage in GB
     * 
     * @ODM\Field(type="int", nullable=true)
     * @var null|int
     */
    public ?int $storageGb = null;

    /**
     * Hypervisor ID (Referenz)
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $hypervisorId = null;

    /**
     * Hypervisor Name
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $hypervisorName = null;

    /**
     * Verwendungszweck
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $purpose = null;

    /**
     * Notizen
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $notes = null;
}
