import { initializeAllComponentSelects } from './componentlinking.js';
import { initializeHelpTooltips } from './helptooltip.js';
import { collectFormData } from './formcollector.js';

document.addEventListener('DOMContentLoaded', function() {
    initializeAllComponentSelects();
    initializeHelpTooltips();
    setupFirewallWizard();
});

function setupFirewallWizard() {
    const form = document.getElementById('newFirewallForm');
    if (!form) return;
    
    form.addEventListener('submit', handleFirewallSubmit);
    
    // Conditional fields based on firewall type
    setupFirewallTypeToggle();
}

function setupFirewallTypeToggle() {
    const typeSelect = document.querySelector('[data-name="type"]');
    const clusterFields = document.querySelector('.firewall-cluster-config');
    
    if (typeSelect && clusterFields) {
        const observer = new MutationObserver(() => {
            const value = typeSelect.dataset.value;
            const showCluster = (value === 'cluster' || value === 'ha-pair');
            clusterFields.style.display = showCluster ? 'block' : 'none';
        });
        observer.observe(typeSelect, { attributes: true });
    }
}

async function handleFirewallSubmit(event) {
    event.preventDefault();
    
    const formData = collectFormData(event.target);
    console.log('Firewall Data:', formData);
    
    try {
        const response = await fetch(getFetchUri(), {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            credentials: 'include',
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

            alert('Firewall erfolgreich erstellt!');
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

function getFetchUri() {
    let uri = '/api/firewalls';
    return uri;
}

// HA Configuration toggle
const haCheck = document.getElementById('fw-ha-check');
const haConfig = document.getElementById('fw-ha-config');

if (haCheck && haConfig) {
    haCheck.addEventListener('change', function() {
        haConfig.style.display = this.checked ? 'block' : 'none';
    });
}

