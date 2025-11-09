import { initializeHelpTooltips } from './helptooltip.js';
import { initializeAllComponentSelects } from './componentlinking.js';
import { collectFormData } from './formcollector.js';

document.addEventListener('DOMContentLoaded', function() {
    initializeHelpTooltips();
    initializeAllComponentSelects();
    setupSIEMWizard();
});

function setupSIEMWizard() {
    const form = document.getElementById('newSIEMForm');
    if (!form) return;
    
    form.addEventListener('submit', handleSIEMSubmit);
    
    // Server Selection Handler
    setupServerSelection();
}

function setupServerSelection() {
    const serverSelect = document.querySelector('[data-name="serverid"]');
    const manualInput = document.getElementById('siem-server-manual');
    
    if (serverSelect) {
        const observer = new MutationObserver(() => {
            const value = serverSelect.dataset.value;
            if (manualInput) {
                manualInput.style.display = (value === 'manual') ? 'block' : 'none';
            }
        });
        observer.observe(serverSelect, { attributes: true });
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
            alert('SIEM-System erfolgreich erstellt!');
            window.location.href = '/assetmanagement/components';
        } else {
            alert('Fehler beim Erstellen:\n' + result.errors.join('\n'));
        }
    } catch (error) {
        console.error('API Error:', error);
        alert('Verbindungsfehler zur API');
    }
}
