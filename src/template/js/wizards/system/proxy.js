export function setupProxyConditionalFields(entryElement) {
    const proxyEnabledCheck = entryElement.querySelector('.proxy-enabled-check');
    const proxyConfig = entryElement.querySelector('.proxy-config');
    
    if (proxyEnabledCheck && proxyConfig) {
        proxyEnabledCheck.addEventListener('change', function() {
            proxyConfig.style.display = this.checked ? 'block' : 'none';
        });
        proxyConfig.style.display = proxyEnabledCheck.checked ? 'block' : 'none';
    }

    const proxyFailoverCheck = entryElement.querySelector('.proxy-failover-check');
    const proxyFailoverConfig = entryElement.querySelector('.proxy-failover-config');
    
    if (proxyFailoverCheck && proxyFailoverConfig) {
        proxyFailoverCheck.addEventListener('change', function() {
            proxyFailoverConfig.style.display = this.checked ? 'block' : 'none';
        });
        proxyFailoverConfig.style.display = proxyFailoverCheck.checked ? 'block' : 'none';
    }
}
