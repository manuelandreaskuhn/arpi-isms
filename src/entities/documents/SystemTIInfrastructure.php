<?php
namespace ARPI\Entities\Documents;

use ARPI\ODM\Mapping\Annotations as ODM;

/**
 * TI-Infrastruktur Konfiguration eines Systems
 * 
 * @ODM\EmbeddedDocument
 * @package Entities
 */
class SystemTIInfrastructure
{
    /**
     * Ist an TI angebunden?
     * 
     * @ODM\Field(type="bool")
     * @var bool
     */
    public bool $isConnected = false;

    /**
     * TI-Infrastruktur ID (Referenz)
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $tiInfrastructureId = null;

    /**
     * TI-Infrastruktur Name
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $tiInfrastructureName = null;

    /**
     * Aktive TI-Dienste
     * 
     * @ODM\Field(type="collection")
     * @var array
     */
    public array $activeTiServices = [];

    /**
     * KIM aktiviert?
     * 
     * @ODM\Field(type="bool")
     * @var bool
     */
    public bool $kimActive = false;

    /**
     * KIM-Adresse
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $kimAddress = null;

    /**
     * KIM-Provider
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $kimProvider = null;

    /**
     * KIM-Client
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $kimClient = null;

    /**
     * KIM-Verschlüsselung
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $kimEncryption = null;

    /**
     * E-Rezept aktiviert?
     * 
     * @ODM\Field(type="bool")
     * @var bool
     */
    public bool $erezeptActive = false;

    /**
     * E-Rezept Modul
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $erezeptModule = null;

    /**
     * E-Rezept Version
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $erezeptVersion = null;

    /**
     * E-Rezept Typen
     * 
     * @ODM\Field(type="collection")
     * @var array
     */
    public array $erezeptTypes = [];

    /**
     * E-Rezept AVS
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $erezeptAvs = null;

    /**
     * System-Notizen
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $systemNotes = null;
}
