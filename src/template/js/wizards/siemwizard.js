import { initializeAllComponentSelects } from './componentlinking.js';
import { initializeHelpTooltips } from './helptooltip.js';
import { collectFormData } from './formcollector.js';

document.addEventListener('DOMContentLoaded', function() {
    initializeAllComponentSelects();
    initializeHelpTooltips();
    setupSIEMWizard();
});

function setupSIEMWizard() {
    const form = document.getElementById('newSIEMForm');
    if (!form) return;
    
    form.addEventListener('submit', handleSIEMSubmit);
    
    // Distributed architecture toggle
    setupDistributedToggle();
}

function setupDistributedToggle() {
    const archSelect = document.querySelector('[data-name="architecture"]');
    const distributedFields = document.querySelector('.siem-distributed-config');
    
    if (archSelect && distributedFields) {
        const observer = new MutationObserver(() => {
            const value = archSelect.dataset.value;
            const showDistributed = (value === 'distributed' || value === 'hybrid');
            distributedFields.style.display = showDistributed ? 'block' : 'none';
        });
        observer.observe(archSelect, { attributes: true });
    }
}

async function handleSIEMSubmit(event) {
    event.preventDefault();
    
    const formData = collectFormData(event.target);
    console.log('SIEM System Data:', formData);
    
    try {
        const response = await fetch('/api/siems', {
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

            alert('SIEM-System erfolgreich erstellt!');
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
