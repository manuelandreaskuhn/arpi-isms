import { initializeComponentSelect, refreshAllComponentSelects } from './componentlinking.js';

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
    const allInputs = section.querySelectorAll('input:not([type="checkbox"]):not([type="radio"]), textarea, .custom-select');
    
    let previousFilledCount = 0;
    if (counter.dataset.filledCount) {
        previousFilledCount = parseInt(counter.dataset.filledCount, 10);
    }
    let filledCount = 0;
    let totalCount = allInputs.length;

    allInputs.forEach(field => {
        let isFilled = false;
        
        if (field.classList.contains('custom-select')) {
            isFilled = field.dataset.value && field.dataset.value !== '';
        } else if (field.tagName === 'TEXTAREA') {
            isFilled = field.value.trim() !== '';
        } else {
            isFilled = field.value.trim() !== '';
        }
        
        if (isFilled) filledCount++;
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

    //Update form status
    let lastchangespan = document.querySelector(".formmanagement > span.form-status");
    if (lastchangespan && filledCount !== previousFilledCount) {
        lastchangespan.textContent = 'Ungespeicherte Änderungen';
        lastchangespan.dataset.status = 'changed';

        let savebutton = document.querySelector(".formmanagement > button.btn-save");
        if (savebutton) {
            savebutton.disabled = false;
        }
    }
}

// Initialize all custom selects on page load
document.addEventListener('DOMContentLoaded', function() {
    // Setup all custom selects
    document.querySelectorAll('.custom-select').forEach(select => {
        setupCustomSelect(select);
    });
    
    // Initialize component linking for all component selects
    refreshAllComponentSelects();
    
    // Section toggle functionality
    document.querySelectorAll('.section-title').forEach(title => {
        title.addEventListener('click', function() {
            const section = this.closest('.form-section');
            section.classList.toggle('collapsed');
        });
    });

    //Listeners for inputs to update section counters
    document.querySelectorAll('.form-section').forEach(section => {
        section.querySelectorAll('input, textarea').forEach(field => {
            field.addEventListener('input', () => {
                updateSectionCounter(section);
            });
        });
    });
    
    // Initialize section counters
    document.querySelectorAll('.form-section').forEach(section => {
        updateSectionCounter(section);
    });
});

// Make refresh function globally accessible
window.refreshAllComponentSelects = refreshAllComponentSelects;