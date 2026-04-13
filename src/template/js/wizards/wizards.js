import { initializeComponentSelect, refreshAllComponentSelects } from './componentlinking.js';
import { initConditionalFields, reevaluateAll as reevaluateConditionalFields } from './conditional-fields.js';
import './wizard-debug.js';

// Global state for custom selects
const customSelectsRegistry = new Map();

/**
 * Setup a custom select dropdown
 * @param {HTMLElement} selectElement - The custom select element
 */
export function setupCustomSelect(selectElement) {
    // Skip if already initialized
    if (customSelectsRegistry.has(selectElement)) {
        return;
    }

    const trigger = selectElement.querySelector('.select-trigger');
    const dropdown = selectElement.querySelector('.select-dropdown');
    const options = selectElement.querySelectorAll('.select-option');
    const searchInput = selectElement.querySelector('.select-search input');
    // Fix: Check both dataset.multiple and data-multiple attribute
    const isMultiple = selectElement.dataset.multiple === 'true' ||
        selectElement.getAttribute('data-multiple') === 'true';

    if (!trigger || !dropdown) return;

    // Register this select
    customSelectsRegistry.set(selectElement, {
        trigger,
        dropdown,
        options: Array.from(options),
        isMultiple
    });

    // Toggle dropdown
    trigger.addEventListener('click', (e) => {
        e.stopPropagation();

        // Close all other dropdowns
        document.querySelectorAll('.custom-select .select-dropdown.active').forEach(d => {
            if (d !== dropdown) {
                d.classList.remove('active');
                d.parentElement.querySelector('.select-trigger')?.classList.remove('active');
            }
        });

        // Toggle current
        dropdown.classList.toggle('active');
        trigger.classList.toggle('active');

        // Focus search if exists
        if (searchInput && dropdown.classList.contains('active')) {
            setTimeout(() => searchInput.focus(), 100);
        }
    });

    // Handle option selection
    options.forEach(option => {
        option.addEventListener('click', (e) => {
            e.stopPropagation();
            const value = option.dataset.value;

            // Get the current isMultiple state from registry
            const selectInfo = customSelectsRegistry.get(selectElement);
            const currentIsMultiple = selectInfo ? selectInfo.isMultiple : isMultiple;

            if (currentIsMultiple) {
                handleMultipleSelection(selectElement, option, value);
                // Don't close dropdown for multi-select
            } else {
                handleSingleSelection(selectElement, option, value);
                // Close dropdown for single select
                dropdown.classList.remove('active');
                trigger.classList.remove('active');
            }

            // Update section counter if in a form section
            const section = selectElement.closest('.form-section');
            if (section) {
                updateSectionCounter(section);
            }
        });
    });

    // Search functionality
    if (searchInput) {
        searchInput.addEventListener('input', (e) => {
            const searchTerm = e.target.value.toLowerCase();
            filterOptions(selectElement, searchTerm);
        });

        // Prevent dropdown close on search input click
        searchInput.addEventListener('click', (e) => {
            e.stopPropagation();
        });
    }

    // Close dropdown when clicking outside
    document.addEventListener('click', (e) => {
        if (!selectElement.contains(e.target)) {
            dropdown.classList.remove('active');
            trigger.classList.remove('active');
        }
    });

    // Initialize component linking if applicable
    if (selectElement.dataset.componentType) {
        initializeComponentSelect(selectElement);
    }
}

/**
 * Handle single selection in custom select
 */
function handleSingleSelection(selectElement, option, value) {
    const trigger = selectElement.querySelector('.select-trigger');
    const dropdown = selectElement.querySelector('.select-dropdown');
    const options = selectElement.querySelectorAll('.select-option');

    // Remove all selected states
    options.forEach(opt => opt.classList.remove('selected'));

    // Add selected state to clicked option
    if (value !== '') {
        option.classList.add('selected');
    }

    // Update trigger text
    const placeholder = trigger.querySelector('.placeholder');
    const valueSpan = trigger.querySelector('.value') || createValueSpan(trigger);

    if (value === '') {
        placeholder.style.display = 'inline';
        valueSpan.style.display = 'none';
        valueSpan.textContent = '';
    } else {
        placeholder.style.display = 'none';
        valueSpan.style.display = 'inline';
        valueSpan.textContent = option.textContent;
    }

    // Set data-value on select element
    selectElement.dataset.value = value;

    // Trigger change event
    selectElement.dispatchEvent(new CustomEvent('change', {
        detail: { value }
    }));
}

/**
 * Handle multiple selection in custom select
 */
function handleMultipleSelection(selectElement, option, value) {
    if (value === '') return; // Skip empty option in multi-select

    const trigger = selectElement.querySelector('.select-trigger');
    const placeholder = trigger.querySelector('.placeholder');
    let selectedBadges = selectElement.querySelector('.selected-badges');

    // Create badges container if it doesn't exist
    if (!selectedBadges) {
        selectedBadges = document.createElement('div');
        selectedBadges.className = 'selected-badges';
        // Insert after placeholder
        placeholder.parentNode.insertBefore(selectedBadges, placeholder.nextSibling);
    }

    // Toggle selected state
    const wasSelected = option.classList.contains('selected');
    option.classList.toggle('selected');

    if (!wasSelected) {
        // Add badge
        const badge = document.createElement('div');
        badge.className = 'badge';
        badge.dataset.value = value;
        badge.innerHTML = `
            <span class="badge-text">${option.textContent}</span>
            <span class="badge-remove" data-value="${value}">×</span>
        `;
        selectedBadges.appendChild(badge);

        // Remove badge on click
        badge.querySelector('.badge-remove').addEventListener('click', (e) => {
            e.stopPropagation();
            badge.remove();
            option.classList.remove('selected');
            updateMultiSelectValue(selectElement);

            // Trigger change event
            selectElement.dispatchEvent(new CustomEvent('change', {
                detail: { values: getSelectedValues(selectElement) }
            }));
        });
    } else {
        // Remove badge
        const badge = selectedBadges.querySelector(`.badge[data-value="${value}"]`);
        if (badge) badge.remove();
    }

    updateMultiSelectValue(selectElement);

    // Trigger change event
    selectElement.dispatchEvent(new CustomEvent('change', {
        detail: { values: getSelectedValues(selectElement) }
    }));
}

/**
 * Update multi-select value
 */
function updateMultiSelectValue(selectElement) {
    const values = getSelectedValues(selectElement);
    selectElement.dataset.value = values.join(',');

    const placeholder = selectElement.querySelector('.select-trigger .placeholder');
    const selectedBadges = selectElement.querySelector('.selected-badges');

    if (values.length === 0) {
        placeholder.style.display = 'inline';
        if (selectedBadges) selectedBadges.style.display = 'none';
    } else {
        placeholder.style.display = 'none';
        if (selectedBadges) selectedBadges.style.display = 'flex';
    }
}

/**
 * Get selected values from multi-select
 */
function getSelectedValues(selectElement) {
    const selectedOptions = selectElement.querySelectorAll('.select-option.selected');
    return Array.from(selectedOptions).map(opt => opt.dataset.value);
}

/**
 * Filter options based on search term
 */
function filterOptions(selectElement, searchTerm) {
    const options = selectElement.querySelectorAll('.select-option');
    const groupHeaders = selectElement.querySelectorAll('.select-group-header');

    options.forEach(option => {
        const text = option.textContent.toLowerCase();
        const matches = text.includes(searchTerm);
        option.classList.toggle('hidden', !matches);
    });

    // Hide group headers if all options in group are hidden
    groupHeaders.forEach(header => {
        let nextElement = header.nextElementSibling;
        let hasVisibleOptions = false;

        while (nextElement && !nextElement.classList.contains('select-group-header')) {
            if (nextElement.classList.contains('select-option') &&
                !nextElement.classList.contains('hidden')) {
                hasVisibleOptions = true;
                break;
            }
            nextElement = nextElement.nextElementSibling;
        }

        header.classList.toggle('hidden', !hasVisibleOptions);
    });
}

/**
 * Create value span for single select
 */
function createValueSpan(trigger) {
    const valueSpan = document.createElement('span');
    valueSpan.className = 'value';
    valueSpan.style.display = 'none';

    const placeholder = trigger.querySelector('.placeholder');
    trigger.insertBefore(valueSpan, placeholder);

    return valueSpan;
}

/**
 * Update listeners for dynamically added entry
 */
export function updateListenersForDynamicEntry(entry) {
    // Custom Select listeners
    entry.querySelectorAll('.custom-select').forEach(select => {
        setupCustomSelect(select);
    });

    // Input listeners for section counter
    entry.querySelectorAll('input, textarea').forEach(field => {
        field.addEventListener('input', () => {
            const section = entry.closest('.form-section');
            if (section) {
                updateSectionCounter(section);
            }
        });
    });
}

/**
 * Remove custom selects from registry when entry is removed
 */
export function removeCustomSelects(entry) {
    entry.querySelectorAll('.custom-select').forEach(select => {
        customSelectsRegistry.delete(select);
    });
}

/**
 * Update section counter based on filled fields
 */
export function updateSectionCounter(section) {
    const counter = section.querySelector('.section-counter');
    if (!counter) return;

    const requiredFields = section.querySelectorAll('[required]');
    // Exclude inputs inside conditionally hidden elements
    const allInputs = section.querySelectorAll(
        'input:not([type="checkbox"]):not([type="radio"]):not([type="range"]), textarea, .custom-select, .toggle-switch input[type="checkbox"]'
    );
    const visibleInputs = Array.from(allInputs).filter(el => !el.closest('[data-conditional-hidden="true"]'));

    // Add radio button groups (count each unique name as one field)
    const radioGroups = new Set();
    section.querySelectorAll('input[type="radio"]').forEach(radio => {
        if (radio.name) radioGroups.add(radio.name);
    });

    // Add checkbox groups (count groups with name[] pattern)
    const checkboxGroups = new Set();
    section.querySelectorAll('input[type="checkbox"]:not(.toggle-switch input)').forEach(checkbox => {
        if (checkbox.name && checkbox.name.includes('[]')) {
            checkboxGroups.add(checkbox.name);
        }
    });

    // Add range sliders
    const rangeSliders = section.querySelectorAll('input[type="range"]');

    let previousFilledCount = 0;
    if (counter.dataset.filledCount) {
        previousFilledCount = parseInt(counter.dataset.filledCount, 10);
    }
    let filledCount = 0;
    let totalCount = visibleInputs.length + radioGroups.size + checkboxGroups.size + rangeSliders.length;

    // Count regular inputs (only visible/non-conditional-hidden)
    visibleInputs.forEach(field => {
        let isFilled = false;

        if (field.classList.contains('custom-select')) {
            isFilled = field.dataset.value && field.dataset.value !== '';
        } else if (field.tagName === 'TEXTAREA') {
            isFilled = field.value.trim() !== '';
        } else if (field.type === 'checkbox') {
            isFilled = field.checked;
        } else {
            isFilled = field.value.trim() !== '';
        }

        if (isFilled) filledCount++;
    });

    // Count radio button groups (one filled per group)
    radioGroups.forEach(groupName => {
        const checkedRadio = section.querySelector(`input[type="radio"][name="${groupName}"]:checked`);
        if (checkedRadio) filledCount++;
    });

    // Count checkbox groups (at least one checked)
    checkboxGroups.forEach(groupName => {
        const checkedCheckbox = section.querySelector(`input[type="checkbox"][name="${groupName}"]:checked`);
        if (checkedCheckbox) filledCount++;
    });

    // Count range sliders (always count as filled if they have a value)
    rangeSliders.forEach(slider => {
        if (slider.value && slider.value !== '') filledCount++;
    });

    counter.textContent = `${filledCount}/${totalCount}`;
    counter.dataset.filledCount = filledCount;
    counter.dataset.totalCount = totalCount;

    // Update counter styling
    counter.classList.remove('complete', 'partial');
    if (filledCount === totalCount && totalCount > 0) {
        counter.classList.add('complete');
    } else if (filledCount > 0) {
        counter.classList.add('partial');
    }

    // Update form status in floating bar only if count changed AND it's not initial load
    const isInitialLoad = counter.dataset.initialized !== 'true';

    // Don't change status on initial load if fields are already filled (page refresh/navigation)
    if (filledCount !== previousFilledCount && !isInitialLoad) {
        updateFormStatus('changed');
    } else if (isInitialLoad && filledCount > 0) {
        // On initial load with filled fields, set status to 'changed' but don't show timestamp
        updateFormStatus('notsaved', 'Nicht gespeichert');
    }

    // Mark as initialized after first count
    if (isInitialLoad) {
        counter.dataset.initialized = 'true';
    }

    // Save counter state to sessionStorage - only for THIS section
    if (window.saveSectionCounters) {
        const form = section.closest('form');
        if (form) {
            // Pass the specific section to only update that one
            window.saveSectionCounters(form.id, section);
        }
    }
}

/**
 * Update form status in the floating form management bar
 */
function updateFormStatus(status = 'notsaved', message = null) {
    // Try floating bar first (new design)
    let statusSpan = document.querySelector('.floating-form-management .form-status');
    let saveButton = document.querySelector('.floating-form-management .btn-save');
    let lastChangeSpan = document.querySelector('.floating-form-management .form-lastchange');
    let statusIcon = document.querySelector('.floating-form-management .form-status-icon');

    // Fallback to old formmanagement structure if floating bar doesn't exist
    if (!statusSpan) {
        statusSpan = document.querySelector('.formmanagement .form-status');
        saveButton = document.querySelector('.formmanagement .btn-save');
        statusIcon = document.querySelector('.formmanagement .form-status-icon');
    }

    if (!statusSpan) return;

    // Update status text and attribute
    statusSpan.dataset.status = status;

    // Update icon color and animation via data attribute
    if (statusIcon) {
        statusIcon.dataset.status = status;
    }

    switch (status) {
        case 'unchanged':
            statusSpan.textContent = message || 'Keine Änderungen';
            if (saveButton) saveButton.disabled = true;
            if (lastChangeSpan) {
                lastChangeSpan.textContent = '';
            }
            break;

        case 'changed':
        case 'notsaved':
            statusSpan.textContent = message || 'Nicht gespeichert';
            if (saveButton) saveButton.disabled = false;
            if (lastChangeSpan) {
                const now = new Date();
                const timeString = now.toLocaleTimeString('de-DE', {
                    hour: '2-digit',
                    minute: '2-digit'
                });
                lastChangeSpan.textContent = `Letzte Änderung: ${timeString}`;
                statusSpan.dataset.lastchange = now.toISOString();
            }
            break;

        case 'saved':
            statusSpan.textContent = message || 'Gespeichert';
            if (saveButton) saveButton.disabled = true;
            if (lastChangeSpan) {
                const savedTime = new Date(statusSpan.dataset.lastchange || Date.now());
                const timeString = savedTime.toLocaleTimeString('de-DE', {
                    hour: '2-digit',
                    minute: '2-digit'
                });
                lastChangeSpan.textContent = `Gespeichert um ${timeString}`;
            }
            break;

        case 'error':
            statusSpan.textContent = message || 'Fehler beim Speichern';
            if (saveButton) saveButton.disabled = false;
            if (lastChangeSpan) {
                lastChangeSpan.textContent = 'Bitte erneut versuchen';
            }
            break;
    }
}

// Initialize all custom selects on page load
document.addEventListener('DOMContentLoaded', function () {
    // Initialize conditional fields (data-condition-* attributes)
    initConditionalFields();
    // Setup all custom selects
    document.querySelectorAll('.custom-select').forEach(select => {
        setupCustomSelect(select);
    });

    // Initialize Toggle slider status text initialization
    document.querySelectorAll('.toggle-switch input[type="checkbox"]').forEach(checkbox => {
        const statusSpan = checkbox.closest('.toggle-wrapper').querySelector('.toggle-status');
        if (statusSpan) {
            statusSpan.textContent = checkbox.checked ? 'Aktiviert' : 'Nicht aktiviert';
        }
    });

    // Initialize component linking for all component selects
    refreshAllComponentSelects();

    // Section toggle functionality
    document.querySelectorAll('.section-title').forEach(title => {
        title.addEventListener('click', function () {
            const section = this.closest('.form-section');
            section.classList.toggle('collapsed');
        });
    });

    // Initialize toggle slider change listeners
    document.querySelectorAll('.toggle-switch input[type="checkbox"]').forEach(checkbox => {
        checkbox.addEventListener('change', function () {
            const statusSpan = this.closest('.toggle-wrapper').querySelector('.toggle-status');
            if (statusSpan) {
                statusSpan.textContent = this.checked ? 'Aktiviert' : 'Nicht aktiviert';
            }
        });
    });

    // Initialize section counters FIRST (but DON'T overwrite restored values)
    document.querySelectorAll('.form-section').forEach(section => {
        const counter = section.querySelector('.section-counter');
        // Only update if counter hasn't been restored from sessionStorage
        if (counter && !counter.dataset.restoredFromSession) {
            updateSectionCounter(section);
        } else if (counter) {
            // Mark as initialized if it was restored
            counter.dataset.initialized = 'true';
        }
    });

    // Initialize form status AFTER counters are set with 'unchanged' status
    updateFormStatus('unchanged', 'Keine Änderungen');

    // Listeners for ALL inputs to update section counters and form status
    document.querySelectorAll('.form-section').forEach(section => {
        // Text inputs and textareas
        section.querySelectorAll('input:not([type="checkbox"]):not([type="radio"]):not([type="range"]), textarea').forEach(field => {
            field.addEventListener('input', () => {
                updateSectionCounter(section);
            });
        });

        // Radio buttons
        section.querySelectorAll('input[type="radio"]').forEach(radio => {
            radio.addEventListener('change', () => {
                updateSectionCounter(section);
            });
        });

        // Checkboxes (including toggle switches and checkbox groups)
        section.querySelectorAll('input[type="checkbox"]').forEach(checkbox => {
            checkbox.addEventListener('change', () => {
                updateSectionCounter(section);
            });
        });

        // Range sliders - trigger form status directly
        section.querySelectorAll('input[type="range"]').forEach(slider => {
            slider.addEventListener('input', () => {
                updateSectionCounter(section);
                // Directly update form status for sliders
                updateFormStatus('changed');
            });

            slider.addEventListener('change', () => {
                updateSectionCounter(section);
                // Directly update form status for sliders
                updateFormStatus('changed');
            });
        });
    });

    // Re-evaluate conditional fields after form data is restored from session
    document.addEventListener('formDataRestored', () => {
        reevaluateConditionalFields();
    });

    // Add form submit listener (example)
    document.querySelectorAll('form').forEach(form => {
        form.addEventListener('submit', function (e) {
            e.preventDefault();
            // Simulate save operation
            updateFormStatus('saved');

            // Your actual save logic here
            console.log('Form submitted');
        });
    });

    // Globale Behandlung für alle Abbrechen-Buttons
    document.querySelectorAll('.btn-cancel').forEach(btn => {
        btn.addEventListener('click', () => {
            if (confirm('Möchten Sie wirklich abbrechen? Alle ungespeicherten Änderungen gehen verloren.')) {
                window.location.href = '/ComponentManagement.html';
            }
        });
    });
});

// Make functions globally accessible
window.refreshAllComponentSelects = refreshAllComponentSelects;
window.updateFormStatus = updateFormStatus;
window.updateSectionCounter = updateSectionCounter;
window.reevaluateConditionalFields = reevaluateConditionalFields;