/**
 * Fills the .software-info-container with data fetched from the software API.
 * Also expands the collapsible section if a sectionId is provided.
 *
 * @param {Object} data       - Software info object from the API
 * @param {string|null} sectionId - ID of the collapsible section element (optional)
 */
export function fillSoftwareInfo(data, sectionId = null) {
    if (sectionId) {
        document.getElementById(sectionId)?.classList.remove('collapsed');
    }

    const infoDiv = document.querySelector('.software-info-container');
    if (!infoDiv) return;

    const q = (sel) => infoDiv.querySelector(sel);
    const byId = (id) => document.getElementById(id);
    const el = (sel, id) => q(sel) ?? byId(id);

    const setText = (node, text) => { if (node) node.textContent = text; };
    const setTags = (node, items) => {
        if (!node) return;
        node.innerHTML = items?.length
            ? items.map(i => `<span class="badge">${i}</span>`).join('')
            : '-';
    };

    setText(q('.software-info-title'), data.name || '');
    setText(q('.software-vendor'), data.vendor || '-');
    setText(el('.software-category', 'sw-category'), data.category || '-');
    setText(el('.software-type', 'sw-type'), data.type || '-');
    setText(el('.software-description-text', 'sw-description'), data.description || '');

    setTags(el('.software-features', 'sw-features'), data.features);
    setTags(el('.software-platforms', 'sw-platforms'), data.platforms);
    setTags(el('.software-license', 'sw-license'), data.licenseModel);
    setTags(el('.software-usecases', 'sw-usecases'), data.useCases);

    setText(el('.software-pricing-text', 'sw-pricing'), data.pricing || '-');
    setText(el('.software-notes-text', 'sw-notes'), data.notes || '');

    // Firewall uses .software-cpe-list (class), other wizards use #sw-cpe (ID)
    const cpe = q('.software-cpe-list') ?? byId('sw-cpe');
    if (cpe) {
        cpe.innerHTML = data.cpe?.length
            ? data.cpe.map(c => `<code class="cpe-id">${c}</code>`).join('')
            : '-';
    }
}

/**
 * Collapses (hides) the software info section.
 * @param {string} sectionId
 */
export function hideSoftwareInfo(sectionId) {
    const section = document.getElementById(sectionId);
    if (section && !section.classList.contains('collapsed')) {
        section.classList.add('collapsed');
    }
}
