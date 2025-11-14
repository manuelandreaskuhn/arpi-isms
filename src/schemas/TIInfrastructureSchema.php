<?php
namespace ARPI\Schemas;

class TIInfrastructureSchema
{
    public static function getSchema(): array
    {
        return [
            'type' => 'object',
            'required' => ['name', 'konnektor'],
            'properties' => [
                'name' => ['type' => 'string', 'minLength' => 1, 'maxLength' => 255],
                'konnektor' => ['type' => 'string', 'enum' => ['secunet', 'rise', 'koco', 'other']],
                'konnektorversion' => ['type' => 'string'],
                'konnektorserial' => ['type' => 'string'],
                'mandantid' => ['type' => 'string'],
                'betriebsstaettennummer' => ['type' => 'string'],
                'locationid' => ['type' => 'string'],
                'ipaddress' => ['type' => 'string'],
                'kartenterminals' => ['type' => 'number', 'minimum' => 0],
                'smcbcards' => ['type' => 'number', 'minimum' => 0],
                'hbacards' => ['type' => 'number', 'minimum' => 0],
                'vpnzugangsdienst' => ['type' => 'string'],
                'konfiguration' => ['type' => 'string', 'enum' => ['standalone', 'redundant', 'cluster']],
                'updatemanagement' => ['type' => 'string', 'enum' => ['automatic', 'manual', 'managed']],
                'monitoring' => ['type' => 'string', 'enum' => ['enabled', 'disabled']],
                'support' => ['type' => 'string'],
                'admin' => ['type' => 'string'],
                'notes' => ['type' => 'string']
            ]
        ];
    }
}
