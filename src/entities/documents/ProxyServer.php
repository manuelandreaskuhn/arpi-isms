<?php
namespace ARPI\Entities\Documents;

use ARPI\ODM\Mapping\Annotations as ODM;
use MongoDB\BSON\ObjectId;

/**
 * Proxy Entity
 * 
 * Repräsentiert einen Proxy-Server im Asset-Management
 * 
 * @ODM\Document(collection="proxies")
 */
class ProxyServer
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
     * Proxy-Server Name / Bezeichnung
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $name;

    /**
     * Proxy-Server ID (Referenz zu VM oder Hardware-Komponente)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $serverid;

    /**
     * Proxy-Server (manuell eingegeben)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $hostname;

    /**
     * Proxy-Port
     * 
     * @ODM\Field(type="int")
     * @var int
     */
    public int $proxyport;

    /**
     * Standort des Proxy-Servers
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $location;

    // ==================== PROXY-TYP & PROTOKOLL ====================

    /**
     * Proxy-Typ (http, https, socks4, socks5, transparent, reverse)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $type;

    /**
     * Proxy-Protokoll (http-https, all, ftp, custom)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $protocol;

    /**
     * Proxy-Software (squid, nginx, haproxy, apache, bluecoat, fortigate, cisco-wsa, zscaler, other)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $software;

    // ==================== AUTHENTIFIZIERUNG ====================

    /**
     * Authentifizierung erforderlich (none, basic, ntlm, kerberos, digest, ldap, radius)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $proxyauth;

    /**
     * Authentifizierungs-Backend (z.B. Active Directory, LDAP-Server)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $proxyauthbackend;

    /**
     * Dienstkonto / Service Account für Proxy
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $proxyserviceaccount;

    // ==================== PROXY-AUSNAHMEN ====================

    /**
     * Standard Ausnahmen / Bypass-Liste (No Proxy)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $proxyexceptions;

    // ==================== ERWEITERTE KONFIGURATION ====================

    /**
     * PAC-Datei URL (Proxy Auto-Config)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $proxypac;

    /**
     * WPAD (Web Proxy Auto-Discovery) aktiviert (enabled, disabled)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $proxywpad;

    /**
     * SSL-Interception / HTTPS-Inspection (enabled, partial, disabled)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $proxysslinterception;

    /**
     * SSL-Zertifikat für Interception
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $proxysslcert;

    /**
     * Proxy-Cache aktiviert (enabled, disabled)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $proxycache;

    /**
     * Cache-Größe
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $proxycachesize;

    // ==================== FAILOVER & REDUNDANZ ====================

    /**
     * Sekundärer Proxy-Server ID (Referenz zu VM oder Hardware-Komponente)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $proxysecondaryid;

    /**
     * Sekundärer Proxy-Server (manuell eingegeben)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $proxysecondary;

    /**
     * Failover-Mechanismus (automatic, manual, load-balanced)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $proxyfailovermechanism;

    // ==================== FILTERING & SICHERHEIT ====================

    /**
     * URL-Filtering aktiviert (enabled, disabled)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $proxyurlfiltering;

    /**
     * Content-Filtering aktiviert (enabled, disabled)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $proxycontentfiltering;

    /**
     * Malware-Scanning aktiviert (enabled, disabled)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $proxymalwarescanning;

    /**
     * DLP (Data Loss Prevention) aktiviert (enabled, disabled)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $proxydlp;

    // ==================== LOGGING & MONITORING ====================

    /**
     * Access Logging (full, minimal, disabled)
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $proxyaccesslog;

    /**
     * Log-Aufbewahrung
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $proxylogretention;

    /**
     * Monitoring-Integration
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $proxymonitoring;

    // ==================== VERANTWORTLICHKEITEN ====================

    /**
     * Proxy-Administrator
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $proxyadmin;

    /**
     * Support-Kontakt
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $proxysupport;

    // ==================== ZUSÄTZLICHE INFORMATIONEN ====================

    /**
     * Notizen / Proxy-Besonderheiten
     * 
     * @ODM\Field(type="string")
     * @var string
     */
    public string $proxynotes;

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
        $this->uuid = \uniqid('proxy_', true);
        $this->createdat = new \DateTime();
        $this->updatedat = new \DateTime();
    }
}
