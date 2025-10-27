import { updateListenersForDynamicEntry, updateSectionCounter, removeCustomSelects } from './wizards.js';

let vmCounter = 0;
let hardwareCounter = 0;
let databaseCounter = 0;

function addVMEntry() {
    vmCounter++;
    const vmList = document.getElementById('vmList');
    const template = document.getElementById('vmEntryTemplate');
    
    // Clone the template content
    const vmEntry = template.content.cloneNode(true);
    const entryDiv = vmEntry.querySelector('.dynamic-entry');
    
    // Set the ID and number
    entryDiv.dataset.id = vmCounter;
    vmEntry.querySelector('.entry-number').textContent = vmCounter;
    
    vmEntry.querySelectorAll('.custom-select').forEach(element => {
        element.dataset.index = vmCounter;
    });
    
    vmList.appendChild(vmEntry);
    
    // Get the newly added entry for event listeners
    const addedEntry = vmList.querySelector(`.dynamic-entry[data-id="${vmCounter}"]`);
    updateListenersForDynamicEntry(addedEntry);
    
    // Update host assignments in database entries
    refreshHostAssignments();
}

function addHardwareEntry() {
    hardwareCounter++;
    const hardwareList = document.getElementById('hardwareList');
    const template = document.getElementById('hardwareEntryTemplate');
    
    // Clone the template content
    const hwEntry = template.content.cloneNode(true);
    const entryDiv = hwEntry.querySelector('.dynamic-entry');
    
    // Set the ID and number
    entryDiv.dataset.id = hardwareCounter;
    hwEntry.querySelector('.entry-number').textContent = hardwareCounter;

    hwEntry.querySelectorAll('.custom-select').forEach(element => {
        element.dataset.index = hardwareCounter;
    });
    
    hardwareList.appendChild(hwEntry);
    
    // Get the newly added entry for event listeners
    const addedEntry = hardwareList.querySelector(`.dynamic-entry[data-id="${hardwareCounter}"]`);
    updateListenersForDynamicEntry(addedEntry);
    
    // Update host assignments in database entries
    refreshHostAssignments();
}

function addDatabaseEntry() {
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
    
    // Initial host assignment rendering
    refreshHostAssignments();
}

function removeEntry(button, type) {
    const entry = button.closest('.dynamic-entry');
    entry.remove();

    removeCustomSelects(entry);

    const entries = document.querySelectorAll(`.dynamic-entry[data-type="${type}"]`);
    entries.forEach((entry, index) => {
        entry.dataset.id = index + 1;
        entry.querySelector('.entry-number').textContent = index + 1;

        entry.querySelectorAll('.custom-select').forEach(element => {
            element.dataset.index = index + 1;
        });
    });

    if (type === 'vm') {
        vmCounter = entries.length + 1;
        updateSectionCounter(document.querySelector('.form-section[data-name="virtualmachines"]'));
        refreshHostAssignments();
    } else if (type === 'hardware') {
        hardwareCounter = entries.length + 1;
        updateSectionCounter(document.querySelector('.form-section[data-name="hardwareservers"]'));
        refreshHostAssignments();
    } else if (type === 'database') {
        databaseCounter = entries.length + 1;
        updateSectionCounter(document.querySelector('.form-section[data-name="databases"]'));
    }
}

// Update host assignments in all database entries
function refreshHostAssignments() {
    const dbEntries = document.querySelectorAll('#databaseList .dynamic-entry[data-type="database"]');
    if (!dbEntries.length) return;

    // Collect VMs
    const vmEntries = document.querySelectorAll('#vmList .dynamic-entry[data-type="vm"]');
    const vms = Array.from(vmEntries).map((e) => {
        const id = e.dataset.id;
        const hostInput = e.querySelector('input[name="hostname"]');
        const hostname = (hostInput && hostInput.value.trim()) || `VM #${id}`;
        return { id, hostname };
    });

    // Collect Hardware
    const hwEntries = document.querySelectorAll('#hardwareList .dynamic-entry[data-type="hardware"]');
    const hw = Array.from(hwEntries).map((e) => {
        const id = e.dataset.id;
        const hostInput = e.querySelector('input[name="hostname"]');
        const hostname = (hostInput && hostInput.value.trim()) || `Server #${id}`;
        return { id, hostname };
    });

    dbEntries.forEach((dbEntry) => {
        const container = dbEntry.querySelector('[data-hostlist]');
        if (!container) return;

        // Remember previous selections
        const prevChecked = new Set(
            Array.from(container.querySelectorAll('input[type="checkbox"]:checked'))
                .map(inp => `${inp.dataset.type}:${inp.dataset.refId}`)
        );

        const dbId = dbEntry.dataset.id;
        let html = '';

        // VMs section
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

        // Hardware section
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

// Handle VM/Hardware/Database checkbox toggle
document.addEventListener('DOMContentLoaded', function() {
    // Initially hide sections
    const vmSection = document.querySelector('.form-section[data-name="virtualmachines"]');
    const hardwareSection = document.querySelector('.form-section[data-name="hardwareservers"]');
    const databaseSection = document.querySelector('.form-section[data-name="databases"]');
    
    if (vmSection) vmSection.style.display = 'none';
    if (hardwareSection) hardwareSection.style.display = 'none';
    if (databaseSection) databaseSection.style.display = 'none';
    
    // VM checkbox handler
    const vmCheckbox = document.getElementById('vm');
    if (vmCheckbox) {
        vmCheckbox.addEventListener('change', function() {
            if (this.checked) {
                vmSection.style.display = 'block';
            } else {
                vmSection.style.display = 'none';
                document.getElementById('vmList').innerHTML = '';
                vmCounter = 0;
                updateSectionCounter(vmSection);
                refreshHostAssignments();
            }
        });
    }
    
    // Hardware checkbox handler
    const hardwareCheckbox = document.getElementById('hardware');
    if (hardwareCheckbox) {
        hardwareCheckbox.addEventListener('change', function() {
            if (this.checked) {
                hardwareSection.style.display = 'block';
            } else {
                hardwareSection.style.display = 'none';
                document.getElementById('hardwareList').innerHTML = '';
                hardwareCounter = 0;
                updateSectionCounter(hardwareSection);
                refreshHostAssignments();
            }
        });
    }
    
    // Database checkbox handler
    const databaseCheckbox = document.getElementById('database');
    if (databaseCheckbox) {
        databaseCheckbox.addEventListener('change', function() {
            if (this.checked) {
                databaseSection.style.display = 'block';
            } else {
                databaseSection.style.display = 'none';
                document.getElementById('databaseList').innerHTML = '';
                databaseCounter = 0;
                updateSectionCounter(databaseSection);
            }
        });
    }

    // Cluster-Konfiguration anzeigen/ausblenden
    document.addEventListener('change', function(e) {
        if (e.target.classList && e.target.classList.contains('db-cluster-check')) {
            const clusterConfig = e.target.closest('.entry-content')?.querySelector('.cluster-config');
            if (clusterConfig) {
                clusterConfig.style.display = e.target.checked ? 'block' : 'none';
            }
        }
    });
});

// Make functions globally accessible for onclick handlers
window.addVMEntry = addVMEntry;
window.addHardwareEntry = addHardwareEntry;
window.addDatabaseEntry = addDatabaseEntry;
window.removeEntry = removeEntry;

