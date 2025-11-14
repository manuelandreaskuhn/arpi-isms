<?php
namespace ARPI\Entities\Documents;

use ARPI\ODM\Mapping\Annotations as ODM;

/**
 * Ein Medizingerät innerhalb eines Systems
 * 
 * @ODM\EmbeddedDocument
 * @package Entities
 */
class SystemMedicalDevice
{
    /**
     * Name des Geräts
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $deviceName;

    /**
     * Geräte-Kategorie
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $deviceCategory = null;

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
     * IP-Adresse
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $ipAddress = null;

    /**
     * Hostname
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $hostname = null;

    /**
     * Kommunikations-Protokoll
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $communicationProtocol = null;

    /**
     * Verbundene Komponente ID
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $connectedComponentId = null;

    /**
     * Verbundene Komponente Name
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $connectedComponentName = null;

    /**
     * Ist Medizinprodukt?
     * 
     * @ODM\Field(type="bool")
     * @var bool
     */
    public bool $isMedicalDevice = false;

    /**
     * Medizinprodukt-Klasse
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $medicalDeviceClass = null;

    /**
     * CE-Kennzeichnung
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $ceMarking = null;

    /**
     * UDI (Unique Device Identifier)
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $udi = null;

    /**
     * Wartungsintervall
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $maintenanceInterval = null;

    /**
     * Nächste Wartung
     * 
     * @ODM\Field(type="date", nullable=true)
     * @var null|\DateTime
     */
    public ?\DateTime $nextMaintenance = null;

    /**
     * Software-Version
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $softwareVersion = null;

    /**
     * Verantwortlicher Kontakt
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $responsibleContact = null;

    /**
     * Notizen
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $notes = null;
}
