<?php
namespace ARPI\Schemas;

class SystemSchema
{
    public static function getSchema(): array
    {
        return [
            'type' => 'object',
            'required' => ['systemname'],
            'properties' => [
                // Basis-Informationen
                'systemname' => ['type' => 'string', 'minLength' => 1, 'maxLength' => 255],
                'software' => ['type' => 'string'],
                'vendor' => ['type' => 'string'],
                'version' => ['type' => 'string'],
                'licensetype' => ['type' => 'string', 'enum' => ['commercial', 'subscription', 'open-source', 'proprietary']],
                
                // Kategorisierung
                'department' => ['type' => 'string'],
                'criticality' => ['type' => 'string', 'enum' => ['low', 'medium', 'high', 'critical']],
                'environment' => ['type' => 'string', 'enum' => ['production', 'test', 'development', 'staging']],
                'hosting' => ['type' => 'string', 'enum' => ['on-premise', 'cloud', 'hybrid', 'datacenter']],
                'cloudprovider' => ['type' => 'string'],
                
                // IT-Sicherheit & Compliance
                'dataclassification' => ['type' => 'string', 'enum' => ['patient', 'personal', 'internal', 'public']],
                'encryption' => ['type' => 'string'],
                'authentication' => ['type' => 'string'],
                'compliance' => ['type' => 'array', 'items' => ['type' => 'string']],
                'lastaudit' => ['type' => 'string'],
                
                // Komponenten-Typen (Flags)
                'componenttypes' => ['type' => 'array', 'items' => ['type' => 'string']],
                
                // Embedded Arrays für Sub-Komponenten
                'virtualmachines' => ['type' => 'array'],
                'hardwareservers' => ['type' => 'array'],
                'databases' => ['type' => 'array'],
                'backupsystems' => ['type' => 'array'],
                'loadbalancers' => ['type' => 'array'],
                'firewallrules' => ['type' => 'array'],
                'clientaccesses' => ['type' => 'array'],
                'medicaldevices' => ['type' => 'array'],
                'medicalinterfaces' => ['type' => 'array'],
                'containers' => ['type' => 'array'],
                
                // Embedded Objects für Single-Komponenten
                'tiinfrastructure' => ['type' => 'object'],
                'proxyconfiguration' => ['type' => 'object'],
                'siemintegration' => ['type' => 'object'],
                'vpnaccess' => ['type' => 'object'],
                'hypervisor' => ['type' => 'object'],
                'commserver' => ['type' => 'object']
            ]
        ];
    }
}
