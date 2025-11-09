import { initializeHelpTooltips } from './helptooltip.js';
import { initializeAllComponentSelects } from './componentlinking.js';
import { collectFormData } from './formcollector.js';

document.addEventListener('DOMContentLoaded', function() {
    initializeHelpTooltips();
    initializeAllComponentSelects();
    setupProxyWizard();
});

function setupProxyWizard() {
    const form = document.getElementById('newProxyForm');
    if (!form) return;
    
    form.addEventListener('submit', handleProxySubmit);
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
            alert('Proxy-Server erfolgreich erstellt!');
            window.location.href = '/assetmanagement/components';
        } else {
            alert('Fehler beim Erstellen:\n' + result.errors.join('\n'));
        }
    } catch (error) {
        console.error('API Error:', error);
        alert('Verbindungsfehler zur API');
    }
}
