<?php
namespace ARPI\Entities\Documents;

use ARPI\ODM\Mapping\Annotations as ODM;

/**
 * Ein Load Balancer innerhalb eines Systems
 * 
 * @ODM\EmbeddedDocument
 * @package Entities
 */
class SystemLoadBalancer
{
    /**
     * Name des Load Balancers
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $loadBalancerName;

    /**
     * Load Balancer Typ
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $loadBalancerType = null;

    /**
     * Load Balancing Algorithmus
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $algorithm = null;

    /**
     * Frontend IP-Adresse
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $frontendIp = null;

    /**
     * Frontend Port
     * 
     * @ODM\Field(type="int", nullable=true)
     * @var null|int
     */
    public ?int $frontendPort = null;

    /**
     * Backend Port
     * 
     * @ODM\Field(type="int", nullable=true)
     * @var null|int
     */
    public ?int $backendPort = null;

    /**
     * Protokoll
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $protocol = null;

    /**
     * Backend Host IDs
     * 
     * @ODM\Field(type="collection")
     * @var array
     */
    public array $backendHostIds = [];

    /**
     * Backend Host Namen
     * 
     * @ODM\Field(type="collection")
     * @var array
     */
    public array $backendHostNames = [];

    /**
     * SSL-Offloading aktiviert?
     * 
     * @ODM\Field(type="bool")
     * @var bool
     */
    public bool $sslOffloading = false;

    /**
     * Health Check Pfad
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $healthCheckPath = null;

    /**
     * Health Check Intervall (Sekunden)
     * 
     * @ODM\Field(type="int", nullable=true)
     * @var null|int
     */
    public ?int $healthCheckInterval = null;

    /**
     * Session Persistence aktiviert?
     * 
     * @ODM\Field(type="bool")
     * @var bool
     */
    public bool $sessionPersistence = false;

    /**
     * Notizen
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $notes = null;
}
