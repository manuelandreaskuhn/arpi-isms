import { initializeAllComponentSelects } from './componentlinking.js';
import { initializeHelpTooltips } from './helptooltip.js';
import { collectFormData } from './formcollector.js';

document.addEventListener('DOMContentLoaded', function() {
    initializeAllComponentSelects();
    initializeHelpTooltips();
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
                hideFirewallSoftwareInfo();
            }
        });
        observer.observe(typeSelect, { attributes: true, attributeFilter: ['data-value'] });
    }
}

function setupHAToggle() {
    const haCheck = document.getElementById('serverhighavailability');
    const haConfig = document.getElementById('fw-ha-config');
    
    if (haCheck && haConfig) {
        haCheck.addEventListener('change', function() {
            haConfig.style.display = this.checked ? 'block' : 'none';
        });
    }
}

function setupFirewallDiagram() {
    const zoneInputs = document.querySelectorAll('.zone-input');
    
    zoneInputs.forEach(input => {
        input.addEventListener('focus', function() {
            this.parentElement.style.borderWidth = '3px';
        });
        
        input.addEventListener('blur', function() {
            this.parentElement.style.borderWidth = '2px';
        });
        
        // Add visual feedback when IP is entered
        input.addEventListener('input', function() {
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
            let lastchangespan = document.querySelector(".formmanagement > span.form-status");
            if (lastchangespan) {
                lastchangespan.textContent = 'Gespeichert am ' + new Date().toLocaleString();
                lastchangespan.dataset.lastchange = new Date().toISOString();
                lastchangespan.dataset.status = 'saved';
            }

            alert('Firewall erfolgreich erstellt!');
            window.location.href = '/assetmanagement/components';
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
    let uri = '/api/firewalls';
    return uri;
}

// HA Configuration toggle
const haCheck = document.getElementById('fw-ha-check');
const haConfig = document.getElementById('fw-ha-config');

if (haCheck && haConfig) {
    haCheck.addEventListener('change', function() {
        haConfig.style.display = this.checked ? 'block' : 'none';
    });
}

async function loadFirewallSoftwareInfo(firewallId) {
    if (!firewallId || firewallId === 'other') {
        hideFirewallSoftwareInfo();
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
            fillFirewallSoftwareInfo(result.data);
        } else {
            console.error('Failed to load firewall software info:', result.error);
            hideFirewallSoftwareInfo();
        }
    } catch (error) {
        console.error('API Error:', error);
        hideFirewallSoftwareInfo();
    }
}

function fillFirewallSoftwareInfo(data) {
    const infoDiv = document.querySelector('.firewall-software-info');
    if (!infoDiv) return;

    // firewall-software-info-section toggle
    const section = document.getElementById('firewall-software-info-section');
    if (section && section.classList.contains('collapsed')) {
        section.classList.remove('collapsed');
    }

    // Title and Badge
    const title = infoDiv.querySelector('.software-info-title');
    const badge = infoDiv.querySelector('.software-info-badge');
    if (title) title.textContent = data.name || '';
    if (badge) badge.textContent = data.status || '';

    // Grid items
    const vendor = infoDiv.querySelector('.software-vendor');
    const category = infoDiv.querySelector('.software-category');
    const type = infoDiv.querySelector('.software-type');
    const marketShare = infoDiv.querySelector('.software-marketshare');
    
    if (vendor) vendor.textContent = data.vendor || '-';
    if (category) category.textContent = data.category || '-';
    if (type) type.textContent = data.type || '-';
    if (marketShare) marketShare.textContent = data.marketShare || '-';

    // Description
    const description = infoDiv.querySelector('.software-description-text');
    if (description) description.textContent = data.description || '';

    // Features
    const featuresContainer = infoDiv.querySelector('.software-features');
    if (featuresContainer && data.features) {
        featuresContainer.innerHTML = data.features
            .map(feature => `<span class="feature-tag">${feature}</span>`)
            .join('');
    }

    // Platforms
    const platformsContainer = infoDiv.querySelector('.software-platforms');
    if (platformsContainer && data.platforms) {
        platformsContainer.innerHTML = data.platforms
            .map(platform => `<span class="platform-tag">${platform}</span>`)
            .join('');
    }

    // License Model
    const licenseContainer = infoDiv.querySelector('.software-license');
    if (licenseContainer && data.licenseModel) {
        licenseContainer.innerHTML = data.licenseModel
            .map(license => `<span class="license-tag">${license}</span>`)
            .join('');
    }

    // Use Cases
    const useCasesContainer = infoDiv.querySelector('.software-usecases');
    if (useCasesContainer && data.useCases) {
        useCasesContainer.innerHTML = data.useCases
            .map(useCase => `<span class="usecase-tag">${useCase}</span>`)
            .join('');
    }

    // Pricing
    const pricing = infoDiv.querySelector('.software-pricing-text');
    if (pricing) pricing.textContent = data.pricing || '-';

    // Notes
    const notes = infoDiv.querySelector('.software-notes-text');
    if (notes) notes.textContent = data.notes || '';

    // CPE Identifiers
    const cpeContainer = infoDiv.querySelector('.software-cpe-list');
    if (cpeContainer && data.cpe) {
        cpeContainer.innerHTML = data.cpe
            .map(cpe => `<div class="cpe-item">${cpe}</div>`)
            .join('');
    }

    // Show the info box
    infoDiv.style.display = 'block';
}

function hideFirewallSoftwareInfo() {
    const infoDiv = document.querySelector('.firewall-software-info');
    if (infoDiv) {
        infoDiv.style.display = 'none';
    }

    // Collapse the section
    const section = document.getElementById('firewall-software-info-section');
    if (section && !section.classList.contains('collapsed')) {
        section.classList.add('collapsed');
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