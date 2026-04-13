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

    getOrCreateInstanceUuid('newSIEMForm');
    cleanupOldInstances('newSIEMForm', 5);
    restoreFormData('newSIEMForm');
    enableAutoSave('newSIEMForm');

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
    if (!event.target.reportValidity()) return;

    const formData = collectFormData(event.target);
    console.log('SIEM System Data:', formData);

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

            alert('SIEM-System erfolgreich erstellt!');
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
    let uri = '/api/siems';
    return uri;
}