import { updateListenersForDynamicEntry, updateSectionCounter } from '../wizards.js';

export function addMedInterfaceEntry() {
    const template = document.getElementById('medInterfaceEntryTemplate');
    const list = document.getElementById('medInterfaceList');
    
    if (!template || !list) return;
    
    const clone = template.content.cloneNode(true);
    const entry = clone.querySelector('.dynamic-entry');
    
    // Set entry number
    const entries = list.querySelectorAll('.dynamic-entry[data-type="medinterface"]');
    const entryNumber = entries.length + 1;
    entry.querySelector('.entry-number').textContent = entryNumber;
    
    list.appendChild(clone);
    
    // Update listeners for custom selects
    updateListenersForDynamicEntry(entry);
    
    // Setup conditional fields for connection type
    setupInterfaceConditionalFields(entry);
    
    // Populate component dropdowns
    refreshInterfaceComponents(entry);
    
    // Update section counter
    const section = document.querySelector('.form-section[data-name="medinterfaces"]');
    updateSectionCounter(section);
}

export function setupInterfaceConditionalFields(entry) {
    const connectionTypeSelect = entry.querySelector('[data-name="connectionType"]');
    
    if (!connectionTypeSelect) return;
    
    const directSection = entry.querySelector('.connection-direct');
    const commServerSection = entry.querySelector('.connection-commserver');
    const fileShareSection = entry.querySelector('.connection-fileshare');
    const mqSection = entry.querySelector('.connection-messagequeue');
    
    // Listen for connection type changes
    connectionTypeSelect.addEventListener('click', function(e) {
        if (e.target.classList.contains('select-option')) {
            const value = e.target.getAttribute('data-value');
            
            // Hide all sections first
            if (directSection) directSection.style.display = 'none';
            if (commServerSection) commServerSection.style.display = 'none';
            if (fileShareSection) fileShareSection.style.display = 'none';
            if (mqSection) mqSection.style.display = 'none';
            
            // Show relevant section
            switch(value) {
                case 'direct':
                    if (directSection) directSection.style.display = 'block';
                    break;
                case 'commserver':
                    if (commServerSection) {
                        commServerSection.style.display = 'block';
                        setupCommServerSelection(entry);
                    }
                    break;
                case 'fileshare':
                    if (fileShareSection) fileShareSection.style.display = 'block';
                    break;
                case 'messagequeue':
                    if (mqSection) mqSection.style.display = 'block';
                    break;
            }
        }
    });
}

function setupCommServerSelection(entry) {
    const commServerSelect = entry.querySelector('[data-name="commServerSelect"]');
    const manualFields = entry.querySelector('.commserver-manual-fields');
    
    if (!commServerSelect || !manualFields) return;
    
    // Populate existing comm servers
    populateExistingCommServers(entry);
    
    // Listen for comm server selection
    commServerSelect.addEventListener('click', function(e) {
        if (e.target.classList.contains('select-option')) {
            const value = e.target.getAttribute('data-value');
            
            if (value === 'manual' || value === '') {
                // Show manual input fields
                manualFields.style.display = 'block';
            } else {
                // Hide manual fields and populate with selected comm server data
                manualFields.style.display = 'none';
                populateCommServerData(entry, value);
            }
        }
    });
}

function populateExistingCommServers(entry) {
    const selectElement = entry.querySelector('.interface-commserver-list');
    if (!selectElement) return;
    
    // Keep "Bitte wählen" and "Manuell eingeben" options
    const existingOptions = Array.from(selectElement.querySelectorAll('.select-option[data-value=""], .select-option[data-value="manual"]'));
    selectElement.innerHTML = '';
    existingOptions.forEach(opt => selectElement.appendChild(opt));
    
    // TODO: Fetch from API/Database - CommunicationServer Entities
    // For now, check if there are CommunicationServers in componentCache
    if (window.componentCache && window.componentCache.commserver) {
        const commServers = window.componentCache.commserver;
        
        if (commServers.length > 0) {
            commServers.forEach(cs => {
                const option = document.createElement('div');
                option.className = 'select-option';
                option.setAttribute('data-value', cs.id);
                option.setAttribute('data-hostname', cs.hostname || '');
                option.setAttribute('data-name', cs.name || cs.hostname);
                option.textContent = cs.name || cs.hostname;
                selectElement.appendChild(option);
            });
        }
    }
}

function populateCommServerData(entry, commServerId) {
    // Get comm server data (from API or global store)
    // For now, get from data attributes
    const option = entry.querySelector(`.select-option[data-value="${commServerId}"]`);
    if (!option) return;
    
    const hostname = option.getAttribute('data-hostname');
    const name = option.getAttribute('data-name');
    
    // Populate fields
    const nameField = entry.querySelector('[name="commServerName"]');
    const hostField = entry.querySelector('[name="commServerHost"]');
    
    if (nameField) nameField.value = name;
    if (hostField) hostField.value = hostname;
}

export function refreshInterfaceComponents(entryOrNull = null) {
    const entries = entryOrNull 
        ? [entryOrNull] 
        : document.querySelectorAll('.dynamic-entry[data-type="medinterface"]');
    
    entries.forEach(entry => {
        const sourceSelect = entry.querySelector('.interface-source-components');
        const targetSelect = entry.querySelector('.interface-target-components');
        const commServerSelect = entry.querySelector('.interface-commserver-components');
        
        if (sourceSelect) {
            populateSourceComponents(sourceSelect);
        }
        
        if (targetSelect) {
            populateTargetComponents(targetSelect);
        }
        
        if (commServerSelect) {
            populateCommServerComponents(commServerSelect);
        }
    });
}

function populateSourceComponents(selectElement) {
    // Keep the "no selection" option
    const noSelection = selectElement.querySelector('[data-value=""]');
    selectElement.innerHTML = '';
    if (noSelection) {
        selectElement.appendChild(noSelection);
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

function populateTargetComponents(selectElement) {
    // Keep the "no selection" option
    const noSelection = selectElement.querySelector('[data-value=""]');
    selectElement.innerHTML = '';
    if (noSelection) {
        selectElement.appendChild(noSelection);
    }
    
    // Add Load Balancers
    const lbEntries = document.querySelectorAll('.dynamic-entry[data-type="loadbalancer"]');
    if (lbEntries.length > 0) {
        const lbGroup = document.createElement('div');
        lbGroup.className = 'select-option-group';
        lbGroup.innerHTML = '<div class="select-option-group-label">Load Balancer</div>';
        
        lbEntries.forEach((lb, index) => {
            const lbName = lb.querySelector('[name="lbName"]')?.value || 'Unbenannter LB';
            const option = document.createElement('div');
            option.className = 'select-option';
            option.setAttribute('data-value', `lb-${index}`);
            option.textContent = `LB: ${lbName}`;
            lbGroup.appendChild(option);
        });
        
        selectElement.appendChild(lbGroup);
    }
    
    // Add VMs and Hardware (same as source)
    populateSourceComponents(selectElement);
}

function populateCommServerComponents(selectElement) {
    // Same as source/target - VMs and Hardware can be comm servers
    populateSourceComponents(selectElement);
}
