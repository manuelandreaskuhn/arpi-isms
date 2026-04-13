/**
 * wizard-base.js
 *
 * Gemeinsame Initialisierungs-Logik für alle Wizard-Seiten.
 * Kapselt den identischen Boilerplate aus den einzelnen wizard*.js Dateien.
 */

import { initializeAllComponentSelects } from './componentlinking.js';
import { initializeHelpTooltips } from './helptooltip.js';
import { initializeWizardNavigation } from './wizardnavigation.js';
import {
    restoreFormData,
    enableAutoSave,
    clearFormData,
    saveSectionCounters,
    getOrCreateInstanceUuid,
    cleanupOldInstances
} from './form-persistence.js';
import { collectFormData } from './formcollector.js';

/**
 * Initialisiert einen Wizard: Komponenten-Selects, Help-Tooltips, Navigation,
 * Form-Persistenz und ruft anschliessend setupFn(form) auf.
 *
 * @param {string}   formId    ID des Formular-Elements
 * @param {Function} setupFn   Wizard-spezifische Setup-Funktion, erhält das form-Element
 */
export function initWizard(formId, setupFn) {
    document.addEventListener('DOMContentLoaded', function () {
        initializeAllComponentSelects();
        initializeHelpTooltips();
        initializeWizardNavigation();

        window.saveSectionCounters = (id, section = null) => saveSectionCounters(id, section);

        getOrCreateInstanceUuid(formId);
        cleanupOldInstances(formId, 5);
        restoreFormData(formId);
        enableAutoSave(formId);

        const form = document.getElementById(formId);
        if (form && setupFn) {
            setupFn(form);
        }
    });
}

/**
 * Erzeugt einen standardisierten Submit-Handler für einen Wizard.
 *
 * @param {string} formId      ID des Formular-Elements
 * @param {string} apiUrl      API-Endpunkt (POST)
 * @param {string} successMsg  Erfolgsmeldung für alert()
 * @param {string} redirect    URL für window.location.href nach Erfolg
 * @returns {Function}         Event-Handler für form.addEventListener('submit', ...)
 */
export function createSubmitHandler(formId, apiUrl, successMsg, redirect) {
    return async function (event) {
        event.preventDefault();
        if (!event.target.reportValidity()) return;

        const formData = collectFormData(event.target);

        try {
            const response = await fetch(apiUrl, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                credentials: 'include',
                body: JSON.stringify(formData)
            });

            const result = await response.json();

            if (result.success) {
                clearFormData(formId);
                if (window.updateFormStatus) window.updateFormStatus('saved');
                alert(successMsg);
                window.location.href = redirect;
            } else {
                const errors = result.errors ? result.errors.join('\n') : 'Unbekannter Fehler';
                alert('Fehler beim Erstellen:\n' + errors);
                if (window.updateFormStatus) window.updateFormStatus('error');
            }
        } catch (error) {
            console.error('API Error:', error);
            alert('Verbindungsfehler zur API');
            if (window.updateFormStatus) window.updateFormStatus('error');
        }
    };
}

/**
 * Beobachtet Änderungen des data-value-Attributs eines Custom-Select-Elements
 * und ruft onChange(value) auf.
 *
 * Ersetzt die wiederkehrenden MutationObserver-Blöcke in den Wizard-Dateien.
 *
 * @param {string}   selector  CSS-Selektor des .custom-select Elements
 * @param {Function} onChange  Callback mit (value: string) => void
 */
export function watchSelect(selector, onChange) {
    const el = document.querySelector(selector);
    if (!el) return;

    const observer = new MutationObserver(() => onChange(el.dataset.value ?? ''));
    observer.observe(el, { attributes: true, attributeFilter: ['data-value'] });

    // Einmalig zum Start auswerten
    onChange(el.dataset.value ?? '');
}

/**
 * Zeigt/versteckt ein Element abhängig von einem Custom-Select-Wert.
 * Kurzform für den häufigsten watchSelect-Anwendungsfall.
 *
 * @param {string}          selectSelector  CSS-Selektor des Custom-Select
 * @param {string|string[]} showValues      Wert(e), bei denen target sichtbar sein soll
 * @param {string}          targetSelector  CSS-Selektor des ein-/auszublendenden Elements
 */
export function toggleOnSelect(selectSelector, showValues, targetSelector) {
    const values = Array.isArray(showValues) ? showValues : [showValues];
    watchSelect(selectSelector, (value) => {
        const target = document.querySelector(targetSelector);
        if (target) target.style.display = values.includes(value) ? 'block' : 'none';
    });
}
