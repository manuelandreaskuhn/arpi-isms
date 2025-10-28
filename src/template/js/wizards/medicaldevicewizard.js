document.addEventListener('DOMContentLoaded', function() {
    // Network Configuration toggle
    const networkCheck = document.getElementById('device-network-check');
    const networkConfig = document.getElementById('device-network-config');
    
    if (networkCheck && networkConfig) {
        networkCheck.addEventListener('change', function() {
            networkConfig.style.display = this.checked ? 'block' : 'none';
        });
    }

    // Gateway Configuration toggle
    const gatewayCheck = document.getElementById('device-gateway-check');
    const gatewayConfig = document.getElementById('device-gateway-config');
    
    if (gatewayCheck && gatewayConfig) {
        gatewayCheck.addEventListener('change', function() {
            gatewayConfig.style.display = this.checked ? 'block' : 'none';
        });
    }
});
