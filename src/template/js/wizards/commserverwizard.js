import { initializeAllComponentSelects } from './componentlinking.js';
import { initializeHelpTooltips } from './helptooltip.js';

document.addEventListener('DOMContentLoaded', function() {
    // Initialize component linking
    initializeAllComponentSelects();

    // Initialize help tooltips
    initializeHelpTooltips();

    // Setup conditional fields
    setupCommServerConditionalFields();
    
    // Populate SIEM systems from global store or existing systems
    populateSIEMSystems();
    
    // Form submission handler
    const form = document.getElementById('newCommServerForm');
    if (form) {
        form.addEventListener('submit', handleFormSubmit);
    }
});

function setupCommServerConditionalFields() {
    // HA Configuration toggle
    const haCheckbox = document.getElementById('commServerHA');
    const haConfig = document.querySelector('.commserver-ha-config');
    
    if (haCheckbox && haConfig) {
        haCheckbox.addEventListener('change', function() {
            haConfig.style.display = this.checked ? 'block' : 'none';
        });
    }

    // SIEM Integration toggle
    const siemCheckbox = document.getElementById('commServerSIEM');
    const siemConfig = document.querySelector('.commserver-siem-config');
    
    if (siemCheckbox && siemConfig) {
        siemCheckbox.addEventListener('change', function() {
            siemConfig.style.display = this.checked ? 'block' : 'none';
        });
    }
}

function populateSIEMSystems() {
    const selectElement = document.querySelector('.commserver-siem-list');
    if (!selectElement) return;
    
    // TODO: Fetch from API or global component registry
    // For now, check if we're in a system context and can access SIEM systems
    
    // Try to get SIEM systems from system wizard context
    const siemSystems = getAvailableSIEMSystems();
    
    if (siemSystems && siemSystems.length > 0) {
        siemSystems.forEach(siem => {
            const option = document.createElement('div');
            option.className = 'select-option';
            option.setAttribute('data-value', siem.id);
            option.setAttribute('data-name', siem.name);
            option.setAttribute('data-type', siem.type);
            option.textContent = `${siem.name} (${siem.type})`;
            selectElement.appendChild(option);
        });
    } else {
        // Add placeholder if no SIEM systems available
        const noOption = document.createElement('div');
        noOption.className = 'select-option';
        noOption.setAttribute('data-value', 'none');
        noOption.textContent = 'Keine SIEM-Systeme verfügbar';
        noOption.style.fontStyle = 'italic';
        noOption.style.color = '#999';
        selectElement.appendChild(noOption);
    }
}

function getAvailableSIEMSystems() {
    // Try to get from global window context (if set by other modules)
    if (window.availableSIEMSystems) {
        return window.availableSIEMSystems;
    }
    
    // Try to get from localStorage (cached from previous API call)
    const cached = localStorage.getItem('availableSIEMSystems');
    if (cached) {
        try {
            return JSON.parse(cached);
        } catch (e) {
            console.error('Failed to parse cached SIEM systems', e);
        }
    }
    
    // TODO: Fetch from API
    // fetch('/api/components/siem').then(r => r.json()).then(data => {...});
    
    // Placeholder data for development
    return [
        { id: 'siem1', name: 'Splunk Enterprise', type: 'Splunk' },
        { id: 'siem2', name: 'QRadar SIEM', type: 'IBM QRadar' },
        { id: 'siem3', name: 'Elastic Security', type: 'Elastic' }
    ];
}

function handleFormSubmit(event) {
    event.preventDefault();
    
    const formData = new FormData(event.target);
    const data = {
        name: formData.get('commServerName'),
        type: formData.get('commServerType'),
        vendor: formData.get('commServerVendor'),
        version: formData.get('commServerVersion'),
        criticality: formData.get('commServerCriticality'),
        hostname: formData.get('commServerHostname'),
        ip: formData.get('commServerIP'),
        os: formData.get('commServerOS'),
        adminPort: formData.get('commServerAdminPort'),
        environment: formData.get('commServerEnvironment'),
        protocols: formData.getAll('commServerProtocols'),
        channelCount: formData.get('commServerChannelCount'),
        throughput: formData.get('commServerThroughput'),
        channels: formData.get('commServerChannels'),
        ha: formData.get('commServerHA') ? true : false,
        clusterType: formData.get('commServerClusterType'),
        nodeCount: formData.get('commServerNodeCount'),
        monitoring: formData.get('commServerMonitoring'),
        logRetention: formData.get('commServerLogRetention'),
        siem: {
            enabled: formData.get('commServerSIEM') ? true : false,
            systemId: formData.get('commServerSIEMSystem'),
            logFormat: formData.get('commServerSIEMLogFormat'),
            transport: formData.get('commServerSIEMTransport'),
            logTypes: formData.getAll('commServerSIEMLogTypes')
        },
        auth: formData.get('commServerAuth'),
        tls: formData.get('commServerTLS'),
        access: formData.get('commServerAccess'),
        maintenance: formData.get('commServerMaintenance'),
        lastUpdate: formData.get('commServerLastUpdate'),
        support: formData.get('commServerSupport'),
        notes: formData.get('commServerNotes')
    };
    
    console.log('Communication Server Data:', data);
    
    // TODO: Send data to backend API
    // fetch('/api/commservers', {
    //     method: 'POST',
    //     headers: { 'Content-Type': 'application/json' },
    //     body: JSON.stringify(data)
    // }).then(response => {
    //     if (response.ok) {
    //         window.location.href = '/assetmanagement/components';
    //     }
    // });
    
    alert('Kommunikationsserver würde jetzt gespeichert werden.');
}
