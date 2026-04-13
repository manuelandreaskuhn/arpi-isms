/**
 * Renders a host-assignment checkbox list into a container element.
 * Preserves previously checked checkboxes across re-renders.
 *
 * @param {Element} container      - DOM element to fill
 * @param {string}  prefix         - Unique prefix for checkbox IDs (e.g. 'db1', 'vpn', 'lb3')
 * @param {Object}  sources
 * @param {Array}   sources.vms    - VM host objects with { id, hostname }
 * @param {Array}   sources.hw     - Hardware server objects with { id, hostname }
 * @param {Array}   [sources.dbs]  - Database objects with { id, dbname } (optional)
 * @param {string}  [sources.emptyMsg] - Custom empty-state message (optional)
 */
export function renderHostList(container, prefix, { vms, hw, dbs = [], emptyMsg = null }) {
    const prevChecked = new Set(
        Array.from(container.querySelectorAll('input[type="checkbox"]:checked'))
            .map(inp => `${inp.dataset.type}:${inp.dataset.refId}`)
    );

    let html = '';

    if (vms.length) {
        html += '<div style="margin-bottom:10px;"><strong style="font-size:0.8em;color:#4a5568;">Virtuelle Maschinen</strong></div>';
        html += '<div class="checkbox-group">';
        vms.forEach(vm => {
            const checkId = `${prefix}-vm-${vm.id}`;
            const checked = prevChecked.has(`vm:${vm.id}`) ? 'checked' : '';
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
            const checkId = `${prefix}-hw-${server.id}`;
            const checked = prevChecked.has(`hardware:${server.id}`) ? 'checked' : '';
            html += `
                    <div class="checkbox-item">
                        <input type="checkbox" id="${checkId}" data-type="hardware" data-ref-id="${server.id}" ${checked}>
                        <label for="${checkId}">${server.hostname}</label>
                    </div>`;
        });
        html += '</div>';
    }

    if (dbs.length) {
        html += '<div style="margin-top:15px;margin-bottom:10px;"><strong style="font-size:0.8em;color:#4a5568;">Datenbanken</strong></div>';
        html += '<div class="checkbox-group">';
        dbs.forEach(db => {
            const checkId = `${prefix}-db-${db.id}`;
            const checked = prevChecked.has(`database:${db.id}`) ? 'checked' : '';
            html += `
                    <div class="checkbox-item">
                        <input type="checkbox" id="${checkId}" data-type="database" data-ref-id="${db.id}" ${checked}>
                        <label for="${checkId}">${db.dbname}</label>
                    </div>`;
        });
        html += '</div>';
    }

    if (!vms.length && !hw.length && !dbs.length) {
        html = `<div class="help-text">${emptyMsg ?? 'Keine Hosts verfügbar. Fügen Sie zuerst VMs oder Hardware Server hinzu.'}</div>`;
    }

    container.innerHTML = html;
}
