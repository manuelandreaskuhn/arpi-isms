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
import { fillSoftwareInfo, hideSoftwareInfo } from './software-info.js';

document.addEventListener('DOMContentLoaded', function () {
    initializeAllComponentSelects();
    initializeHelpTooltips();
    initializeWizardNavigation();

    // Make saveSectionCounters globally accessible with updated signature
    window.saveSectionCounters = (formId, section = null) => saveSectionCounters(formId, section);

    // Initialize or restore UUID for this form instance
    getOrCreateInstanceUuid('newBackupSystemForm');

    // Cleanup old instances (keep last 5)
    cleanupOldInstances('newBackupSystemForm', 5);

    // Restore saved form data (including section counters)
    restoreFormData('newBackupSystemForm');

    // Enable auto-save
    enableAutoSave('newBackupSystemForm');

    setupBackupWizard();
});

function setupBackupWizard() {
    const form = document.getElementById('newBackupSystemForm');
    if (!form) return;

    form.addEventListener('submit', handleBackupSubmit);

    // Storage-Stufen Toggle
    setupStorageLevelToggle();

    // Server ID Selection Handler
    setupServerSelection();

    // Immutability Period Toggle
    setupImmutabilityToggles();

    // Software selection listener
    setupSoftwareListener();

    // Floating form management buttons
    setupFormManagementButtons();

    // Manual input toggles for component linking
    setupManualInputToggles();
}

function setupFormManagementButtons() {
    const saveBtn = document.getElementById('saveBackupForm');
    const form = document.getElementById('newBackupSystemForm');

    if (saveBtn && form) {
        saveBtn.addEventListener('click', () => {
            form.dispatchEvent(new Event('submit'));
        });
    }
}

function setupSoftwareListener() {
    const softwareSelect = document.querySelector('[data-name="software"]');
    if (softwareSelect) {
        const observer = new MutationObserver(() => {
            const value = softwareSelect.dataset.value;
            if (value && value !== '' && value !== 'other') {
                loadBackupSoftwareInfo(value);
            }
        });
        observer.observe(softwareSelect, { attributes: true, attributeFilter: ['data-value'] });
    }
}

async function loadBackupSoftwareInfo(softwareId) {
    try {
        const response = await fetch(`/api/data/backup-software/${softwareId}`);
        if (!response.ok) throw new Error('Software info not found');

        const result = await response.json();
        if (result.success && result.data) {
            fillSoftwareInfo(result.data, 'backup-software-info-section');
        } else {
            throw new Error(result.error || 'Failed to load software info');
        }
    } catch (error) {
        console.error('Error loading backup software info:', error);
        hideSoftwareInfo('backup-software-info-section');
    }
}

function setupStorageLevelToggle() {
    const storageLevelSelect = document.querySelector('[data-name="storagelevels"]');
    const tertiaryHeader = document.getElementById('tertiary-storage-header');
    const tertiaryConfig = document.getElementById('tertiary-storage-config');

    if (storageLevelSelect) {
        const observer = new MutationObserver(() => {
            const value = storageLevelSelect.dataset.value;
            const show = (value === '3-tier');
            if (tertiaryHeader) tertiaryHeader.style.display = show ? 'block' : 'none';
            if (tertiaryConfig) tertiaryConfig.style.display = show ? 'block' : 'none';
        });
        observer.observe(storageLevelSelect, { attributes: true });
    }
}

function setupServerSelection() {
    const serverSelect = document.querySelector('[data-name="serverid"]');
    const manualInput = document.getElementById('backup-server-manual');

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

function setupImmutabilityToggles() {
    // Secondary Immutability
    const secondaryImmutSelect = document.querySelector('[data-name="secondaryimmutability"]');
    const secondaryPeriod = document.getElementById('secondary-immutability-period');

    if (secondaryImmutSelect) {
        const observer = new MutationObserver(() => {
            const value = secondaryImmutSelect.dataset.value;
            if (secondaryPeriod) {
                secondaryPeriod.style.display = (value === 'enabled') ? 'block' : 'none';
            }
        });
        observer.observe(secondaryImmutSelect, { attributes: true });
    }

    // Tertiary Immutability
    const tertiaryImmutSelect = document.querySelector('[data-name="tertiaryimmutability"]');
    const tertiaryPeriod = document.getElementById('tertiary-immutability-period');

    if (tertiaryImmutSelect) {
        const observer = new MutationObserver(() => {
            const value = tertiaryImmutSelect.dataset.value;
            if (tertiaryPeriod) {
                tertiaryPeriod.style.display = (value === 'enabled') ? 'block' : 'none';
            }
        });
        observer.observe(tertiaryImmutSelect, { attributes: true });
    }
}

function setupManualInputToggles() {
    // Monitoring manual input toggle
    const monitoringSelect = document.querySelector('[data-name="monitoringintegration"]');
    const monitoringManual = document.getElementById('monitoring-integration-manual');

    if (monitoringSelect) {
        const observer = new MutationObserver(() => {
            const value = monitoringSelect.dataset.value;
            if (monitoringManual) {
                monitoringManual.style.display = (value === 'manual') ? 'block' : 'none';
            }
        });
        observer.observe(monitoringSelect, { attributes: true, attributeFilter: ['data-value'] });
    }
}

async function handleBackupSubmit(event) {
    event.preventDefault();
    if (!event.target.reportValidity()) return;

    // Formular-Daten sammeln
    const formData = collectFormData(event.target);

    console.log('Backup System Data:', formData);

    // An API senden
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

            alert('Backup-System erfolgreich erstellt!');
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
    let uri = '/api/backup-systems';
    return uri;
}