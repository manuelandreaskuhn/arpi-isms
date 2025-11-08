/**
 * Central Component Linking System
 * Manages dynamic population of select fields with component references
 */

// Component data cache
const componentCache = {
    vm: [],
    hardware: [],
    firewall: [],
    hypervisor: [],
    backup: [],
    siem: [],
    vpn: [],
    proxy: [],
    network: [],
    commserver: [],
    tiinfrastructure: [],
    loadbalancer: [],
    meddevice: []
};

/**
 * Initialize component linking for a specific select field
 * @param {HTMLElement} selectElement - The custom select element
 */
export function initializeComponentSelect(selectElement) {
    const componentTypes = selectElement.dataset.componentType?.split(',') || [];
    
    if (componentTypes.length === 0) {
        return; // No component linking needed
    }
    
    // Add observer for "manual" option selection
    const observer = new MutationObserver((mutations) => {
        mutations.forEach((mutation) => {
            if (mutation.type === 'attributes' && mutation.attributeName === 'data-value') {
                handleManualInputToggle(selectElement);
            }
        });
    });
    observer.observe(selectElement, { attributes: true });
    
    // Populate the select with components
    populateComponentSelect(selectElement, componentTypes);
}

/**
 * Populate select field with component options
 * @param {HTMLElement} selectElement - The custom select element
 * @param {Array<string>} componentTypes - Array of component types to include
 */
function populateComponentSelect(selectElement, componentTypes) {
    const dropdown = selectElement.querySelector('.select-options');
    if (!dropdown) return;
    
    // Keep first two options (empty and manual)
    const emptyOption = dropdown.querySelector('[data-value=""]');
    const manualOption = dropdown.querySelector('[data-value="manual"]');
    dropdown.innerHTML = '';
    if (emptyOption) dropdown.appendChild(emptyOption);
    if (manualOption) dropdown.appendChild(manualOption);
    
    // Add components by type
    componentTypes.forEach(type => {
        const components = getComponentsByType(type);
        
        if (components.length > 0) {
            // Add group header
            const groupHeader = document.createElement('div');
            groupHeader.className = 'select-group-header';
            groupHeader.textContent = getComponentTypeLabel(type);
            dropdown.appendChild(groupHeader);
            
            // Add component options
            components.forEach(component => {
                const option = document.createElement('div');
                option.className = 'select-option';
                option.dataset.value = `${type}-${component.id}`;
                option.dataset.componentType = type;
                option.dataset.componentId = component.id;
                option.textContent = formatComponentLabel(component, type);
                dropdown.appendChild(option);
            });
        }
    });
}

/**
 * Handle manual input toggle
 * @param {HTMLElement} selectElement - The custom select element
 */
function handleManualInputToggle(selectElement) {
    const value = selectElement.dataset.value;
    const parentGroup = selectElement.closest('.form-group');
    if (!parentGroup) return;
    
    // Find associated manual input field
    const manualFieldId = selectElement.dataset.name.replace('id', '') + '-manual';
    const manualField = document.getElementById(manualFieldId);
    
    if (manualField) {
        manualField.style.display = (value === 'manual') ? 'block' : 'none';
    }
}

/**
 * Get components by type (from cache or fetch from API)
 * @param {string} type - Component type
 * @returns {Array} Array of components
 */
function getComponentsByType(type) {
    // TODO: In production, fetch from API/database
    // For now, return from cache or collect from current page
    
    switch(type) {
        case 'vm':
            return collectVMsFromPage();
        case 'hardware':
            return collectHardwareFromPage();
        case 'firewall':
            return collectFirewallsFromPage();
        case 'commserver':
            return collectCommServersFromPage();
        case 'hypervisor':
            return collectHypervisorsFromPage();
        case 'tiinfrastructure':
            return collectTIInfrastructureFromPage();
        case 'loadbalancer':
            return collectLoadBalancersFromPage();
        case 'meddevice':
            return collectMedDevicesFromPage();
        default:
            return componentCache[type] || [];
    }
}

/**
 * Collect VMs from current page (System Wizard)
 * @returns {Array} Array of VM objects
 */
function collectVMsFromPage() {
    const vmEntries = document.querySelectorAll('#vmList .dynamic-entry[data-type="vm"]');
    return Array.from(vmEntries).map((e) => {
        const id = e.dataset.id;
        const hostInput = e.querySelector('input[name="hostname"]');
        const hostname = (hostInput && hostInput.value.trim()) || `VM #${id}`;
        const ipInput = e.querySelector('input[name="ipaddress"]');
        const ip = ipInput ? ipInput.value.trim() : '';
        return { id, hostname, ip };
    });
}

/**
 * Collect Hardware from current page (System Wizard)
 * @returns {Array} Array of Hardware objects
 */
function collectHardwareFromPage() {
    const hwEntries = document.querySelectorAll('#hardwareList .dynamic-entry[data-type="hardware"]');
    return Array.from(hwEntries).map((e) => {
        const id = e.dataset.id;
        const hostInput = e.querySelector('input[name="hostname"]');
        const hostname = (hostInput && hostInput.value.trim()) || `Server #${id}`;
        const ipInput = e.querySelector('input[name="ipaddress"]');
        const ip = ipInput ? ipInput.value.trim() : '';
        return { id, hostname, ip };
    });
}

/**
 * Collect Firewalls from database/API
 * @returns {Array} Array of Firewall objects
 */
function collectFirewallsFromPage() {
    // TODO: Fetch from API
    // Example data:
    return [
        { id: 'fw-1', name: 'FW-DMZ-01', type: 'Palo Alto PA-5220' },
        { id: 'fw-2', name: 'FW-Internal-01', type: 'Fortinet FortiGate' }
    ];
}

/**
 * Collect Communication Servers from current page (System Wizard)
 * @returns {Array} Array of CommServer objects
 */
function collectCommServersFromPage() {
    // Check if we're in a system wizard with commserver section
    const commserverSection = document.querySelector('.form-section[data-name="commserver"]');
    if (!commserverSection || commserverSection.style.display === 'none') {
        return componentCache.commserver || [];
    }

    // If there's a commserver configuration, collect it
    const nameInput = commserverSection.querySelector('input[name="commservername"]');
    if (nameInput && nameInput.value.trim()) {
        const typeSelect = commserverSection.querySelector('[data-name="commservertype"]');
        return [{
            id: '1',
            name: nameInput.value.trim(),
            type: typeSelect ? typeSelect.dataset.value : ''
        }];
    }

    return componentCache.commserver || [];
}

/**
 * Collect Hypervisors from current page (System Wizard)
 * @returns {Array} Array of Hypervisor objects
 */
function collectHypervisorsFromPage() {
    // Check if we're in a system wizard with hypervisor section
    const hypervisorSection = document.querySelector('.form-section[data-name="hypervisor"]');
    if (!hypervisorSection || hypervisorSection.style.display === 'none') {
        return componentCache.hypervisor || [];
    }

    // If there's a hypervisor configuration, collect it
    const nameInput = hypervisorSection.querySelector('input[name="hypervisorname"]');
    if (nameInput && nameInput.value.trim()) {
        const typeSelect = hypervisorSection.querySelector('[data-name="hypervisortype"]');
        return [{
            id: '1',
            name: nameInput.value.trim(),
            type: typeSelect ? typeSelect.dataset.value : ''
        }];
    }

    return componentCache.hypervisor || [];
}

/**
 * Collect TI-Infrastructure from current page (System Wizard)
 * @returns {Array} Array of TI-Infrastructure objects
 */
function collectTIInfrastructureFromPage() {
    // Check if we're in a system wizard with TI section
    const tiSection = document.querySelector('.form-section[data-name="gematicti"]');
    if (!tiSection || tiSection.style.display === 'none') {
        return componentCache.tiinfrastructure || [];
    }

    // Check if TI is actually connected
    const tiConnectedCheck = tiSection.querySelector('.ti-connected-check');
    if (!tiConnectedCheck || !tiConnectedCheck.checked) {
        return componentCache.tiinfrastructure || [];
    }

    // If there's TI infrastructure configured, collect it
    const tiSelect = tiSection.querySelector('[data-name="tiinfrastrukturid"]');
    const manualInput = tiSection.querySelector('input[name="tiinfrastructurname"]');
    
    if (tiSelect && tiSelect.dataset.value && tiSelect.dataset.value !== 'manual' && tiSelect.dataset.value !== '') {
        // Extract from select value
        const selectedOption = tiSelect.querySelector(`.select-option[data-value="${tiSelect.dataset.value}"]`);
        if (selectedOption) {
            return [{
                id: tiSelect.dataset.value,
                name: selectedOption.textContent.trim(),
                type: 'TI-Konnektor'
            }];
        }
    } else if (manualInput && manualInput.value.trim()) {
        // Manual input
        return [{
            id: 'manual-1',
            name: manualInput.value.trim(),
            type: 'TI-Konnektor'
        }];
    }

    return componentCache.tiinfrastructure || [];
}

/**
 * Get human-readable label for component type
 * @param {string} type - Component type
 * @returns {string} Label
 */
function getComponentTypeLabel(type) {
    const labels = {
        'vm': 'Virtuelle Maschinen',
        'hardware': 'Hardware Server',
        'firewall': 'Firewall-Komponenten',
        'hypervisor': 'Hypervisoren',
        'backup': 'Backup-Systeme',
        'siem': 'SIEM-Systeme',
        'vpn': 'VPN-Gateways',
        'proxy': 'Proxy-Server',
        'network': 'Netzwerke',
        'commserver': 'Kommunikationsserver',
        'tiinfrastructure': 'TI-Infrastruktur-Komponenten',
        'loadbalancer': 'Load Balancer',
        'meddevice': 'Medizingeräte'
    };
    return labels[type] || type;
}

/**
 * Format component label for display
 * @param {Object} component - Component object
 * @param {string} type - Component type
 * @returns {string} Formatted label
 */
function formatComponentLabel(component, type) {
    switch(type) {
        case 'vm':
        case 'hardware':
            return component.ip 
                ? `${component.hostname} (${component.ip})`
                : component.hostname;
        case 'firewall':
        case 'commserver':
        case 'hypervisor':
        case 'tiinfrastructure':
        case 'loadbalancer':
        case 'meddevice':
            return component.type 
                ? `${component.name} (${component.type})`
                : component.name;
        default:
            return component.name || component.hostname || `${type} #${component.id}`;
    }
}

/**
 * Refresh all component selects on the page
 */
export function refreshAllComponentSelects() {
    const componentSelects = document.querySelectorAll('.custom-select[data-component-type]');
    componentSelects.forEach(select => {
        const componentTypes = select.dataset.componentType?.split(',') || [];
        if (componentTypes.length > 0) {
            populateComponentSelect(select, componentTypes);
        }
    });
}

/**
 * Update component cache with new data
 * @param {string} type - Component type
 * @param {Array} components - Array of component objects
 */
export function updateComponentCache(type, components) {
    componentCache[type] = components;
    refreshAllComponentSelects();
}

/**
 * Initialize all component selects on page load
 */
export function initializeAllComponentSelects() {
    const componentSelects = document.querySelectorAll('.custom-select[data-component-type]');
    componentSelects.forEach(select => {
        initializeComponentSelect(select);
    });
}
