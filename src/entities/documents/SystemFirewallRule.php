<?php
namespace ARPI\Entities\Documents;

use ARPI\ODM\Mapping\Annotations as ODM;

/**
 * Eine Firewall-Regel innerhalb eines Systems
 * 
 * @ODM\EmbeddedDocument
 * @package Entities
 */
class SystemFirewallRule
{
    /**
     * Name der Regel
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $ruleName;

    /**
     * Firewall ID (Referenz)
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $firewallId = null;

    /**
     * Firewall Name
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $firewallName = null;

    /**
     * Aktion (Allow/Deny)
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $action = null;

    /**
     * Protokoll
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $protocol = null;

    /**
     * Quell-Zone
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $sourceZone = null;

    /**
     * Quell-Adresse
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $sourceAddress = null;

    /**
     * Quell-Port
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $sourcePort = null;

    /**
     * Ziel-Zone
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $destinationZone = null;

    /**
     * Ziel-Adresse
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $destinationAddress = null;

    /**
     * Ziel-Port
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $destinationPort = null;

    /**
     * NAT aktiviert?
     * 
     * @ODM\Field(type="bool")
     * @var bool
     */
    public bool $natEnabled = false;

    /**
     * NAT-Typ
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $natType = null;

    /**
     * NAT-Adresse
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $natAddress = null;

    /**
     * Logging aktiviert?
     * 
     * @ODM\Field(type="bool")
     * @var bool
     */
    public bool $loggingEnabled = false;

    /**
     * Notizen
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $notes = null;
}
