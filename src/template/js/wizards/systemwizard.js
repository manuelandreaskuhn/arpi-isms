import { updateListenersForDynamicEntry, updateSectionCounter, removeCustomSelects } from './wizards.js';
import { 
    addVMEntry, 
    addHardwareEntry, 
    removeEntry,
    refreshVMHypervisors,
    refreshAllVMHypervisors 
} from './system/vmhardware.js';
import { 
    addDatabaseEntry,
    refreshHostAssignments 
} from './system/database.js';
import { 
    addBackupEntry,
    setupBackupConditionalFields,
    refreshBackupHostAssignments,
    refreshBackupSystems,
    refreshAllBackupSystems 
} from './system/backup.js';
import { 
    addLoadBalancerEntry,
    setupLoadBalancerConditionalFields,
    refreshLoadBalancerHostAssignments 
} from './system/loadbalancer.js';
import { 
    addFirewallEntry,
    setupFirewallConditionalFields,
    refreshFirewallHostAssignments 
} from './system/firewall.js';
import { 
    addClientEntry,
    setupClientConditionalFields,
    refreshClientHostAssignments,
    refreshClientTargets 
} from './system/client.js';
import { setupTIConditionalFields } from './system/ti.js';
import { setupProxyConditionalFields } from './system/proxy.js';
import { 
    setupSIEMConditionalFields,
    refreshSIEMHostAssignments,
    refreshSIEMDatabaseAssignments 
} from './system/siem.js';
import { setupVPNConditionalFields, refreshVPNHostAssignments } from './system/vpn.js';
import { 
    addMedInterfaceEntry,
    refreshInterfaceComponents 
} from './system/medinterface.js';
import {
    addContainerEntry,
    setupContainerConditionalFields,
    refreshContainerHostAssignments
} from './system/container.js';
import { initializeHelpTooltips } from './helptooltip.js';
import { refreshAllComponentSelects } from './componentlinking.js';

document.addEventListener('DOMContentLoaded', function() {
    // Initialize help tooltips
    initializeHelpTooltips();
    
    // Initially hide sections
    const vmSection = document.querySelector('.form-section[data-name="virtualmachines"]');
    const hardwareSection = document.querySelector('.form-section[data-name="hardwareservers"]');
    const databaseSection = document.querySelector('.form-section[data-name="databases"]');
    const backupSection = document.querySelector('.form-section[data-name="backups"]');
    const loadbalancerSection = document.querySelector('.form-section[data-name="loadbalancers"]');
    const firewallSection = document.querySelector('.form-section[data-name="firewalls"]');
    const clientSection = document.querySelector('.form-section[data-name="clients"]');
    const medInterfaceSection = document.querySelector('.form-section[data-name="medinterfaces"]');
    const containerSection = document.querySelector('.form-section[data-name="containers"]');
    
    if (vmSection) vmSection.style.display = 'none';
    if (hardwareSection) hardwareSection.style.display = 'none';
    if (databaseSection) databaseSection.style.display = 'none';
    if (backupSection) backupSection.style.display = 'none';
    if (loadbalancerSection) loadbalancerSection.style.display = 'none';
    if (firewallSection) firewallSection.style.display = 'none';
    if (clientSection) clientSection.style.display = 'none';
    if (medInterfaceSection) medInterfaceSection.style.display = 'none';
    if (containerSection) containerSection.style.display = 'none';
    
    // VM checkbox handler
    const vmCheckbox = document.getElementById('vm');
    if (vmCheckbox) {
        vmCheckbox.addEventListener('change', function() {
            if (this.checked) {
                vmSection.style.display = 'block';
            } else {
                vmSection.style.display = 'none';
                document.getElementById('vmList').innerHTML = '';
                updateSectionCounter(vmSection);
                refreshHostAssignments();
                refreshBackupHostAssignments();
            }
        });
    }
    
    // Hardware checkbox handler
    const hardwareCheckbox = document.getElementById('hardware');
    if (hardwareCheckbox) {
        hardwareCheckbox.addEventListener('change', function() {
            if (this.checked) {
                hardwareSection.style.display = 'block';
            } else {
                hardwareSection.style.display = 'none';
                document.getElementById('hardwareList').innerHTML = '';
                updateSectionCounter(hardwareSection);
                refreshHostAssignments();
                refreshBackupHostAssignments();
            }
        });
    }
    
    // Database checkbox handler
    const databaseCheckbox = document.getElementById('database');
    if (databaseCheckbox) {
        databaseCheckbox.addEventListener('change', function() {
            if (this.checked) {
                databaseSection.style.display = 'block';
            } else {
                databaseSection.style.display = 'none';
                document.getElementById('databaseList').innerHTML = '';
                updateSectionCounter(databaseSection);
                refreshBackupHostAssignments();
            }
        });
    }

    // Backup checkbox handler
    const backupCheckbox = document.getElementById('backup');
    if (backupCheckbox) {
        backupCheckbox.addEventListener('change', function() {
            if (this.checked) {
                backupSection.style.display = 'block';
            } else {
                backupSection.style.display = 'none';
                document.getElementById('backupList').innerHTML = '';
                updateSectionCounter(backupSection);
            }
        });
    }

    // Load Balancer checkbox handler
    const loadbalancerCheckbox = document.getElementById('loadbalancer');
    if (loadbalancerCheckbox) {
        loadbalancerCheckbox.addEventListener('change', function() {
            if (this.checked) {
                loadbalancerSection.style.display = 'block';
            } else {
                loadbalancerSection.style.display = 'none';
                document.getElementById('loadbalancerList').innerHTML = '';
                updateSectionCounter(loadbalancerSection);
            }
        });
    }

    // Firewall checkbox handler
    const firewallCheckbox = document.getElementById('firewall');
    if (firewallCheckbox) {
        firewallCheckbox.addEventListener('change', function() {
            if (this.checked) {
                firewallSection.style.display = 'block';
            } else {
                firewallSection.style.display = 'none';
                document.getElementById('firewallList').innerHTML = '';
                updateSectionCounter(firewallSection);
            }
        });
    }

    // Client checkbox handler
    const clientCheckbox = document.getElementById('client');
    if (clientCheckbox) {
        clientCheckbox.addEventListener('change', function() {
            if (this.checked) {
                clientSection.style.display = 'block';
            } else {
                clientSection.style.display = 'none';
                document.getElementById('clientList').innerHTML = '';
                updateSectionCounter(clientSection);
            }
        });
    }

    // Gematik TI checkbox handler
    const gematictiCheckbox = document.getElementById('gematicti');
    const gematictiSection = document.querySelector('.form-section[data-name="gematicti"]');
    
    if (gematictiCheckbox && gematictiSection) {
        gematictiSection.style.display = 'none';
        
        gematictiCheckbox.addEventListener('change', function() {
            if (this.checked) {
                gematictiSection.style.display = 'block';
                setupTIConditionalFields(gematictiSection);
                // Refresh component selects für TI-Komponenten
                refreshAllComponentSelects();
            } else {
                gematictiSection.style.display = 'none';
            }
        });
    }

    // Proxy checkbox handler
    const proxyCheckbox = document.getElementById('proxy');
    const proxySection = document.querySelector('.form-section[data-name="proxy"]');
    
    if (proxyCheckbox && proxySection) {
        proxySection.style.display = 'none';
        
        proxyCheckbox.addEventListener('change', function() {
            if (this.checked) {
                proxySection.style.display = 'block';
                setupProxyConditionalFields(proxySection);
            } else {
                proxySection.style.display = 'none';
            }
        });
    }

    // SIEM checkbox handler
    const siemCheckbox = document.getElementById('siem');
    const siemSection = document.querySelector('.form-section[data-name="siem"]');
    
    if (siemCheckbox && siemSection) {
        siemSection.style.display = 'none';
        
        siemCheckbox.addEventListener('change', function() {
            if (this.checked) {
                siemSection.style.display = 'block';
                setupSIEMConditionalFields(siemSection);
            } else {
                siemSection.style.display = 'none';
            }
        });
    }

    // VPN checkbox handler
    const vpnCheckbox = document.getElementById('vpn');
    const vpnSection = document.querySelector('.form-section[data-name="vpn"]');
    
    if (vpnCheckbox && vpnSection) {
        vpnSection.style.display = 'none';
        
        vpnCheckbox.addEventListener('change', function() {
            if (this.checked) {
                vpnSection.style.display = 'block';
                setupVPNConditionalFields(vpnSection);
            } else {
                vpnSection.style.display = 'none';
            }
        });
    }

    // Medical Interface checkbox handler
    const medInterfaceCheckbox = document.getElementById('medinterface');
    
    if (medInterfaceCheckbox && medInterfaceSection) {
        medInterfaceCheckbox.addEventListener('change', function() {
            if (this.checked) {
                medInterfaceSection.style.display = 'block';
                // Refresh component selects für Interfaces
                refreshAllComponentSelects();
            } else {
                medInterfaceSection.style.display = 'none';
                document.getElementById('medInterfaceList').innerHTML = '';
                updateSectionCounter(medInterfaceSection);
            }
        });
    }

    // Container checkbox handler
    const containerCheckbox = document.getElementById('container');
    
    if (containerCheckbox && containerSection) {
        containerCheckbox.addEventListener('change', function() {
            if (this.checked) {
                containerSection.style.display = 'block';
            } else {
                containerSection.style.display = 'none';
                document.getElementById('containerList').innerHTML = '';
                updateSectionCounter(containerSection);
            }
        });
    }

    // Hypervisor checkbox handler
    const hypervisorCheckbox = document.getElementById('hypervisor');
    const hypervisorSection = document.querySelector('.form-section[data-name="hypervisor"]');
    
    if (hypervisorCheckbox && hypervisorSection) {
        hypervisorSection.style.display = 'none';
        
        hypervisorCheckbox.addEventListener('change', function() {
            if (this.checked) {
                hypervisorSection.style.display = 'block';
                refreshAllComponentSelects();
            } else {
                hypervisorSection.style.display = 'none';
            }
        });
    }

    // CommunicationServer checkbox handler
    const commserverCheckbox = document.getElementById('commserver');
    const commserverSection = document.querySelector('.form-section[data-name="commserver"]');
    
    if (commserverCheckbox && commserverSection) {
        commserverSection.style.display = 'none';
        
        commserverCheckbox.addEventListener('change', function() {
            if (this.checked) {
                commserverSection.style.display = 'block';
                refreshAllComponentSelects();
            } else {
                commserverSection.style.display = 'none';
            }
        });
    }

    // Cluster-Konfiguration anzeigen/ausblenden
    document.addEventListener('change', function(e) {
        if (e.target.classList && e.target.classList.contains('db-cluster-check')) {
            const clusterConfig = e.target.closest('.entry-content')?.querySelector('.cluster-config');
            if (clusterConfig) {
                clusterConfig.style.display = e.target.checked ? 'block' : 'none';
            }
        }
    });
});

// Make functions globally accessible for onclick handlers
window.addVMEntry = addVMEntry;
window.addHardwareEntry = addHardwareEntry;
window.addDatabaseEntry = addDatabaseEntry;
window.addBackupEntry = addBackupEntry;
window.addLoadBalancerEntry = addLoadBalancerEntry;
window.addFirewallEntry = addFirewallEntry;
window.addClientEntry = addClientEntry;
window.removeEntry = removeEntry;
window.refreshHostAssignments = refreshHostAssignments;
window.refreshBackupHostAssignments = refreshBackupHostAssignments;
window.refreshLoadBalancerHostAssignments = refreshLoadBalancerHostAssignments;
window.refreshFirewallHostAssignments = refreshFirewallHostAssignments;
window.refreshClientHostAssignments = refreshClientHostAssignments;
window.refreshVMHypervisors = refreshVMHypervisors;
window.refreshBackupSystems = refreshBackupSystems;
window.setupBackupConditionalFields = setupBackupConditionalFields;
window.setupLoadBalancerConditionalFields = setupLoadBalancerConditionalFields;
window.setupFirewallConditionalFields = setupFirewallConditionalFields;
window.setupClientConditionalFields = setupClientConditionalFields;
window.setupTIConditionalFields = setupTIConditionalFields;
window.setupProxyConditionalFields = setupProxyConditionalFields;
window.setupSIEMConditionalFields = setupSIEMConditionalFields;
window.refreshSIEMHostAssignments = refreshSIEMHostAssignments;
window.refreshSIEMDatabaseAssignments = refreshSIEMDatabaseAssignments;
window.refreshVPNHostAssignments = refreshVPNHostAssignments;
window.addMedInterfaceEntry = addMedInterfaceEntry;
window.refreshInterfaceComponents = refreshInterfaceComponents;
window.addContainerEntry = addContainerEntry;
window.setupContainerConditionalFields = setupContainerConditionalFields;
window.refreshContainerHostAssignments = refreshContainerHostAssignments;

