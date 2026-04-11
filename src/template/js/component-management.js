/**
 * Component Management – Suche, Filter, Sortierung, Gruppen-Collapse
 */
(function () {
    const search = document.getElementById('compSearch');
    const sortSelect = document.getElementById('compSort');
    const collapseAll = document.getElementById('compCollapseAll');
    const expandAll = document.getElementById('compExpandAll');
    const container = document.getElementById('compListContainer');
    const emptyMsg = document.getElementById('compEmptyMsg');
    const countLabel = document.getElementById('compVisibleCount');
    const chips = document.querySelectorAll('#compFilterBar .syslist-chip');

    let activeFilter = 'all';

    // ── Gruppen ein-/ausklappen ────────────────────────────────────────
    container.querySelectorAll('.syslist-group-header').forEach(header => {
        header.addEventListener('click', () => toggleGroup(header.closest('.syslist-group')));
    });

    collapseAll.addEventListener('click', () => {
        container.querySelectorAll('.syslist-group:not([hidden])').forEach(g => collapseGroup(g));
    });

    expandAll.addEventListener('click', () => {
        container.querySelectorAll('.syslist-group:not([hidden])').forEach(g => expandGroup(g));
    });

    function collapseGroup(group) {
        group.querySelector('.syslist-group-body').style.display = 'none';
        group.querySelector('.syslist-group-toggle').textContent = '▸';
        group.classList.add('collapsed');
    }

    function expandGroup(group) {
        group.querySelector('.syslist-group-body').style.display = '';
        group.querySelector('.syslist-group-toggle').textContent = '▾';
        group.classList.remove('collapsed');
    }

    function toggleGroup(group) {
        group.classList.contains('collapsed') ? expandGroup(group) : collapseGroup(group);
    }

    // ── Filter-Chips ───────────────────────────────────────────────────
    chips.forEach(chip => {
        chip.addEventListener('click', () => {
            chips.forEach(c => c.classList.remove('active'));
            chip.classList.add('active');
            activeFilter = chip.dataset.filter;
            applyFilters();
        });
    });

    // ── Suche ─────────────────────────────────────────────────────────
    search.addEventListener('input', applyFilters);

    // ── Sortierung ────────────────────────────────────────────────────
    sortSelect.addEventListener('change', applyFilters);

    // ── Kern-Logik ────────────────────────────────────────────────────
    function applyFilters() {
        const query = search.value.trim().toLowerCase();
        const sort = sortSelect.value;

        let totalVisible = 0;

        container.querySelectorAll('.syslist-group').forEach(group => {
            const typ = group.dataset.typ;

            const groupVisible = (activeFilter === 'all' || activeFilter === typ);
            if (!groupVisible) {
                group.hidden = true;
                return;
            }
            group.hidden = false;

            // Zeilen filtern
            const rows = Array.from(group.querySelectorAll('.syslist-row'));
            let visibleRows = [];

            rows.forEach(row => {
                const name = row.dataset.name || '';
                const ip = row.querySelector('.complist-col-ip')?.textContent.toLowerCase() || '';
                const software = row.querySelector('.complist-col-software')?.textContent.toLowerCase() || '';
                const system = row.querySelector('.complist-col-system')?.textContent.toLowerCase() || '';
                const matches = !query || name.includes(query) || ip.includes(query)
                    || software.includes(query) || system.includes(query);
                row.hidden = !matches;
                if (matches) visibleRows.push(row);
            });

            totalVisible += visibleRows.length;

            // Sortierung innerhalb der Gruppe
            const body = group.querySelector('.syslist-group-body');
            sortRows(visibleRows, sort).forEach(r => body.appendChild(r));

            // Gruppenanzahl aktualisieren
            group.querySelector('.syslist-group-count').textContent = visibleRows.length;

            // Gruppe ausblenden wenn keine Treffer
            group.hidden = visibleRows.length === 0;
        });

        // Gesamt-Counter
        countLabel.textContent = totalVisible + (totalVisible === 1 ? ' Komponente' : ' Komponenten');

        // Leer-Meldung
        emptyMsg.style.display = (totalVisible === 0) ? '' : 'none';
    }

    function sortRows(rows, mode) {
        return rows.slice().sort((a, b) => {
            switch (mode) {
                case 'name-asc':
                    return (a.dataset.name || '').localeCompare(b.dataset.name || '');
                case 'name-desc':
                    return (b.dataset.name || '').localeCompare(a.dataset.name || '');
                default:
                    return 0;
            }
        });
    }
})();
