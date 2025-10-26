import { updateListenersForDynamicEntry, updateSectionCounter, removeCustomSelects } from './wizards.js';

let vmCounter = 0;
let hardwareCounter = 0;

function addVMEntry() {
    vmCounter++;
    const vmList = document.getElementById('vmList');
    const template = document.getElementById('vmEntryTemplate');
    
    // Clone the template content
    const vmEntry = template.content.cloneNode(true);
    const entryDiv = vmEntry.querySelector('.dynamic-entry');
    
    // Set the ID and number
    entryDiv.dataset.id = vmCounter;
    vmEntry.querySelector('.entry-number').textContent = vmCounter;
    
    vmEntry.querySelectorAll('.custom-select').forEach(element => {
        element.dataset.index = vmCounter;
    });
    
    vmList.appendChild(vmEntry);
    
    // Get the newly added entry for event listeners
    const addedEntry = vmList.querySelector(`.dynamic-entry[data-id="${vmCounter}"]`);
    updateListenersForDynamicEntry(addedEntry);
}

function addHardwareEntry() {
    hardwareCounter++;
    const hardwareList = document.getElementById('hardwareList');
    const template = document.getElementById('hardwareEntryTemplate');
    
    // Clone the template content
    const hwEntry = template.content.cloneNode(true);
    const entryDiv = hwEntry.querySelector('.dynamic-entry');
    
    // Set the ID and number
    entryDiv.dataset.id = hardwareCounter;
    hwEntry.querySelector('.entry-number').textContent = hardwareCounter;

    hwEntry.querySelectorAll('.custom-select').forEach(element => {
        element.dataset.index = hardwareCounter;
    });
    
    hardwareList.appendChild(hwEntry);
    
    // Get the newly added entry for event listeners
    const addedEntry = hardwareList.querySelector(`.dynamic-entry[data-id="${hardwareCounter}"]`);
    updateListenersForDynamicEntry(addedEntry);
}

function removeEntry(button, type) {
    const entry = button.closest('.dynamic-entry');
    entry.remove();

    removeCustomSelects(entry);

    const entries = document.querySelectorAll(`.dynamic-entry[data-type="${type}"]`);
    entries.forEach((entry, index) => {
        entry.dataset.id = index + 1;
        entry.querySelector('.entry-number').textContent = index + 1;

        entry.querySelectorAll('.custom-select').forEach(element => {
            element.dataset.index = index + 1;
        });
    });

    if (type === 'vm') {
        vmCounter = entries.length + 1;
        updateSectionCounter(document.querySelector('.form-section[data-name="virtualmachines"]'));
    } else {
        hardwareCounter = entries.length + 1;
        updateSectionCounter(document.querySelector('.form-section[data-name="hardwareservers"]'));
    }
}

// Handle VM checkbox toggle
document.addEventListener('DOMContentLoaded', function() {
    // Initially hide sections
    const vmSection = document.querySelector('.form-section[data-name="virtualmachines"]');
    const hardwareSection = document.querySelector('.form-section[data-name="hardwareservers"]');
    
    if (vmSection) vmSection.style.display = 'none';
    if (hardwareSection) hardwareSection.style.display = 'none';
    
    // VM checkbox handler
    const vmCheckbox = document.getElementById('vm');
    if (vmCheckbox) {
        vmCheckbox.addEventListener('change', function() {
            if (this.checked) {
                vmSection.style.display = 'block';
            } else {
                vmSection.style.display = 'none';
                document.getElementById('vmList').innerHTML = '';
                vmCounter = 0;
                updateSectionCounter(vmSection);
            }
        });
    }
    
    // Hardware checkbox handler
    const hardwareCheckbox = document.getElementById('hardware');
    if (hardwareCheckbox) {
        hardwareCheckbox.addEventListener('change', function() {
            if (this.checked) {
                hardwareSection.style.display = 'block';
            } else {
                document.getElementById('hardwareList').innerHTML = '';
                hardwareCounter = 0;
                updateSectionCounter(hardwareSection);
                updateSectionCounter(hardwareSection);
            }
        });
    }
});

// Make functions globally accessible for onclick handlers
window.addVMEntry = addVMEntry;
window.addHardwareEntry = addHardwareEntry;
window.removeEntry = removeEntry;

