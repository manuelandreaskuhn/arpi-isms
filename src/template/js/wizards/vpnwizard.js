import { initializeAllComponentSelects } from './componentlinking.js';
import { initializeHelpTooltips } from './helptooltip.js';
import { collectFormData } from './formcollector.js';

document.addEventListener('DOMContentLoaded', function() {
    // Initialize component linking
    initializeAllComponentSelects();

    // Initialize help tooltips
    initializeHelpTooltips();
    
    // Setup VPN wizard
    setupVPNWizard();
    
    console.log('VPN Wizard initialized');
});

function setupVPNWizard() {
    const form = document.getElementById('newVPNForm');
    if (!form) return;
    
    form.addEventListener('submit', handleVPNSubmit);
    
    // Gateway manual input toggle
    setupGatewayToggle();
    
    // Secondary gateway manual input toggle
    setupSecondaryGatewayToggle();
}

function setupGatewayToggle() {
    const gatewaySelect = document.querySelector('[data-name="gatewayid"]');
    const manualInput = document.getElementById('vpn-gateway-manual');
    
    if (gatewaySelect && manualInput) {
        const observer = new MutationObserver(() => {
            const value = gatewaySelect.dataset.value;
            manualInput.style.display = (value === 'manual') ? 'block' : 'none';
        });
        observer.observe(gatewaySelect, { attributes: true });
    }
}

function setupSecondaryGatewayToggle() {
    const secondarySelect = document.querySelector('[data-name="secondarygatewayid"]');
    const manualInput = document.getElementById('secondary-gateway-manual');
    
    if (secondarySelect && manualInput) {
        const observer = new MutationObserver(() => {
            const value = secondarySelect.dataset.value;
            manualInput.style.display = (value === 'manual') ? 'block' : 'none';
        });
        observer.observe(secondarySelect, { attributes: true });
    }
}

async function handleVPNSubmit(event) {
    event.preventDefault();
    
    const formData = collectFormData(event.target);
    console.log('VPN Data:', formData);
    
    try {
        const response = await fetch('/api/vpns', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(formData)
        });
        
        const result = await response.json();
        if (result.success) {
            let lastchangespan = document.querySelector(".formmanagement > span.form-status");
            if (lastchangespan) {
                lastchangespan.textContent = 'Gespeichert am ' + new Date().toLocaleString();
                lastchangespan.dataset.lastchange = new Date().toISOString();
                lastchangespan.dataset.status = 'saved';
            }

            alert('VPN-System erfolgreich erstellt!');
            window.location.href = '/assetmanagement/components';
        } else {
            alert('Fehler beim Erstellen:\n' + result.errors.join('\n'));

            let lastchangespan = document.querySelector(".formmanagement > span.form-status");
            if (lastchangespan) {
                lastchangespan.dataset.status = 'error';
            }
        }
    } catch (error) {
        console.error('API Error:', error);
        alert('Verbindungsfehler zur API');
    }
}
