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
        
        foreach ($system->virtualMachines as $vm) {
            $hosts[] = [
                'type' => 'vm',
                'id' => spl_object_id($vm),
                'hostname' => $vm->hostname,
                'ip' => $vm->ipAddress
            ];
        }
        
        foreach ($system->hardwareServers as $hw) {
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
            'vm' => !empty($system->virtualMachines),
            'hardware' => !empty($system->hardwareServers),
            'database' => !empty($system->databases),
            'backup' => !empty($system->backupSystems),
            'loadbalancer' => !empty($system->loadBalancers),
            'firewall' => !empty($system->firewallRules),
            'client' => !empty($system->clientAccesses),
            'meddevice' => !empty($system->medicalDevices),
            'medinterface' => !empty($system->medicalInterfaces),
            'container' => !empty($system->containers),
            'ti' => $system->tiInfrastructure !== null,
            'proxy' => $system->proxyConfiguration !== null,
            'siem' => $system->siemIntegration !== null,
            'vpn' => $system->vpnAccess !== null,
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
            'vm' => count($system->virtualMachines),
            'hardware' => count($system->hardwareServers),
            'database' => count($system->databases),
            'backup' => count($system->backupSystems),
            'loadbalancer' => count($system->loadBalancers),
            'firewall' => count($system->firewallRules),
            'client' => count($system->clientAccesses),
            'meddevice' => count($system->medicalDevices),
            'medinterface' => count($system->medicalInterfaces),
            'container' => count($system->containers),
            'ti' => $system->tiInfrastructure !== null ? 1 : 0,
            'proxy' => $system->proxyConfiguration !== null ? 1 : 0,
            'siem' => $system->siemIntegration !== null ? 1 : 0,
            'vpn' => $system->vpnAccess !== null ? 1 : 0,
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
        return count($system->virtualMachines) +
               count($system->hardwareServers) +
               count($system->databases) +
               count($system->backupSystems) +
               count($system->loadBalancers) +
               count($system->firewallRules) +
               count($system->clientAccesses) +
               count($system->medicalDevices) +
               count($system->medicalInterfaces) +
               count($system->containers) +
               ($system->tiInfrastructure !== null ? 1 : 0) +
               ($system->proxyConfiguration !== null ? 1 : 0) +
               ($system->siemIntegration !== null ? 1 : 0) +
               ($system->vpnAccess !== null ? 1 : 0);
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
        return $system->dataClassification === 'patientdata-gdpr';
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
        if (!in_array($type, $system->componentTypes, true)) {
            $system->componentTypes[] = $type;
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
        $system->componentTypes = array_values(array_filter(
            $system->componentTypes,
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
        return in_array($type, $system->componentTypes, true);
    }
}
