import { initializeAllComponentSelects } from './componentlinking.js';
import { initializeHelpTooltips } from './helptooltip.js';
import { collectFormData } from './formcollector.js';

document.addEventListener('DOMContentLoaded', function() {
    // Initialize component linking
    initializeAllComponentSelects();

    // Initialize help tooltips
    initializeHelpTooltips();

    // Setup conditional fields
    setupCommServerConditionalFields();
    
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

async function handleFormSubmit(event) {
    event.preventDefault();
    
    const formData = collectFormData(event.target);
    console.log('Communication Server Data:', formData);
    
    try {
        const response = await fetch('/api/communication-servers', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(formData)
        });
        
        const result = await response.json();
        
        if (result.success) {
            alert('Kommunikationsserver erfolgreich erstellt!');
            window.location.href = '/assetmanagement/components';
        } else {
            alert('Fehler beim Erstellen:\n' + result.errors.join('\n'));
        }
    } catch (error) {
        console.error('API Error:', error);
        alert('Verbindungsfehler zur API');
    }
}
