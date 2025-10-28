import { collectHosts } from './vmhardware.js';

export function setupVPNConditionalFields(entryElement) {
    const vpnEnabledCheck = entryElement.querySelector('.vpn-enabled-check');
    const vpnConfig = entryElement.querySelector('.vpn-config');
    
    if (vpnEnabledCheck && vpnConfig) {
        vpnEnabledCheck.addEventListener('change', function() {
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

    const prevChecked = new Set(
        Array.from(container.querySelectorAll('input[type="checkbox"]:checked'))
            .map(inp => `${inp.dataset.type}:${inp.dataset.refId}`)
    );

    let html = '';

    if (vms.length) {
        html += '<div style="margin-bottom:10px;"><strong style="font-size:0.8em;color:#4a5568;">Virtuelle Maschinen</strong></div>';
        html += '<div class="checkbox-group">';
        vms.forEach(vm => {
            const checkId = `vpn-vm-${vm.id}`;
            const key = `vm:${vm.id}`;
            const checked = prevChecked.has(key) ? 'checked' : '';
            html += `
                <div class="checkbox-item">
                    <input type="checkbox" id="${checkId}" data-type="vm" data-ref-id="${vm.id}" ${checked}>
                    <label for="${checkId}">${vm.hostname}</label>
                </div>`;
        });
        html += '</div>';
    }

    if (hw.length) {
        html += '<div style="margin-top:15px;margin-bottom:10px;"><strong style="font-size:0.8em;color:#4a5568;">Hardware Server</strong></div>';
        html += '<div class="checkbox-group">';
        hw.forEach(server => {
            const checkId = `vpn-hw-${server.id}`;
            const key = `hardware:${server.id}`;
            const checked = prevChecked.has(key) ? 'checked' : '';
            html += `
                <div class="checkbox-item">
                    <input type="checkbox" id="${checkId}" data-type="hardware" data-ref-id="${server.id}" ${checked}>
                    <label for="${checkId}">${server.hostname}</label>
                </div>`;
        });
        html += '</div>';
    }

    if (!vms.length && !hw.length) {
        html = '<div class="help-text">Keine Hosts verfügbar. Fügen Sie zuerst VMs oder Hardware Server hinzu.</div>';
    }

    container.innerHTML = html;
}
