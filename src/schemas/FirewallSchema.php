<?php
namespace ARPI\Schemas;

class FirewallSchema
{
    public static function getSchema(): array
    {
        return [
            'type' => 'object',
            'required' => ['name', 'manufacturer', 'model'],
            'properties' => [
                'name' => ['type' => 'string', 'minLength' => 1, 'maxLength' => 255],
                'manufacturer' => ['type' => 'string', 'minLength' => 1],
                'model' => ['type' => 'string', 'minLength' => 1],
                'firmwareversion' => ['type' => 'string'],
                'managementip' => ['type' => 'string'],
                'managementurl' => ['type' => 'string'],
                'location' => ['type' => 'string'],
                'role' => ['type' => 'string', 'enum' => ['perimeter', 'internal', 'dmz', 'datacenter']],
                'hamode' => ['type' => 'string', 'enum' => ['standalone', 'active-passive', 'active-active', 'cluster']],
                'throughput' => ['type' => 'string'],
                'maxconnections' => ['type' => 'number', 'minimum' => 0],
                'vpnsupport' => ['type' => 'string', 'enum' => ['yes', 'no']],
                'idssupport' => ['type' => 'string', 'enum' => ['yes', 'no']],
                'wafenabled' => ['type' => 'string', 'enum' => ['yes', 'no']],
                'sslinspenabled' => ['type' => 'string', 'enum' => ['yes', 'no']],
                'logging' => ['type' => 'string', 'enum' => ['local', 'syslog', 'siem', 'none']],
                'notes' => ['type' => 'string']
            ]
        ];
    }
}
