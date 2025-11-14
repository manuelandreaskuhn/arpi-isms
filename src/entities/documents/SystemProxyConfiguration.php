<?php
namespace ARPI\Entities\Documents;

use ARPI\ODM\Mapping\Annotations as ODM;

/**
 * Proxy-Konfiguration eines Systems
 * 
 * @ODM\EmbeddedDocument
 * @package Entities
 */
class SystemProxyConfiguration
{
    /**
     * Ist konfiguriert?
     * 
     * @ODM\Field(type="bool")
     * @var bool
     */
    public bool $isConfigured = false;

    /**
     * Proxy-Typ
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $proxyType = null;

    /**
     * Proxy-Server ID (Referenz)
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $proxyServerId = null;

    /**
     * Proxy-Server Name
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $proxyServerName = null;

    /**
     * Proxy-Adresse
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $proxyAddress = null;

    /**
     * Proxy-Port
     * 
     * @ODM\Field(type="int", nullable=true)
     * @var null|int
     */
    public ?int $proxyPort = null;

    /**
     * Authentifizierung erforderlich?
     * 
     * @ODM\Field(type="bool")
     * @var bool
     */
    public bool $authenticationRequired = false;

    /**
     * Authentifizierungs-Typ
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $authenticationType = null;

    /**
     * Bypass-Liste
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $bypassList = null;

    /**
     * SSL-Inspection aktiviert?
     * 
     * @ODM\Field(type="bool")
     * @var bool
     */
    public bool $sslInspection = false;

    /**
     * Content-Filtering aktiviert?
     * 
     * @ODM\Field(type="bool")
     * @var bool
     */
    public bool $contentFiltering = false;

    /**
     * Hat Failover?
     * 
     * @ODM\Field(type="bool")
     * @var bool
     */
    public bool $hasFailover = false;

    /**
     * Failover Proxy ID
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $failoverProxyId = null;

    /**
     * Failover Proxy Name
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $failoverProxyName = null;

    /**
     * Notizen
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $notes = null;
}
