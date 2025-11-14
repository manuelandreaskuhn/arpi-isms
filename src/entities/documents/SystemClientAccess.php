<?php
namespace ARPI\Entities\Documents;

use ARPI\ODM\Mapping\Annotations as ODM;

/**
 * Ein Client-Zugriff innerhalb eines Systems
 * 
 * @ODM\EmbeddedDocument
 * @package Entities
 */
class SystemClientAccess
{
    /**
     * Name des Zugriffs
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $accessName;

    /**
     * Client-Typ
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $clientType = null;

    /**
     * Betriebssystem
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $operatingSystem = null;

    /**
     * Anzahl Clients
     * 
     * @ODM\Field(type="int", nullable=true)
     * @var null|int
     */
    public ?int $clientCount = null;

    /**
     * Zugriffs-Protokoll
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $accessProtocol = null;

    /**
     * Port
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $port = null;

    /**
     * Verschlüsselung
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $encryption = null;

    /**
     * Authentifizierung
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $authentication = null;

    /**
     * Verbindungsziel
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $connectionTarget = null;

    /**
     * Ziel Load Balancer ID
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $targetLoadBalancerId = null;

    /**
     * Ziel Load Balancer Name
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $targetLoadBalancerName = null;

    /**
     * Ziel Server IDs
     * 
     * @ODM\Field(type="collection")
     * @var array
     */
    public array $targetServerIds = [];

    /**
     * Ziel Server Namen
     * 
     * @ODM\Field(type="collection")
     * @var array
     */
    public array $targetServerNames = [];

    /**
     * Zugriffs-URL
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $accessUrl = null;

    /**
     * DNS-Name
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $dnsName = null;

    /**
     * Client-Software
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $clientSoftware = null;

    /**
     * Installationsmethode
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $installMethod = null;

    /**
     * Update-Mechanismus
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $updateMechanism = null;

    /**
     * Lizenzierung
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $licensing = null;

    /**
     * Netzwerk-Segment
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $networkSegment = null;

    /**
     * Bandbreite
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $bandwidth = null;

    /**
     * Offline-Fähigkeit
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $offlineCapability = null;

    /**
     * Session-Management
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $sessionManagement = null;

    /**
     * Benutzergruppe
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $userGroup = null;

    /**
     * Arbeitszeiten
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $workingHours = null;

    /**
     * Systemanforderungen
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $systemRequirements = null;

    /**
     * Spezielle Anforderungen
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $specialRequirements = null;

    /**
     * Notizen
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $notes = null;
}
