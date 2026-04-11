/**
 * Application Management – Suche, Filter, Sortierung, Gruppen-Collapse,
 * Nav-Links, Multi-Version-Toggle
 */
(function () {
    const search      = document.getElementById('appSearch');
    const sortSelect  = document.getElementById('appSort');
    const collapseAll = document.getElementById('appCollapseAll');
    const expandAll   = document.getElementById('appExpandAll');
    const container   = document.getElementById('appListContainer');
    const emptyMsg    = document.getElementById('appEmptyMsg');
    const countLabel  = document.getElementById('appVisibleCount');
    const chips       = document.querySelectorAll('#appFilterBar .syslist-chip');
    const navLinks    = document.querySelectorAll('.app-nav-list a');

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

    // ── Multi-Version-Toggle (event delegation) ────────────────────────
    container.addEventListener('click', e => {
        // Ignore clicks on the edit button inside expandable rows
        if (e.target.closest('.syslist-edit-btn')) return;

        const row = e.target.closest('.approw--expandable');
        if (!row) return;

        const versionsEl = row.nextElementSibling;
        if (!versionsEl || !versionsEl.classList.contains('approw-versions')) return;

        const expanded = row.classList.toggle('approw--expanded');
        versionsEl.style.display = expanded ? '' : 'none';
        const toggle = row.querySelector('.approw-toggle');
        if (toggle) toggle.textContent = expanded ? '▾' : '▸';
    });

    // ── Nav-Links: Gruppe aufklappen und hinspringen ───────────────────
    navLinks.forEach(link => {
        link.addEventListener('click', e => {
            e.preventDefault();
            const targetId = link.getAttribute('href').substring(1);
            const group = document.getElementById(targetId);
            if (!group) return;
            if (group.hidden) {
                chips.forEach(c => c.classList.remove('active'));
                document.querySelector('.syslist-chip[data-filter="all"]').classList.add('active');
                activeFilter = 'all';
                applyFilters();
            }
            expandGroup(group);
            group.scrollIntoView({ behavior: 'smooth', block: 'start' });
        });
    });

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
        const sort  = sortSelect.value;

        let totalVisible = 0;

        container.querySelectorAll('.syslist-group').forEach(group => {
            const typ = group.dataset.typ;
            const groupVisible = (activeFilter === 'all' || activeFilter === typ);
            if (!groupVisible) { group.hidden = true; return; }
            group.hidden = false;

            const rows = Array.from(group.querySelectorAll('.syslist-row'));

            // Capture version-div siblings BEFORE any DOM moves
            const versionDivs = new Map();
            rows.forEach(row => {
                const sib = row.nextElementSibling;
                if (sib && sib.classList.contains('approw-versions')) {
                    versionDivs.set(row, sib);
                }
            });

            let visibleRows = [];
            rows.forEach(row => {
                const name    = row.dataset.name || '';
                const appName = row.querySelector('.applist-col-name')?.textContent.toLowerCase()    || '';
                const vendor  = row.querySelector('.applist-col-vendor')?.textContent.toLowerCase()  || '';
                const version = row.querySelector('.applist-col-version')?.textContent.toLowerCase() || '';
                const versEl  = versionDivs.get(row);
                const versText = versEl ? versEl.textContent.toLowerCase() : '';
                const matches = !query || name.includes(query) || appName.includes(query)
                                       || vendor.includes(query) || version.includes(query)
                                       || versText.includes(query);
                row.hidden = !matches;
                if (versEl) versEl.hidden = !matches;
                if (matches) visibleRows.push(row);
            });

            totalVisible += visibleRows.length;

            // Sort rows, keeping each version-div immediately following its parent row
            const body = group.querySelector('.syslist-group-body');
            sortRows(visibleRows, sort).forEach(r => {
                body.appendChild(r);
                const vd = versionDivs.get(r);
                if (vd) body.appendChild(vd);
            });

            group.querySelector('.syslist-group-count').textContent = visibleRows.length;
            group.hidden = visibleRows.length === 0;
        });

        countLabel.textContent = totalVisible + (totalVisible === 1 ? ' Applikation' : ' Applikationen');
        emptyMsg.style.display = (totalVisible === 0) ? '' : 'none';
    }

    function getCve(row) {
        return parseInt(row.querySelector('.applist-col-cve')?.textContent || '0') || 0;
    }

    function getSystems(row) {
        return parseInt(row.querySelector('.applist-col-systems')?.textContent || '0') || 0;
    }

    function sortRows(rows, mode) {
        return rows.slice().sort((a, b) => {
            switch (mode) {
                case 'name-asc':     return (a.dataset.name || '').localeCompare(b.dataset.name || '');
                case 'name-desc':    return (b.dataset.name || '').localeCompare(a.dataset.name || '');
                case 'cve-desc':     return getCve(b) - getCve(a);
                case 'systems-desc': return getSystems(b) - getSystems(a);
                default:             return 0;
            }
        });
    }
})();
