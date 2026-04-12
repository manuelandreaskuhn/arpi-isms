import { initializeAllComponentSelects } from './componentlinking.js';
import { initializeHelpTooltips } from './helptooltip.js';
import { collectFormData } from './formcollector.js';
import { initializeWizardNavigation } from './wizardnavigation.js';
import {
    restoreFormData,
    enableAutoSave,
    clearFormData,
    saveSectionCounters,
    getOrCreateInstanceUuid,
    cleanupOldInstances
} from './form-persistence.js';

document.addEventListener('DOMContentLoaded', function () {
    initializeAllComponentSelects();
    initializeHelpTooltips();
    initializeWizardNavigation();

    window.saveSectionCounters = (formId, section = null) => saveSectionCounters(formId, section);

    getOrCreateInstanceUuid('newNetworkForm');
    cleanupOldInstances('newNetworkForm', 5);
    restoreFormData('newNetworkForm');
    enableAutoSave('newNetworkForm');

    setupNetworkWizard();
});

function setupNetworkWizard() {
    const form = document.getElementById('newNetworkForm');
    if (!form) return;

    form.addEventListener('submit', handleNetworkSubmit);

    // DHCP Toggle
    setupDHCPToggle();
}

function setupDHCPToggle() {
    const dhcpSelect = document.querySelector('[data-name="dhcp"]');
    const dhcpRangeField = document.getElementById('dhcp-range-field');

    if (dhcpSelect && dhcpRangeField) {
        const observer = new MutationObserver(() => {
            const value = dhcpSelect.dataset.value;
            dhcpRangeField.style.display = (value === 'enabled') ? 'block' : 'none';
        });
        observer.observe(dhcpSelect, { attributes: true });
    }
}

async function handleNetworkSubmit(event) {
    event.preventDefault();

    const formData = collectFormData(event.target);
    console.log('Network Data:', formData);

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

            alert('Netzwerk erfolgreich erstellt!');
            window.location.href = '/ComponentManagement.html';
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
    let uri = '/api/networks';
    return uri;
}