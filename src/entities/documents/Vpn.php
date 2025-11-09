<?php
namespace ARPI\Entities\Documents;

use ARPI\ODM\Mapping\Annotations as ODM;
use MongoDB\BSON\ObjectId;

/**
 * VPN Entity
 * 
 * Repräsentiert ein VPN-System (Virtual Private Network) im Asset-Management
 * 
 * @ODM\Document(collection="vpns")
 */
class Vpn
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
     * VPN Name / Bezeichnung
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $name;

    /**
     * VPN-Typ (remote-access, site-to-site, mobile-vpn, ssl-vpn, clientless)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $type;

    /**
     * VPN-Zweck (employee-access, admin-access, partner-access, site-connection, cloud-connection, datacenter-connection)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $purpose;

    /**
     * Standort des VPN
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $location;

    // ==================== VPN-GATEWAY & INFRASTRUKTUR ====================

    /**
     * VPN-Gateway ID (Referenz zu VM, Hardware oder Firewall-Komponente)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $gatewayid;

    /**
     * VPN-Gateway (manuell eingegeben)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $gateway;

    /**
     * Gateway-Typ (dedicated-appliance, firewall-integrated, software-gateway, cloud-gateway, virtual-appliance)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $gatewaytype;

    /**
     * VPN-Software / Lösung
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $software;

    /**
     * VPN-Software Version
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $version;

    /**
     * Öffentliche IP-Adresse
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $publicip;

    /**
     * Management-URL
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $mgmturl;

    // ==================== VPN-PROTOKOLL & VERSCHLÜSSELUNG ====================

    /**
     * VPN-Protokoll (ipsec, ipsec-ikev1, ssl-tls, openvpn-tcp, openvpn-udp, wireguard, l2tp-ipsec, pptp, sstp)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $protocol;

    /**
     * VPN-Port(s)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $ports;

    /**
     * Verschlüsselungs-Algorithmus (aes-256-gcm, aes-256-cbc, aes-128-gcm, aes-128-cbc, chacha20-poly1305, 3des)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $encryptionalgo;

    /**
     * Hash-Algorithmus (sha-512, sha-384, sha-256, sha-1, md5)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $hashalgo;

    /**
     * Diffie-Hellman Group (group-21, group-20, group-19, group-14, group-5, group-2)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $dhgroup;

    /**
     * Perfect Forward Secrecy (enabled, disabled)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $pfs;

    // ==================== AUTHENTIFIZIERUNG & ZUGRIFFSKONTROLLE ====================

    /**
     * Authentifizierungs-Methode (certificate, username-password, cert-and-password, mfa, psk, smartcard)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $authmethod;

    /**
     * MFA-Provider
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $mfaprovider;

    /**
     * Authentifizierungs-Backend (ad, ldap, radius, saml, local, azure-ad)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $authbackend;

    /**
     * RADIUS-Server
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $radiusserver;

    /**
     * Zertifizierungsstelle (CA)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $ca;

    /**
     * Zertifikat-Gültigkeit
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $certvalidity;

    /**
     * Definierte Benutzergruppen
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $usergroups;

    // ==================== IP-ADRESSIERUNG & ROUTING ====================

    /**
     * VPN-IP-Pool (CIDR)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $ippool;

    /**
     * IP-Pool Größe
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $ippoolsize;

    /**
     * DNS-Server (Primary)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $dns1;

    /**
     * DNS-Server (Secondary)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $dns2;

    /**
     * Routing-Modus (full-tunnel, split-tunnel, inverse-split)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $routingmode;

    /**
     * Erlaubte Netzwerke / Routen
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $allowednetworks;

    /**
     * DNS-Suffix / Suchdomänen
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $dnssuffix;

    // ==================== KAPAZITÄT & PERFORMANCE ====================

    /**
     * Maximale gleichzeitige Verbindungen
     * 
     * @ODM\Field(type="int")
     * @var int
     */
    public int $maxconnections;

    /**
     * Lizenzierte Verbindungen
     * 
     * @ODM\Field(type="int")
     * @var int
     */
    public int $licensedconnections;

    /**
     * Durchschnittliche aktive Nutzer
     * 
     * @ODM\Field(type="int")
     * @var int
     */
    public int $avgactiveusers;

    /**
     * Peak-Nutzung (Spitzenlast)
     * 
     * @ODM\Field(type="int")
     * @var int
     */
    public int $peakusers;

    /**
     * Bandbreite pro Verbindung
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $bandwidthperconnection;

    /**
     * Gesamte VPN-Bandbreite
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $totalbandwidth;

    // ==================== SICHERHEITS-FEATURES ====================

    /**
     * Session Timeout (Idle)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $sessiontimeout;

    /**
     * Maximale Session-Dauer
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $maxsessionduration;

    /**
     * Automatische Trennung (enabled, disabled)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $autodisconnect;

    /**
     * Reconnect erlaubt (automatic, manual)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $reconnect;

    /**
     * Endpoint Compliance Check (enabled, disabled)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $compliancecheck;

    /**
     * Antivirus-Prüfung erforderlich (required, optional, disabled)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $antiviruscheck;

    /**
     * Firewall-Anforderung (required, optional, disabled)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $firewallrequirement;

    /**
     * OS-Patch-Level Prüfung (strict, moderate, disabled)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $ospatchcheck;

    /**
     * Kill Switch / Drop-on-Disconnect (enabled, disabled)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $killswitch;

    /**
     * Always-On VPN (enabled, optional, disabled)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $alwayson;

    /**
     * Traffic-Inspection / DPI (enabled, basic, disabled)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $trafficinspection;

    /**
     * IPS/IDS Integration (ips, ids, none)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $ipsids;

    // ==================== LOGGING & MONITORING ====================

    /**
     * Logging-Level (detailed, normal, minimal)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $logginglevel;

    /**
     * Log-Retention
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $logretention;

    /**
     * SIEM-Integration
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $siemintegration;

    /**
     * Syslog-Server
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $syslogserver;

    /**
     * Monitoring-Tool
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $monitoringtool;

    /**
     * Geloggte Events (Array: authentication, connections, traffic, errors)
     * 
     * @ODM\Field(type="array")
     * @var array
     */
    public array $loggedevents = [];

    // ==================== REDUNDANZ & HOCHVERFÜGBARKEIT ====================

    /**
     * Hochverfügbarkeit (active-active, active-passive, cluster, none)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $ha;

    /**
     * Sekundäres VPN-Gateway ID (Referenz zu VM, Hardware oder Firewall)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $secondarygatewayid;

    /**
     * Sekundäres Gateway (manuell eingegeben)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $secondarygateway;

    /**
     * Failover-Zeit
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $failovertime;

    /**
     * Load Balancing (enabled, disabled)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $loadbalancing;

    // ==================== COMPLIANCE & RICHTLINIEN ====================

    /**
     * Compliance-Anforderungen (Array: dsgvo, hipaa, pci-dss, iso27001, kritis)
     * 
     * @ODM\Field(type="array")
     * @var array
     */
    public array $compliance = [];

    /**
     * Letzte Sicherheitsprüfung
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $lastsecurityaudit;

    /**
     * Nächste geplante Prüfung
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $nextsecurityaudit;

    // ==================== VERANTWORTLICHKEITEN ====================

    /**
     * VPN-Administrator
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $admin;

    /**
     * Support-Kontakt
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $support;

    /**
     * Notfall-Kontakt (24/7)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $emergencycontact;

    // ==================== ZUSÄTZLICHE INFORMATIONEN ====================

    /**
     * Notizen / VPN-Besonderheiten
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $notes;

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
        $this->uuid = \uniqid('vpn_', true);
        $this->createdat = new \DateTime();
        $this->updatedat = new \DateTime();
        $this->loggedevents = [];
        $this->compliance = [];
    }
}
