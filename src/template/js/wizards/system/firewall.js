import { updateListenersForDynamicEntry } from '../wizards.js';
import { collectHosts } from './vmhardware.js';
import { renderHostList } from './hostlist.js';

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

        fwNATCheck.addEventListener('change', function () {
            fwNATConfig.style.display = this.checked ? 'block' : 'none';
        });
        fwNATConfig.style.display = fwNATCheck.checked ? 'block' : 'none';
    }

    // VPN Configuration
    const fwVPNCheck = entryElement.querySelector('.fw-vpn-check');
    if (fwVPNCheck) {
        const fwVPNConfig = entryElement.querySelector('.fw-vpn-config');

        fwVPNCheck.addEventListener('change', function () {
            fwVPNConfig.style.display = this.checked ? 'block' : 'none';
        });
        fwVPNConfig.style.display = fwVPNCheck.checked ? 'block' : 'none';
    }

    // HA Configuration
    const fwHACheck = entryElement.querySelector('.fw-ha-check');
    if (fwHACheck) {
        const fwHAConfig = entryElement.querySelector('.fw-ha-config');

        fwHACheck.addEventListener('change', function () {
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
        renderHostList(container, `fw${fwEntry.dataset.id}`, { vms, hw });
    });
}
