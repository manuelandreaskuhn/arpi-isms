import { initializeHelpTooltips } from './helptooltip.js';

document.addEventListener('DOMContentLoaded', function() {
    // Initialize help tooltips
    initializeHelpTooltips();

    // HA Configuration toggle
    const haCheck = document.getElementById('fw-ha-check');
    const haConfig = document.getElementById('fw-ha-config');
    
    if (haCheck && haConfig) {
        haCheck.addEventListener('change', function() {
            haConfig.style.display = this.checked ? 'block' : 'none';
        });
    }
});
