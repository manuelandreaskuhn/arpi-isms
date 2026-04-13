import { updateListenersForDynamicEntry } from '../wizards.js';
import { collectHosts } from './vmhardware.js';
import { renderHostList } from './hostlist.js';

let loadbalancerCounter = 0;

export function addLoadBalancerEntry() {
    loadbalancerCounter++;
    const lbList = document.getElementById('loadbalancerList');
    const template = document.getElementById('loadbalancerEntryTemplate');

    const lbEntry = template.content.cloneNode(true);
    const entryDiv = lbEntry.querySelector('.dynamic-entry');

    entryDiv.dataset.id = loadbalancerCounter;
    lbEntry.querySelector('.entry-number').textContent = loadbalancerCounter;

    lbEntry.querySelectorAll('.custom-select').forEach(element => {
        element.dataset.index = loadbalancerCounter;
    });

    lbList.appendChild(lbEntry);

    const addedEntry = lbList.querySelector(`.dynamic-entry[data-id="${loadbalancerCounter}"]`);
    updateListenersForDynamicEntry(addedEntry);

    setupLoadBalancerConditionalFields(addedEntry);
    refreshLoadBalancerHostAssignments();
}

export function setupLoadBalancerConditionalFields(entryElement) {
    const lbHACheck = entryElement.querySelector('.lb-ha-check');
    if (lbHACheck) {
        const lbHAConfig = entryElement.querySelector('.lb-ha-config');

        lbHACheck.addEventListener('change', function () {
            lbHAConfig.style.display = this.checked ? 'block' : 'none';
        });
        lbHAConfig.style.display = lbHACheck.checked ? 'block' : 'none';
    }
}

export function refreshLoadBalancerHostAssignments() {
    const lbEntries = document.querySelectorAll('#loadbalancerList .dynamic-entry[data-type="loadbalancer"]');
    if (!lbEntries.length) return;

    const { vms, hw } = collectHosts();

    lbEntries.forEach((lbEntry) => {
        const container = lbEntry.querySelector('[data-hostlist]');
        if (!container) return;
        renderHostList(container, `lb${lbEntry.dataset.id}`, { vms, hw });
    });
}
