import { refreshAllComponentSelects } from '../componentlinking.js';

/**
 * Setup conditional fields for TI Infrastructure
 * @param {HTMLElement} tiSection - The TI section element
 */
export function setupTIConditionalFields(tiSection) {
    if (!tiSection) return;

    // TI Connected checkbox
    const tiConnectedCheck = tiSection.querySelector('.ti-connected-check');
    const tiConnectionConfig = tiSection.querySelector('.ti-connection-config');
    
    if (tiConnectedCheck && tiConnectionConfig) {
        tiConnectedCheck.addEventListener('change', function() {
            tiConnectionConfig.style.display = this.checked ? 'block' : 'none';
            if (this.checked) {
                refreshAllComponentSelects();
            }
        });
    }

    // KIM Active checkbox
    const kimActiveCheck = tiSection.querySelector('.ti-kim-active-check');
    const kimConfig = tiSection.querySelector('.ti-kim-config');
    
    if (kimActiveCheck && kimConfig) {
        kimActiveCheck.addEventListener('change', function() {
            kimConfig.style.display = this.checked ? 'block' : 'none';
        });
    }

    // E-Rezept Active checkbox
    const erezeptActiveCheck = tiSection.querySelector('.ti-erezept-active-check');
    const erezeptConfig = tiSection.querySelector('.ti-erezept-config');
    
    if (erezeptActiveCheck && erezeptConfig) {
        erezeptActiveCheck.addEventListener('change', function() {
            erezeptConfig.style.display = this.checked ? 'block' : 'none';
        });
    }
}
