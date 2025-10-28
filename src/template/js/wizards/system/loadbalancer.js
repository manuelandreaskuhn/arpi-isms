import { updateListenersForDynamicEntry } from '../wizards.js';
import { collectHosts } from './vmhardware.js';

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
        
        lbHACheck.addEventListener('change', function() {
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

        const prevChecked = new Set(
            Array.from(container.querySelectorAll('input[type="checkbox"]:checked'))
                .map(inp => `${inp.dataset.type}:${inp.dataset.refId}`)
        );

        const lbId = lbEntry.dataset.id;
        let html = '';

        if (vms.length) {
            html += '<div style="margin-bottom:10px;"><strong style="font-size:0.8em;color:#4a5568;">Virtuelle Maschinen</strong></div>';
            html += '<div class="checkbox-group">';
            vms.forEach(vm => {
                const checkId = `lb${lbId}-vm-${vm.id}`;
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
                const checkId = `lb${lbId}-hw-${server.id}`;
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
