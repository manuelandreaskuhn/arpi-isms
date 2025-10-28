import { collectHosts } from './vmhardware.js';
import { collectDatabases } from './database.js';

export function setupSIEMConditionalFields(entryElement) {
    const siemEnabledCheck = entryElement.querySelector('.siem-enabled-check');
    const siemConfig = entryElement.querySelector('.siem-config');
    
    if (siemEnabledCheck && siemConfig) {
        siemEnabledCheck.addEventListener('change', function() {
            siemConfig.style.display = this.checked ? 'block' : 'none';
            if (this.checked) {
                refreshSIEMHostAssignments();
            }
        });
        siemConfig.style.display = siemEnabledCheck.checked ? 'block' : 'none';
    }
    
    const databaseLogsCheck = entryElement.querySelector('.siem-database-logs-check');
    const databaseSelection = entryElement.querySelector('.siem-database-selection');
    
    if (databaseLogsCheck && databaseSelection) {
        databaseLogsCheck.addEventListener('change', function() {
            databaseSelection.style.display = this.checked ? 'block' : 'none';
            if (this.checked) {
                refreshSIEMDatabaseAssignments();
            }
        });
        databaseSelection.style.display = databaseLogsCheck.checked ? 'block' : 'none';
    }
}

export function refreshSIEMHostAssignments() {
    const siemSection = document.querySelector('.form-section[data-name="siem"]');
    if (!siemSection) return;
    
    const container = siemSection.querySelector('[data-siem-hostlist]');
    if (!container) return;

    const { vms, hw } = collectHosts();

    const prevChecked = new Set(
        Array.from(container.querySelectorAll('input[type="checkbox"]:checked'))
            .map(inp => `${inp.dataset.type}:${inp.dataset.refId}`)
    );

    let html = '';

    if (vms.length) {
        html += '<div style="margin-bottom:10px;"><strong style="font-size:0.8em;color:#4a5568;">Virtuelle Maschinen</strong></div>';
        html += '<div class="checkbox-group">';
        vms.forEach(vm => {
            const checkId = `siem-vm-${vm.id}`;
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
            const checkId = `siem-hw-${server.id}`;
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
    
    refreshSIEMDatabaseAssignments();
}

export function refreshSIEMDatabaseAssignments() {
    const siemSection = document.querySelector('.form-section[data-name="siem"]');
    if (!siemSection) return;
    
    const container = siemSection.querySelector('[data-siem-dblist]');
    if (!container) return;

    const dbs = collectDatabases();

    const prevChecked = new Set(
        Array.from(container.querySelectorAll('input[type="checkbox"]:checked'))
            .map(inp => `database:${inp.dataset.refId}`)
    );

    let html = '';

    if (dbs.length) {
        html += '<div class="checkbox-group">';
        dbs.forEach(db => {
            const checkId = `siem-db-${db.id}`;
            const key = `database:${db.id}`;
            const checked = prevChecked.has(key) ? 'checked' : '';
            html += `
                <div class="checkbox-item">
                    <input type="checkbox" id="${checkId}" data-type="database" data-ref-id="${db.id}" ${checked}>
                    <label for="${checkId}">${db.dbname}</label>
                </div>`;
        });
        html += '</div>';
    } else {
        html = '<div class="help-text">Keine Datenbanken verfügbar. Fügen Sie zuerst Datenbanken hinzu.</div>';
    }

    container.innerHTML = html;
}
