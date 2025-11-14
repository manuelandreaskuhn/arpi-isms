import { updateListenersForDynamicEntry, updateSectionCounter } from '../wizards.js';
import { refreshAllComponentSelects } from '../componentlinking.js';

export function addMedInterfaceEntry() {
    const template = document.getElementById('medInterfaceEntryTemplate');
    const list = document.getElementById('medInterfaceList');
    
    if (!template || !list) return;
    
    const clone = template.content.cloneNode(true);
    const entry = clone.querySelector('.dynamic-entry');
    
    // Set entry number
    const entries = list.querySelectorAll('.dynamic-entry[data-type="medinterface"]');
    const entryNumber = entries.length + 1;
    entry.querySelector('.entry-number').textContent = entryNumber;
    
    list.appendChild(clone);
    
    // Update listeners for custom selects
    updateListenersForDynamicEntry(entry);
    
    // Setup conditional fields for connection type
    setupInterfaceConditionalFields(entry);
    
    // Refresh all component-linked selects
    refreshAllComponentSelects();
    
    // Update section counter
    const section = document.querySelector('.form-section[data-name="medinterfaces"]');
    updateSectionCounter(section);
}

export function setupInterfaceConditionalFields(entry) {
    const connectionTypeSelect = entry.querySelector('[data-name="connectionType"]');
    
    if (!connectionTypeSelect) return;
    
    const directSection = entry.querySelector('.connection-direct');
    const commServerSection = entry.querySelector('.connection-commserver');
    const fileShareSection = entry.querySelector('.connection-fileshare');
    const mqSection = entry.querySelector('.connection-messagequeue');
    
    // Listen for connection type changes
    connectionTypeSelect.addEventListener('click', function(e) {
        if (e.target.classList.contains('select-option')) {
            const value = e.target.getAttribute('data-value');
            
            // Hide all sections first
            if (directSection) directSection.style.display = 'none';
            if (commServerSection) commServerSection.style.display = 'none';
            if (fileShareSection) fileShareSection.style.display = 'none';
            if (mqSection) mqSection.style.display = 'none';
            
            // Show relevant section
            switch(value) {
                case 'direct':
                    if (directSection) directSection.style.display = 'block';
                    break;
                case 'commserver':
                    if (commServerSection) {
                        commServerSection.style.display = 'block';
                        setupCommServerSelection(entry);
                    }
                    break;
                case 'fileshare':
                    if (fileShareSection) fileShareSection.style.display = 'block';
                    break;
                case 'messagequeue':
                    if (mqSection) mqSection.style.display = 'block';
                    break;
            }
        }
    });
}

function setupCommServerSelection(entry) {
    const commServerSelect = entry.querySelector('[data-name="commServerSelect"]');
    const manualFields = entry.querySelector('.commserver-manual-fields');
    
    if (!commServerSelect || !manualFields) return;
    
    // Listen for comm server selection
    commServerSelect.addEventListener('click', function(e) {
        if (e.target.classList.contains('select-option')) {
            const value = e.target.getAttribute('data-value');
            
            if (value === 'manual' || value === '') {
                // Show manual input fields
                manualFields.style.display = 'block';
            } else {
                // Hide manual fields and populate with selected comm server data
                manualFields.style.display = 'none';
                populateCommServerData(entry, value);
            }
        }
    });
}

function populateCommServerData(entry, commServerId) {
    // Get comm server data from component linking
    const option = entry.querySelector(`.select-option[data-value="${commServerId}"]`);
    if (!option) return;
    
    const hostname = option.getAttribute('data-hostname');
    const name = option.getAttribute('data-name');
    
    // Populate fields
    const nameField = entry.querySelector('[name="commServerName"]');
    const hostField = entry.querySelector('[name="commServerHost"]');
    
    if (nameField) nameField.value = name;
    if (hostField) hostField.value = hostname;
}

export function refreshInterfaceComponents(entryOrNull = null) {
    // Component Linking übernimmt die Befüllung automatisch
    refreshAllComponentSelects();
}
