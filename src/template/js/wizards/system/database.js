import { updateListenersForDynamicEntry, updateSectionCounter } from '../wizards.js';
import { collectHosts } from './vmhardware.js';

let databaseCounter = 0;

export function addDatabaseEntry() {
    databaseCounter++;
    const dbList = document.getElementById('databaseList');
    const template = document.getElementById('databaseEntryTemplate');
    
    const dbEntry = template.content.cloneNode(true);
    const entryDiv = dbEntry.querySelector('.dynamic-entry');
    
    entryDiv.dataset.id = databaseCounter;
    dbEntry.querySelector('.entry-number').textContent = databaseCounter;
    
    dbEntry.querySelectorAll('.custom-select').forEach(element => {
        element.dataset.index = databaseCounter;
    });
    
    dbList.appendChild(dbEntry);
    
    const addedEntry = dbList.querySelector(`.dynamic-entry[data-id="${databaseCounter}"]`);
    updateListenersForDynamicEntry(addedEntry);
    
    refreshHostAssignments();
}

export function refreshHostAssignments() {
    const dbEntries = document.querySelectorAll('#databaseList .dynamic-entry[data-type="database"]');
    if (!dbEntries.length) return;

    const { vms, hw } = collectHosts();

    dbEntries.forEach((dbEntry) => {
        const container = dbEntry.querySelector('[data-hostlist]');
        if (!container) return;

        const prevChecked = new Set(
            Array.from(container.querySelectorAll('input[type="checkbox"]:checked'))
                .map(inp => `${inp.dataset.type}:${inp.dataset.refId}`)
        );

        const dbId = dbEntry.dataset.id;
        let html = '';

        if (vms.length) {
            html += '<div style="margin-bottom:10px;"><strong style="font-size:0.8em;color:#4a5568;">Virtuelle Maschinen</strong></div>';
            html += '<div class="checkbox-group">';
            vms.forEach(vm => {
                const checkId = `db${dbId}-vm-${vm.id}`;
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
                const checkId = `db${dbId}-hw-${server.id}`;
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

export function collectDatabases() {
    const dbEntries = document.querySelectorAll('#databaseList .dynamic-entry[data-type="database"]');
    return Array.from(dbEntries).map((e) => {
        const id = e.dataset.id;
        const nameInput = e.querySelector('input[name="dbname"]');
        const dbname = (nameInput && nameInput.value.trim()) || `Datenbank #${id}`;
        return { id, dbname };
    });
}
