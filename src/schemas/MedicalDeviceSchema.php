<?php
namespace ARPI\Schemas;

class MedicalDeviceSchema
{
    public static function getSchema(): array
    {
        return [
            'type' => 'object',
            'required' => ['name', 'category', 'manufacturer'],
            'properties' => [
                'name' => ['type' => 'string', 'minLength' => 1, 'maxLength' => 255],
                'inventorynumber' => ['type' => 'string'],
                'manufacturer' => ['type' => 'string'],
                'model' => ['type' => 'string'],
                'serialnumber' => ['type' => 'string'],
                'category' => ['type' => 'string', 'enum' => ['ct', 'mrt', 'xray', 'ultrasound', 'angiography', 'mammography', 'lab-hematology', 'lab-chemistry', 'patient-monitor', 'ventilator', 'infusion-pump', 'defibrillator', 'dialysis', 'other']],
                'riskclass' => ['type' => 'string', 'enum' => ['1', '2a', '2b', '3']],
                'cemarking' => ['type' => 'string', 'enum' => ['yes', 'no']],
                'udi' => ['type' => 'string'],
                'notifiedbody' => ['type' => 'string'],
                'location' => ['type' => 'string'],
                'usagestatus' => ['type' => 'string', 'enum' => ['in-use', 'standby', 'maintenance', 'repair', 'decommissioned', 'storage']],
                'networked' => ['type' => 'string', 'enum' => ['yes', 'no']],
                'networkconnection' => ['type' => 'string', 'enum' => ['ethernet', 'wifi', 'bluetooth', 'serial', 'usb', 'none']],
                'ipaddress' => ['type' => 'string'],
                'pacsintegration' => ['type' => 'string', 'enum' => ['direct', 'gateway', 'none', 'n/a']],
                'rishisintegration' => ['type' => 'string', 'enum' => ['direct', 'gateway', 'none', 'n/a']],
                'protocol' => ['type' => 'string', 'enum' => ['dicom', 'hl7', 'fhir', 'modality-worklist', 'ihe', 'proprietary', 'none']],
                'gateway' => ['type' => 'string', 'enum' => ['yes', 'no']],
                'gatewayname' => ['type' => 'string'],
                'gatewayfunctions' => ['type' => 'array', 'items' => ['type' => 'string']],
                'maintenancecontract' => ['type' => 'string', 'enum' => ['full-service', 'preventive', 'on-demand', 'none']],
                'nextmaintenance' => ['type' => 'string'],
                'lastmtk' => ['type' => 'string'],
                'nextmtk' => ['type' => 'string'],
                'os' => ['type' => 'string'],
                'updatepolicy' => ['type' => 'string', 'enum' => ['automatic', 'controlled', 'locked', 'eol']],
                'antivirus' => ['type' => 'string', 'enum' => ['installed', 'restricted', 'unsupported', 'compensated']],
                'firewall' => ['type' => 'string', 'enum' => ['airgap', 'microsegmentation', 'vlan', 'host-based', 'open']],
                'encryption' => ['type' => 'string', 'enum' => ['full', 'transport-only', 'storage-only', 'none']],
                'accesscontrol' => ['type' => 'string', 'enum' => ['mfa', 'password', 'card', 'biometric', 'none']],
                'securityassessment' => ['type' => 'string'],
                'mpbeauftragter' => ['type' => 'string'],
                'itresponsible' => ['type' => 'string'],
                'notes' => ['type' => 'string']
            ]
        ];
    }
}
