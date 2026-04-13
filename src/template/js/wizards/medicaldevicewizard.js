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

    getOrCreateInstanceUuid('newMedicalDeviceForm');
    cleanupOldInstances('newMedicalDeviceForm', 5);
    restoreFormData('newMedicalDeviceForm');
    enableAutoSave('newMedicalDeviceForm');

    setupMedicalDeviceWizard();
});

function setupMedicalDeviceWizard() {
    const form = document.getElementById('newMedicalDeviceForm');
    if (!form) return;

    form.addEventListener('submit', handleMedicalDeviceSubmit);

    // Conditional Fields
    setupConditionalFields();
}

function setupConditionalFields() {
    // Networked Toggle
    const networkedSelect = document.querySelector('[data-name="networked"]');
    const networkFields = document.querySelector('.meddevice-network-config');

    if (networkedSelect && networkFields) {
        const observer = new MutationObserver(() => {
            const value = networkedSelect.dataset.value;
            networkFields.style.display = (value === 'yes') ? 'block' : 'none';
        });
        observer.observe(networkedSelect, { attributes: true });
    }

    // Gateway Toggle
    const gatewaySelect = document.querySelector('[data-name="gateway"]');
    const gatewayFields = document.querySelector('.meddevice-gateway-config');

    if (gatewaySelect && gatewayFields) {
        const observer = new MutationObserver(() => {
            const value = gatewaySelect.dataset.value;
            gatewayFields.style.display = (value === 'yes') ? 'block' : 'none';
        });
        observer.observe(gatewaySelect, { attributes: true });
    }
}

async function handleMedicalDeviceSubmit(event) {
    event.preventDefault();
    if (!event.target.reportValidity()) return;

    const formData = collectFormData(event.target);
    console.log('Medical Device Data:', formData);

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

            alert('Medizingerät erfolgreich erstellt!');
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
    let uri = '/api/medical-devices';
    return uri;
}