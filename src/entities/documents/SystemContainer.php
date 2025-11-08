<?php
namespace ARPI\Entities\Documents;

use ARPI\ODM\Mapping\Annotations as ODM;

/**
 * Ein Container innerhalb eines Systems
 * 
 * @ODM\EmbeddedDocument
 * @package Entities
 */
class SystemContainer
{
    /**
     * Name des Containers
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $containerName;

    /**
     * Container-Typ
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $containerType = null;

    /**
     * Image-Name
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $imageName = null;

    /**
     * Image-Tag
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $imageTag = null;

    /**
     * Registry
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $registry = null;

    /**
     * Host-System ID (Referenz)
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $hostSystemId = null;

    /**
     * Host-System Name
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $hostSystemName = null;

    /**
     * Orchestrierung
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $orchestration = null;

    /**
     * Namespace
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $namespace = null;

    /**
     * Anzahl Replicas
     * 
     * @ODM\Field(type="int", nullable=true)
     * @var null|int
     */
    public ?int $replicas = null;

    /**
     * Exponierte Ports
     * 
     * @ODM\Field(type="collection")
     * @var array
     */
    public array $exposedPorts = [];

    /**
     * Volumes
     * 
     * @ODM\Field(type="collection")
     * @var array
     */
    public array $volumes = [];

    /**
     * Umgebungsvariablen
     * 
     * @ODM\Field(type="collection")
     * @var array
     */
    public array $environmentVariables = [];

    /**
     * Restart-Policy
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $restartPolicy = null;

    /**
     * CPU-Limits
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $resourceLimitsCpu = null;

    /**
     * Memory-Limits
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $resourceLimitsMemory = null;

    /**
     * Health-Check Command
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $healthCheckCommand = null;

    /**
     * Notizen
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $notes = null;
}
