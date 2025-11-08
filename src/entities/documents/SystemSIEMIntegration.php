<?php
namespace ARPI\Entities\Documents;

use ARPI\ODM\Mapping\Annotations as ODM;

/**
 * SIEM-Integration eines Systems
 * 
 * @ODM\EmbeddedDocument
 * @package Entities
 */
class SystemSIEMIntegration
{
    /**
     * Ist integriert?
     * 
     * @ODM\Field(type="bool")
     * @var bool
     */
    public bool $isIntegrated = false;

    /**
     * SIEM-System ID (Referenz)
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $siemSystemId = null;

    /**
     * SIEM-System Name
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $siemSystemName = null;

    /**
     * Log-Quellen
     * 
     * @ODM\Field(type="collection")
     * @var array
     */
    public array $logSources = [];

    /**
     * Log-Forwarding Methode
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $logForwardingMethod = null;

    /**
     * Log-Format
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $logFormat = null;

    /**
     * Überwachte Host IDs
     * 
     * @ODM\Field(type="collection")
     * @var array
     */
    public array $monitoredHostIds = [];

    /**
     * Überwachte Host Namen
     * 
     * @ODM\Field(type="collection")
     * @var array
     */
    public array $monitoredHostNames = [];

    /**
     * Überwachte Datenbank IDs
     * 
     * @ODM\Field(type="collection")
     * @var array
     */
    public array $monitoredDatabaseIds = [];

    /**
     * Überwachte Datenbank Namen
     * 
     * @ODM\Field(type="collection")
     * @var array
     */
    public array $monitoredDatabaseNames = [];

    /**
     * Use Cases
     * 
     * @ODM\Field(type="collection")
     * @var array
     */
    public array $useCases = [];

    /**
     * Alerting-Regeln
     * 
     * @ODM\Field(type="collection")
     * @var array
     */
    public array $alertingRules = [];

    /**
     * Retention in Tagen
     * 
     * @ODM\Field(type="int", nullable=true)
     * @var null|int
     */
    public ?int $retentionDays = null;

    /**
     * Notizen
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $notes = null;
}
