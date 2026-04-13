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
    getOrCreateInstanceUuid('newFirewallForm');

    // Cleanup old instances (keep last 5)
    cleanupOldInstances('newFirewallForm', 5);

    // Restore saved form data (including section counters)
    restoreFormData('newFirewallForm');

    // Enable auto-save
    enableAutoSave('newFirewallForm');

    setupFirewallWizard();
});

function setupFirewallWizard() {
    const form = document.getElementById('newFirewallForm');
    if (!form) return;

    form.addEventListener('submit', handleFirewallSubmit);

    // Conditional fields based on firewall type
    setupFirewallTypeToggle();

    // Setup firewall diagram interactions
    setupFirewallDiagram();

    // Setup HA configuration toggle
    setupHAToggle();

    // Setup additional zones
    setupAdditionalZones();

    // Setup log retention slider
    setupLogRetentionSlider();
}

function setupFirewallTypeToggle() {
    const typeSelect = document.querySelector('[data-name="type"]');

    if (typeSelect) {
        // Listen for changes on the custom select
        const observer = new MutationObserver(() => {
            const value = typeSelect.dataset.value;
            if (value && value !== '') {
                loadFirewallSoftwareInfo(value);
            } else {
                hideSoftwareInfo('firewall-software-info-section');
            }
        });
        observer.observe(typeSelect, { attributes: true, attributeFilter: ['data-value'] });
    }
}

function setupHAToggle() {
    const haCheck = document.getElementById('serverhighavailability');
    const haConfig = document.getElementById('fw-ha-config');

    if (haCheck && haConfig) {
        haCheck.addEventListener('change', function () {
            haConfig.style.display = this.checked ? 'block' : 'none';
        });
    }
}

function setupFirewallDiagram() {
    const zoneInputs = document.querySelectorAll('.zone-input');

    zoneInputs.forEach(input => {
        input.addEventListener('focus', function () {
            this.parentElement.style.borderWidth = '3px';
        });

        input.addEventListener('blur', function () {
            this.parentElement.style.borderWidth = '2px';
        });

        // Add visual feedback when IP is entered
        input.addEventListener('input', function () {
            const zone = this.parentElement;
            if (this.value.trim()) {
                zone.style.opacity = '1';
            } else {
                zone.style.opacity = '0.85';
            }
        });
    });
}

async function handleFirewallSubmit(event) {
    event.preventDefault();
    if (!event.target.reportValidity()) return;

    const formData = collectFormData(event.target);
    console.log('Firewall Data:', formData);

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
            clearFormData('newFirewallForm');

            // Use global updateFormStatus function
            if (window.updateFormStatus) {
                window.updateFormStatus('saved');
            }

            alert('Firewall erfolgreich erstellt!');
            window.location.href = '/ComponentManagement.html';
        } else {
            alert('Fehler beim Erstellen:\n' + result.errors.join('\n'));

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
    let uri = '/api/firewalls';
    return uri;
}

// HA Configuration toggle
const haCheck = document.getElementById('fw-ha-check');
const haConfig = document.getElementById('fw-ha-config');

if (haCheck && haConfig) {
    haCheck.addEventListener('change', function () {
        haConfig.style.display = this.checked ? 'block' : 'none';
    });
}

async function loadFirewallSoftwareInfo(firewallId) {
    if (!firewallId || firewallId === 'other') {
        hideSoftwareInfo('firewall-software-info-section');
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
            fillSoftwareInfo(result.data, 'firewall-software-info-section');
        } else {
            console.error('Failed to load firewall software info:', result.error);
            hideSoftwareInfo('firewall-software-info-section');
        }
    } catch (error) {
        console.error('API Error:', error);
        hideSoftwareInfo('firewall-software-info-section');
    }
}

function getDataUri() {
    let uri = '/api/data/firewall-software';
    const firewallTypeSelect = document.querySelector('.custom-select[data-name="type"]');
    if (firewallTypeSelect) {
        const firewallid = firewallTypeSelect.dataset.value;
        if (firewallid && firewallid !== '' && firewallid !== 'none' && firewallid !== 'other') {
            uri += `/${firewallid}`;
        }
    }
    return uri;
}

function setupAdditionalZones() {
    const container = document.getElementById('additional-zones-container');
    if (!container) return;

    container.addEventListener('click', function (e) {
        if (e.target.classList.contains('btn-add-zone')) {
            addZoneInput();
        } else if (e.target.classList.contains('btn-remove-zone')) {
            e.target.closest('.multi-input-item').remove();
        }
    });
}

function addZoneInput() {
    const container = document.getElementById('additional-zones-container');
    const newItem = document.createElement('div');
    newItem.className = 'multi-input-item';
    newItem.innerHTML = `
        <input type="text" class="additional-zone-input" placeholder="z.B. VPN: 10.10.0.1">
        <button type="button" class="btn-remove-zone">−</button>
    `;
    container.appendChild(newItem);
}

function setupLogRetentionSlider() {
    const slider = document.getElementById('logretention-slider');
    const display = document.getElementById('logretention-display');

    if (!slider || !display) return;

    // Sync display value with slider
    slider.addEventListener('input', function () {
        display.textContent = this.value;
    });
}