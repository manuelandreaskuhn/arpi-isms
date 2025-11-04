import { updateListenersForDynamicEntry, updateSectionCounter, removeCustomSelects } from '../wizards.js';

let vmCounter = 0;
let hardwareCounter = 0;

export function addVMEntry() {
    vmCounter++;
    const vmList = document.getElementById('vmList');
    const template = document.getElementById('vmEntryTemplate');
    
    const vmEntry = template.content.cloneNode(true);
    const entryDiv = vmEntry.querySelector('.dynamic-entry');
    
    entryDiv.dataset.id = vmCounter;
    vmEntry.querySelector('.entry-number').textContent = vmCounter;
    
    vmEntry.querySelectorAll('.custom-select').forEach(element => {
        element.dataset.index = vmCounter;
    });
    
    vmList.appendChild(vmEntry);
    
    const addedEntry = vmList.querySelector(`.dynamic-entry[data-id="${vmCounter}"]`);
    updateListenersForDynamicEntry(addedEntry);
    
    // Trigger refreshes in other modules
    if (window.refreshHostAssignments) window.refreshHostAssignments();
    if (window.refreshVPNHostAssignments) window.refreshVPNHostAssignments();
    if (window.refreshAllComponentSelects) window.refreshAllComponentSelects();
    refreshVMHypervisors(addedEntry);
}

export function addHardwareEntry() {
    hardwareCounter++;
    const hardwareList = document.getElementById('hardwareList');
    const template = document.getElementById('hardwareEntryTemplate');
    
    const hwEntry = template.content.cloneNode(true);
    const entryDiv = hwEntry.querySelector('.dynamic-entry');
    
    entryDiv.dataset.id = hardwareCounter;
    hwEntry.querySelector('.entry-number').textContent = hardwareCounter;

    hwEntry.querySelectorAll('.custom-select').forEach(element => {
        element.dataset.index = hardwareCounter;
    });
    
    hardwareList.appendChild(hwEntry);
    
    const addedEntry = hardwareList.querySelector(`.dynamic-entry[data-id="${hardwareCounter}"]`);
    updateListenersForDynamicEntry(addedEntry);
    
    // Trigger refreshes in other modules
    if (window.refreshHostAssignments) window.refreshHostAssignments();
    if (window.refreshVPNHostAssignments) window.refreshVPNHostAssignments();
    if (window.refreshAllComponentSelects) window.refreshAllComponentSelects();
}

export function removeEntry(button, type) {
    const entry = button.closest('.dynamic-entry');
    entry.remove();

    removeCustomSelects(entry);

    const entries = document.querySelectorAll(`.dynamic-entry[data-type="${type}"]`);
    entries.forEach((entry, index) => {
        entry.dataset.id = index + 1;
        entry.querySelector('.entry-number').textContent = index + 1;

        entry.querySelectorAll('.custom-select').forEach(element => {
            element.dataset.index = index + 1;
        });
    });

    const sectionMap = {
        'vm': { counter: () => vmCounter = entries.length + 1, selector: '.form-section[data-name="virtualmachines"]' },
        'hardware': { counter: () => hardwareCounter = entries.length + 1, selector: '.form-section[data-name="hardwareservers"]' },
        'database': { selector: '.form-section[data-name="databases"]' },
        'backup': { selector: '.form-section[data-name="backups"]' },
        'loadbalancer': { selector: '.form-section[data-name="loadbalancers"]' },
        'firewall': { selector: '.form-section[data-name="firewalls"]' },
        'client': { selector: '.form-section[data-name="clients"]' }
    };

    if (sectionMap[type]) {
        if (sectionMap[type].counter) sectionMap[type].counter();
        updateSectionCounter(document.querySelector(sectionMap[type].selector));
        
        // Trigger refreshes based on type
        if (type === 'vm' || type === 'hardware') {
            if (window.refreshHostAssignments) window.refreshHostAssignments();
            if (window.refreshBackupHostAssignments) window.refreshBackupHostAssignments();
            if (window.refreshVPNHostAssignments) window.refreshVPNHostAssignments();
            if (window.refreshAllComponentSelects) window.refreshAllComponentSelects();
        } else if (type === 'database') {
            if (window.refreshBackupHostAssignments) window.refreshBackupHostAssignments();
        }
    }
}

export function refreshVMHypervisors(vmEntry) {
    const hypervisorSelect = vmEntry.querySelector('[data-name="hypervisorid"]');
    if (!hypervisorSelect) return;
    
    const dropdown = hypervisorSelect.querySelector('.select-options');
    if (!dropdown) return;
    
    const firstOption = dropdown.querySelector('[data-value=""]');
    dropdown.innerHTML = '';
    if (firstOption) dropdown.appendChild(firstOption);
    
    // TODO: Fetch hypervisors from component API/database
    const exampleHypervisors = [
        { id: 'hv-1', name: 'ESXi-Cluster-01', type: 'VMware vSphere 8.0' },
        { id: 'hv-2', name: 'Hyper-V-Host-DC1', type: 'Hyper-V 2022' },
        { id: 'hv-3', name: 'Proxmox-VE-Cluster', type: 'Proxmox VE 8.1' }
    ];
    
    exampleHypervisors.forEach((hv) => {
        const option = document.createElement('div');
        option.className = 'select-option';
        option.dataset.value = hv.id;
        option.textContent = `${hv.name} (${hv.type})`;
        dropdown.appendChild(option);
    });
}

export function refreshAllVMHypervisors() {
    const vmEntries = document.querySelectorAll('#vmList .dynamic-entry[data-type="vm"]');
    vmEntries.forEach(vmEntry => {
        refreshVMHypervisors(vmEntry);
    });
}

// Utility function to collect VMs and Hardware
export function collectHosts() {
    const vmEntries = document.querySelectorAll('#vmList .dynamic-entry[data-type="vm"]');
    const vms = Array.from(vmEntries).map((e) => {
        const id = e.dataset.id;
        const hostInput = e.querySelector('input[name="hostname"]');
        const hostname = (hostInput && hostInput.value.trim()) || `VM #${id}`;
        return { id, hostname, type: 'vm' };
    });

    const hwEntries = document.querySelectorAll('#hardwareList .dynamic-entry[data-type="hardware"]');
    const hw = Array.from(hwEntries).map((e) => {
        const id = e.dataset.id;
        const hostInput = e.querySelector('input[name="hostname"]');
        const hostname = (hostInput && hostInput.value.trim()) || `Server #${id}`;
        return { id, hostname, type: 'hardware' };
    });

    return { vms, hw };
}
