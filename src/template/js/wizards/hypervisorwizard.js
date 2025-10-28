document.addEventListener('DOMContentLoaded', function() {
    // Cluster Configuration toggle
    const clusterCheck = document.getElementById('hypervisor-cluster-check');
    const clusterConfig = document.getElementById('hypervisor-cluster-config');
    
    if (clusterCheck && clusterConfig) {
        clusterCheck.addEventListener('change', function() {
            clusterConfig.style.display = this.checked ? 'block' : 'none';
        });
    }
});
