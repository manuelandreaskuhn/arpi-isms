import { initializeAllComponentSelects } from './componentlinking.js';
import { initializeHelpTooltips } from './helptooltip.js';
import { collectFormData } from './formcollector.js';

document.addEventListener('DOMContentLoaded', function() {
    // Initialize component linking
    initializeAllComponentSelects();

    // Initialize help tooltips
    initializeHelpTooltips();

    // Setup communication server wizard
    setupComServerWizard();
});

function setupComServerWizard() {
    const form = document.getElementById('newComServerForm');
    if (!form) return;
    
    form.addEventListener('submit', handleComServerSubmit);
    
    // HA configuration toggle
    setupHAToggle();
}

function setupHAToggle() {
    const haSelect = document.querySelector('[data-name="ha"]');
    const haFields = document.querySelector('.comserver-ha-config');
    
    if (haSelect && haFields) {
        const observer = new MutationObserver(() => {
            const value = haSelect.dataset.value;
            const showHA = (value === 'active-active' || value === 'active-passive' || value === 'cluster');
            haFields.style.display = showHA ? 'block' : 'none';
        });
        observer.observe(haSelect, { attributes: true });
    }
}

async function handleComServerSubmit(event) {
    event.preventDefault();
    
    const formData = collectFormData(event.target);
    console.log('Communication Server Data:', formData);
    
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

            alert('Kommunikationsserver erfolgreich erstellt!');
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
    let uri = '/api/communication-servers';
    return uri;
}