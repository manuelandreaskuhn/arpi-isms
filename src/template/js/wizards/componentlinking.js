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
    network: []
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
        'network': 'Netzwerke'
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
