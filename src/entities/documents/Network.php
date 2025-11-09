<?php
namespace ARPI\Entities\Documents;

use ARPI\ODM\Mapping\Annotations as ODM;
use MongoDB\BSON\ObjectId;

/**
 * Network Entity
 * 
 * Repräsentiert ein Netzwerk-Segment im Asset-Management
 * 
 * @ODM\Document(collection="networks")
 * @package Entities
 */
class Network
{
    /**
     * Eindeutige ID (MongoDB ObjectID)
     * 
     * @ODM\Id
     * @var ObjectId
     */
    public ObjectId $id;

    /**
     * UUID für externe Referenzierung
     * 
     * @ODM\Field(type="string")
     * @ODM\Index(unique=true)
     * @var string
     */
    public string $uuid;

    // ==================== BASIS-INFORMATIONEN ====================

    /**
     * Netzwerk-Name / Bezeichnung
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $name;

    /**
     * Netzwerk-Typ (lan, vlan, wan, dmz, management, storage, wifi, vpn)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $type;

    /**
     * VLAN-ID (falls zutreffend)
     * 
     * @ODM\Field(type="int")
     * @var int|null
     */
    public ?int $vlanid;

    /**
     * Standort des Netzwerks
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $location;

    // ==================== IP-ADRESSIERUNG ====================

    /**
     * Netzwerk-Adresse in CIDR-Notation (z.B. 192.168.100.0/24)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $cidr;

    /**
     * Subnetz-Maske (z.B. 255.255.255.0)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $subnetmask;

    /**
     * Gateway / Router IP-Adresse
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $gateway;

    /**
     * IP-Adressbereich (nutzbar)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $iprange;

    /**
     * Primärer DNS-Server
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $dnsprimary;

    /**
     * Sekundärer DNS-Server
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $dnssecondary;

    // ==================== DHCP-KONFIGURATION ====================

    /**
     * DHCP aktiviert (yes, no)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $dhcpenabled;

    /**
     * DHCP-Server Adresse oder Hostname
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $dhcpserver;

    /**
     * DHCP-Pool Start-Adresse
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $dhcpstart;

    /**
     * DHCP-Pool End-Adresse
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $dhcpend;

    /**
     * DHCP-Lease-Zeit
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $dhcplease;

    /**
     * DHCP-Reservierungen (Anzahl oder Details)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $dhcpreservations;

    // ==================== NETZWERK-SEGMENTIERUNG ====================

    /**
     * Sicherheitszone (internal, dmz, external, management, guest, restricted)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $securityzone;

    /**
     * Trust-Level (high, medium, low, zero)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $trustlevel;

    /**
     * Netzwerk-Isolation (full, partial, none)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $isolation;

    /**
     * Inter-VLAN Routing (enabled, restricted, disabled)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $intervlanrouting;

    /**
     * Verbundene Netzwerke / Routing-Informationen
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $connectednetworks;

    // ==================== NETZWERK-HARDWARE ====================

    /**
     * Core Switch ID (Referenz zu Hardware-Komponente)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $coreswitchid;

    /**
     * Core Switch (manuell eingegeben)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $coreswitch;

    /**
     * Distribution Switches
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $distributionswitch;

    /**
     * Access Switches
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $accessswitch;

    /**
     * Switch Management-IP
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $switchmgmtip;

    /**
     * Router / L3-Switch ID (Referenz zu Hardware-Komponente)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $routerid;

    /**
     * Router (manuell eingegeben)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $router;

    /**
     * Firewall ID (Referenz zu Firewall-Komponente)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $firewallid;

    /**
     * Firewall (manuell eingegeben)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $firewall;

    // ==================== SICHERHEITS-FEATURES ====================

    /**
     * 802.1X Port-based NAC (enabled, partial, disabled)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $dot1x;

    /**
     * RADIUS-Server für Authentifizierung
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $radiusserver;

    /**
     * MAC-Adress-Filtering (whitelist, blacklist, disabled)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $macfiltering;

    /**
     * Port Security (enabled, sticky, disabled)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $portsecurity;

    /**
     * DHCP Snooping (enabled, disabled)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $dhcpsnooping;

    /**
     * Dynamic ARP Inspection (enabled, disabled)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $arpinspection;

    /**
     * IP Source Guard (enabled, disabled)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $ipsourceguard;

    /**
     * Storm Control (enabled, disabled)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $stormcontrol;

    /**
     * IDS/IPS Integration (ips, ids, none)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $idsips;

    /**
     * Flow Monitoring (netflow, sflow, ipfix, none)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $flowmonitoring;

    /**
     * SPAN/Mirror Port (configured, not-configured)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $spanport;

    /**
     * Network Monitoring Tool
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $monitoringtool;

    // ==================== VPN & REMOTE ACCESS ====================

    /**
     * VPN-Zugang verfügbar (yes, no)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $vpnenabled;

    /**
     * VPN-Typ (site-to-site, remote-access, both)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $vpntype;

    /**
     * VPN-Protokoll (ipsec, ssl-vpn, openvpn, wireguard, l2tp)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $vpnprotocol;

    /**
     * VPN-Gateway Adresse
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $vpngateway;

    /**
     * VPN-Pool IP-Range
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $vpnpool;

    /**
     * Maximale VPN-Verbindungen
     * 
     * @ODM\Field(type="int")
     * @var int|null
     */
    public ?int $vpnmaxconnections;

    // ==================== REDUNDANZ & HOCHVERFÜGBARKEIT ====================

    /**
     * Redundanz vorhanden (full, partial, none)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $redundancy;

    /**
     * Spanning Tree Protocol (rstp, mstp, stp, none)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $spanningtree;

    /**
     * Link Aggregation / LACP (active, static, none)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $lacp;

    /**
     * Gateway Redundancy Protokoll (vrrp, hsrp, glbp, none)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $gatewayredundancy;

    /**
     * Uplink-Redundanz Details
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $uplinkredundancy;

    // ==================== PERFORMANCE & QOS ====================

    /**
     * Bandbreite
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $bandwidth;

    /**
     * QoS aktiviert (yes, no)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $qosenabled;

    /**
     * QoS-Mechanismus (diffserv, cos, both, none)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $qosmechanism;

    /**
     * Traffic Shaping/Policing (shaping, policing, both, none)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $trafficshaping;

    /**
     * Priorisierte Dienste / Traffic-Klassen
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $prioritizedservices;

    // ==================== DOKUMENTATION & COMPLIANCE ====================

    /**
     * Netzwerk-Diagramm vorhanden (yes, outdated, no)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $networkdiagram;

    /**
     * IP-Adress-Management Tool (IPAM)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $ipam;

    /**
     * Letzte Netzwerk-Audit
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $lastaudit;

    /**
     * Compliance-Anforderungen (Array: pci-dss, hipaa, dsgvo, kritis)
     * 
     * @ODM\Field(type="array")
     * @var array
     */
    public array $compliance = [];

    // ==================== VERANTWORTLICHKEITEN ====================

    /**
     * Netzwerk-Administrator
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $networkadmin;

    /**
     * Support-Kontakt
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $networksupport;

    // ==================== ZUSÄTZLICHE INFORMATIONEN ====================

    /**
     * Notizen / Netzwerk-Besonderheiten
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $networknotes;

    // ==================== METADATEN ====================

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
     * Constructor
     */
    public function __construct()
    {
        $this->uuid = \uniqid('network_', true);
        $this->createdat = new \DateTime();
        $this->updatedat = new \DateTime();
        $this->compliance = [];
    }

}
