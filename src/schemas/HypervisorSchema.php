<?php
namespace ARPI\Schemas;

class HypervisorSchema
{
    public static function getSchema(): array
    {
        return [
            'type' => 'object',
            'required' => ['name', 'type', 'version'],
            'properties' => [
                'name' => ['type' => 'string', 'minLength' => 1, 'maxLength' => 255],
                'type' => ['type' => 'string', 'enum' => ['vmware-esxi', 'vmware-vcenter', 'hyper-v', 'kvm', 'proxmox', 'xen', 'other']],
                'version' => ['type' => 'string'],
                'hostname' => ['type' => 'string'],
                'managementip' => ['type' => 'string'],
                'clustermode' => ['type' => 'string', 'enum' => ['standalone', 'cluster']],
                'clustername' => ['type' => 'string'],
                'nodecount' => ['type' => 'number', 'minimum' => 1],
                'cpucores' => ['type' => 'number', 'minimum' => 1],
                'ram' => ['type' => 'number', 'minimum' => 1],
                'storage' => ['type' => 'number', 'minimum' => 0],
                'vmcount' => ['type' => 'number', 'minimum' => 0],
                'haenabled' => ['type' => 'string', 'enum' => ['yes', 'no']],
                'drsenabled' => ['type' => 'string', 'enum' => ['yes', 'no']],
                'vmotion' => ['type' => 'string', 'enum' => ['yes', 'no']],
                'backupintegration' => ['type' => 'string'],
                'monitoringintegration' => ['type' => 'string'],
                'licensemodel' => ['type' => 'string'],
                'supportcontract' => ['type' => 'string'],
                'notes' => ['type' => 'string']
            ]
        ];
    }
}
