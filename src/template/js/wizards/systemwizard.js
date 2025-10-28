import { updateListenersForDynamicEntry, updateSectionCounter, removeCustomSelects } from './wizards.js';

let vmCounter = 0;
let hardwareCounter = 0;
let databaseCounter = 0;
let backupCounter = 0;
let loadbalancerCounter = 0;
let firewallCounter = 0;
let clientCounter = 0;

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

    // Refresh hypervisor list
    refreshVMHypervisors(addedEntry);
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

    // Refresh backup system list
    refreshBackupSystems(addedEntry);
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

function addFirewallEntry() {
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
    
    // Setup conditional visibility handlers
    setupFirewallConditionalFields(addedEntry);
    
    // Refresh host assignments
    refreshFirewallHostAssignments();
}

function addClientEntry() {
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
    
    // Setup conditional visibility handlers
    setupClientConditionalFields(addedEntry);
    
    // Refresh target selections
    refreshClientTargets(addedEntry);
    refreshClientHostAssignments();
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
    } else if (type === 'firewall') {
        firewallCounter = entries.length + 1;
        updateSectionCounter(document.querySelector('.form-section[data-name="firewalls"]'));
    } else if (type === 'client') {
        clientCounter = entries.length + 1;
        updateSectionCounter(document.querySelector('.form-section[data-name="clients"]'));
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

// Setup conditional field visibility for firewall entries
function setupFirewallConditionalFields(entryElement) {
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

// Update host assignments in all firewall entries
function refreshFirewallHostAssignments() {
    const fwEntries = document.querySelectorAll('#firewallList .dynamic-entry[data-type="firewall"]');
    if (!fwEntries.length) return;

    const vmEntries = document.querySelectorAll('#vmList .dynamic-entry[data-type="vm"]');
    const vms = Array.from(vmEntries).map((e) => {
        const id = e.dataset.id;
        const hostInput = e.querySelector('input[name="hostname"]');
        const hostname = (hostInput && hostInput.value.trim()) || `VM #${id}`;
        return { id, hostname };
    });

    const hwEntries = document.querySelectorAll('#hardwareList .dynamic-entry[data-type="hardware"]');
    const hw = Array.from(hwEntries).map((e) => {
        const id = e.dataset.id;
        const hostInput = e.querySelector('input[name="hostname"]');
        const hostname = (hostInput && hostInput.value.trim()) || `Server #${id}`;
        return { id, hostname };
    });

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

// Setup conditional field visibility for client entries
function setupClientConditionalFields(entryElement) {
    const connectionTargetSelect = entryElement.querySelector('[data-name="connectiontarget"]');
    if (connectionTargetSelect) {
        const lbConfig = entryElement.querySelector('.client-lb-config');
        const serverConfig = entryElement.querySelector('.client-server-config');
        
        // Initially hide both
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

// Refresh Load Balancer targets in client entries
function refreshClientTargets(clientEntry) {
    const lbSelect = clientEntry.querySelector('[data-name="targetloadbalancer"]');
    if (!lbSelect) return;
    
    const lbEntries = document.querySelectorAll('#loadbalancerList .dynamic-entry[data-type="loadbalancer"]');
    const dropdown = lbSelect.querySelector('.select-options');
    
    if (!dropdown) return;
    
    // Keep first option (empty)
    const firstOption = dropdown.querySelector('[data-value=""]');
    dropdown.innerHTML = '';
    if (firstOption) dropdown.appendChild(firstOption);
    
    // Add load balancers
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

// Update host assignments in all client entries
function refreshClientHostAssignments() {
    const clientEntries = document.querySelectorAll('#clientList .dynamic-entry[data-type="client"]');
    if (!clientEntries.length) return;

    const vmEntries = document.querySelectorAll('#vmList .dynamic-entry[data-type="vm"]');
    const vms = Array.from(vmEntries).map((e) => {
        const id = e.dataset.id;
        const hostInput = e.querySelector('input[name="hostname"]');
        const hostname = (hostInput && hostInput.value.trim()) || `VM #${id}`;
        return { id, hostname };
    });

    const hwEntries = document.querySelectorAll('#hardwareList .dynamic-entry[data-type="hardware"]');
    const hw = Array.from(hwEntries).map((e) => {
        const id = e.dataset.id;
        const hostInput = e.querySelector('input[name="hostname"]');
        const hostname = (hostInput && hostInput.value.trim()) || `Server #${id}`;
        return { id, hostname };
    });

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
        
        // Also refresh load balancer targets
        refreshClientTargets(clientEntry);
    });
}

// Refresh Hypervisor selections in VM entries
function refreshVMHypervisors(vmEntry) {
    const hypervisorSelect = vmEntry.querySelector('[data-name="hypervisorid"]');
    if (!hypervisorSelect) return;
    
    // Note: This would need to fetch from actual hypervisor components
    // For now, it's a placeholder that shows the structure
    const dropdown = hypervisorSelect.querySelector('.select-options');
    if (!dropdown) return;
    
    // Keep first option (empty)
    const firstOption = dropdown.querySelector('[data-value=""]');
    dropdown.innerHTML = '';
    if (firstOption) dropdown.appendChild(firstOption);
    
    // TODO: Fetch hypervisors from component API/database
    // Example structure:
    const exampleHypervisors = [
        { id: 'hv-1', name: 'ESXi-Cluster-01', type: 'VMware vSphere 8.0' },
        { id: 'hv-2', name: 'Hyper-V-Host-DC1', type: 'Hyper-V 2022' },
        { id: 'hv-3', name: 'Proxmox-VE-Cluster', type: 'Proxmox VE 8.1' }
    ];
    
    exampleHypervisors.forEach((hv) => {
        const option = document.createElement('div');
        option.className = 'select-option';
        option.dataset.value = hv.id;
        option.textContent = `${hv.name} (${hv.type})`;
        dropdown.appendChild(option);
    });
}

// Refresh all VM hypervisor selections when needed
function refreshAllVMHypervisors() {
    const vmEntries = document.querySelectorAll('#vmList .dynamic-entry[data-type="vm"]');
    vmEntries.forEach(vmEntry => {
        refreshVMHypervisors(vmEntry);
    });
}

// Refresh Backup System selections in backup entries
function refreshBackupSystems(backupEntry) {
    const backupSystemSelect = backupEntry.querySelector('[data-name="backupsystemid"]');
    if (!backupSystemSelect) return;
    
    const dropdown = backupSystemSelect.querySelector('.select-options');
    if (!dropdown) return;
    
    // Keep first option (empty)
    const firstOption = dropdown.querySelector('[data-value=""]');
    dropdown.innerHTML = '';
    if (firstOption) dropdown.appendChild(firstOption);
    
    // TODO: Fetch backup systems from component API/database
    // Example structure:
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

// Refresh all backup system selections when needed
function refreshAllBackupSystems() {
    const backupEntries = document.querySelectorAll('#backupList .dynamic-entry[data-type="backup"]');
    backupEntries.forEach(backupEntry => {
        refreshBackupSystems(backupEntry);
    });
}

document.addEventListener('DOMContentLoaded', function() {
    // Initially hide sections
    const vmSection = document.querySelector('.form-section[data-name="virtualmachines"]');
    const hardwareSection = document.querySelector('.form-section[data-name="hardwareservers"]');
    const databaseSection = document.querySelector('.form-section[data-name="databases"]');
    const backupSection = document.querySelector('.form-section[data-name="backups"]');
    const loadbalancerSection = document.querySelector('.form-section[data-name="loadbalancers"]');
    const firewallSection = document.querySelector('.form-section[data-name="firewalls"]');
    const clientSection = document.querySelector('.form-section[data-name="clients"]');
    
    if (vmSection) vmSection.style.display = 'none';
    if (hardwareSection) hardwareSection.style.display = 'none';
    if (databaseSection) databaseSection.style.display = 'none';
    if (backupSection) backupSection.style.display = 'none';
    if (loadbalancerSection) loadbalancerSection.style.display = 'none';
    if (firewallSection) firewallSection.style.display = 'none';
    if (clientSection) clientSection.style.display = 'none';
    
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

    // Firewall checkbox handler
    const firewallCheckbox = document.getElementById('firewall');
    if (firewallCheckbox) {
        firewallCheckbox.addEventListener('change', function() {
            if (this.checked) {
                firewallSection.style.display = 'block';
            } else {
                firewallSection.style.display = 'none';
                document.getElementById('firewallList').innerHTML = '';
                firewallCounter = 0;
                updateSectionCounter(firewallSection);
            }
        });
    }

    // Client checkbox handler
    const clientCheckbox = document.getElementById('client');
    if (clientCheckbox) {
        clientCheckbox.addEventListener('change', function() {
            if (this.checked) {
                clientSection.style.display = 'block';
            } else {
                clientSection.style.display = 'none';
                document.getElementById('clientList').innerHTML = '';
                clientCounter = 0;
                updateSectionCounter(clientSection);
            }
        });
    }

    // Gematik TI checkbox handler
    const gematictiCheckbox = document.getElementById('gematicti');
    const gematictiSection = document.querySelector('.form-section[data-name="gematicti"]');
    
    if (gematictiCheckbox && gematictiSection) {
        gematictiSection.style.display = 'none';
        
        gematictiCheckbox.addEventListener('change', function() {
            if (this.checked) {
                gematictiSection.style.display = 'block';
                // Setup conditional fields when section is shown
                setupTIConditionalFields(gematictiSection);
            } else {
                gematictiSection.style.display = 'none';
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

// Setup conditional field visibility for TI entries
function setupTIConditionalFields(entryElement) {
    // TI Connection toggle
    const tiConnectedCheck = entryElement.querySelector('.ti-connected-check');
    const tiConnectionConfig = entryElement.querySelector('.ti-connection-config');
    
    if (tiConnectedCheck && tiConnectionConfig) {
        tiConnectedCheck.addEventListener('change', function() {
            tiConnectionConfig.style.display = this.checked ? 'block' : 'none';
        });
        tiConnectionConfig.style.display = tiConnectedCheck.checked ? 'block' : 'none';
    }

    // KIM Configuration toggle
    const tiKimActiveCheck = entryElement.querySelector('.ti-kim-active-check');
    const tiKimConfig = entryElement.querySelector('.ti-kim-config');
    
    if (tiKimActiveCheck && tiKimConfig) {
        tiKimActiveCheck.addEventListener('change', function() {
            tiKimConfig.style.display = this.checked ? 'block' : 'none';
        });
        tiKimConfig.style.display = tiKimActiveCheck.checked ? 'block' : 'none';
    }

    // E-Rezept Configuration toggle
    const tiErezeptActiveCheck = entryElement.querySelector('.ti-erezept-active-check');
    const tiErezeptConfig = entryElement.querySelector('.ti-erezept-config');
    
    if (tiErezeptActiveCheck && tiErezeptConfig) {
        tiErezeptActiveCheck.addEventListener('change', function() {
            tiErezeptConfig.style.display = this.checked ? 'block' : 'none';
        });
        tiErezeptConfig.style.display = tiErezeptActiveCheck.checked ? 'block' : 'none';
    }
}

