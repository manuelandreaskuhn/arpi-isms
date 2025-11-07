<?php
namespace ARPI\Entities\Documents;

use ARPI\ODM\Mapping\Annotations as ODM;
use MongoDB\BSON\ObjectId;

/**
 * Hypervisor-Dokument
 * 
 * Dieses Dokument speichert detaillierte Informationen über Hypervisoren
 * innerhalb der IT-Infrastruktur, einschließlich Cluster-Konfiguration,
 * Ressourcen, Netzwerk, Management und Lizenzierung.
 * 
 * @ODM\Document(collection="hypervisors")
 * @package Entities
 */
class Hypervisor
{
    /**
     * MongoDB Document ID
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

    // ==================== Basis-Informationen ====================

    /**
     * Name des Hypervisors
     * (z.B. "ESXi-Cluster-01", "Hyper-V-Host-DC1")
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $hypervisorname;

    /**
     * Typ/Hersteller des Hypervisors
     * (z.B. "vmware-esxi", "hyperv", "kvm", "proxmox")
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $hypervisortype;

    /**
     * Version der Hypervisor-Software
     * (z.B. "ESXi 8.0 U2", "Hyper-V 2022")
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $hypervisorversion;

    /**
     * Management IP / URL
     * (z.B. "vcenter.example.com", "192.168.10.50")
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $mgmturl;

    // ==================== Cluster / Host-Konfiguration ====================

    /**
     * Cluster-Konfiguration aktiviert
     * 
     * @ODM\Field(type="bool")
     * @var bool
     */
    public bool $iscluster;

    /**
     * Cluster Name
     * (z.B. "Production-Cluster", "HA-Cluster-01")
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $clustername;

    /**
     * Anzahl Hosts im Cluster
     * 
     * @ODM\Field(type="int")
     * @var int
     */
    public int $clusterhosts;

    /**
     * High Availability Status
     * Werte: enabled, disabled
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $ha;

    /**
     * DRS / Load Balancing Status
     * Werte: fully-automated, partially-automated, manual, disabled
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $drs;

    /**
     * Host-Liste / Hostnames
     * (Liste der physischen Hosts, einer pro Zeile)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $hostlist;

    /**
     * Standort / Rechenzentrum
     * (z.B. "RZ1", "Datacenter Berlin")
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $location;

    /**
     * Rack-Informationen
     * (z.B. "Rack A12-A14")
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $rackinfo;

    // ==================== Ressourcen & Kapazität ====================

    /**
     * Gesamt CPU Cores
     * (Gesamte physische CPU Cores aller Hosts)
     * 
     * @ODM\Field(type="int")
     * @var int
     */
    public int $totalcpu;

    /**
     * Gesamt RAM in GB
     * (Gesamter physischer RAM aller Hosts)
     * 
     * @ODM\Field(type="int")
     * @var int
     */
    public int $totalram;

    /**
     * Gesamt Storage in TB
     * (Gesamter zugewiesener Storage)
     * 
     * @ODM\Field(type="float")
     * @var float
     */
    public float $totalstorage;

    /**
     * Storage-Typ
     * Werte: local, san, iscsi, nfs, vsan, mixed
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $storagetype;

    /**
     * Anzahl VMs (aktuell)
     * 
     * @ODM\Field(type="int")
     * @var int
     */
    public int $vmcount;

    /**
     * Overcommitment Ratio (CPU)
     * (z.B. "4:1", "8:1")
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $cpuovercommit;

    // ==================== Netzwerk-Konfiguration ====================

    /**
     * Management Netzwerk
     * (z.B. "192.168.10.0/24, VLAN 10")
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $mgmtnetwork;

    /**
     * vMotion / Live Migration Netzwerk
     * (z.B. "192.168.20.0/24, VLAN 20")
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $vmotionnetwork;

    /**
     * Storage Netzwerk
     * (z.B. "192.168.30.0/24, VLAN 30")
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $storagenetwork;

    /**
     * VM Netzwerke / Port Groups
     * (z.B. "Prod-VLAN100, DMZ-VLAN200")
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $vmnetworks;

    /**
     * Distributed Switch / Virtual Switch
     * (z.B. "vDS-Production", "vSwitch0")
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $vswitch;

    // ==================== Management & Monitoring ====================

    /**
     * Management-Tool
     * Werte: vcenter, scvmm, proxmox-web, xen-orchestra, virsh, other
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $mgmttool;

    /**
     * Management Tool Version
     * (z.B. "vCenter 8.0", "SCVMM 2022")
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $mgmtversion;

    /**
     * Monitoring / Alerting
     * (z.B. "vROps", "PRTG", "Zabbix")
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $monitoring;

    /**
     * Backup-Lösung
     * (z.B. "Veeam", "Altaro", "Commvault")
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $backupsolution;

    // ==================== Lizenzierung & Support ====================

    /**
     * Lizenzmodell
     * Werte: perpetual, subscription, per-cpu, per-core, per-vm, free
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $licensemodel;

    /**
     * Support-Level
     * Werte: production, business, basic, community, none
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $supportlevel;

    /**
     * Support-Vertragsende
     * (z.B. "31.12.2025", "unbegrenzt")
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $supportend;

    // ==================== Zusätzliche Informationen ====================

    /**
     * Notizen und Besonderheiten
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $hypervisornotes;

    // ==================== Zeitstempel ====================

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
    

    /**
     * Initialisiert Default Werte (z.B. leere Arrays)
     * @return void 
     */
    public function __construct()
    {
        $this->uuid = \uniqid('hypervisor_', true);
        $this->createdat = new \DateTime();
        $this->iscluster = false;
    }
}
