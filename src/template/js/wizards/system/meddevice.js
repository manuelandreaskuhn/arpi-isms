import { updateListenersForDynamicEntry, updateSectionCounter } from '../wizards.js';
import { refreshAllComponentSelects } from '../componentlinking.js';

let medDeviceCounter = 0;

/**
 * Add a new medical device entry
 */
export function addMedDeviceEntry() {
    medDeviceCounter++;
    const template = document.getElementById('medDeviceEntryTemplate');
    const medDeviceList = document.getElementById('medDeviceList');
    
    if (!template || !medDeviceList) return;
    
    const clone = template.content.cloneNode(true);
    const entry = clone.querySelector('.dynamic-entry');
    
    entry.dataset.id = medDeviceCounter;
    entry.querySelector('.entry-number').textContent = medDeviceCounter;
    
    medDeviceList.appendChild(clone);
    
    updateListenersForDynamicEntry(entry);
    
    const section = document.querySelector('.form-section[data-name="meddevices"]');
    if (section) {
        updateSectionCounter(section);
    }
    
    setupMedDeviceConditionalFields(entry);
    
    // Refresh component selects to include new medical device
    refreshAllComponentSelects();
}

/**
 * Setup conditional fields for medical device entry
 * @param {HTMLElement} entry - The medical device entry element
 */
export function setupMedDeviceConditionalFields(entry) {
    if (!entry) return;

    // Handle component selection - show/hide manual input
    const componentSelect = entry.querySelector('[data-name="meddeviceconnectedcomponent"]');
    const manualInput = entry.querySelector('#meddeviceconnectedcomponent-manual');
    
    if (componentSelect && manualInput) {
        const observer = new MutationObserver(() => {
            const value = componentSelect.dataset.value;
            manualInput.style.display = (value === 'manual') ? 'block' : 'none';
        });
        observer.observe(componentSelect, { attributes: true, attributeFilter: ['data-value'] });
    }
}

/**
 * Refresh host assignments for medical devices
 */
export function refreshMedDeviceHostAssignments() {
    refreshAllComponentSelects();
}
