<?php
namespace ARPI\Schemas;

/**
 * JSON Schema für VPN-System
 */
class VpnSchema
{
    public static function getSchema(): array
    {
        return [
            'type' => 'object',
            'required' => ['name', 'type', 'protocol', 'authmethod', 'ippool'],
            'properties' => [
                // Basis-Informationen
                'name' => [
                    'type' => 'string',
                    'minLength' => 1,
                    'maxLength' => 255,
                    'description' => 'VPN Name / Bezeichnung'
                ],
                'type' => [
                    'type' => 'string',
                    'enum' => [
                        'remote-access',
                        'site-to-site',
                        'mobile-vpn',
                        'ssl-vpn',
                        'clientless'
                    ],
                    'description' => 'VPN-Typ'
                ],
                'purpose' => [
                    'type' => 'string',
                    'enum' => [
                        'employee-access',
                        'admin-access',
                        'partner-access',
                        'site-connection',
                        'cloud-connection',
                        'datacenter-connection'
                    ],
                    'description' => 'VPN-Zweck'
                ],
                'location' => [
                    'type' => 'string',
                    'maxLength' => 255,
                    'description' => 'Standort des VPN'
                ],
                
                // VPN-Gateway & Infrastruktur
                'gatewayid' => [
                    'type' => 'string',
                    'description' => 'VPN-Gateway ID (Referenz zu VM/Hardware/Firewall)'
                ],
                'gateway' => [
                    'type' => 'string',
                    'maxLength' => 255,
                    'description' => 'VPN-Gateway (manuell)'
                ],
                'gatewaytype' => [
                    'type' => 'string',
                    'enum' => [
                        'dedicated-appliance',
                        'firewall-integrated',
                        'software-gateway',
                        'cloud-gateway',
                        'virtual-appliance'
                    ]
                ],
                'software' => [
                    'type' => 'string',
                    'maxLength' => 255,
                    'description' => 'VPN-Software / Lösung'
                ],
                'version' => [
                    'type' => 'string',
                    'maxLength' => 100,
                    'description' => 'Software-Version'
                ],
                'publicip' => [
                    'type' => 'string',
                    'pattern' => '^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$',
                    'description' => 'Öffentliche IP-Adresse'
                ],
                'mgmturl' => [
                    'type' => 'string',
                    'format' => 'uri',
                    'description' => 'Management-URL'
                ],
                
                // VPN-Protokoll & Verschlüsselung
                'protocol' => [
                    'type' => 'string',
                    'enum' => [
                        'ipsec',
                        'ipsec-ikev1',
                        'ssl-tls',
                        'openvpn-tcp',
                        'openvpn-udp',
                        'wireguard',
                        'l2tp-ipsec',
                        'pptp',
                        'sstp'
                    ],
                    'description' => 'VPN-Protokoll'
                ],
                'ports' => [
                    'type' => 'string',
                    'maxLength' => 255,
                    'description' => 'VPN-Port(s)'
                ],
                'encryptionalgo' => [
                    'type' => 'string',
                    'enum' => [
                        'aes-256-gcm',
                        'aes-256-cbc',
                        'aes-128-gcm',
                        'aes-128-cbc',
                        'chacha20-poly1305',
                        '3des'
                    ]
                ],
                'hashalgo' => [
                    'type' => 'string',
                    'enum' => ['sha-512', 'sha-384', 'sha-256', 'sha-1', 'md5']
                ],
                'dhgroup' => [
                    'type' => 'string',
                    'enum' => [
                        'group-21',
                        'group-20',
                        'group-19',
                        'group-14',
                        'group-5',
                        'group-2'
                    ]
                ],
                'pfs' => [
                    'type' => 'string',
                    'enum' => ['enabled', 'disabled']
                ],
                
                // Authentifizierung
                'authmethod' => [
                    'type' => 'string',
                    'enum' => [
                        'certificate',
                        'username-password',
                        'cert-and-password',
                        'mfa',
                        'psk',
                        'smartcard'
                    ],
                    'description' => 'Authentifizierungs-Methode'
                ],
                'mfaprovider' => [
                    'type' => 'string',
                    'maxLength' => 255
                ],
                'authbackend' => [
                    'type' => 'string',
                    'enum' => ['ad', 'ldap', 'radius', 'saml', 'local', 'azure-ad']
                ],
                'radiusserver' => [
                    'type' => 'string',
                    'maxLength' => 255
                ],
                'ca' => [
                    'type' => 'string',
                    'maxLength' => 255
                ],
                'certvalidity' => [
                    'type' => 'string',
                    'maxLength' => 100
                ],
                'usergroups' => [
                    'type' => 'string',
                    'description' => 'Benutzergruppen'
                ],
                
                // IP-Adressierung & Routing
                'ippool' => [
                    'type' => 'string',
                    'pattern' => '^(?:[0-9]{1,3}\.){3}[0-9]{1,3}/[0-9]{1,2}$',
                    'description' => 'VPN-IP-Pool (CIDR)'
                ],
                'ippoolsize' => [
                    'type' => 'string',
                    'maxLength' => 100
                ],
                'dns1' => [
                    'type' => 'string',
                    'maxLength' => 255
                ],
                'dns2' => [
                    'type' => 'string',
                    'maxLength' => 255
                ],
                'routingmode' => [
                    'type' => 'string',
                    'enum' => ['full-tunnel', 'split-tunnel', 'inverse-split']
                ],
                'allowednetworks' => [
                    'type' => 'string',
                    'description' => 'Erlaubte Netzwerke'
                ],
                'dnssuffix' => [
                    'type' => 'string',
                    'maxLength' => 255
                ],
                
                // Kapazität
                'maxconnections' => [
                    'type' => 'integer',
                    'minimum' => 0
                ],
                'licensedconnections' => [
                    'type' => 'integer',
                    'minimum' => 0
                ],
                'avgactiveusers' => [
                    'type' => 'integer',
                    'minimum' => 0
                ],
                'peakusers' => [
                    'type' => 'integer',
                    'minimum' => 0
                ],
                'bandwidthperconnection' => [
                    'type' => 'string',
                    'maxLength' => 100
                ],
                'totalbandwidth' => [
                    'type' => 'string',
                    'maxLength' => 100
                ],
                
                // Sicherheit
                'sessiontimeout' => [
                    'type' => 'string',
                    'maxLength' => 100
                ],
                'maxsessionduration' => [
                    'type' => 'string',
                    'maxLength' => 100
                ],
                'autodisconnect' => [
                    'type' => 'string',
                    'enum' => ['enabled', 'disabled']
                ],
                'reconnect' => [
                    'type' => 'string',
                    'enum' => ['automatic', 'manual']
                ],
                'compliancecheck' => [
                    'type' => 'string',
                    'enum' => ['enabled', 'disabled']
                ],
                'antiviruscheck' => [
                    'type' => 'string',
                    'enum' => ['required', 'optional', 'disabled']
                ],
                'firewallrequirement' => [
                    'type' => 'string',
                    'enum' => ['required', 'optional', 'disabled']
                ],
                'ospatchcheck' => [
                    'type' => 'string',
                    'enum' => ['strict', 'moderate', 'disabled']
                ],
                'killswitch' => [
                    'type' => 'string',
                    'enum' => ['enabled', 'disabled']
                ],
                'alwayson' => [
                    'type' => 'string',
                    'enum' => ['enabled', 'optional', 'disabled']
                ],
                'trafficinspection' => [
                    'type' => 'string',
                    'enum' => ['enabled', 'basic', 'disabled']
                ],
                'ipsids' => [
                    'type' => 'string',
                    'enum' => ['ips', 'ids', 'none']
                ],
                
                // Logging & Monitoring
                'logginglevel' => [
                    'type' => 'string',
                    'enum' => ['detailed', 'normal', 'minimal']
                ],
                'logretention' => [
                    'type' => 'string',
                    'maxLength' => 100
                ],
                'siemintegration' => [
                    'type' => 'string',
                    'maxLength' => 255
                ],
                'syslogserver' => [
                    'type' => 'string',
                    'maxLength' => 255
                ],
                'monitoringtool' => [
                    'type' => 'string',
                    'maxLength' => 255
                ],
                'loggedevents' => [
                    'type' => 'array',
                    'items' => [
                        'type' => 'string',
                        'enum' => ['authentication', 'connections', 'traffic', 'errors']
                    ]
                ],
                
                // Redundanz & HA
                'ha' => [
                    'type' => 'string',
                    'enum' => ['active-active', 'active-passive', 'cluster', 'none']
                ],
                'secondarygatewayid' => [
                    'type' => 'string',
                    'description' => 'Sekundäres Gateway ID'
                ],
                'secondarygateway' => [
                    'type' => 'string',
                    'maxLength' => 255
                ],
                'failovertime' => [
                    'type' => 'string',
                    'maxLength' => 100
                ],
                'loadbalancing' => [
                    'type' => 'string',
                    'enum' => ['enabled', 'disabled']
                ],
                
                // Compliance
                'compliance' => [
                    'type' => 'array',
                    'items' => [
                        'type' => 'string',
                        'enum' => ['dsgvo', 'hipaa', 'pci-dss', 'iso27001', 'kritis']
                    ]
                ],
                'lastsecurityaudit' => [
                    'type' => 'string',
                    'maxLength' => 100
                ],
                'nextsecurityaudit' => [
                    'type' => 'string',
                    'maxLength' => 100
                ],
                
                // Verantwortlichkeiten
                'admin' => [
                    'type' => 'string',
                    'maxLength' => 255
                ],
                'support' => [
                    'type' => 'string',
                    'maxLength' => 255
                ],
                'emergencycontact' => [
                    'type' => 'string',
                    'maxLength' => 255
                ],
                
                // Notizen
                'notes' => [
                    'type' => 'string',
                    'description' => 'Zusätzliche Informationen'
                ]
            ]
        ];
    }
}
