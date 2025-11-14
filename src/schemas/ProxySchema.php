<?php
namespace ARPI\Schemas;

class ProxySchema
{
    public static function getSchema(): array
    {
        return [
            'type' => 'object',
            'required' => ['name', 'type', 'software'],
            'properties' => [
                'name' => ['type' => 'string', 'minLength' => 1, 'maxLength' => 255],
                'type' => ['type' => 'string', 'enum' => ['forward', 'reverse', 'transparent', 'socks']],
                'software' => ['type' => 'string', 'enum' => ['squid', 'nginx', 'haproxy', 'apache', 'traefik', 'envoy', 'f5', 'other']],
                'version' => ['type' => 'string'],
                'hostname' => ['type' => 'string'],
                'ipaddress' => ['type' => 'string'],
                'port' => ['type' => 'number', 'minimum' => 1, 'maximum' => 65535],
                'sslport' => ['type' => 'number', 'minimum' => 1, 'maximum' => 65535],
                'authentication' => ['type' => 'string', 'enum' => ['none', 'basic', 'ntlm', 'kerberos', 'ldap', 'saml']],
                'sslinterception' => ['type' => 'string', 'enum' => ['enabled', 'disabled']],
                'caching' => ['type' => 'string', 'enum' => ['enabled', 'disabled']],
                'cachesize' => ['type' => 'string'],
                'contentfiltering' => ['type' => 'string', 'enum' => ['enabled', 'disabled']],
                'urlfiltering' => ['type' => 'string', 'enum' => ['enabled', 'disabled']],
                'malwareprotection' => ['type' => 'string', 'enum' => ['enabled', 'disabled']],
                'logginglevel' => ['type' => 'string', 'enum' => ['none', 'basic', 'detailed', 'debug']],
                'logretention' => ['type' => 'string'],
                'hamode' => ['type' => 'string', 'enum' => ['standalone', 'active-passive', 'active-active']],
                'monitoring' => ['type' => 'string'],
                'admin' => ['type' => 'string'],
                'notes' => ['type' => 'string']
            ]
        ];
    }
}
