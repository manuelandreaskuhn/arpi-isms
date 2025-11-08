<?php
namespace ARPI\Entities\Documents;

use ARPI\ODM\Mapping\Annotations as ODM;

/**
 * Eine medizinische Schnittstelle innerhalb eines Systems
 * 
 * @ODM\EmbeddedDocument
 * @package Entities
 */
class SystemMedicalInterface
{
    /**
     * Name der Schnittstelle
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $interfaceName;

    /**
     * Schnittstellen-Typ
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $interfaceType = null;

    /**
     * Protokoll
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $protocol = null;

    /**
     * Richtung
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $direction = null;

    /**
     * Quell-System ID
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $sourceSystemId = null;

    /**
     * Quell-System Name
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $sourceSystemName = null;

    /**
     * Ziel-System ID
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $targetSystemId = null;

    /**
     * Ziel-System Name
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $targetSystemName = null;

    /**
     * Daten-Typen
     * 
     * @ODM\Field(type="collection")
     * @var array
     */
    public array $dataTypes = [];

    /**
     * Nachrichten-Format
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $messageFormat = null;

    /**
     * Transport-Methode
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $transportMethod = null;

    /**
     * Port
     * 
     * @ODM\Field(type="int", nullable=true)
     * @var null|int
     */
    public ?int $port = null;

    /**
     * Verschlüsselung aktiviert?
     * 
     * @ODM\Field(type="bool")
     * @var bool
     */
    public bool $encryptionEnabled = false;

    /**
     * Frequenz
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $frequency = null;

    /**
     * Ist Echtzeit?
     * 
     * @ODM\Field(type="bool")
     * @var bool
     */
    public bool $isRealTime = false;

    /**
     * Fehlerbehandlung
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $errorHandling = null;

    /**
     * Notizen
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $notes = null;
}
