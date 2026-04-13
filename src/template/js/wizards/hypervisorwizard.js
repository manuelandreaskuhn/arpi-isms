import { initializeAllComponentSelects } from './componentlinking.js';
import { initializeHelpTooltips } from './helptooltip.js';
import { collectFormData } from './formcollector.js';
import { initializeWizardNavigation } from './wizardnavigation.js';
import { initConditionalFields } from './conditional-fields.js';
import {
    restoreFormData,
    enableAutoSave,
    clearFormData,
    saveSectionCounters,
    getOrCreateInstanceUuid,
    cleanupOldInstances
} from './form-persistence.js';
import { fillSoftwareInfo, hideSoftwareInfo } from './software-info.js';

document.addEventListener('DOMContentLoaded', function () {
    initializeAllComponentSelects();
    initializeHelpTooltips();
    initializeWizardNavigation();

    // Make saveSectionCounters globally accessible with updated signature
    window.saveSectionCounters = (formId, section = null) => saveSectionCounters(formId, section);

    // Initialize or restore UUID for this form instance
    getOrCreateInstanceUuid('newHypervisorForm');

    // Cleanup old instances (keep last 5)
    cleanupOldInstances('newHypervisorForm', 5);

    // Restore saved form data (including section counters)
    restoreFormData('newHypervisorForm');

    // Enable auto-save
    enableAutoSave('newHypervisorForm');

    initConditionalFields();
    setupHypervisorWizard();
});

function setupHypervisorWizard() {
    const form = document.getElementById('newHypervisorForm');
    if (!form) return;

    form.addEventListener('submit', handleHypervisorSubmit);

    // Software selection listener
    setupSoftwareListener();

    // Manual input toggles for component linking
    setupManualInputToggles();
}

function setupSoftwareListener() {
    const softwareSelect = document.querySelector('.custom-select[data-name="hypervisortype"]');

    if (softwareSelect) {
        const observer = new MutationObserver(() => {
            const value = softwareSelect.dataset.value;
            if (value && value !== '') {
                loadHypervisorSoftwareInfo(value);
            } else {
                hideSoftwareInfo('hypervisor-software-info-section');
            }
        });
        observer.observe(softwareSelect, { attributes: true, attributeFilter: ['data-value'] });
    }
}


function setupManualInputToggles() {
    // Monitoring manual input toggle
    const monitoringSelect = document.querySelector('[data-name="monitoringid"]');
    const monitoringManual = document.getElementById('monitoring-manual');

    if (monitoringSelect) {
        const observer = new MutationObserver(() => {
            const value = monitoringSelect.dataset.value;
            if (monitoringManual) {
                monitoringManual.style.display = (value === 'manual') ? 'block' : 'none';
            }
        });
        observer.observe(monitoringSelect, { attributes: true, attributeFilter: ['data-value'] });
    }

    // Backup manual input toggle
    const backupSelect = document.querySelector('[data-name="backupid"]');
    const backupManual = document.getElementById('backup-manual');

    if (backupSelect) {
        const observer = new MutationObserver(() => {
            const value = backupSelect.dataset.value;
            if (backupManual) {
                backupManual.style.display = (value === 'manual') ? 'block' : 'none';
            }
        });
        observer.observe(backupSelect, { attributes: true, attributeFilter: ['data-value'] });
    }
}

async function loadHypervisorSoftwareInfo(hypervisorId) {
    if (!hypervisorId || hypervisorId === 'other') {
        hideSoftwareInfo('hypervisor-software-info-section');
        return;
    }

    try {
        const response = await fetch(getDataUri(), {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json',
            },
            credentials: 'include'
        });

        const result = await response.json();

        if (result.success && result.data) {
            fillSoftwareInfo(result.data, 'hypervisor-software-info-section');
        } else {
            console.error('Failed to load hypervisor software info:', result.error);
            hideSoftwareInfo('hypervisor-software-info-section');
        }
    } catch (error) {
        console.error('API Error:', error);
        hideSoftwareInfo('hypervisor-software-info-section');
    }
}

function getDataUri() {
    let uri = '/api/data/hypervisor-software';
    const softwareSelect = document.querySelector('.custom-select[data-name="hypervisortype"]');
    if (softwareSelect) {
        const softwareId = softwareSelect.dataset.value;
        if (softwareId && softwareId !== '' && softwareId !== 'none' && softwareId !== 'other') {
            uri += `/${softwareId}`;
        }
    }
    return uri;
}

async function handleHypervisorSubmit(event) {
    event.preventDefault();
    if (!event.target.reportValidity()) return;

    const formData = collectFormData(event.target);
    console.log('Hypervisor Data:', formData);

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
            // Clear saved form data on successful submit
            clearFormData('newHypervisorForm');

            // Use global updateFormStatus function
            if (window.updateFormStatus) {
                window.updateFormStatus('saved');
            }

            alert('Hypervisor erfolgreich erstellt!');
            window.location.href = '/ComponentManagement.html';
        } else {
            alert('Fehler beim Erstellen:\n' + (result.errors ? result.errors.join('\n') : 'Unbekannter Fehler'));

            // Use global updateFormStatus function
            if (window.updateFormStatus) {
                window.updateFormStatus('error');
            }
        }
    } catch (error) {
        console.error('API Error:', error);
        alert('Verbindungsfehler zur API');

        // Use global updateFormStatus function
        if (window.updateFormStatus) {
            window.updateFormStatus('error');
        }
    }
}

function getFetchUri() {
    let uri = '/api/hypervisors';
    return uri;
}