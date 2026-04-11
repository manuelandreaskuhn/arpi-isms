/**
 * Conditional Fields — Data-attribute-driven show/hide system.
 *
 * Elements (fields, groups, sections) can declare a condition via:
 *
 *   data-condition-field="fieldname"    — name of the controlling field
 *   data-condition-op="eq|neq|in|contains|gt|lt"
 *   data-condition-value="value"        — single value OR comma-separated list for "in"/"contains"
 *
 * Operators:
 *   eq        — controlling value equals condition value (string compare)
 *   neq       — controlling value does NOT equal condition value
 *   in        — condition value is a comma-list; controlling value must be one of them
 *   contains  — controlling field is a checkbox-group; at least one checked value
 *               must be in the comma-separated condition value list
 *   gt        — controlling numeric value is greater than condition value
 *   lt        — controlling numeric value is less than condition value
 *
 * The module reads the controlling field's current value, evaluates the
 * condition and toggles visibility. Hidden elements are also disabled so
 * they are excluded from form submission.
 *
 * Usage:
 *   import { initConditionalFields } from './conditional-fields.js';
 *   initConditionalFields();                      // scan whole document
 *   initConditionalFields(myFormElement);         // scope to a container
 */

// ─── Internal registry ───────────────────────────────────────────────────────

/** @type {Map<HTMLElement, {fieldName: string, op: string, condValue: string[]}>} */
const registry = new Map();

// ─── Public API ───────────────────────────────────────────────────────────────

/**
 * Scans the container for conditional elements, evaluates them once and
 * attaches the necessary event listeners.
 *
 * @param {Document|HTMLElement} [root=document]
 */
export function initConditionalFields(root = document) {
    const targets = root.querySelectorAll('[data-condition-field]');

    targets.forEach(el => {
        const fieldName = el.dataset.conditionField;
        const op = (el.dataset.conditionOp || 'eq').toLowerCase();
        const rawValue = el.dataset.conditionValue ?? '';
        const condValues = rawValue.split(',').map(v => v.trim());

        registry.set(el, { fieldName, op, condValues });

        // Evaluate immediately
        evaluateElement(el, root);
    });

    // Attach listeners to all form controls that might be controllers
    const controllerNames = new Set([...registry.values()].map(c => c.fieldName));
    controllerNames.forEach(name => attachListeners(name, root));
}

/**
 * Re-evaluates all registered conditional elements inside the container.
 * Call this after dynamic DOM changes (e.g. after restoring form data).
 *
 * @param {Document|HTMLElement} [root=document]
 */
export function reevaluateAll(root = document) {
    registry.forEach((_, el) => {
        if (root.contains(el)) {
            evaluateElement(el, root);
        }
    });
}

// ─── Evaluation ──────────────────────────────────────────────────────────────

/**
 * Evaluates a single conditional element and shows/hides it.
 *
 * @param {HTMLElement} el
 * @param {Document|HTMLElement} root
 */
function evaluateElement(el, root) {
    const { fieldName, op, condValues } = registry.get(el);
    const controllerValue = readFieldValue(fieldName, root);
    const visible = evaluate(op, controllerValue, condValues);
    setVisibility(el, visible);
}

/**
 * Evaluates the condition.
 *
 * @param {string}   op
 * @param {string|string[]} current  — string for single fields, string[] for checkbox-groups
 * @param {string[]} condValues
 * @returns {boolean}
 */
function evaluate(op, current, condValues) {
    const single = Array.isArray(current) ? (current[0] ?? '') : current;

    switch (op) {
        case 'eq':
            return single === (condValues[0] ?? '');

        case 'neq':
            return single !== (condValues[0] ?? '');

        case 'in':
            return condValues.includes(single);

        case 'contains':
            // current is an array of checked values; at least one must appear in condValues
            if (Array.isArray(current)) {
                return current.some(v => condValues.includes(v));
            }
            return condValues.includes(single);

        case 'gt':
            return parseFloat(single) > parseFloat(condValues[0] ?? '0');

        case 'lt':
            return parseFloat(single) < parseFloat(condValues[0] ?? '0');

        default:
            return false;
    }
}

// ─── DOM helpers ─────────────────────────────────────────────────────────────

/**
 * Shows or hides an element.
 * Hidden elements additionally get `data-conditional-hidden="true"` so that
 * formcollector.js can ignore them, and their inputs are disabled.
 *
 * @param {HTMLElement} el
 * @param {boolean}     visible
 */
function setVisibility(el, visible) {
    if (visible) {
        el.style.display = '';
        el.removeAttribute('data-conditional-hidden');
        el.querySelectorAll('input, select, textarea').forEach(i => i.removeAttribute('disabled'));
    } else {
        el.style.display = 'none';
        el.dataset.conditionalHidden = 'true';
        el.querySelectorAll('input, select, textarea').forEach(i => i.setAttribute('disabled', 'true'));
    }
}

/**
 * Reads the current value of a named field from the DOM.
 *
 * Supports:
 *  - Standard inputs / textareas / selects (name or id)
 *  - Custom selects (data-name attribute, reads data-value)
 *  - Checkbox groups (name="fieldname[]") → returns string[]
 *  - Single checkboxes / toggles → returns "true" | ""
 *  - Range sliders
 *
 * @param {string}               name
 * @param {Document|HTMLElement} root
 * @returns {string|string[]}
 */
function readFieldValue(name, root) {
    // 1. Custom select (data-name="name", stores value in data-value)
    const customSelect = root.querySelector(`.custom-select[data-name="${CSS.escape(name)}"]`);
    if (customSelect) {
        return customSelect.dataset.value ?? '';
    }

    // 2. Checkbox-group (name="fieldname[]")
    const checkboxes = root.querySelectorAll(`input[type="checkbox"][name="${CSS.escape(name)}[]"]`);
    if (checkboxes.length > 0) {
        return Array.from(checkboxes)
            .filter(cb => cb.checked)
            .map(cb => cb.value);
    }

    // 3. Single checkbox / toggle
    const singleCheck = root.querySelector(`input[type="checkbox"][name="${CSS.escape(name)}"], input[type="checkbox"][id="${CSS.escape(name)}"]`);
    if (singleCheck) {
        return singleCheck.checked ? 'true' : '';
    }

    // 4. Radio group
    const checkedRadio = root.querySelector(`input[type="radio"][name="${CSS.escape(name)}"]:checked`);
    if (checkedRadio) {
        return checkedRadio.value;
    }

    // 5. Range slider
    const range = root.querySelector(`input[type="range"][name="${CSS.escape(name)}"], input[type="range"][id="${CSS.escape(name)}"]`);
    if (range) {
        return range.value;
    }

    // 6. Standard text/number/email/url/textarea
    const input = root.querySelector(`[name="${CSS.escape(name)}"], [id="${CSS.escape(name)}"]`);
    if (input) {
        return (input.value ?? '').trim();
    }

    return '';
}

// ─── Event binding ────────────────────────────────────────────────────────────

/**
 * Attaches change/input listeners to all elements that can control a field.
 *
 * @param {string}               fieldName
 * @param {Document|HTMLElement} root
 */
function attachListeners(fieldName, root) {
    const onChange = () => {
        registry.forEach((_, el) => {
            if (registry.get(el).fieldName === fieldName && root.contains(el)) {
                evaluateElement(el, root);
            }
        });
    };

    // Custom selects fire a custom "change" event with { detail: { value } }
    root.querySelectorAll(`.custom-select[data-name="${CSS.escape(fieldName)}"]`)
        .forEach(el => el.addEventListener('change', onChange));

    // Standard inputs (text/number/range/url/email)
    root.querySelectorAll(
        `input:not([type="checkbox"]):not([type="radio"])[name="${CSS.escape(fieldName)}"],` +
        `input:not([type="checkbox"]):not([type="radio"])[id="${CSS.escape(fieldName)}"],` +
        `textarea[name="${CSS.escape(fieldName)}"]`
    ).forEach(el => el.addEventListener('input', onChange));

    // Checkboxes — both single toggles and group members
    root.querySelectorAll(
        `input[type="checkbox"][name="${CSS.escape(fieldName)}"],` +
        `input[type="checkbox"][id="${CSS.escape(fieldName)}"],` +
        `input[type="checkbox"][name="${CSS.escape(fieldName)}[]"]`
    ).forEach(el => el.addEventListener('change', onChange));

    // Radio buttons
    root.querySelectorAll(`input[type="radio"][name="${CSS.escape(fieldName)}"]`)
        .forEach(el => el.addEventListener('change', onChange));
}
