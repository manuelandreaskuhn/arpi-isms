<?php
namespace ARPI\Entities\Documents;

use ARPI\ODM\Mapping\Annotations as ODM;
use MongoDB\BSON\ObjectId;

/**
 * Eine Kundengruppe.
 * 
 * @ODM\Document(collection="customergroups")
 * @package Entities
 */
class CustomerGroup { 

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
     * Eindeutige Kundennummer, welche verwendet wird um auf den Kunden zu verlinken.
     * Für Rechnungen, etc.
     * 
     * @ODM\Field(type="int")
     * @var int
     */
    public int $customerid;

    /**
     * Welche Währung hat der Kunde? - ISO 4217
     * Bsp.: EUR
     * z.B. für Projekt Budget
     * 
     * @ODM\Field(type="string", length=3, enum={"EUR","USD","GBP","CHF"})
     * @var string
     */
    public string $currency;

    /**
     * Vollständiger Name des Kunden
     * z.B. Franziskaner gGmbH
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $name;

    /**
     * Was gilt als Login? E-Mail oder Benutzername?
     * 
     * @ODM\Field(type="string", enum={"EMAIL", "USERNAME"})
     * @var string
     */
    public string $logintype;

    /**
     * Liste von Domains / Subdomains zu diesem Kunden
     * Gesplittet durch #
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $domains;

    /**
     * Name der Datenbank
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $databasename;

    /**
     * Welches ist die Hauptsprache, also werden die ganzen Texte geschrieben, etc.
     * 
     * @ODM\Field(type="string", enum={"de","en"})
     * @var string
     */
    public string $mainlanguage;

    /**
     * Instanzen für unseren Kunden
     * 
     * @ODM\ReferenceMany(targetDocument=Customer::class)
     * @var Customer[]
     */
    public array $customers;


    /**
     * Initialisiert Default Werte (z.B. leere Arrays)
     * @return void 
     */
    public function __construct() {
        $this->uuid = \uniqid('customergroup_', true);
        $this->customers = array();
    }
}