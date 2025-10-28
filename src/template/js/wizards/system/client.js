import { updateListenersForDynamicEntry } from '../wizards.js';
import { collectHosts } from './vmhardware.js';

let clientCounter = 0;

export function addClientEntry() {
    clientCounter++;
    const clientList = document.getElementById('clientList');
    const template = document.getElementById('clientEntryTemplate');
    
    const clientEntry = template.content.cloneNode(true);
    const entryDiv = clientEntry.querySelector('.dynamic-entry');
    
    entryDiv.dataset.id = clientCounter;
    clientEntry.querySelector('.entry-number').textContent = clientCounter;
    
    clientEntry.querySelectorAll('.custom-select').forEach(element => {
        element.dataset.index = clientCounter;
    });
    
    clientList.appendChild(clientEntry);
    
    const addedEntry = clientList.querySelector(`.dynamic-entry[data-id="${clientCounter}"]`);
    updateListenersForDynamicEntry(addedEntry);
    
    setupClientConditionalFields(addedEntry);
    refreshClientTargets(addedEntry);
    refreshClientHostAssignments();
}

export function setupClientConditionalFields(entryElement) {
    const connectionTargetSelect = entryElement.querySelector('[data-name="connectiontarget"]');
    if (connectionTargetSelect) {
        const lbConfig = entryElement.querySelector('.client-lb-config');
        const serverConfig = entryElement.querySelector('.client-server-config');
        
        if (lbConfig) lbConfig.style.display = 'none';
        if (serverConfig) serverConfig.style.display = 'none';
        
        const observer = new MutationObserver((mutations) => {
            mutations.forEach((mutation) => {
                if (mutation.type === 'attributes' && mutation.attributeName === 'data-value') {
                    const value = connectionTargetSelect.dataset.value;
                    
                    if (lbConfig) {
                        lbConfig.style.display = (value === 'loadbalancer') ? 'block' : 'none';
                    }
                    
                    if (serverConfig) {
                        serverConfig.style.display = (value === 'vm-direct' || value === 'hardware-direct') ? 'block' : 'none';
                    }
                }
            });
        });
        observer.observe(connectionTargetSelect, { attributes: true });
    }
}

export function refreshClientTargets(clientEntry) {
    const lbSelect = clientEntry.querySelector('[data-name="targetloadbalancer"]');
    if (!lbSelect) return;
    
    const lbEntries = document.querySelectorAll('#loadbalancerList .dynamic-entry[data-type="loadbalancer"]');
    const dropdown = lbSelect.querySelector('.select-options');
    
    if (!dropdown) return;
    
    const firstOption = dropdown.querySelector('[data-value=""]');
    dropdown.innerHTML = '';
    if (firstOption) dropdown.appendChild(firstOption);
    
    lbEntries.forEach((lbEntry) => {
        const id = lbEntry.dataset.id;
        const nameInput = lbEntry.querySelector('input[name="lbname"]');
        const name = (nameInput && nameInput.value.trim()) || `Load Balancer #${id}`;
        
        const option = document.createElement('div');
        option.className = 'select-option';
        option.dataset.value = `lb-${id}`;
        option.textContent = name;
        dropdown.appendChild(option);
    });
}

export function refreshClientHostAssignments() {
    const clientEntries = document.querySelectorAll('#clientList .dynamic-entry[data-type="client"]');
    if (!clientEntries.length) return;

    const { vms, hw } = collectHosts();

    clientEntries.forEach((clientEntry) => {
        const container = clientEntry.querySelector('[data-hostlist]');
        if (!container) return;

        const prevChecked = new Set(
            Array.from(container.querySelectorAll('input[type="checkbox"]:checked'))
                .map(inp => `${inp.dataset.type}:${inp.dataset.refId}`)
        );

        const clientId = clientEntry.dataset.id;
        let html = '';

        if (vms.length) {
            html += '<div style="margin-bottom:10px;"><strong style="font-size:0.8em;color:#4a5568;">Virtuelle Maschinen</strong></div>';
            html += '<div class="checkbox-group">';
            vms.forEach(vm => {
                const checkId = `client${clientId}-vm-${vm.id}`;
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
                const checkId = `client${clientId}-hw-${server.id}`;
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
        
        refreshClientTargets(clientEntry);
    });
}
