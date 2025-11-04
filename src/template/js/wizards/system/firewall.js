import { updateListenersForDynamicEntry } from '../wizards.js';
import { collectHosts } from './vmhardware.js';

let firewallCounter = 0;

export function addFirewallEntry() {
    firewallCounter++;
    const fwList = document.getElementById('firewallList');
    const template = document.getElementById('firewallEntryTemplate');
    
    const fwEntry = template.content.cloneNode(true);
    const entryDiv = fwEntry.querySelector('.dynamic-entry');
    
    entryDiv.dataset.id = firewallCounter;
    fwEntry.querySelector('.entry-number').textContent = firewallCounter;
    
    fwEntry.querySelectorAll('.custom-select').forEach(element => {
        element.dataset.index = firewallCounter;
    });
    
    fwList.appendChild(fwEntry);
    
    const addedEntry = fwList.querySelector(`.dynamic-entry[data-id="${firewallCounter}"]`);
    updateListenersForDynamicEntry(addedEntry);
    
    setupFirewallConditionalFields(addedEntry);
    refreshFirewallHostAssignments();
}

export function setupFirewallConditionalFields(entryElement) {
    // NAT Configuration
    const fwNATCheck = entryElement.querySelector('.fw-nat-check');
    if (fwNATCheck) {
        const fwNATConfig = entryElement.querySelector('.fw-nat-config');
        
        fwNATCheck.addEventListener('change', function() {
            fwNATConfig.style.display = this.checked ? 'block' : 'none';
        });
        fwNATConfig.style.display = fwNATCheck.checked ? 'block' : 'none';
    }

    // VPN Configuration
    const fwVPNCheck = entryElement.querySelector('.fw-vpn-check');
    if (fwVPNCheck) {
        const fwVPNConfig = entryElement.querySelector('.fw-vpn-config');
        
        fwVPNCheck.addEventListener('change', function() {
            fwVPNConfig.style.display = this.checked ? 'block' : 'none';
        });
        fwVPNConfig.style.display = fwVPNCheck.checked ? 'block' : 'none';
    }

    // HA Configuration
    const fwHACheck = entryElement.querySelector('.fw-ha-check');
    if (fwHACheck) {
        const fwHAConfig = entryElement.querySelector('.fw-ha-config');
        
        fwHACheck.addEventListener('change', function() {
            fwHAConfig.style.display = this.checked ? 'block' : 'none';
        });
        fwHAConfig.style.display = fwHACheck.checked ? 'block' : 'none';
    }
}

export function refreshFirewallHostAssignments() {
    const fwEntries = document.querySelectorAll('#firewallList .dynamic-entry[data-type="firewall"]');
    if (!fwEntries.length) return;

    const { vms, hw } = collectHosts();

    fwEntries.forEach((fwEntry) => {
        const container = fwEntry.querySelector('[data-hostlist]');
        if (!container) return;

        const prevChecked = new Set(
            Array.from(container.querySelectorAll('input[type="checkbox"]:checked'))
                .map(inp => `${inp.dataset.type}:${inp.dataset.refId}`)
        );

        const fwId = fwEntry.dataset.id;
        let html = '';

        if (vms.length) {
            html += '<div style="margin-bottom:10px;"><strong style="font-size:0.8em;color:#4a5568;">Virtuelle Maschinen</strong></div>';
            html += '<div class="checkbox-group">';
            vms.forEach(vm => {
                const checkId = `fw${fwId}-vm-${vm.id}`;
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
                const checkId = `fw${fwId}-hw-${server.id}`;
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
    });
}
