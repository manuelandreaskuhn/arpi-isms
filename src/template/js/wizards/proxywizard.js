import { initializeAllComponentSelects } from './componentlinking.js';

document.addEventListener('DOMContentLoaded', function() {
    // Initialize component linking
    initializeAllComponentSelects();
    
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
