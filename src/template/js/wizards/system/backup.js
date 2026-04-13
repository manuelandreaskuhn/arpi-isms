import { updateListenersForDynamicEntry } from '../wizards.js';
import { collectHosts } from './vmhardware.js';
import { collectDatabases } from './database.js';
import { renderHostList } from './hostlist.js';

let backupCounter = 0;

export function addBackupEntry() {
    backupCounter++;
    const backupList = document.getElementById('backupList');
    const template = document.getElementById('backupEntryTemplate');

    const backupEntry = template.content.cloneNode(true);
    const entryDiv = backupEntry.querySelector('.dynamic-entry');

    entryDiv.dataset.id = backupCounter;
    backupEntry.querySelector('.entry-number').textContent = backupCounter;

    backupEntry.querySelectorAll('.custom-select').forEach(element => {
        element.dataset.index = backupCounter;
    });

    backupList.appendChild(backupEntry);

    const addedEntry = backupList.querySelector(`.dynamic-entry[data-id="${backupCounter}"]`);
    updateListenersForDynamicEntry(addedEntry);

    setupBackupConditionalFields(addedEntry);
    refreshBackupHostAssignments();
    refreshBackupSystems(addedEntry);
}

export function setupBackupConditionalFields(entryElement) {
    const gfsEnabledSelect = entryElement.querySelector('[data-name="gfsenabled"]');
    if (gfsEnabledSelect) {
        const gfsFieldsRows = [
            entryElement.querySelector('input[name="gfsdaily"]')?.closest('.form-row'),
            entryElement.querySelector('input[name="gfsweekly"]')?.closest('.form-row'),
            entryElement.querySelector('input[name="gfsmonthly"]')?.closest('.form-row'),
            entryElement.querySelector('input[name="gfsyearly"]')?.closest('.form-row')
        ].filter(Boolean);

        gfsFieldsRows.forEach(row => row.style.display = 'none');

        const observer = new MutationObserver((mutations) => {
            mutations.forEach((mutation) => {
                if (mutation.type === 'attributes' && mutation.attributeName === 'data-value') {
                    const value = gfsEnabledSelect.dataset.value;
                    gfsFieldsRows.forEach(row => row.style.display = (value === 'yes') ? 'flex' : 'none');
                }
            });
        });
        observer.observe(gfsEnabledSelect, { attributes: true });
    }
}

export function refreshBackupHostAssignments() {
    const backupEntries = document.querySelectorAll('#backupList .dynamic-entry[data-type="backup"]');
    if (!backupEntries.length) return;

    const { vms, hw } = collectHosts();
    const dbs = collectDatabases();

    backupEntries.forEach((backupEntry) => {
        const container = backupEntry.querySelector('[data-hostlist]');
        if (!container) return;
        renderHostList(container, `backup${backupEntry.dataset.id}`, {
            vms, hw, dbs,
            emptyMsg: 'Keine Hosts verfügbar. Fügen Sie zuerst VMs, Hardware Server oder Datenbanken hinzu.'
        });
    });
}

export function refreshBackupSystems(backupEntry) {
    const backupSystemSelect = backupEntry.querySelector('[data-name="backupsystemid"]');
    if (!backupSystemSelect) return;

    const dropdown = backupSystemSelect.querySelector('.select-options');
    if (!dropdown) return;

    const firstOption = dropdown.querySelector('[data-value=""]');
    dropdown.innerHTML = '';
    if (firstOption) dropdown.appendChild(firstOption);

    // TODO: Fetch backup systems from component API/database
    const exampleBackupSystems = [
        { id: 'bs-1', name: 'Veeam-Prod', type: 'Veeam Backup & Replication' },
        { id: 'bs-2', name: 'Backup-Server-01', type: 'Commvault' },
        { id: 'bs-3', name: 'Azure-Backup', type: 'Azure Backup' }
    ];

    exampleBackupSystems.forEach((bs) => {
        const option = document.createElement('div');
        option.className = 'select-option';
        option.dataset.value = bs.id;
        option.textContent = `${bs.name} (${bs.type})`;
        dropdown.appendChild(option);
    });
}

export function refreshAllBackupSystems() {
    const backupEntries = document.querySelectorAll('#backupList .dynamic-entry[data-type="backup"]');
    backupEntries.forEach(backupEntry => {
        refreshBackupSystems(backupEntry);
    });
}
