import { initializeAllComponentSelects } from './componentlinking.js';
import { initializeHelpTooltips } from './helptooltip.js';
    
document.addEventListener('DOMContentLoaded', function() {
    // Initialize component linking
    initializeAllComponentSelects();

    // Initialize help tooltips
    initializeHelpTooltips();

    // Proxy Failover toggle
    const proxyFailoverCheck = document.getElementById('proxy-failover-check');
    const proxyFailoverConfig = document.getElementById('proxy-failover-config');
    
    if (proxyFailoverCheck && proxyFailoverConfig) {
        proxyFailoverCheck.addEventListener('change', function() {
            proxyFailoverConfig.style.display = this.checked ? 'block' : 'none';
        });
    }
    
    console.log('Proxy Wizard initialized with component linking');
});
