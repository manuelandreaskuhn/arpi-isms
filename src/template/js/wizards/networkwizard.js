import { initializeAllComponentSelects } from './componentlinking.js';
import { initializeHelpTooltips } from './helptooltip.js';
import { collectFormData } from './formcollector.js';

document.addEventListener('DOMContentLoaded', function() {
    initializeAllComponentSelects();
    initializeHelpTooltips();
    setupNetworkWizard();
});

function setupNetworkWizard() {
    const form = document.getElementById('newNetworkForm');
    if (!form) return;
    
    form.addEventListener('submit', handleNetworkSubmit);
    
    // DHCP Toggle
    setupDHCPToggle();
}

function setupDHCPToggle() {
    const dhcpSelect = document.querySelector('[data-name="dhcp"]');
    const dhcpRangeField = document.getElementById('dhcp-range-field');
    
    if (dhcpSelect && dhcpRangeField) {
        const observer = new MutationObserver(() => {
            const value = dhcpSelect.dataset.value;
            dhcpRangeField.style.display = (value === 'enabled') ? 'block' : 'none';
        });
        observer.observe(dhcpSelect, { attributes: true });
    }
}

async function handleNetworkSubmit(event) {
    event.preventDefault();
    
    const formData = collectFormData(event.target);
    console.log('Network Data:', formData);
    
    try {
        const response = await fetch('/api/networks', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(formData)
        });
        
        const result = await response.json();
        
        if (result.success) {
            alert('Netzwerk erfolgreich erstellt!');
            window.location.href = '/assetmanagement/components';
        } else {
            alert('Fehler beim Erstellen:\n' + result.errors.join('\n'));
        }
    } catch (error) {
        console.error('API Error:', error);
        alert('Verbindungsfehler zur API');
    }
}
