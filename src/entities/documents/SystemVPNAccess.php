<?php
namespace ARPI\Entities\Documents;

use ARPI\ODM\Mapping\Annotations as ODM;

/**
 * VPN-Zugriff Konfiguration eines Systems
 * 
 * @ODM\EmbeddedDocument
 * @package Entities
 */
class SystemVPNAccess
{
    /**
     * Ist konfiguriert?
     * 
     * @ODM\Field(type="bool")
     * @var bool
     */
    public bool $isConfigured = false;

    /**
     * VPN-Gateway ID (Referenz)
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $vpnGatewayId = null;

    /**
     * VPN-Gateway Name
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $vpnGatewayName = null;

    /**
     * VPN-Typ
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $vpnType = null;

    /**
     * VPN-Protokoll
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $vpnProtocol = null;

    /**
     * Erlaubte Benutzergruppen
     * 
     * @ODM\Field(type="collection")
     * @var array
     */
    public array $allowedUserGroups = [];

    /**
     * Erreichbare Hosts
     * 
     * @ODM\Field(type="collection")
     * @var array
     */
    public array $accessibleHosts = [];

    /**
     * Authentifizierung
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $authentication = null;

    /**
     * MFA erforderlich?
     * 
     * @ODM\Field(type="bool")
     * @var bool
     */
    public bool $mfaRequired = false;

    /**
     * IP-Pool Range
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $ipPoolRange = null;

    /**
     * Split-Tunneling aktiviert?
     * 
     * @ODM\Field(type="bool")
     * @var bool
     */
    public bool $splitTunneling = false;

    /**
     * Session-Timeout (Minuten)
     * 
     * @ODM\Field(type="int", nullable=true)
     * @var null|int
     */
    public ?int $sessionTimeout = null;

    /**
     * Notizen
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $notes = null;
}
