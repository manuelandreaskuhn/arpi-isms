import { initializeAllComponentSelects } from './componentlinking.js';
import { initializeHelpTooltips } from './helptooltip.js';
import { collectFormData } from './formcollector.js';

document.addEventListener('DOMContentLoaded', function() {
    initializeAllComponentSelects();
    initializeHelpTooltips();
    setupProxyWizard();
});

function setupProxyWizard() {
    const form = document.getElementById('newProxyForm');
    if (!form) return;
    
    form.addEventListener('submit', handleProxySubmit);
    
    // HA configuration toggle
    setupHAToggle();
}

function setupHAToggle() {
    const haSelect = document.querySelector('[data-name="ha"]');
    const haFields = document.querySelector('.proxy-ha-config');
    
    if (haSelect && haFields) {
        const observer = new MutationObserver(() => {
            const value = haSelect.dataset.value;
            const showHA = (value !== 'none' && value !== '');
            haFields.style.display = showHA ? 'block' : 'none';
        });
        observer.observe(haSelect, { attributes: true });
    }
}

async function handleProxySubmit(event) {
    event.preventDefault();
    
    const formData = collectFormData(event.target);
    console.log('Proxy Server Data:', formData);
    
    try {
        const response = await fetch('/api/proxies', {
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

            alert('Proxy-Server erfolgreich erstellt!');
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
