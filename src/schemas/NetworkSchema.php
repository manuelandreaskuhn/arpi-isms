<?php
namespace ARPI\Schemas;

class NetworkSchema
{
    public static function getSchema(): array
    {
        return [
            'type' => 'object',
            'required' => ['name', 'type', 'vlanid'],
            'properties' => [
                'name' => ['type' => 'string', 'minLength' => 1, 'maxLength' => 255],
                'type' => ['type' => 'string', 'enum' => ['production', 'management', 'storage', 'backup', 'dmz', 'guest', 'medical', 'iot']],
                'vlanid' => ['type' => 'number', 'minimum' => 1, 'maximum' => 4094],
                'subnet' => ['type' => 'string'],
                'gateway' => ['type' => 'string'],
                'dhcp' => ['type' => 'string', 'enum' => ['enabled', 'disabled']],
                'dhcprange' => ['type' => 'string'],
                'dnsservers' => ['type' => 'string'],
                'securityzone' => ['type' => 'string', 'enum' => ['public', 'dmz', 'internal', 'restricted', 'isolated']],
                'accesscontrol' => ['type' => 'string', 'enum' => ['open', 'restricted', 'isolated']],
                'firewallrules' => ['type' => 'string'],
                'monitoring' => ['type' => 'string', 'enum' => ['enabled', 'disabled']],
                'documentation' => ['type' => 'string'],
                'notes' => ['type' => 'string']
            ]
        ];
    }
}
