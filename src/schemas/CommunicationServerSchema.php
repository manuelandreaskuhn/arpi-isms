<?php
namespace ARPI\Schemas;

class CommunicationServerSchema
{
    public static function getSchema(): array
    {
        return [
            'type' => 'object',
            'required' => ['name', 'type', 'vendor'],
            'properties' => [
                'name' => ['type' => 'string', 'minLength' => 1, 'maxLength' => 255],
                'type' => ['type' => 'string', 'enum' => ['mirth', 'rhapsody', 'ensemble', 'cloverleaf', 'other']],
                'vendor' => ['type' => 'string'],
                'version' => ['type' => 'string'],
                'criticality' => ['type' => 'string', 'enum' => ['low', 'medium', 'high', 'critical']],
                'hostname' => ['type' => 'string'],
                'ip' => ['type' => 'string'],
                'os' => ['type' => 'string'],
                'adminport' => ['type' => 'number', 'minimum' => 1, 'maximum' => 65535],
                'environment' => ['type' => 'string', 'enum' => ['production', 'test', 'development', 'staging']],
                'protocols' => ['type' => 'array', 'items' => ['type' => 'string']],
                'channelcount' => ['type' => 'number', 'minimum' => 0],
                'throughput' => ['type' => 'string'],
                'channels' => ['type' => 'string'],
                'ha' => ['type' => 'boolean'],
                'clustertype' => ['type' => 'string'],
                'nodecount' => ['type' => 'number', 'minimum' => 1],
                'monitoring' => ['type' => 'string'],
                'logretention' => ['type' => 'string'],
                'siem' => [
                    'type' => 'object',
                    'properties' => [
                        'enabled' => ['type' => 'boolean'],
                        'systemid' => ['type' => 'string'],
                        'logformat' => ['type' => 'string'],
                        'transport' => ['type' => 'string'],
                        'logtypes' => ['type' => 'array', 'items' => ['type' => 'string']]
                    ]
                ],
                'auth' => ['type' => 'string'],
                'tls' => ['type' => 'string'],
                'access' => ['type' => 'string'],
                'maintenance' => ['type' => 'string'],
                'lastupdate' => ['type' => 'string'],
                'support' => ['type' => 'string'],
                'notes' => ['type' => 'string']
            ]
        ];
    }
}
