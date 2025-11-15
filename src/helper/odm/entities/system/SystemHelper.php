<?php
namespace ARPI\Helper\ODM\Entities\System;

use ARPI\Entities\Documents\System;

class SystemHelper
{
    /**
     * Get all hosts (VMs + Hardware) for component linking
     * @param System $system
     * @return array
     */
    public static function getAllHosts(System $system): array
    {
        $hosts = [];
        
        foreach ($system->virtualmachines as $vm) {
            $hosts[] = [
                'type' => 'vm',
                'id' => spl_object_id($vm),
                'hostname' => $vm->hostname,
                'ip' => $vm->ipAddress
            ];
        }
        
        foreach ($system->hardwareservers as $hw) {
            $hosts[] = [
                'type' => 'hardware',
                'id' => spl_object_id($hw),
                'hostname' => $hw->hostname,
                'ip' => $hw->ipAddress
            ];
        }
        
        return $hosts;
    }

    /**
     * Check if system has specific component type
     * @param System $system
     * @param string $type
     * @return bool
     */
    public static function hasComponent(System $system, string $type): bool
    {
        return match($type) {
            'vm' => !empty($system->virtualmachines),
            'hardware' => !empty($system->hardwareservers),
            'database' => !empty($system->databases),
            'backup' => !empty($system->backupsystems),
            'loadbalancer' => !empty($system->loadbalancers),
            'firewall' => !empty($system->firewallrules),
            'client' => !empty($system->clientaccesses),
            'meddevice' => !empty($system->medicaldevices),
            'medinterface' => !empty($system->medicalinterfaces),
            'container' => !empty($system->containers),
            'ti' => $system->tiinfrastructure !== null,
            'proxy' => $system->proxyconfiguration !== null,
            'siem' => $system->siemintegration !== null,
            'vpn' => $system->vpnaccess !== null,
            default => false
        };
    }

    /**
     * Get component count by type
     * @param System $system
     * @param string $type
     * @return int
     */
    public static function getComponentCount(System $system, string $type): int
    {
        return match($type) {
            'vm' => count($system->virtualmachines),
            'hardware' => count($system->hardwareservers),
            'database' => count($system->databases),
            'backup' => count($system->backupsystems),
            'loadbalancer' => count($system->loadbalancers),
            'firewall' => count($system->firewallrules),
            'client' => count($system->clientaccesses),
            'meddevice' => count($system->medicaldevices),
            'medinterface' => count($system->medicalinterfaces),
            'container' => count($system->containers),
            'ti' => $system->tiinfrastructure !== null ? 1 : 0,
            'proxy' => $system->proxyconfiguration !== null ? 1 : 0,
            'siem' => $system->siemintegration !== null ? 1 : 0,
            'vpn' => $system->vpnaccess !== null ? 1 : 0,
            default => 0
        };
    }

    /**
     * Get total component count
     * @param System $system
     * @return int
     */
    public static function getTotalComponentCount(System $system): int
    {
        return count($system->virtualmachines) +
               count($system->hardwareservers) +
               count($system->databases) +
               count($system->backupsystems) +
               count($system->loadbalancers) +
               count($system->firewallrules) +
               count($system->clientaccesses) +
               count($system->medicaldevices) +
               count($system->medicalinterfaces) +
               count($system->containers) +
               ($system->tiinfrastructure !== null ? 1 : 0) +
               ($system->proxyconfiguration !== null ? 1 : 0) +
               ($system->siemintegration !== null ? 1 : 0) +
               ($system->vpnaccess !== null ? 1 : 0);
    }

    /**
     * Check if system is critical (24/7)
     * @param System $system
     * @return bool
     */
    public static function isCritical(System $system): bool
    {
        return $system->criticality === 'critical-24-7';
    }

    /**
     * Check if system handles patient data
     * @param System $system
     * @return bool
     */
    public static function handlesPatientData(System $system): bool
    {
        return $system->dataclassification === 'patientdata-gdpr';
    }

    /**
     * Check if system is KRITIS-relevant
     * @param System $system
     * @return bool
     */
    public static function isKRITIS(System $system): bool
    {
        return in_array('kritis', $system->compliance, true);
    }

    /**
     * Add compliance item
     * @param System $system
     * @param string $complianceItem
     * @return void
     */
    public static function addCompliance(System $system, string $complianceItem): void
    {
        if (!in_array($complianceItem, $system->compliance, true)) {
            $system->compliance[] = $complianceItem;
        }
    }

    /**
     * Remove compliance item
     * @param System $system
     * @param string $complianceItem
     * @return void
     */
    public static function removeCompliance(System $system, string $complianceItem): void
    {
        $system->compliance = array_values(array_filter(
            $system->compliance,
            fn($item) => $item !== $complianceItem
        ));
    }

    /**
     * Add component type
     * @param System $system
     * @param string $type
     * @return void
     */
    public static function addComponentType(System $system, string $type): void
    {
        if (!in_array($type, $system->componenttypes, true)) {
            $system->componenttypes[] = $type;
        }
    }

    /**
     * Remove component type
     * @param System $system
     * @param string $type
     * @return void
     */
    public static function removeComponentType(System $system, string $type): void
    {
        $system->componenttypes = array_values(array_filter(
            $system->componenttypes,
            fn($item) => $item !== $type
        ));
    }

    /**
     * Check if system has component type
     * @param System $system
     * @param string $type
     * @return bool
     */
    public static function hasComponentType(System $system, string $type): bool
    {
        return in_array($type, $system->componenttypes, true);
    }
}
