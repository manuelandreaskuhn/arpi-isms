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
                hideSoftwareInfo('lb-software-info-section');
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
        hideSoftwareInfo('lb-software-info-section');
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
            fillSoftwareInfo(result.data, 'lb-software-info-section');
        } else {
            hideSoftwareInfo('lb-software-info-section');
        }
    } catch (error) {
        console.error('API Error:', error);
        hideSoftwareInfo('lb-software-info-section');
    }
}

async function handleLoadBalancerSubmit(event) {
    event.preventDefault();
    if (!event.target.reportValidity()) return;

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
