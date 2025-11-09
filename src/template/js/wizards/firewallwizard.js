import { initializeHelpTooltips } from './helptooltip.js';
import { initializeAllComponentSelects } from './componentlinking.js';
import { collectFormData } from './formcollector.js';

document.addEventListener('DOMContentLoaded', function() {
    // Initialize help tooltips
    initializeHelpTooltips();
    initializeAllComponentSelects();
    setupFirewallWizard();
});

function setupFirewallWizard() {
    const form = document.getElementById('newFirewallForm');
    if (!form) return;
    
    form.addEventListener('submit', handleFirewallSubmit);
}

async function handleFirewallSubmit(event) {
    event.preventDefault();
    
    const formData = collectFormData(event.target);
    console.log('Firewall Data:', formData);
    
    try {
        const response = await fetch('/api/firewalls', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(formData)
        });
        
        const result = await response.json();
        
        if (result.success) {
            alert('Firewall erfolgreich erstellt!');
            window.location.href = '/assetmanagement/components';
        } else {
            alert('Fehler beim Erstellen:\n' + result.errors.join('\n'));
        }
    } catch (error) {
        console.error('API Error:', error);
        alert('Verbindungsfehler zur API');
    }
}

// HA Configuration toggle
const haCheck = document.getElementById('fw-ha-check');
const haConfig = document.getElementById('fw-ha-config');

if (haCheck && haConfig) {
    haCheck.addEventListener('change', function() {
        haConfig.style.display = this.checked ? 'block' : 'none';
    });
}
