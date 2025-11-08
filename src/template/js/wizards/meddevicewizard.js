import { initializeAllComponentSelects } from './componentlinking.js';
import { initializeHelpTooltips } from './helptooltip.js';
import { setupMedDeviceConditionalFields } from './system/meddevice.js';

document.addEventListener('DOMContentLoaded', function() {
    // Initialize component linking
    initializeAllComponentSelects();

    // Initialize help tooltips
    initializeHelpTooltips();
    
    // Setup conditional fields for medical device form
    const medDeviceForm = document.querySelector('.entry-content');
    if (medDeviceForm) {
        setupMedDeviceConditionalFields(medDeviceForm);
    }
    
    console.log('Medical Device Wizard initialized with component linking');
});
