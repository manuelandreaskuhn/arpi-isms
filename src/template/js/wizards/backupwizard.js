import { initializeAllComponentSelects } from './componentlinking.js';
import { initializeHelpTooltips } from './helptooltip.js';

document.addEventListener('DOMContentLoaded', function() {
    // Initialize component linking
    initializeAllComponentSelects();

    // Initialize help tooltips
    initializeHelpTooltips();

    // Storage Levels (2-tier / 3-tier) toggle
    const storageLevelsSelect = document.querySelector('[data-name="storagelevels"]');
    const tertiaryStorageHeader = document.getElementById('tertiary-storage-header');
    const tertiaryStorageConfig = document.getElementById('tertiary-storage-config');
    
    if (storageLevelsSelect) {
        const observer = new MutationObserver((mutations) => {
            mutations.forEach((mutation) => {
                if (mutation.type === 'attributes' && mutation.attributeName === 'data-value') {
                    const value = storageLevelsSelect.dataset.value;
                    
                    if (value === '3-tier') {
                        if (tertiaryStorageHeader) tertiaryStorageHeader.style.display = 'block';
                        if (tertiaryStorageConfig) tertiaryStorageConfig.style.display = 'block';
                    } else {
                        if (tertiaryStorageHeader) tertiaryStorageHeader.style.display = 'none';
                        if (tertiaryStorageConfig) tertiaryStorageConfig.style.display = 'none';
                    }
                }
            });
        });
        observer.observe(storageLevelsSelect, { attributes: true });
    }

    // Secondary Immutability toggle
    const secondaryImmutabilitySelect = document.querySelector('[data-name="secondaryimmutability"]');
    const secondaryImmutabilityPeriod = document.getElementById('secondary-immutability-period');
    
    if (secondaryImmutabilitySelect && secondaryImmutabilityPeriod) {
        const observer = new MutationObserver((mutations) => {
            mutations.forEach((mutation) => {
                if (mutation.type === 'attributes' && mutation.attributeName === 'data-value') {
                    const value = secondaryImmutabilitySelect.dataset.value;
                    secondaryImmutabilityPeriod.style.display = (value === 'enabled') ? 'block' : 'none';
                }
            });
        });
        observer.observe(secondaryImmutabilitySelect, { attributes: true });
    }

    // Tertiary Immutability toggle
    const tertiaryImmutabilitySelect = document.querySelector('[data-name="tertiaryimmutability"]');
    const tertiaryImmutabilityPeriod = document.getElementById('tertiary-immutability-period');
    
    if (tertiaryImmutabilitySelect && tertiaryImmutabilityPeriod) {
        const observer = new MutationObserver((mutations) => {
            mutations.forEach((mutation) => {
                if (mutation.type === 'attributes' && mutation.attributeName === 'data-value') {
                    const value = tertiaryImmutabilitySelect.dataset.value;
                    tertiaryImmutabilityPeriod.style.display = (value === 'enabled') ? 'block' : 'none';
                }
            });
        });
        observer.observe(tertiaryImmutabilitySelect, { attributes: true });
    }
});
