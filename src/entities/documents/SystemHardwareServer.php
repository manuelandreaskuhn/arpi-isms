<?php
namespace ARPI\Entities\Documents;

use ARPI\ODM\Mapping\Annotations as ODM;

/**
 * Ein physischer Hardware-Server innerhalb eines Systems
 * 
 * @ODM\EmbeddedDocument
 * @package Entities
 */
class SystemHardwareServer
{
    /**
     * Hostname des Servers
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $hostname;

    /**
     * IP-Adresse
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $ipAddress = null;

    /**
     * Hersteller
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $manufacturer = null;

    /**
     * Modell
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $model = null;

    /**
     * Seriennummer
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $serialNumber = null;

    /**
     * Standort
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $location = null;

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
     * RAID-Konfiguration
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $raidConfiguration = null;

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
