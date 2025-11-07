<?php
namespace ARPI\Entities\Documents;

use ARPI\ODM\Mapping\Annotations as ODM;
use MongoDB\BSON\ObjectId;

/**
 * Eine Instanz Unseres Kunden.
 * 
 * Beinhaltet Informationen über unseren Kunden, welche in der Software verwendet werden.
 * Die eindeutige Kundennummer wird dabei im Admin Bereich generiert.
 * 
 * @ODM\Document(collection="customers")
 * @package Entities
 */
class Customer { 

    /**
     * MongoDB ObjectId
     * 
     * @ODM\Id
     * @var ObjectId
     */
    public ObjectId $id;

    /**
     * UUID zur eindeutigen Identifizierung des Datensatzes.
     * 
     * @ODM\Field(type="string")
     * @ODM\Index(unique=true)
     * @var string
     */
    public string $uuid;

    /**
     * Vollständiger Name des Kunden
     * z.B. Uniklinikum Köln
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $name;

    /**
     * Kurzname des Kunden
     * z.B. UKK
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $shortname;

    /**
     * API Token für die Globalen APIs
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $apitoken;

    /**
     * Welches ist die Hauptsprache, also werden die ganzen Texte geschrieben, etc.
     * 
     * @ODM\Field(type="string", enum={"de","en"})
     * @var string
     */
    public string $mainlanguage;

    /**
     * FALSE: Ist ein echtes Krankenhaus
     * TRUE: z.b. die IT nach einer Zusmamenführung
     * 
     * @ODM\Field(type="bool")
     * @var bool
     */
    public bool $virtual;

    /**
     * Verbindung zur Gruppe
     * 
     * @ODM\ReferenceOne(targetDocument=CustomerGroup::class)
     * @var CustomerGroup
     */
    public CustomerGroup $customergroup;


    /**
     * Initialisiert Default Werte (z.B. leere Arrays)
     * @return void 
     */
    public function __construct() {
        $this->uuid = \uniqid('customer_', true);
    }
}