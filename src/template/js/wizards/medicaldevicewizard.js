import { initializeHelpTooltips } from './helptooltip.js';
import { collectFormData } from './formcollector.js';

document.addEventListener('DOMContentLoaded', function() {
    // Initialize help tooltips
    initializeHelpTooltips();
    setupMedicalDeviceWizard();
});

function setupMedicalDeviceWizard() {
    const form = document.getElementById('newMedicalDeviceForm');
    if (!form) return;
    
    form.addEventListener('submit', handleMedicalDeviceSubmit);
    
    // Conditional Fields
    setupConditionalFields();
}

function setupConditionalFields() {
    // Networked Toggle
    const networkedSelect = document.querySelector('[data-name="networked"]');
    const networkFields = document.querySelector('.meddevice-network-config');
    
    if (networkedSelect && networkFields) {
        const observer = new MutationObserver(() => {
            const value = networkedSelect.dataset.value;
            networkFields.style.display = (value === 'yes') ? 'block' : 'none';
        });
        observer.observe(networkedSelect, { attributes: true });
    }
    
    // Gateway Toggle
    const gatewaySelect = document.querySelector('[data-name="gateway"]');
    const gatewayFields = document.querySelector('.meddevice-gateway-config');
    
    if (gatewaySelect && gatewayFields) {
        const observer = new MutationObserver(() => {
            const value = gatewaySelect.dataset.value;
            gatewayFields.style.display = (value === 'yes') ? 'block' : 'none';
        });
        observer.observe(gatewaySelect, { attributes: true });
    }
}

async function handleMedicalDeviceSubmit(event) {
    event.preventDefault();
    
    const formData = collectFormData(event.target);
    console.log('Medical Device Data:', formData);
    
    try {
        const response = await fetch('/api/medical-devices', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(formData)
        });
        
        const result = await response.json();
        
        if (result.success) {
            alert('Medizingerät erfolgreich erstellt!');
            window.location.href = '/assetmanagement/components';
        } else {
            alert('Fehler beim Erstellen:\n' + result.errors.join('\n'));
        }
    } catch (error) {
        console.error('API Error:', error);
        alert('Verbindungsfehler zur API');
    }
}
