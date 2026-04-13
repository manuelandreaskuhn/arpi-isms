import { collectHosts } from './vmhardware.js';
import { renderHostList } from './hostlist.js';

export function setupVPNConditionalFields(entryElement) {
    const vpnEnabledCheck = entryElement.querySelector('.vpn-enabled-check');
    const vpnConfig = entryElement.querySelector('.vpn-config');

    if (vpnEnabledCheck && vpnConfig) {
        vpnEnabledCheck.addEventListener('change', function () {
            vpnConfig.style.display = this.checked ? 'block' : 'none';
            if (this.checked) {
                refreshVPNHostAssignments();
            }
        });
        vpnConfig.style.display = vpnEnabledCheck.checked ? 'block' : 'none';
    }
}

export function refreshVPNHostAssignments() {
    const vpnSection = document.querySelector('.form-section[data-name="vpn"]');
    if (!vpnSection) return;

    const container = vpnSection.querySelector('[data-vpn-hostlist]');
    if (!container) return;

    const { vms, hw } = collectHosts();
    renderHostList(container, 'vpn', { vms, hw });
}
