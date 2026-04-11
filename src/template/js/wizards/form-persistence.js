/**
 * Generate a UUID for form instance
 */
function generateUUID() {
    return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
        const r = Math.random() * 16 | 0;
        const v = c === 'x' ? r : (r & 0x3 | 0x8);
        return v.toString(16);
    });
}

/**
 * Get storage key for form instance
 */
function getStorageKey(formId, instanceUuid) {
    return `form_${formId}_${instanceUuid}`;
}

/**
 * Get or create instance UUID for form
 */
export function getOrCreateInstanceUuid(formId) {
    const form = document.getElementById(formId);
    if (!form) return null;

    let instanceUuid = form.dataset.instanceUuid;

    // If no UUID exists, generate one
    if (!instanceUuid || instanceUuid === '') {
        instanceUuid = generateUUID();
        form.dataset.instanceUuid = instanceUuid;
    }

    return instanceUuid;
}

/**
 * Save form data to sessionStorage
 */
export function saveFormData(formId) {
    const form = document.getElementById(formId);
    if (!form) return;

    const instanceUuid = getOrCreateInstanceUuid(formId);
    if (!instanceUuid) return;

    const formData = new FormData(form);
    const data = {};

    // Regular form fields
    for (let [key, value] of formData.entries()) {
        if (data[key]) {
            // Handle multiple values (checkboxes)
            if (Array.isArray(data[key])) {
                data[key].push(value);
            } else {
                data[key] = [data[key], value];
            }
        } else {
            data[key] = value;
        }
    }

    // Custom selects
    form.querySelectorAll('.custom-select').forEach(select => {
        const name = select.dataset.name;
        const value = select.dataset.value;
        if (name && value) {
            data[name] = value;
        }
    });

    // Save ALL section counter states (read current DOM state)
    const counters = {};
    document.querySelectorAll('.form-section').forEach(section => {
        const counter = section.querySelector('.section-counter');
        const sectionTitle = section.querySelector('.section-title span:first-child');
        if (counter && sectionTitle) {
            const sectionName = sectionTitle.textContent.trim();
            // Always read current values from DOM
            counters[sectionName] = {
                filledCount: counter.dataset.filledCount || '0',
                totalCount: counter.dataset.totalCount || '0',
                text: counter.textContent,
                initialized: counter.dataset.initialized || 'false'
            };
        }
    });
    data['__section_counters__'] = counters;
    data['__instance_uuid__'] = instanceUuid;
    data['__timestamp__'] = new Date().toISOString();

    const storageKey = getStorageKey(formId, instanceUuid);
    sessionStorage.setItem(storageKey, JSON.stringify(data));
}

/**
 * Restore form data from sessionStorage
 */
export function restoreFormData(formId) {
    const form = document.getElementById(formId);
    if (!form) return;

    const instanceUuid = getOrCreateInstanceUuid(formId);
    if (!instanceUuid) return;

    const storageKey = getStorageKey(formId, instanceUuid);
    const savedData = sessionStorage.getItem(storageKey);

    if (!savedData) {
        return;
    }

    try {
        const data = JSON.parse(savedData);

        // Verify this is the correct instance
        if (data['__instance_uuid__'] && data['__instance_uuid__'] !== instanceUuid) {
            return;
        }

        // Restore regular fields FIRST
        Object.entries(data).forEach(([name, value]) => {
            if (name.startsWith('__')) return; // Skip metadata fields

            const fields = form.querySelectorAll(`[name="${name}"]`);
            fields.forEach(field => {
                if (field.type === 'checkbox' || field.type === 'radio') {
                    if (Array.isArray(value)) {
                        field.checked = value.includes(field.value);
                    } else {
                        field.checked = field.value === value;
                    }
                } else if (field.type === 'range') {
                    field.value = value;
                    // Update display if exists
                    const displayId = field.id.replace('-slider', '-display');
                    const display = document.getElementById(displayId);
                    if (display) {
                        display.textContent = value;
                    }
                } else if (field.tagName === 'SELECT') {
                    field.value = value;
                } else {
                    field.value = value;
                }
            });

            // Restore custom selects
            const customSelect = form.querySelector(`.custom-select[data-name="${name}"]`);
            if (customSelect && value) {
                customSelect.dataset.value = value;
                // Update visual display
                const trigger = customSelect.querySelector('.select-trigger');
                const placeholder = trigger?.querySelector('.placeholder');
                const valueSpan = trigger?.querySelector('.value');
                const option = customSelect.querySelector(`.select-option[data-value="${value}"]`);

                if (option && placeholder && valueSpan) {
                    placeholder.style.display = 'none';
                    valueSpan.style.display = 'inline';
                    valueSpan.textContent = option.textContent;
                    option.classList.add('selected');
                }
            }
        });

        // Restore section counters IMMEDIATELY
        if (data['__section_counters__']) {
            document.querySelectorAll('.form-section').forEach(section => {
                const counter = section.querySelector('.section-counter');
                const sectionTitle = section.querySelector('.section-title span:first-child');
                if (counter && sectionTitle) {
                    const sectionName = sectionTitle.textContent.trim();
                    const counterData = data['__section_counters__'][sectionName];
                    if (counterData) {
                        // Mark counter as restored to prevent overwriting
                        counter.dataset.restoredFromSession = 'true';
                        counter.textContent = counterData.text;
                        counter.dataset.filledCount = counterData.filledCount;
                        counter.dataset.totalCount = counterData.totalCount;
                        counter.dataset.initialized = 'true';

                        // Update counter styling
                        const filledCount = parseInt(counterData.filledCount, 10);
                        const totalCount = parseInt(counterData.totalCount, 10);
                        counter.classList.remove('complete', 'partial');
                        if (filledCount === totalCount && totalCount > 0) {
                            counter.classList.add('complete');
                        } else if (filledCount > 0) {
                            counter.classList.add('partial');
                        }
                    }
                }
            });
        }

        // Signal that form data has been restored so conditional fields can re-evaluate
        form.dispatchEvent(new CustomEvent('formDataRestored', { bubbles: true }));

    } catch (e) {
        console.error('Error restoring form data:', e);
    }
}

/**
 * Clear saved form data
 */
export function clearFormData(formId) {
    const form = document.getElementById(formId);
    if (!form) return;

    const instanceUuid = form.dataset.instanceUuid;
    if (!instanceUuid) return;

    const storageKey = getStorageKey(formId, instanceUuid);
    sessionStorage.removeItem(storageKey);
}

/**
 * Auto-save form data on change
 */
export function enableAutoSave(formId) {
    const form = document.getElementById(formId);
    if (!form) return;

    // Ensure UUID exists
    getOrCreateInstanceUuid(formId);

    // Debounce function to avoid too frequent saves
    let saveTimeout;
    const debouncedSave = () => {
        clearTimeout(saveTimeout);
        saveTimeout = setTimeout(() => {
            saveFormData(formId);
        }, 300);
    };

    // Save on any input change
    form.addEventListener('input', debouncedSave);
    form.addEventListener('change', debouncedSave);

    // Also save when custom selects change
    form.addEventListener('custom-select-change', debouncedSave);
}

/**
 * Save section counter manually - DEPRECATED, use saveFormData instead
 */
export function saveSectionCounters(formId, sectionToUpdate = null) {
    // Simply call saveFormData which now saves all counters correctly
    saveFormData(formId);
}

/**
 * List all saved form instances
 */
export function listFormInstances(formId) {
    const instances = [];
    for (let i = 0; i < sessionStorage.length; i++) {
        const key = sessionStorage.key(i);
        if (key && key.startsWith(`form_${formId}_`)) {
            const data = sessionStorage.getItem(key);
            try {
                const parsed = JSON.parse(data);
                instances.push({
                    key,
                    uuid: parsed['__instance_uuid__'],
                    timestamp: parsed['__timestamp__']
                });
            } catch (e) {
                console.error('Error parsing instance:', e);
            }
        }
    }
    return instances;
}

/**
 * Clean up old form instances (keep only the most recent N instances)
 */
export function cleanupOldInstances(formId, keepCount = 5) {
    const instances = listFormInstances(formId);

    // Sort by timestamp (newest first)
    instances.sort((a, b) => {
        const timeA = new Date(a.timestamp || 0);
        const timeB = new Date(b.timestamp || 0);
        return timeB - timeA;
    });

    // Remove old instances
    if (instances.length > keepCount) {
        const toRemove = instances.slice(keepCount);
        toRemove.forEach(instance => {
            sessionStorage.removeItem(instance.key);
        });
    }
}
