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
                hideHypervisorSoftwareInfo();
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
        hideHypervisorSoftwareInfo();
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
            fillHypervisorSoftwareInfo(result.data);
        } else {
            console.error('Failed to load hypervisor software info:', result.error);
            hideHypervisorSoftwareInfo();
        }
    } catch (error) {
        console.error('API Error:', error);
        hideHypervisorSoftwareInfo();
    }
}

function fillHypervisorSoftwareInfo(data) {
    // hypervisor-software-info-section toggle
    const section = document.getElementById('hypervisor-software-info-section');
    if (section && section.classList.contains('collapsed')) {
        section.classList.remove('collapsed');
    }

    const infoDiv = document.querySelector('.software-info-container');
    if (!infoDiv) return;

    // Title
    const title = infoDiv.querySelector('.software-info-title');
    if (title) title.textContent = data.name || '';

    // Grid items
    const category = document.getElementById('sw-category');
    const vendor = infoDiv.querySelector('.software-vendor');
    const type = document.getElementById('sw-type');

    if (category) category.textContent = data.category || '-';
    if (vendor) vendor.textContent = data.vendor || '-';
    if (type) type.textContent = data.type || '-';

    // Description
    const description = document.getElementById('sw-description');
    if (description) description.textContent = data.description || '';

    // Features
    const featuresContainer = document.getElementById('sw-features');
    if (featuresContainer && data.features) {
        featuresContainer.innerHTML = data.features
            .map(feature => `<span class="feature-tag">${feature}</span>`)
            .join('');
    }

    // Platforms
    const platformsContainer = document.getElementById('sw-platforms');
    if (platformsContainer && data.platforms) {
        platformsContainer.innerHTML = data.platforms
            .map(platform => `<span class="platform-tag">${platform}</span>`)
            .join('');
    }

    // License Model
    const licenseContainer = document.getElementById('sw-license');
    if (licenseContainer && data.licenseModel) {
        licenseContainer.innerHTML = data.licenseModel
            .map(license => `<span class="license-tag">${license}</span>`)
            .join('');
    }

    // Use Cases
    const useCasesContainer = document.getElementById('sw-usecases');
    if (useCasesContainer && data.useCases) {
        useCasesContainer.innerHTML = data.useCases
            .map(useCase => `<span class="usecase-tag">${useCase}</span>`)
            .join('');
    }

    // Pricing
    const pricing = document.getElementById('sw-pricing');
    if (pricing) pricing.textContent = data.pricing || '-';

    // Notes
    const notes = document.getElementById('sw-notes');
    if (notes) notes.textContent = data.notes || '';

    // CPE Identifiers
    const cpeContainer = document.getElementById('sw-cpe');
    if (cpeContainer && data.cpe) {
        cpeContainer.innerHTML = data.cpe
            .map(cpe => `<div class="cpe-item">${cpe}</div>`)
            .join('');
    }
}

function hideHypervisorSoftwareInfo() {
    // Collapse the section
    const section = document.getElementById('hypervisor-software-info-section');
    if (section && !section.classList.contains('collapsed')) {
        section.classList.add('collapsed');
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