/**
 * Sammelt alle Daten aus einem Formular
 * Unterstützt: input, textarea, checkbox, custom-select
 * 
 * @param {HTMLFormElement} form
 * @returns {Object}
 */
/** Returns true if el is inside a conditionally hidden container */
function isConditionallyHidden(el) {
    return !!el.closest('[data-conditional-hidden="true"]');
}

export function collectFormData(form) {
    const data = {};

    // Standard-Inputs (text, number, email, etc.)
    form.querySelectorAll('input[type="text"], input[type="number"], input[type="email"], input[type="date"]').forEach(input => {
        if (isConditionallyHidden(input)) return;
        if (input.name) {
            data[input.name] = input.value || null;
        } else if (input.id) {
            data[input.id] = input.value || null;
        }
    });

    // Textareas
    form.querySelectorAll('textarea').forEach(textarea => {
        if (isConditionallyHidden(textarea)) return;
        if (textarea.name) {
            data[textarea.name] = textarea.value || null;
        } else if (textarea.id) {
            data[textarea.id] = textarea.value || null;
        }
    });

    // Checkboxen (mehrere Werte zu Array)
    const checkboxGroups = {};
    form.querySelectorAll('input[type="checkbox"]').forEach(checkbox => {
        if (isConditionallyHidden(checkbox)) return;
        const name = checkbox.name || checkbox.id;
        if (!name) return;

        if (checkbox.checked) {
            if (checkbox.value) {
                // Multi-checkbox (name group)
                if (!checkboxGroups[name]) {
                    checkboxGroups[name] = [];
                }
                checkboxGroups[name].push(checkbox.value);
            } else {
                // Single checkbox (boolean)
                data[name] = true;
            }
        }
    });

    // Checkbox-Groups zu data hinzufügen
    Object.assign(data, checkboxGroups);

    // Custom Selects
    form.querySelectorAll('.custom-select').forEach(select => {
        if (isConditionallyHidden(select)) return;
        const name = select.dataset.name;
        const value = select.dataset.value;
        if (name) {
            data[name] = value || null;
        }
    });

    // Numerische Werte konvertieren
    Object.keys(data).forEach(key => {
        const value = data[key];
        if (typeof value === 'string' && value !== null && value !== '') {
            // Versuche zu Number zu konvertieren wenn es wie eine Zahl aussieht
            if (/^\d+(\.\d+)?$/.test(value)) {
                data[key] = parseFloat(value);
            }
        }
    });

    return data;
}

/**
 * Befüllt ein Formular mit Daten (für Edit-Modus)
 * 
 * @param {HTMLFormElement} form
 * @param {Object} data
 */
export function populateFormData(form, data) {
    Object.keys(data).forEach(key => {
        const value = data[key];

        // Standard-Input
        const input = form.querySelector(`input[name="${key}"], input[id="${key}"], textarea[name="${key}"], textarea[id="${key}"]`);
        if (input) {
            input.value = value || '';
            return;
        }

        // Custom Select
        const customSelect = form.querySelector(`.custom-select[data-name="${key}"]`);
        if (customSelect) {
            customSelect.dataset.value = value || '';
            const trigger = customSelect.querySelector('.select-trigger span:first-child');
            const option = customSelect.querySelector(`.select-option[data-value="${value}"]`);
            if (trigger && option) {
                trigger.textContent = option.textContent;
            }
            return;
        }

        // Checkboxen
        if (Array.isArray(value)) {
            value.forEach(v => {
                const checkbox = form.querySelector(`input[type="checkbox"][name="${key}"][value="${v}"]`);
                if (checkbox) {
                    checkbox.checked = true;
                }
            });
        } else if (typeof value === 'boolean') {
            const checkbox = form.querySelector(`input[type="checkbox"][name="${key}"], input[type="checkbox"][id="${key}"]`);
            if (checkbox) {
                checkbox.checked = value;
            }
        }
    });
}
