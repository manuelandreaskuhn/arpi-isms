<?php
namespace ARPI\Entities\Documents;

use ARPI\ODM\Mapping\Annotations as ODM;
use DateTime;
use MongoDB\BSON\ObjectId;

/**
 * Ein Benutzer von unseren Kunden.
 * 
 * Eindeutige Identifizierung durch die Login (z.B. E-Mail Adresse) nach außen.
 * Nach innen mit der UUID.
 * 
 * @ODM\Document(collection="users")
 * @package Entities
 */
class User {

    /**
     * MongoDB Object ID
     * 
     * @ODM\Id
     * @var ObjectId
     */
    public ObjectId $id;

    /**
     * UUID
     * 
     * @ODM\Field(type="string")
     * @ODM\Index(unique=true)
     * @var string
     */
    public string $uuid;

    /**
     * Login Name - Kann E-Mail Adressen sein, Namen, Benutzernamen, etc.
     * 
     * @ODM\Field(type="string")
     * @ODM\Index
     * @var string
     */
    public string $login;

    /**
     * Verlinkung zum Ressource (meist aus dem AD importiert)
     * 
     * @ODM\EmbedOne(targetDocument=Ressource::class)
     * @var Ressource
     */
    public Ressource $ressource;

    /**
     * Welcher Kunde?
     * 
     * @ODM\ReferenceOne(targetDocument=CustomerGroup::class)
     * @var CustomerGroup
     */
    public CustomerGroup $customergroup;

    /**
     * Welcher Kunde?
     * 
     * @ODM\ReferenceMany(targetDocument=Customer::class)
     * @var Customer[]
     */
    public array/*Customer*/ $customers;

    /**
     * Secret für 2-Auth
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var string|null
     */
    public ?string $secret;

    /**
     * Datum wann das letzte mal 2-FA erfolgreich war
     * 
     * @ODM\Field(type="date", nullable=true)
     * @var \DateTime|null
     */
    public ?\DateTime $lastcheck;

    /**
     * Ist der Account deaktiviert?
     * 
     * @ODM\Field(type="bool")
     * @var bool
     */
    public bool $disabled;

    /**
     * Automatisch oder per Hand erstellt?
     * 
     * @ODM\Field(type="string", enumType="string")
     * @var string
     */
    public string $source;

    /**
     * Wenn automatisch generiert, welche ID hat es?
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $sourceid;

    /**
     * Letzter erfolgreiche Login Zeit/Datum
     * 
     * @ODM\Field(type="date", nullable=true)
     * @var DateTime|null
     */
    public ?\DateTime $lastlogin;

    /**
     * Letzte ausgewählte Instanz
     * 
     * @ODM\ReferenceOne(targetDocument=Customer::class, nullable=true)
     * @var Customer|null
     */
    public ?Customer $lastcustomer;

    
    /**
     * Initialisiert Default Werte (z.B. leere Arrays)
     * @return void 
     */
    public function __construct() {
        $this->uuid = \uniqid('ressource_', true);
        $this->customers = array();
        $this->id = new ObjectId();
    }
}