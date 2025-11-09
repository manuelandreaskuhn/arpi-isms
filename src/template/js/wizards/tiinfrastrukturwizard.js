import { initializeAllComponentSelects } from './componentlinking.js';
import { initializeHelpTooltips } from './helptooltip.js';
import { collectFormData } from './formcollector.js';

document.addEventListener('DOMContentLoaded', function() {
    initializeAllComponentSelects();
    initializeHelpTooltips();
    setupTIWizard();
});

function setupTIWizard() {
    const form = document.getElementById('newTIInfrastructureForm');
    if (!form) return;
    
    form.addEventListener('submit', handleTISubmit);
    
    // Konfiguration Toggle
    setupKonfigurationToggle();
}

function setupKonfigurationToggle() {
    const konfigSelect = document.querySelector('[data-name="konfiguration"]');
    const redundantFields = document.querySelector('.ti-redundant-config');
    
    if (konfigSelect && redundantFields) {
        const observer = new MutationObserver(() => {
            const value = konfigSelect.dataset.value;
            const show = (value === 'redundant' || value === 'cluster');
            redundantFields.style.display = show ? 'block' : 'none';
        });
        observer.observe(konfigSelect, { attributes: true });
    }
}

async function handleTISubmit(event) {
    event.preventDefault();
    
    const formData = collectFormData(event.target);
    console.log('TI Infrastructure Data:', formData);
    
    try {
        const response = await fetch('/api/ti-infrastructures', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(formData)
        });
        
        const result = await response.json();
        
        if (result.success) {
            alert('TI-Infrastruktur erfolgreich erstellt!');
            window.location.href = '/assetmanagement/components';
        } else {
            alert('Fehler beim Erstellen:\n' + result.errors.join('\n'));
        }
    } catch (error) {
        console.error('API Error:', error);
        alert('Verbindungsfehler zur API');
    }
}
