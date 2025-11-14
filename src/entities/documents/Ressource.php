<?php
namespace ARPI\Entities\Documents;

use ARPI\ODM\Mapping\Annotations as ODM;
use MongoDB\BSON\ObjectId;
use DateTime;

/**
 * Eintrag für eine Ressource. Kundenspezifisch.
 * Ist eine eigebettete Entität in User.
 * @see User
 * @ODM\EmbeddedDocument
 */
class Ressource {

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
     * Wann wurde das Ressource zuletzt geändert?
     * 
     * @ODM\Field(type="date")
     * @var \DateTime
     */
    public DateTime $lastchange;

    /**
     * Wer ist der Verwalter von diesem Datensatz?
     * 
     * @ODM\ReferenceOne(targetDocument=CustomerGroup::class)
     * @var CustomerGroup
     */
    public CustomerGroup $owner;

    /**
     * In welchem Krankenhaus arbeitet die Person?
     * 
     * @ODM\ReferenceOne(targetDocument=Customer::class, nullable=true)
     * @var Customer|null
     */
    public ?Customer $worksat;

    /**
     * Gruppe oder Benutzer
     * 
     * @ODM\Field(type="string", enumType="string")
     * @var string
     */
    public string $type;

    /**
     * ID beim Kunden
     * 
     * @ODM\Field(type="string")
     * @ODM\Index
     * @var string
     */
    public string $externalid;

    /**
     * Vorname
     * 
     * @ODM\Field(type="string")
     * @ODM\Index(options={"text": true})
     * @var string
     */
    public string $firstname;

    /**
     * Nachname
     * 
     * @ODM\Field(type="string")
     * @ODM\Index(options={"text": true})
     * @var string
     */
    public string $lastname;

    /**
     * E-Mail Adresse
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var string|null
     */
    public ?string $email;

    /**
     * Gruppenname (wenn Type=group)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $groupname;

    /**
     * Beschreibung
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $description;

    /**
     * Rollen
     * 
     * @ODM\ReferenceMany(targetDocument=Role::class)
     * @var Role[]
     */
    public array $roles;

    /**
     * Organisationen, in denen die Ressource arbeitet.
     * 
     * @ODM\ReferenceMany(targetDocument=Organization::class)
     * @var Organization[]
     */
    public array $organizations;


    /**
     * Initialisiert Default Werte (z.B. leere Arrays)
     * @return void 
     */
    public function __construct() {
        $this->uuid = \uniqid('ressource_', true);
        $this->id = new ObjectId();
        $this->roles = array();
        $this->organizations = array();
    }
}