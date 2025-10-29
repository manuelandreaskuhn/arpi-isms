import { initializeAllComponentSelects } from './componentlinking.js';
import { initializeHelpTooltips } from './helptooltip.js';

document.addEventListener('DOMContentLoaded', function() {
    // Initialize component linking
    initializeAllComponentSelects();

    // Initialize help tooltips
    initializeHelpTooltips();
    
    console.log('SIEM Wizard initialized with component linking');
});
