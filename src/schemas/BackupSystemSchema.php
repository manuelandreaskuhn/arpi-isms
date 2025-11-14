<?php
namespace ARPI\Schemas;

class BackupSystemSchema
{
    /**
     * JSON Schema für BackupSystem Validierung
     * 
     * @return array
     */
    public static function getSchema(): array
    {
        return [
            'type' => 'object',
            'required' => ['name', 'software', 'version'],
            'properties' => [
                // Basis-Informationen
                'name' => [
                    'type' => 'string',
                    'minLength' => 1,
                    'maxLength' => 255
                ],
                'software' => [
                    'type' => 'string',
                    'minLength' => 1
                ],
                'version' => [
                    'type' => 'string',
                    'minLength' => 1
                ],
                'licensemodel' => [
                    'type' => 'string',
                    'enum' => ['per-socket', 'per-vm', 'per-tb', 'per-host', 'subscription', 'perpetual', 'free']
                ],
                
                // Infrastruktur
                'serverid' => ['type' => ['string', 'null']],
                'serverhostname' => ['type' => ['string', 'null']],
                'serverip' => ['type' => ['string', 'null']],
                'serveroperatingystem' => ['type' => 'string'],
                'serverlocation' => ['type' => 'string'],
                'backupmanagementurl' => ['type' => 'string'],
                
                // Storage
                'storagelevels' => [
                    'type' => 'string',
                    'enum' => ['2-tier', '3-tier']
                ],
                'primarystoragetype' => ['type' => 'string'],
                'primarystoragecapacity' => ['type' => 'number', 'minimum' => 0],
                'primarystoragepath' => ['type' => 'string'],
                'primarydeduplication' => ['type' => 'string', 'enum' => ['enabled', 'disabled']],
                
                'secondarystoragetype' => ['type' => 'string'],
                'secondarystoragecapacity' => ['type' => 'number', 'minimum' => 0],
                'secondarystoragepath' => ['type' => 'string'],
                'secondarydeduplication' => ['type' => 'string', 'enum' => ['enabled', 'disabled']],
                'secondaryreplicationfreq' => ['type' => 'string', 'enum' => ['continuous', 'hourly', 'daily', 'weekly']],
                'secondaryimmutability' => ['type' => 'string', 'enum' => ['enabled', 'disabled']],
                'secondaryimmutabilityperiod' => ['type' => 'string'],
                
                'tertiarystoragetype' => ['type' => 'string'],
                'tertiarystoragecapacity' => ['type' => 'number', 'minimum' => 0],
                'tertiarystoragepath' => ['type' => 'string'],
                'tertiaryarchivefreq' => ['type' => 'string', 'enum' => ['continuous', 'hourly', 'daily', 'weekly']],
                'tertiaryretention' => ['type' => 'string'],
                'tertiaryimmutability' => ['type' => 'string', 'enum' => ['enabled', 'disabled']],
                'tertiaryimmutabilityperiod' => ['type' => 'string'],
                
                // Features
                'backuptypes' => [
                    'type' => 'array',
                    'items' => [
                        'type' => 'string',
                        'enum' => ['full', 'incremental', 'differential', 'forever-incremental']
                    ]
                ],
                'compression' => ['type' => 'string', 'enum' => ['none', 'low', 'medium', 'high']],
                'backupencryption' => ['type' => 'string', 'enum' => ['aes-256', 'aes-128', 'other', 'none']],
                'applicationaware' => ['type' => 'string', 'enum' => ['yes', 'no']],
                'instantrecovery' => ['type' => 'string', 'enum' => ['supported', 'not-supported']],
                'additionalfeatures' => [
                    'type' => 'array',
                    'items' => [
                        'type' => 'string',
                        'enum' => ['replication', 'archiving', 'cdp', 'cloud-tier']
                    ]
                ],
                
                // Monitoring
                'monitoringintegration' => ['type' => 'string'],
                'reporting' => ['type' => 'string', 'enum' => ['daily', 'weekly', 'monthly', 'on-failure']],
                'alertemail' => ['type' => 'string', 'format' => 'email'],
                'logretention' => ['type' => 'string'],
                
                // Verantwortlichkeiten
                'backupadmin' => ['type' => 'string'],
                'supportcontract' => ['type' => 'string', 'enum' => ['24-7', 'business-hours', 'basic', 'none']],
                'supportend' => ['type' => 'string'],
                
                // Notizen
                'backupsystemnotes' => ['type' => 'string']
            ]
        ];
    }
}
