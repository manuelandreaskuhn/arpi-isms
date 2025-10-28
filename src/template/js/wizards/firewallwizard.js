document.addEventListener('DOMContentLoaded', function() {
    // HA Configuration toggle
    const haCheck = document.getElementById('fw-ha-check');
    const haConfig = document.getElementById('fw-ha-config');
    
    if (haCheck && haConfig) {
        haCheck.addEventListener('change', function() {
            haConfig.style.display = this.checked ? 'block' : 'none';
        });
    }
});
