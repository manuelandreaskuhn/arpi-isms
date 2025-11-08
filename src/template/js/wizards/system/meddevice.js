import { updateListenersForDynamicEntry, updateSectionCounter } from '../wizards.js';
import { refreshAllComponentSelects } from '../componentlinking.js';

let medDeviceCounter = 0;

export function addMedDeviceEntry() {
    medDeviceCounter++;
    const template = document.getElementById('medDeviceEntryTemplate');
    const clone = template.content.cloneNode(true);
    
    const entry = clone.querySelector('.dynamic-entry');
    entry.dataset.id = medDeviceCounter;
    entry.querySelector('.entry-number').textContent = medDeviceCounter;
    
    const medDeviceList = document.getElementById('medDeviceList');
    medDeviceList.appendChild(clone);
    
    setupMedDeviceConditionalFields(entry);
    updateListenersForDynamicEntry(entry);
    
    const section = document.querySelector('.form-section[data-name="meddevices"]');
    updateSectionCounter(section);
    
    refreshAllComponentSelects();
}

export function setupMedDeviceConditionalFields(container) {
    if (!container) return;
    
    // Handle component linking manual input toggle
    const componentSelect = container.querySelector('[data-name="meddeviceconnectedcomponent"]');
    if (componentSelect) {
        const observer = new MutationObserver(() => {
            handleMedDeviceComponentToggle(container);
        });
        observer.observe(componentSelect, { attributes: true, attributeFilter: ['data-value'] });
        handleMedDeviceComponentToggle(container);
    }
}

function handleMedDeviceComponentToggle(container) {
    const componentSelect = container.querySelector('[data-name="meddeviceconnectedcomponent"]');
    const manualInput = container.querySelector('#meddeviceconnectedcomponent-manual');
    
    if (!componentSelect || !manualInput) return;
    
    const value = componentSelect.dataset.value;
    manualInput.style.display = (value === 'manual') ? 'block' : 'none';
}

export function refreshMedDeviceHostAssignments() {
    refreshAllComponentSelects();
}
