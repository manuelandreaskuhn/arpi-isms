<?php
namespace ARPI\Entities\Documents;

use ARPI\ODM\Mapping\Annotations as ODM;
use MongoDB\BSON\ObjectId;


/**
 * Ein IT-System innerhalb der Infrastruktur.
 * 
 * Dieses Dokument modelliert ein vollständiges IT-System mit allen zugehörigen
 * Komponenten wie VMs, Hardware, Datenbanken, Backup-Systemen, etc.
 * 
 * @ODM\Document(collection="systems")
 * @package Entities
 */
class System
{
    /**
     * MongoDB Document ID
     * 
     * @ODM\Id
     * @var ObjectId
     */
    public ObjectId $id;

    // ==================== BASIS-INFORMATIONEN ====================
    
    /**
     * Name des Systems
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $systemname;

    /**
     * Erstellungsdatum
     * 
     * @ODM\Field(type="date")
     * @var \DateTime
     */
    public \DateTime $createdat;

    /**
     * Letztes Änderungsdatum
     * 
     * @ODM\Field(type="date")
     * @var \DateTime
     */
    public \DateTime $updatedat;

    // ==================== SOFTWARE-INFORMATIONEN ====================
    
    /**
     * Verwendete Software
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $software = null;

    /**
     * Software-Hersteller
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $vendor = null;

    /**
     * Software-Version
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $version = null;

    /**
     * Lizenztyp
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $licensetype = null;

    // ==================== KATEGORISIERUNG ====================
    
    /**
     * Zuständiger Fachbereich
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $department = null;

    /**
     * Kritikalität des Systems
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $criticality = null;

    /**
     * Umgebung (Produktion, Test, etc.)
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $environment = null;

    /**
     * Hosting-Typ (On-Premise, Cloud, etc.)
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $hosting = null;

    /**
     * Cloud-Provider
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $cloudprovider = null;

    // ==================== IT-SICHERHEIT & COMPLIANCE ====================
    
    /**
     * Datenschutz-Klassifizierung
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $dataclassification = null;

    /**
     * Verschlüsselung
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $encryption = null;

    /**
     * Authentifizierungs-Methode
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $authentication = null;

    /**
     * Compliance-Standards
     * 
     * @ODM\Field(type="collection")
     * @var array
     */
    public array $compliance = [];

    /**
     * Letztes Audit
     * 
     * @ODM\Field(type="string", nullable=true)
     * @var null|string
     */
    public ?string $lastaudit = null;

    // ==================== IT-KOMPONENTEN (Flags) ====================
    
    /**
     * Vorhandene Komponenten-Typen
     * 
     * @ODM\Field(type="collection")
     * @var array
     */
    public array $componenttypes = [];

    // ==================== VIRTUELLE MASCHINEN (Embedded) ====================
    
    /**
     * Virtuelle Maschinen
     * 
     * @ODM\EmbedMany(targetDocument=SystemVirtualMachine::class)
     * @var array
     */
    public array $virtualmachines = [];

    // ==================== HARDWARE SERVER (Embedded) ====================
    
    /**
     * Hardware-Server
     * 
     * @ODM\EmbedMany(targetDocument=SystemHardwareServer::class)
     * @var array
     */
    public array $hardwareservers = [];

    // ==================== DATENBANKEN (Embedded) ====================
    
    /**
     * Datenbanken
     * 
     * @ODM\EmbedMany(targetDocument=SystemDatabase::class)
     * @var array
     */
    public array $databases = [];

    // ==================== BACKUP-SYSTEME (Embedded) ====================
    
    /**
     * Backup-Systeme
     * 
     * @ODM\EmbedMany(targetDocument=SystemBackup::class)
     * @var array
     */
    public array $backupsystems = [];

    // ==================== LOAD BALANCER (Embedded) ====================
    
    /**
     * Load Balancer
     * 
     * @ODM\EmbedMany(targetDocument=SystemLoadBalancer::class)
     * @var array
     */
    public array $loadbalancers = [];

    // ==================== FIREWALL-REGELN (Embedded) ====================
    
    /**
     * Firewall-Regeln
     * 
     * @ODM\EmbedMany(targetDocument=SystemFirewallRule::class)
     * @var array
     */
    public array $firewallrules = [];

    // ==================== CLIENT-ZUGRIFFE (Embedded) ====================
    
    /**
     * Client-Zugriffe
     * 
     * @ODM\EmbedMany(targetDocument=SystemClientAccess::class)
     * @var array
     */
    public array $clientaccesses = [];

    // ==================== MEDIZINGERÄTE (Embedded) ====================
    
    /**
     * Medizingeräte
     * 
     * @ODM\EmbedMany(targetDocument=SystemMedicalDevice::class)
     * @var array
     */
    public array $medicaldevices = [];

    // ==================== TI-INFRASTRUKTUR (Embedded) ====================
    
    /**
     * TI-Infrastruktur
     * 
     * @ODM\EmbedOne(targetDocument=SystemTIInfrastructure::class)
     * @var null|SystemTIInfrastructure
     */
    public ?SystemTIInfrastructure $tiinfrastructure = null;

    // ==================== PROXY (Embedded) ====================
    
    /**
     * Proxy-Konfiguration
     * 
     * @ODM\EmbedOne(targetDocument=SystemProxyConfiguration::class)
     * @var null|SystemProxyConfiguration
     */
    public ?SystemProxyConfiguration $proxyconfiguration = null;

    // ==================== SIEM (Embedded) ====================
    
    /**
     * SIEM-Integration
     * 
     * @ODM\EmbedOne(targetDocument=SystemSIEMIntegration::class)
     * @var null|SystemSIEMIntegration
     */
    public ?SystemSIEMIntegration $siemintegration = null;

    // ==================== VPN (Embedded) ====================
    
    /**
     * VPN-Zugriff
     * 
     * @ODM\EmbedOne(targetDocument=SystemVPNAccess::class)
     * @var null|SystemVPNAccess
     */
    public ?SystemVPNAccess $vpnaccess = null;

    // ==================== MEDIZINISCHE SCHNITTSTELLEN (Embedded) ====================
    
    /**
     * Medizinische Schnittstellen
     * 
     * @ODM\EmbedMany(targetDocument=SystemMedicalInterface::class)
     * @var array
     */
    public array $medicalinterfaces = [];

    // ==================== CONTAINER (Embedded) ====================
    
    /**
     * Container
     * 
     * @ODM\EmbedMany(targetDocument=SystemContainer::class)
     * @var array
     */
    public array $containers = [];

    // ==================== CONSTRUCTOR ====================
    
    /**
     * Initialisiert Default-Werte
     * @return void
     */
    public function __construct()
    {
        $this->createdat = new \DateTime();
        $this->updatedat = new \DateTime();
    }

    // ==================== LIFECYCLE METHODS ====================
    
    /**
     * Wird vor dem Update ausgeführt
     * @ODM\PreUpdate
     * @return void
     */
    public function preUpdate(): void
    {
        $this->updatedat = new \DateTime();
    }
}
