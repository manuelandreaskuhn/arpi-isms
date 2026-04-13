import { updateListenersForDynamicEntry, updateSectionCounter } from '../wizards.js';
import { collectHosts } from './vmhardware.js';
import { renderHostList } from './hostlist.js';

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
        renderHostList(container, `db${dbEntry.dataset.id}`, { vms, hw });
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
