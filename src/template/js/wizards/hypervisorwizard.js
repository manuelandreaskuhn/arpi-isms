import { initializeAllComponentSelects } from './componentlinking.js';
import { initializeHelpTooltips } from './helptooltip.js';
import { collectFormData } from './formcollector.js';

document.addEventListener('DOMContentLoaded', function() {
    initializeAllComponentSelects();
    initializeHelpTooltips();
    setupHypervisorWizard();
});

function setupHypervisorWizard() {
    const form = document.getElementById('newHypervisorForm');
    if (!form) return;
    
    form.addEventListener('submit', handleHypervisorSubmit);
    
    // Cluster configuration toggle
    setupClusterToggle();
}

function setupClusterToggle() {
    const clusterSelect = document.querySelector('[data-name="cluster"]');
    const clusterFields = document.querySelector('.hypervisor-cluster-config');
    
    if (clusterSelect && clusterFields) {
        const observer = new MutationObserver(() => {
            const value = clusterSelect.dataset.value;
            clusterFields.style.display = (value === 'yes') ? 'block' : 'none';
        });
        observer.observe(clusterSelect, { attributes: true });
    }
}

async function handleHypervisorSubmit(event) {
    event.preventDefault();
    
    const formData = collectFormData(event.target);
    console.log('Hypervisor Data:', formData);
    
    try {
        const response = await fetch('/api/hypervisors', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(formData)
        });
        
        const result = await response.json();
        
        if (result.success) {
            alert('Hypervisor erfolgreich erstellt!');
            window.location.href = '/assetmanagement/components';
        } else {
            alert('Fehler beim Erstellen:\n' + result.errors.join('\n'));
        }
    } catch (error) {
        console.error('API Error:', error);
        alert('Verbindungsfehler zur API');
    }
}
