/**
 * System Management – Suche, Filter, Sortierung, Gruppen-Collapse
 */
(function () {
    const search = document.getElementById('sysSearch');
    const sortSelect = document.getElementById('sysSort');
    const collapseAll = document.getElementById('sysCollapseAll');
    const expandAll = document.getElementById('sysExpandAll');
    const container = document.getElementById('sysListContainer');
    const emptyMsg = document.getElementById('sysEmptyMsg');
    const countLabel = document.getElementById('sysVisibleCount');
    const chips = document.querySelectorAll('#sysFilterBar .syslist-chip');

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
            const bereich = group.dataset.bereich;

            // Gruppe gegen Filter prüfen
            const groupVisible = (activeFilter === 'all' || activeFilter === bereich);

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
                const desc = row.querySelector('.syslist-col-desc')?.textContent.toLowerCase() || '';
                const matches = !query || name.includes(query) || desc.includes(query);
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
        countLabel.textContent = totalVisible + (totalVisible === 1 ? ' System' : ' Systeme');

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
                case 'komp-desc':
                    return parseInt(b.querySelector('.syslist-badge--komp')?.textContent || 0)
                        - parseInt(a.querySelector('.syslist-badge--komp')?.textContent || 0);
                case 'app-desc':
                    return parseInt(b.querySelector('.syslist-badge--app')?.textContent || 0)
                        - parseInt(a.querySelector('.syslist-badge--app')?.textContent || 0);
                default:
                    return 0;
            }
        });
    }
})();
