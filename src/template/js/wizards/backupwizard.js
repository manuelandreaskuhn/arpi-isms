import { initializeAllComponentSelects } from './componentlinking.js';
import { initializeHelpTooltips } from './helptooltip.js';
import { collectFormData } from './formcollector.js';

document.addEventListener('DOMContentLoaded', function() {
    initializeAllComponentSelects();
    initializeHelpTooltips();
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

async function handleBackupSubmit(event) {
    event.preventDefault();
    
    // Formular-Daten sammeln
    const formData = collectFormData(event.target);
    
    console.log('Backup System Data:', formData);
    
    // An API senden
    try {
        const response = await fetch('/api/backup-systems', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(formData)
        });
        
        const result = await response.json();
        
        if (result.success) {
            alert('Backup-System erfolgreich erstellt!');
            window.location.href = '/assetmanagement/components';
        } else {
            alert('Fehler beim Erstellen:\n' + result.errors.join('\n'));
        }
    } catch (error) {
        console.error('API Error:', error);
        alert('Verbindungsfehler zur API');
    }
}
