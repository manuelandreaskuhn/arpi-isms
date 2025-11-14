<?php
namespace ARPI\Schemas;

class SIEMSchema
{
    public static function getSchema(): array
    {
        return [
            'type' => 'object',
            'required' => ['name', 'software', 'version'],
            'properties' => [
                'name' => ['type' => 'string', 'minLength' => 1, 'maxLength' => 255],
                'software' => ['type' => 'string', 'enum' => ['splunk', 'qradar', 'arcsight', 'sentinel', 'logrhythm', 'securonix', 'elastic-siem', 'wazuh', 'ossec', 'alienvault', 'sumo-logic', 'datadog', 'rapid7', 'other']],
                'version' => ['type' => 'string'],
                'licensemodel' => ['type' => 'string', 'enum' => ['per-eps', 'per-gb', 'per-device', 'per-user', 'subscription', 'perpetual', 'free']],
                'deployment' => ['type' => 'string', 'enum' => ['on-premise', 'cloud', 'hybrid']],
                'serverid' => ['type' => 'string'],
                'hostname' => ['type' => 'string'],
                'mgmturl' => ['type' => 'string'],
                'ipaddress' => ['type' => 'string'],
                'operatingsystem' => ['type' => 'string'],
                'location' => ['type' => 'string'],
                'logsources' => ['type' => 'number', 'minimum' => 0],
                'eps' => ['type' => 'number', 'minimum' => 0],
                'logvolume' => ['type' => 'string'],
                'storage' => ['type' => 'string'],
                'logsourcetypes' => ['type' => 'array', 'items' => ['type' => 'string']],
                'usecases' => ['type' => 'number', 'minimum' => 0],
                'correlationrules' => ['type' => 'number', 'minimum' => 0],
                'ueba' => ['type' => 'string', 'enum' => ['enabled', 'disabled']],
                'threatintel' => ['type' => 'string', 'enum' => ['enabled', 'disabled']],
                'threatfeeds' => ['type' => 'string'],
                'frameworks' => ['type' => 'array', 'items' => ['type' => 'string']],
                'incidentmgmt' => ['type' => 'string'],
                'ticketing' => ['type' => 'string'],
                'soar' => ['type' => 'string', 'enum' => ['integrated', 'external', 'none']],
                'soarplatform' => ['type' => 'string'],
                'retention' => ['type' => 'number', 'minimum' => 0],
                'archiving' => ['type' => 'string', 'enum' => ['enabled', 'disabled']],
                'compliance' => ['type' => 'array', 'items' => ['type' => 'string']],
                'alertmail' => ['type' => 'string'],
                'alertfreq' => ['type' => 'string'],
                'notifications' => ['type' => 'array', 'items' => ['type' => 'string']],
                'dashboard' => ['type' => 'string'],
                'soctype' => ['type' => 'string', 'enum' => ['internal', 'external', 'hybrid', 'none']],
                'sochours' => ['type' => 'string', 'enum' => ['24-7', 'business', 'extended']],
                'socresponsible' => ['type' => 'string'],
                'mssp' => ['type' => 'string'],
                'admin' => ['type' => 'string'],
                'support' => ['type' => 'string', 'enum' => ['24-7', 'business', 'basic', 'none']],
                'supportcontact' => ['type' => 'string'],
                'notes' => ['type' => 'string']
            ]
        ];
    }
}
