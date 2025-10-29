import { updateListenersForDynamicEntry, updateSectionCounter } from '../wizards.js';

export function addContainerEntry() {
    const template = document.getElementById('containerEntryTemplate');
    const list = document.getElementById('containerList');
    
    if (!template || !list) return;
    
    const clone = template.content.cloneNode(true);
    const entry = clone.querySelector('.dynamic-entry');
    
    // Set entry number
    const entries = list.querySelectorAll('.dynamic-entry[data-type="container"]');
    const entryNumber = entries.length + 1;
    entry.querySelector('.entry-number').textContent = entryNumber;
    
    list.appendChild(clone);
    
    // Update listeners for custom selects
    updateListenersForDynamicEntry(entry);
    
    // Setup conditional fields
    setupContainerConditionalFields(entry);
    
    // Populate host assignments
    refreshContainerHostAssignments(entry);
    
    // Update section counter
    const section = document.querySelector('.form-section[data-name="containers"]');
    updateSectionCounter(section);
}

export function setupContainerConditionalFields(entry) {
    // Kubernetes configuration toggle
    const orchestrationSelect = entry.querySelector('[data-name="containerOrchestration"]');
    const k8sConfig = entry.querySelector('.container-k8s-config');
    
    if (orchestrationSelect && k8sConfig) {
        orchestrationSelect.addEventListener('click', function(e) {
            if (e.target.classList.contains('select-option')) {
                const value = e.target.getAttribute('data-value');
                k8sConfig.style.display = (value === 'kubernetes' || value === 'openshift') ? 'block' : 'none';
            }
        });
    }
    
    // Volumes configuration toggle
    const volumesCheckbox = entry.querySelector('.container-volumes-check');
    const volumesConfig = entry.querySelector('.container-volumes-config');
    
    if (volumesCheckbox && volumesConfig) {
        volumesCheckbox.addEventListener('change', function() {
            volumesConfig.style.display = this.checked ? 'block' : 'none';
        });
    }
    
    // Environment variables configuration toggle
    const envCheckbox = entry.querySelector('.container-env-check');
    const envConfig = entry.querySelector('.container-env-config');
    
    if (envCheckbox && envConfig) {
        envCheckbox.addEventListener('change', function() {
            envConfig.style.display = this.checked ? 'block' : 'none';
        });
    }
}

export function refreshContainerHostAssignments(entryOrNull = null) {
    const entries = entryOrNull 
        ? [entryOrNull] 
        : document.querySelectorAll('.dynamic-entry[data-type="container"]');
    
    entries.forEach(entry => {
        const hostSelect = entry.querySelector('.container-host-options');
        
        if (hostSelect) {
            populateContainerHosts(hostSelect);
        }
    });
}

function populateContainerHosts(selectElement) {
    // Keep the "no assignment" option
    const noAssignment = selectElement.querySelector('[data-value=""]');
    selectElement.innerHTML = '';
    if (noAssignment) {
        selectElement.appendChild(noAssignment);
    }
    
    // Add VMs
    const vmEntries = document.querySelectorAll('.dynamic-entry[data-type="vm"]');
    if (vmEntries.length > 0) {
        const vmGroup = document.createElement('div');
        vmGroup.className = 'select-option-group';
        vmGroup.innerHTML = '<div class="select-option-group-label">Virtuelle Maschinen</div>';
        
        vmEntries.forEach((vm, index) => {
            const vmName = vm.querySelector('[name="vmName"]')?.value || 'Unbenannte VM';
            const option = document.createElement('div');
            option.className = 'select-option';
            option.setAttribute('data-value', `vm-${index}`);
            option.textContent = `VM: ${vmName}`;
            vmGroup.appendChild(option);
        });
        
        selectElement.appendChild(vmGroup);
    }
    
    // Add Hardware Servers
    const hwEntries = document.querySelectorAll('.dynamic-entry[data-type="hardware"]');
    if (hwEntries.length > 0) {
        const hwGroup = document.createElement('div');
        hwGroup.className = 'select-option-group';
        hwGroup.innerHTML = '<div class="select-option-group-label">Hardware Server</div>';
        
        hwEntries.forEach((hw, index) => {
            const hwName = hw.querySelector('[name="hardwareName"]')?.value || 'Unbenannter Server';
            const option = document.createElement('div');
            option.className = 'select-option';
            option.setAttribute('data-value', `hw-${index}`);
            option.textContent = `Server: ${hwName}`;
            hwGroup.appendChild(option);
        });
        
        selectElement.appendChild(hwGroup);
    }
}
