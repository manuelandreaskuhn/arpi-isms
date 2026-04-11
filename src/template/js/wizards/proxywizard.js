/**
 * proxywizard.js
 * 
 * Wizard für das Erstellen und Bearbeiten von Proxy-Server Komponenten
 */

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
    getOrCreateInstanceUuid('newProxyForm');

    // Cleanup old instances (keep last 5)
    cleanupOldInstances('newProxyForm', 5);

    // Restore saved form data (including section counters)
    restoreFormData('newProxyForm');

    // Enable auto-save
    enableAutoSave('newProxyForm');

    setupProxyWizard();
    setupProxyTypeListener();
    setupToggleSwitches();
    setupConditionalFields();
});

function setupProxyWizard() {
    const form = document.getElementById('newProxyForm');
    if (!form) return;

    form.addEventListener('submit', handleProxySubmit);

    // Software selection listener
    setupSoftwareListener();

    // Floating form management buttons
    setupFormManagementButtons();

    // Manual input toggles for component linking
    setupManualInputToggles();

    // Failover configuration toggle
    setupFailoverToggle();
}

function setupFormManagementButtons() {
    const saveButtons = document.querySelectorAll('.btn-save');
    const form = document.getElementById('newProxyForm');

    saveButtons.forEach(button => {
        button.addEventListener('click', () => {
            if (form) {
                form.dispatchEvent(new Event('submit'));
            }
        });
    });


}

function setupSoftwareListener() {
    const softwareSelect = document.querySelector('[data-name="software"]');
    if (softwareSelect) {
        const observer = new MutationObserver(() => {
            const value = softwareSelect.dataset.value;
            if (value && value !== '' && value !== 'other') {
                loadProxySoftwareInfo(value);
            }
        });
        observer.observe(softwareSelect, { attributes: true, attributeFilter: ['data-value'] });
    }
}

/**
 * Load proxy software information from API
 */
async function loadProxySoftwareInfo(softwareId) {
    try {
        const response = await fetch(`/api/data/proxy-software/${softwareId}`);
        if (!response.ok) throw new Error('Software info not found');

        const result = await response.json();
        if (result.success && result.data) {
            fillProxySoftwareInfo(result.data);
            showProxySoftwareInfo();
        } else {
            throw new Error(result.error || 'Failed to load software info');
        }
    } catch (error) {
        console.error('Error loading proxy software info:', error);
        hideProxySoftwareInfo();
    }
}

/**
 * Fill software information section
 */
function fillProxySoftwareInfo(data) {
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

/**
 * Show software information section
 */
function showProxySoftwareInfo() {
    const section = document.getElementById('proxy-software-info-section');
    if (section) {
        section.classList.remove('collapsed');
    }
}

/**
 * Hide software information section
 */
function hideProxySoftwareInfo() {
    const section = document.getElementById('proxy-software-info-section');
    if (section) {
        section.classList.add('collapsed');
    }
}

/**
 * Setup manual input toggles for component-linking fields
 */
function setupManualInputToggles() {
    // Proxy Server manual input
    const proxyServerSelect = document.querySelector('[data-name="serverid"]');
    const proxyServerManual = document.getElementById('proxy-server-manual');

    if (proxyServerSelect) {
        const observer = new MutationObserver(() => {
            const value = proxyServerSelect.dataset.value;
            if (proxyServerManual) {
                proxyServerManual.style.display = (value === 'manual') ? 'block' : 'none';
            }
        });
        observer.observe(proxyServerSelect, { attributes: true });
    }

    // Monitoring Integration manual input
    const monitoringSelect = document.querySelector('[data-name="proxymonitoring"]');
    const monitoringManual = document.getElementById('proxy-monitoring-manual');

    if (monitoringSelect) {
        const observer = new MutationObserver(() => {
            const value = monitoringSelect.dataset.value;
            if (monitoringManual) {
                monitoringManual.style.display = (value === 'manual') ? 'block' : 'none';
            }
        });
        observer.observe(monitoringSelect, { attributes: true, attributeFilter: ['data-value'] });
    }

    // Secondary Proxy manual input
    const secondarySelect = document.querySelector('[data-name="proxysecondaryid"]');
    const secondaryManual = document.getElementById('proxy-secondary-manual');

    if (secondarySelect) {
        const observer = new MutationObserver(() => {
            const value = secondarySelect.dataset.value;
            if (secondaryManual) {
                secondaryManual.style.display = (value === 'manual') ? 'block' : 'none';
            }
        });
        observer.observe(secondarySelect, { attributes: true });
    }
}

/**
 * Setup failover configuration toggle
 */
function setupFailoverToggle() {
    const checkbox = document.getElementById('proxy-failover-check');
    const config = document.getElementById('proxy-failover-config');

    if (checkbox && config) {
        checkbox.addEventListener('change', function () {
            if (this.checked) {
                config.style.display = 'block';
            } else {
                config.style.display = 'none';
            }
        });
    }
}

/**
 * Setup proxy type listener to adjust protocols
 */
function setupProxyTypeListener() {
    const typeSelect = document.querySelector('[data-name="type"]');
    if (!typeSelect) return;

    const observer = new MutationObserver(() => {
        const proxyType = typeSelect.dataset.value;
        adjustProtocolsForProxyType(proxyType);
    });
    observer.observe(typeSelect, { attributes: true, attributeFilter: ['data-value'] });
}

/**
 * Adjust available protocols based on proxy type
 */
function adjustProtocolsForProxyType(proxyType) {
    const protocolsContainer = document.getElementById('proxy-protocols-container');
    if (!protocolsContainer) return;

    const protocols = {
        'http': ['http', 'https'],
        'https': ['https'],
        'socks4': ['http', 'https', 'ftp'],
        'socks5': ['http', 'https', 'ftp', 'socks'],
        'transparent': ['http', 'https'],
        'reverse': ['http', 'https']
    };

    const allowedProtocols = protocols[proxyType] || ['http', 'https', 'ftp', 'socks'];

    // Update checkboxes
    const checkboxes = protocolsContainer.querySelectorAll('input[type="checkbox"]');
    checkboxes.forEach(checkbox => {
        const protocol = checkbox.value;
        const isAllowed = allowedProtocols.includes(protocol);

        if (!isAllowed) {
            checkbox.checked = false;
            checkbox.disabled = true;
            checkbox.parentElement.style.opacity = '0.5';
        } else {
            checkbox.disabled = false;
            checkbox.parentElement.style.opacity = '1';
        }
    });
}

/**
 * Setup toggle switches with status updates
 */
function setupToggleSwitches() {
    const toggles = document.querySelectorAll('.toggle-switch input[type="checkbox"]');

    toggles.forEach(toggle => {
        const wrapper = toggle.closest('.toggle-wrapper');
        if (!wrapper) return;

        const statusSpan = wrapper.querySelector('.toggle-status');
        if (!statusSpan) return;

        // Set initial state
        updateToggleStatus(toggle, statusSpan);

        // Listen for changes
        toggle.addEventListener('change', function () {
            updateToggleStatus(this, statusSpan);
        });
    });
}

/**
 * Update toggle switch status text
 */
function updateToggleStatus(toggle, statusSpan) {
    if (toggle.checked) {
        statusSpan.textContent = 'Aktiviert';
        statusSpan.classList.add('active');
    } else {
        statusSpan.textContent = 'Nicht aktiviert';
        statusSpan.classList.remove('active');
    }
}

/**
 * Setup conditional field visibility
 */
function setupConditionalFields() {
    // SSL Certificate field - show only when SSL Interception is enabled or partial
    const sslRadios = document.querySelectorAll('input[name="proxysslinterception"]');
    const sslCertField = document.getElementById('proxy-ssl-cert-field');

    sslRadios.forEach(radio => {
        radio.addEventListener('change', function () {
            if (sslCertField) {
                const value = this.value;
                if (value === 'enabled' || value === 'partial') {
                    sslCertField.style.display = 'block';
                } else {
                    sslCertField.style.display = 'none';
                }
            }
        });
    });

    // Cache Size field - show only when Cache is enabled
    const cacheToggle = document.getElementById('proxycache');
    const cacheSizeField = document.getElementById('proxy-cache-size-field');

    if (cacheToggle && cacheSizeField) {
        cacheToggle.addEventListener('change', function () {
            if (this.checked) {
                cacheSizeField.style.display = 'block';
            } else {
                cacheSizeField.style.display = 'none';
            }
        });
    }
}

async function handleProxySubmit(event) {
    event.preventDefault();

    // Formular-Daten sammeln
    const formData = collectFormData(event.target);

    console.log('Proxy Server Data:', formData);

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

            alert('Proxy-Server erfolgreich erstellt!');
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
    let uri = '/api/proxies';
    return uri;
}