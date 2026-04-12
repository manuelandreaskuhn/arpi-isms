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

    getOrCreateInstanceUuid('newLoadBalancerForm');
    cleanupOldInstances('newLoadBalancerForm', 5);
    restoreFormData('newLoadBalancerForm');
    enableAutoSave('newLoadBalancerForm');

    setupLoadBalancerWizard();
});

function setupLoadBalancerWizard() {
    const form = document.getElementById('newLoadBalancerForm');
    if (!form) return;

    form.addEventListener('submit', handleLoadBalancerSubmit);

    setupSoftwareListener();
    setupManualInputToggles();
}

function setupSoftwareListener() {
    const softwareSelect = document.querySelector('.custom-select[data-name="type"]');

    if (softwareSelect) {
        const observer = new MutationObserver(() => {
            const value = softwareSelect.dataset.value;
            if (value && value !== '') {
                loadLBSoftwareInfo(value);
            } else {
                hideLBSoftwareInfo();
            }
        });
        observer.observe(softwareSelect, { attributes: true, attributeFilter: ['data-value'] });
    }
}

function setupManualInputToggles() {
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
}

async function loadLBSoftwareInfo(lbId) {
    if (!lbId || lbId === 'other') {
        hideLBSoftwareInfo();
        return;
    }

    try {
        const response = await fetch(`/api/data/loadbalancer-software/${lbId}`, {
            method: 'GET',
            headers: { 'Content-Type': 'application/json' },
            credentials: 'include'
        });

        const result = await response.json();

        if (result.success && result.data) {
            fillLBSoftwareInfo(result.data);
        } else {
            hideLBSoftwareInfo();
        }
    } catch (error) {
        console.error('API Error:', error);
        hideLBSoftwareInfo();
    }
}

function fillLBSoftwareInfo(data) {
    const section = document.getElementById('lb-software-info-section');
    if (section && section.classList.contains('collapsed')) {
        section.classList.remove('collapsed');
    }

    const infoDiv = document.querySelector('.software-info-container');
    if (!infoDiv) return;

    const title = infoDiv.querySelector('.software-info-title');
    if (title) title.textContent = data.name || '';

    const vendor = infoDiv.querySelector('.software-vendor');
    if (vendor) vendor.textContent = data.vendor || '-';

    const category = document.getElementById('sw-category');
    if (category) category.textContent = data.category || '-';

    const type = document.getElementById('sw-type');
    if (type) type.textContent = data.type || '-';

    const description = document.getElementById('sw-description');
    if (description) description.textContent = data.description || '';

    const featuresContainer = document.getElementById('sw-features');
    if (featuresContainer && data.features) {
        featuresContainer.innerHTML = data.features
            .map(f => `<span class="feature-tag">${f}</span>`).join('');
    }

    const pricing = document.getElementById('sw-pricing');
    if (pricing) pricing.textContent = data.pricing || '-';

    const notes = document.getElementById('sw-notes');
    if (notes) notes.textContent = data.notes || '';
}

function hideLBSoftwareInfo() {
    const section = document.getElementById('lb-software-info-section');
    if (section && !section.classList.contains('collapsed')) {
        section.classList.add('collapsed');
    }
}

async function handleLoadBalancerSubmit(event) {
    event.preventDefault();

    const formData = collectFormData(event.target);
    console.log('Load Balancer Data:', formData);

    try {
        const response = await fetch('/api/load-balancers', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            credentials: 'include',
            body: JSON.stringify(formData)
        });

        const result = await response.json();
        if (result.success) {
            clearFormData('newLoadBalancerForm');

            if (window.updateFormStatus) {
                window.updateFormStatus('saved');
            }

            alert('Load Balancer erfolgreich erstellt!');
            window.location.href = '/ComponentManagement.html';
        } else {
            alert('Fehler beim Erstellen:\n' + (result.errors ? result.errors.join('\n') : 'Unbekannter Fehler'));

            if (window.updateFormStatus) {
                window.updateFormStatus('error');
            }
        }
    } catch (error) {
        console.error('API Error:', error);
        alert('Verbindungsfehler zur API');

        if (window.updateFormStatus) {
            window.updateFormStatus('error');
        }
    }
}
