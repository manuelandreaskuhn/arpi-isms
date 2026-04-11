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
            fillBackupSoftwareInfo(result.data);

            // Show info section
            const infoSection = document.getElementById('backup-software-info-section');
            if (infoSection) {
                infoSection.classList.remove('collapsed');
            }
        } else {
            throw new Error(result.error || 'Failed to load software info');
        }
    } catch (error) {
        console.error('Error loading backup software info:', error);

        // Hide info section on error
        const infoSection = document.getElementById('backup-software-info-section');
        if (infoSection) {
            infoSection.classList.add('collapsed');
        }
    }
}

function fillBackupSoftwareInfo(data) {
    // Title and vendor
    const titleEl = document.querySelector('.software-info-title');
    const vendorEl = document.querySelector('.software-vendor');
    if (titleEl) titleEl.textContent = data.name || '-';
    if (vendorEl) vendorEl.textContent = data.vendor || '-';

    // Category and type
    document.getElementById('sw-category').textContent = data.category || '-';
    document.getElementById('sw-type').textContent = data.type || '-';

    // Description
    document.getElementById('sw-description').textContent = data.description || 'Keine Beschreibung verfügbar.';

    // Features
    const featuresEl = document.getElementById('sw-features');
    if (data.features && data.features.length > 0) {
        featuresEl.innerHTML = data.features.map(f => `<span class="badge">${f}</span>`).join('');
    } else {
        featuresEl.textContent = '-';
    }

    // Platforms
    const platformsEl = document.getElementById('sw-platforms');
    if (data.platforms && data.platforms.length > 0) {
        platformsEl.innerHTML = data.platforms.map(p => `<span class="badge">${p}</span>`).join('');
    } else {
        platformsEl.textContent = '-';
    }

    // License models
    const licenseEl = document.getElementById('sw-license');
    if (data.licenseModel && data.licenseModel.length > 0) {
        licenseEl.innerHTML = data.licenseModel.map(l => `<span class="badge">${l}</span>`).join('');
    } else {
        licenseEl.textContent = '-';
    }

    // Pricing
    document.getElementById('sw-pricing').textContent = data.pricing || '-';

    // Notes
    document.getElementById('sw-notes').textContent = data.notes || '-';

    // CPE identifiers
    const cpeEl = document.getElementById('sw-cpe');
    if (data.cpe && data.cpe.length > 0) {
        cpeEl.innerHTML = data.cpe.map(c => `<code class="cpe-id">${c}</code>`).join('');
    } else {
        cpeEl.textContent = '-';
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