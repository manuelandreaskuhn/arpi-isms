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

document.addEventListener('DOMContentLoaded', function() {
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
    
    setupHypervisorWizard();
});

function setupHypervisorWizard() {
    const form = document.getElementById('newHypervisorForm');
    if (!form) return;
    
    form.addEventListener('submit', handleHypervisorSubmit);
    
    // Cluster configuration toggle
    setupClusterToggle();
    
    // Storage type toggle
    setupStorageType();
    
    // Software selection listener
    setupSoftwareListener();
    
    // Manual input toggles for component linking
    setupManualInputToggles();
}

function setupClusterToggle() {
    const clusterCheckbox = document.getElementById('hypervisor-cluster-enable');
    const clusterConfig = document.getElementById('hypervisor-cluster-config');
    const singleHostConfig = document.getElementById('single-host-config');
    const singleHostStorageConfig = document.getElementById('single-host-storage-config');
    const resourcesManual = document.getElementById('resources-manual-input');
    const resourcesCluster = document.getElementById('resources-cluster-summary');
    
    if (clusterCheckbox && clusterConfig && singleHostConfig) {
        // Set initial state based on checkbox
        const updateVisibility = () => {
            if (clusterCheckbox.checked) {
                clusterConfig.style.display = 'block';
                singleHostConfig.style.display = 'none';
                if (singleHostStorageConfig) singleHostStorageConfig.style.display = 'none';
                if (resourcesManual) resourcesManual.style.display = 'none';
                if (resourcesCluster) resourcesCluster.style.display = 'block';
                updateClusterResourceSummary();
            } else {
                clusterConfig.style.display = 'none';
                singleHostConfig.style.display = 'block';
                if (singleHostStorageConfig) singleHostStorageConfig.style.display = 'block';
                if (resourcesManual) resourcesManual.style.display = 'block';
                if (resourcesCluster) resourcesCluster.style.display = 'none';
            }
        };
        
        // Set initial state
        updateVisibility();
        
        // Listen to changes
        clusterCheckbox.addEventListener('change', updateVisibility);
    }
    
    // Setup host management
    setupHostManagement();
}

function setupStorageType() {
    const hostBasedRadio = document.getElementById('storage-type-host');
    const externalRadio = document.getElementById('storage-type-external');
    const externalStorageConfig = document.getElementById('external-storage-config');
    const hostStorageFields = document.querySelectorAll('.host-storage-field');
    const externalCapacityInput = document.getElementById('external-storage-capacity');
    
    function updateStorageDisplay() {
        const isExternal = externalRadio?.checked;
        
        // Toggle external storage config visibility
        if (externalStorageConfig) {
            externalStorageConfig.style.display = isExternal ? 'block' : 'none';
        }
        
        // Toggle host storage fields visibility
        hostStorageFields.forEach(field => {
            field.style.display = isExternal ? 'none' : 'block';
        });
        
        // Update resource summary
        updateClusterResourceSummary();
    }
    
    if (hostBasedRadio) {
        hostBasedRadio.addEventListener('change', updateStorageDisplay);
    }
    
    if (externalRadio) {
        externalRadio.addEventListener('change', updateStorageDisplay);
    }
    
    if (externalCapacityInput) {
        externalCapacityInput.addEventListener('input', updateClusterResourceSummary);
    }
    
    // Initial state
    updateStorageDisplay();
}

function setupHostManagement() {
    const addHostBtn = document.querySelector('.btn-add-host');
    const hostListContainer = document.querySelector('.host-list-container');
    
    if (!addHostBtn || !hostListContainer) return;
    
    // Add host button
    addHostBtn.addEventListener('click', () => {
        const hostEntries = hostListContainer.querySelectorAll('.host-entry');
        const newHostNumber = hostEntries.length + 1;
        const newHostIndex = hostEntries.length;
        
        const newHostEntry = document.createElement('div');
        newHostEntry.className = 'host-entry';
        newHostEntry.dataset.hostId = newHostNumber;
        newHostEntry.innerHTML = `
            <div class="host-entry-number">${newHostNumber}</div>
            <div class="host-entry-field">
                <input type="text" name="hosts[${newHostIndex}][hostname]" placeholder="z.B. esxi-host-0${newHostNumber}.example.com">
            </div>
            <div class="host-entry-field">
                <input type="text" name="hosts[${newHostIndex}][ip]" placeholder="IP-Adresse">
            </div>
            <div class="host-entry-field">
                <input type="text" name="hosts[${newHostIndex}][cpu]" placeholder="CPU Cores" class="host-cpu-input">
            </div>
            <div class="host-entry-field">
                <input type="text" name="hosts[${newHostIndex}][ram]" placeholder="RAM (GB)" class="host-ram-input">
            </div>
            <div class="host-entry-field host-storage-field">
                <input type="text" name="hosts[${newHostIndex}][storage]" placeholder="Storage (TB)" class="host-storage-input">
            </div>
            <button type="button" class="btn-remove-host">✕</button>
        `;
        
        hostListContainer.appendChild(newHostEntry);
        
        // Add input listeners for resource calculation
        const cpuInput = newHostEntry.querySelector('.host-cpu-input');
        const ramInput = newHostEntry.querySelector('.host-ram-input');
        const storageInput = newHostEntry.querySelector('.host-storage-input');
        if (cpuInput) cpuInput.addEventListener('input', updateClusterResourceSummary);
        if (ramInput) ramInput.addEventListener('input', updateClusterResourceSummary);
        if (storageInput) storageInput.addEventListener('input', updateClusterResourceSummary);
        
        updateHostCount();
        updateRemoveButtons();
        updateClusterDiagram();
        updateClusterResourceSummary();
    });
    
    // Remove host buttons (event delegation)
    hostListContainer.addEventListener('click', (e) => {
        if (e.target.classList.contains('btn-remove-host') && !e.target.disabled) {
            const hostEntry = e.target.closest('.host-entry');
            if (hostEntry) {
                hostEntry.remove();
                updateHostNumbers();
                updateHostCount();
                updateRemoveButtons();
                updateClusterDiagram();
                updateClusterResourceSummary();
            }
        }
    });
    
    // Add input listeners to existing hosts
    hostListContainer.querySelectorAll('.host-cpu-input, .host-ram-input, .host-storage-input').forEach(input => {
        input.addEventListener('input', updateClusterResourceSummary);
    });
    
    // Initial state
    updateRemoveButtons();
    updateClusterDiagram();
}

function updateHostNumbers() {
    const hostEntries = document.querySelectorAll('.host-entry');
    hostEntries.forEach((entry, index) => {
        const numberEl = entry.querySelector('.host-entry-number');
        if (numberEl) numberEl.textContent = index + 1;
        
        entry.dataset.hostId = index + 1;
        
        // Update input names
        const inputs = entry.querySelectorAll('input');
        inputs.forEach(input => {
            const name = input.getAttribute('name');
            if (name) {
                const newName = name.replace(/hosts\[\d+\]/, `hosts[${index}]`);
                input.setAttribute('name', newName);
            }
        });
    });
}

function updateHostCount() {
    const hostCountEl = document.getElementById('host-count');
    const hostEntries = document.querySelectorAll('.host-entry');
    if (hostCountEl) {
        hostCountEl.textContent = hostEntries.length;
    }
}

function updateRemoveButtons() {
    const hostEntries = document.querySelectorAll('.host-entry');
    const removeButtons = document.querySelectorAll('.btn-remove-host');
    
    // Disable remove button if only one host remains
    removeButtons.forEach(btn => {
        btn.disabled = hostEntries.length <= 1;
    });
}

function updateClusterDiagram() {
    const hostVisualContainer = document.getElementById('cluster-hosts-visual');
    if (!hostVisualContainer) return;
    
    const hostEntries = document.querySelectorAll('.host-entry');
    const hostCount = hostEntries.length;
    
    // Clear existing visual hosts
    hostVisualContainer.innerHTML = '';
    
    // Create host visuals based on count
    for (let i = 0; i < hostCount; i++) {
        const hostVisual = document.createElement('div');
        hostVisual.className = 'cluster-host';
        hostVisual.dataset.position = i;
        hostVisual.innerHTML = `
            <div class="host-mini-icon">🖥️</div>
            <div class="host-mini-label">Host ${i + 1}</div>
        `;
        hostVisualContainer.appendChild(hostVisual);
    }
    
    // For 5+ hosts, use circular arrangement within the diagram
    if (hostCount >= 5) {
        const hosts = hostVisualContainer.querySelectorAll('.cluster-host');
        const diagram = hostVisualContainer.closest('.cluster-diagram');
        if (!diagram) return;
        
        const diagramRect = diagram.getBoundingClientRect();
        const centerX = diagramRect.width / 2;
        const centerY = diagramRect.height / 2;
        const radius = Math.min(diagramRect.width, diagramRect.height) * 0.35; // 35% of smaller dimension
        
        hosts.forEach((host, index) => {
            const angle = (index / hostCount) * 2 * Math.PI - Math.PI / 2; // Start from top
            const x = centerX + radius * Math.cos(angle);
            const y = centerY + radius * Math.sin(angle);
            
            host.style.left = `${x}px`;
            host.style.top = `${y}px`;
            host.style.transform = 'translate(-50%, -50%)';
        });
    }
}

function updateClusterResourceSummary() {
    const hostEntries = document.querySelectorAll('.host-entry');
    const externalRadio = document.getElementById('storage-type-external');
    const isExternalStorage = externalRadio?.checked;
    
    let totalCPU = 0;
    let totalRAM = 0;
    let totalStorage = 0;
    let hostCount = hostEntries.length;
    let hostsWithData = 0;
    
    hostEntries.forEach(entry => {
        const cpuInput = entry.querySelector('[name*="[cpu]"]');
        const ramInput = entry.querySelector('[name*="[ram]"]');
        const storageInput = entry.querySelector('[name*="[storage]"]');
        
        const cpu = parseInt(cpuInput?.value) || 0;
        const ram = parseInt(ramInput?.value) || 0;
        const storage = parseFloat(storageInput?.value) || 0;
        
        if (cpu > 0 || ram > 0 || storage > 0) hostsWithData++;
        
        totalCPU += cpu;
        totalRAM += ram;
        if (!isExternalStorage) {
            totalStorage += storage;
        }
    });
    
    // Bei externem Storage, Wert aus external-storage-capacity nehmen
    if (isExternalStorage) {
        const externalCapacity = document.getElementById('external-storage-capacity');
        totalStorage = parseFloat(externalCapacity?.value) || 0;
    }
    
    // Update display elements
    const cpuTotal = document.getElementById('cluster-cpu-total');
    const ramTotal = document.getElementById('cluster-ram-total');
    const storageTotal = document.getElementById('cluster-storage-total');
    const avgResources = document.getElementById('cluster-avg-resources');
    const hostCountDisplay = document.getElementById('cluster-host-count-display');
    
    if (cpuTotal) cpuTotal.textContent = totalCPU;
    if (ramTotal) ramTotal.textContent = `${totalRAM} GB`;
    if (storageTotal) storageTotal.textContent = `${totalStorage.toFixed(1)} TB`;
    if (hostCountDisplay) hostCountDisplay.textContent = hostCount;
    
    if (avgResources) {
        if (hostsWithData > 0) {
            const avgCPU = Math.round(totalCPU / hostsWithData);
            const avgRAM = Math.round(totalRAM / hostsWithData);
            avgResources.textContent = `${avgCPU} Cores / ${avgRAM} GB`;
        } else {
            avgResources.textContent = '-';
        }
    }
}

function setupSoftwareListener() {
    const softwareSelect = document.querySelector('.custom-select[data-name="hypervisortype"]');
    
    if (softwareSelect) {
        // Listen for changes on the custom select
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
            window.location.href = '/assetmanagement/components';
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