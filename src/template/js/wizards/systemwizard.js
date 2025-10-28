import { updateListenersForDynamicEntry, updateSectionCounter, removeCustomSelects } from './wizards.js';

let vmCounter = 0;
let hardwareCounter = 0;
let databaseCounter = 0;
let backupCounter = 0;
let loadbalancerCounter = 0;

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

function addBackupEntry() {
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
    
    // Setup conditional visibility handlers for this entry
    setupBackupConditionalFields(addedEntry);
    
    // Initial host assignment rendering
    refreshBackupHostAssignments();
}

function addLoadBalancerEntry() {
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
    
    // Setup conditional visibility handlers
    setupLoadBalancerConditionalFields(addedEntry);
    
    // Refresh host assignments
    refreshLoadBalancerHostAssignments();
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
        refreshBackupHostAssignments();
    } else if (type === 'hardware') {
        hardwareCounter = entries.length + 1;
        updateSectionCounter(document.querySelector('.form-section[data-name="hardwareservers"]'));
        refreshHostAssignments();
        refreshBackupHostAssignments();
    } else if (type === 'database') {
        databaseCounter = entries.length + 1;
        updateSectionCounter(document.querySelector('.form-section[data-name="databases"]'));
        refreshBackupHostAssignments();
    } else if (type === 'backup') {
        backupCounter = entries.length + 1;
        updateSectionCounter(document.querySelector('.form-section[data-name="backups"]'));
    } else if (type === 'loadbalancer') {
        loadbalancerCounter = entries.length + 1;
        updateSectionCounter(document.querySelector('.form-section[data-name="loadbalancers"]'));
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

// Setup conditional field visibility for backup entries
function setupBackupConditionalFields(entryElement) {
    // GFS Schema - show/hide GFS fields based on selection
    const gfsEnabledSelect = entryElement.querySelector('[data-name="gfsenabled"]');
    if (gfsEnabledSelect) {
        const gfsFieldsRows = [
            entryElement.querySelector('input[name="gfsdaily"]')?.closest('.form-row'),
            entryElement.querySelector('input[name="gfsweekly"]')?.closest('.form-row'),
            entryElement.querySelector('input[name="gfsmonthly"]')?.closest('.form-row'),
            entryElement.querySelector('input[name="gfsyearly"]')?.closest('.form-row')
        ].filter(Boolean);
        
        // Initially hide GFS fields
        gfsFieldsRows.forEach(row => row.style.display = 'none');
        
        // Listen for changes on the custom select
        const observer = new MutationObserver((mutations) => {
            mutations.forEach((mutation) => {
                if (mutation.type === 'attributes' && mutation.attributeName === 'data-value') {
                    const value = gfsEnabledSelect.dataset.value;
                    if (value === 'yes') {
                        gfsFieldsRows.forEach(row => row.style.display = 'flex');
                    } else {
                        gfsFieldsRows.forEach(row => row.style.display = 'none');
                    }
                }
            });
        });
        observer.observe(gfsEnabledSelect, { attributes: true });
    }
    
    // 3-2-1 Backup Rule - show/hide offsite fields
    const backup321Check = entryElement.querySelector('.backup-321-check');
    if (backup321Check) {
        const backup321Config = entryElement.querySelector('.backup-321-config');
        
        backup321Check.addEventListener('change', function() {
            if (this.checked) {
                backup321Config.style.display = 'block';
            } else {
                backup321Config.style.display = 'none';
            }
        });
        // Set initial visibility based on checked state
        backup321Config.style.display = backup321Check.checked ? 'block' : 'none';
    }
    
    // Immutability - show/hide period field
    const immutabilitySelect = entryElement.querySelector('[data-name="immutability"]');
    if (immutabilitySelect) {
        const periodField = entryElement.querySelector('input[name="immutabilityperiod"]')?.closest('.form-group');
        
        if (periodField) {
            // Initially hide period field
            periodField.style.display = 'none';
            
            const observer = new MutationObserver((mutations) => {
                mutations.forEach((mutation) => {
                    if (mutation.type === 'attributes' && mutation.attributeName === 'data-value') {
                        const value = immutabilitySelect.dataset.value;
                        if (value === 'enabled' || value === 'partial') {
                            periodField.style.display = 'block';
                        } else {
                            periodField.style.display = 'none';
                        }
                    }
                });
            });
            observer.observe(immutabilitySelect, { attributes: true });
        }
    }
}

// Update host assignments in all backup entries
function refreshBackupHostAssignments() {
    const backupEntries = document.querySelectorAll('#backupList .dynamic-entry[data-type="backup"]');
    if (!backupEntries.length) return;

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

    // Collect Databases
    const dbEntries = document.querySelectorAll('#databaseList .dynamic-entry[data-type="database"]');
    const dbs = Array.from(dbEntries).map((e) => {
        const id = e.dataset.id;
        const nameInput = e.querySelector('input[name="dbname"]');
        const dbname = (nameInput && nameInput.value.trim()) || `Datenbank #${id}`;
        return { id, dbname };
    });

    backupEntries.forEach((backupEntry) => {
        const container = backupEntry.querySelector('[data-hostlist]');
        if (!container) return;

        // Remember previous selections
        const prevChecked = new Set(
            Array.from(container.querySelectorAll('input[type="checkbox"]:checked'))
                .map(inp => `${inp.dataset.type}:${inp.dataset.refId}`)
        );

        const backupId = backupEntry.dataset.id;
        let html = '';

        // VMs section
        if (vms.length) {
            html += '<div style="margin-bottom:10px;"><strong style="font-size:0.8em;color:#4a5568;">Virtuelle Maschinen</strong></div>';
            html += '<div class="checkbox-group">';
            vms.forEach(vm => {
                const checkId = `backup${backupId}-vm-${vm.id}`;
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
                const checkId = `backup${backupId}-hw-${server.id}`;
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

        // Databases section
        if (dbs.length) {
            html += '<div style="margin-top:15px;margin-bottom:10px;"><strong style="font-size:0.8em;color:#4a5568;">Datenbanken</strong></div>';
            html += '<div class="checkbox-group">';
            dbs.forEach(db => {
                const checkId = `backup${backupId}-db-${db.id}`;
                const key = `database:${db.id}`;
                const checked = prevChecked.has(key) ? 'checked' : '';
                html += `
                    <div class="checkbox-item">
                        <input type="checkbox" id="${checkId}" data-type="database" data-ref-id="${db.id}" ${checked}>
                        <label for="${checkId}">${db.dbname}</label>
                    </div>`;
            });
            html += '</div>';
        }

        if (!vms.length && !hw.length && !dbs.length) {
            html = '<div class="help-text">Keine Hosts verfügbar. Fügen Sie zuerst VMs, Hardware Server oder Datenbanken hinzu.</div>';
        }

        container.innerHTML = html;
    });
}

// Setup conditional field visibility for load balancer entries
function setupLoadBalancerConditionalFields(entryElement) {
    // HA Configuration - show/hide HA fields
    const lbHACheck = entryElement.querySelector('.lb-ha-check');
    if (lbHACheck) {
        const lbHAConfig = entryElement.querySelector('.lb-ha-config');
        
        lbHACheck.addEventListener('change', function() {
            if (this.checked) {
                lbHAConfig.style.display = 'block';
            } else {
                lbHAConfig.style.display = 'none';
            }
        });
        lbHAConfig.style.display = lbHACheck.checked ? 'block' : 'none';
    }
}

// Update host assignments in all load balancer entries
function refreshLoadBalancerHostAssignments() {
    const lbEntries = document.querySelectorAll('#loadbalancerList .dynamic-entry[data-type="loadbalancer"]');
    if (!lbEntries.length) return;

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

    lbEntries.forEach((lbEntry) => {
        const container = lbEntry.querySelector('[data-hostlist]');
        if (!container) return;

        const prevChecked = new Set(
            Array.from(container.querySelectorAll('input[type="checkbox"]:checked'))
                .map(inp => `${inp.dataset.type}:${inp.dataset.refId}`)
        );

        const lbId = lbEntry.dataset.id;
        let html = '';

        // VMs section
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

        // Hardware section
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

// Handle VM/Hardware/Database/Backup/LoadBalancer checkbox toggle
document.addEventListener('DOMContentLoaded', function() {
    // Initially hide sections
    const vmSection = document.querySelector('.form-section[data-name="virtualmachines"]');
    const hardwareSection = document.querySelector('.form-section[data-name="hardwareservers"]');
    const databaseSection = document.querySelector('.form-section[data-name="databases"]');
    const backupSection = document.querySelector('.form-section[data-name="backups"]');
    const loadbalancerSection = document.querySelector('.form-section[data-name="loadbalancers"]');
    
    if (vmSection) vmSection.style.display = 'none';
    if (hardwareSection) hardwareSection.style.display = 'none';
    if (databaseSection) databaseSection.style.display = 'none';
    if (backupSection) backupSection.style.display = 'none';
    if (loadbalancerSection) loadbalancerSection.style.display = 'none';
    
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
                refreshBackupHostAssignments();
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
                refreshBackupHostAssignments();
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
                refreshBackupHostAssignments();
            }
        });
    }

    // Backup checkbox handler
    const backupCheckbox = document.getElementById('backup');
    if (backupCheckbox) {
        backupCheckbox.addEventListener('change', function() {
            if (this.checked) {
                backupSection.style.display = 'block';
            } else {
                backupSection.style.display = 'none';
                document.getElementById('backupList').innerHTML = '';
                backupCounter = 0;
                updateSectionCounter(backupSection);
            }
        });
    }

    // Load Balancer checkbox handler
    const loadbalancerCheckbox = document.getElementById('loadbalancer');
    if (loadbalancerCheckbox) {
        loadbalancerCheckbox.addEventListener('change', function() {
            if (this.checked) {
                loadbalancerSection.style.display = 'block';
            } else {
                loadbalancerSection.style.display = 'none';
                document.getElementById('loadbalancerList').innerHTML = '';
                loadbalancerCounter = 0;
                updateSectionCounter(loadbalancerSection);
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
window.addBackupEntry = addBackupEntry;
window.addLoadBalancerEntry = addLoadBalancerEntry;
window.removeEntry = removeEntry;

