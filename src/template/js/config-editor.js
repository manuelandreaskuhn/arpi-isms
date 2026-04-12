/**
 * Config Editor — Kundenspezifische Wizard-Konfiguration
 *
 * Architektur:
 *  - State: aktueller Wizard-Config-Entwurf (JS-Objekt, nicht direkt gespeichert)
 *  - API:   /api/config/wizards, /api/config/wizard/{id}, PUT, DELETE
 *  - UI:    Sidebar-Liste + Seiteneditor mit Drag & Drop (nativem HTML5)
 */

'use strict';

// ============================================================
// State
// ============================================================

const EditorState = {
    /** @type {string|null} */
    wizardId: null,

    /** @type {object|null} Aktuell im Editor geladene Config (Arbeitskopie) */
    config: null,

    /** @type {boolean} Ob Custom-Config vorhanden ist (vor Bearbeitung) */
    isCustom: false,

    /** @type {boolean} Ob es ungespeicherte Änderungen gibt */
    dirty: false,

    /** @type {object} Elements-Katalog { elementId → {...} } */
    elements: {},

    /** @type {string|null} Welche Page-ID gerade ein Feld aufnimmt (DnD) */
    draggingFrom: null,

    /** @type {{pageIdx: number, fieldIdx: number}|null} */
    draggingField: null,

    /** @type {number|null} Seiten-Index der dragged Seite */
    draggingPageIdx: null,
};

// ============================================================
// DOM-Referenzen
// ============================================================

/** @type {HTMLUListElement} */
let wizardNavList;
/** @type {HTMLDivElement} */
let settingsEmpty, settingsEditor;
/** @type {HTMLHeadingElement} */
let editorTitle;
/** @type {HTMLSpanElement} */
let editorBadge;
/** @type {HTMLDivElement} */
let editorPages, editorDirtyBanner;
/** @type {HTMLButtonElement} */
let btnSaveConfig, btnResetConfig, btnAddPage;
/** @type {HTMLDialogElement} */
let addFieldDialog, addPageDialog;
/** @type {HTMLInputElement} */
let addFieldSearch;
/** @type {HTMLUListElement} */
let addFieldList;

// Welche Seite wird gerade befüllt?
let pendingAddFieldPageIdx = null;

// ============================================================
// Init
// ============================================================

document.addEventListener('DOMContentLoaded', async () => {
    wizardNavList = document.getElementById('wizardNavList');
    settingsEmpty = document.getElementById('settingsEmpty');
    settingsEditor = document.getElementById('settingsEditor');
    editorTitle = document.getElementById('editorTitle');
    editorBadge = document.getElementById('editorBadge');
    editorPages = document.getElementById('editorPages');
    editorDirtyBanner = document.getElementById('editorDirtyBanner');
    btnSaveConfig = document.getElementById('btnSaveConfig');
    btnResetConfig = document.getElementById('btnResetConfig');
    btnAddPage = document.getElementById('btnAddPage');
    addFieldDialog = document.getElementById('addFieldDialog');
    addPageDialog = document.getElementById('addPageDialog');
    addFieldSearch = document.getElementById('addFieldSearch');
    addFieldList = document.getElementById('addFieldList');

    btnSaveConfig.addEventListener('click', handleSave);
    btnResetConfig.addEventListener('click', handleReset);
    btnAddPage.addEventListener('click', openAddPageDialog);

    addFieldSearch.addEventListener('input', filterElements);
    document.getElementById('btnAddFieldCancel').addEventListener('click', () => addFieldDialog.close());
    document.getElementById('btnAddPageCancel').addEventListener('click', () => addPageDialog.close());
    addPageDialog.querySelector('form').addEventListener('submit', handleAddPageSubmit);

    await Promise.all([loadWizardList(), loadElements()]);
});

// ============================================================
// API-Calls
// ============================================================

async function apiFetch(url, opts = {}) {
    const res = await fetch(url, {
        headers: { 'Content-Type': 'application/json', 'Accept': 'application/json' },
        ...opts,
    });
    const json = await res.json();
    if (!json.success) throw new Error(json.error ?? 'API error');
    return json.data;
}

async function loadWizardList() {
    try {
        const wizards = await apiFetch('/?site=API&path=config/wizards');
        renderWizardList(wizards);
    } catch (e) {
        wizardNavList.innerHTML = `<li class="editor-error">Wizards konnten nicht geladen werden</li>`;
    }
}

async function loadElements() {
    try {
        const elements = await apiFetch('/?site=API&path=config/elements');
        EditorState.elements = elements;
    } catch (_) {
        // Elements sind nur für das Hinzufügen nötig, kein harter Fehler
    }
}

async function loadWizardConfig(id) {
    return apiFetch(`/?site=API&path=config/wizard/${encodeURIComponent(id)}`);
}

async function saveWizardConfig(id, config) {
    await apiFetch(`/?site=API&path=config/wizard/${encodeURIComponent(id)}`, {
        method: 'PUT',
        body: JSON.stringify(config),
    });
}

async function deleteWizardConfig(id) {
    await apiFetch(`/?site=API&path=config/wizard/${encodeURIComponent(id)}`, {
        method: 'DELETE',
    });
}

// ============================================================
// Wizard-Liste rendern
// ============================================================

function renderWizardList(wizards) {
    wizardNavList.innerHTML = '';

    if (!wizards || wizards.length === 0) {
        wizardNavList.innerHTML = '<li style="padding:8px 20px;font-size:0.85em;color:#94a3b8;">Keine Wizards gefunden</li>';
        return;
    }

    wizards.forEach(w => {
        const li = document.createElement('li');
        const btn = document.createElement('button');
        btn.className = 'wizard-nav-item';
        btn.dataset.id = w.id;
        btn.type = 'button';

        const labelSpan = document.createElement('span');
        labelSpan.className = 'wizard-nav-label';
        labelSpan.textContent = w.label ?? w.id;
        btn.appendChild(labelSpan);

        if (w.isCustom) {
            const badge = document.createElement('span');
            badge.className = 'badge-custom';
            badge.textContent = 'Angepasst';
            btn.appendChild(badge);
        }

        btn.addEventListener('click', () => selectWizard(w.id, btn));
        li.appendChild(btn);
        wizardNavList.appendChild(li);
    });
}

function selectWizard(id, clickedBtn) {
    if (EditorState.dirty) {
        if (!confirm('Es gibt ungespeicherte Änderungen. Trotzdem wechseln?')) return;
    }

    document.querySelectorAll('.wizard-nav-item').forEach(b => b.classList.remove('active'));
    clickedBtn.classList.add('active');

    openWizardEditor(id);
}

// ============================================================
// Editor öffnen
// ============================================================

async function openWizardEditor(id) {
    settingsEmpty.hidden = true;
    settingsEditor.hidden = false;
    editorPages.innerHTML = '<div class="editor-loading">Konfiguration wird geladen…</div>';
    editorDirtyBanner.hidden = true;
    btnSaveConfig.disabled = true;
    editorTitle.textContent = id;

    try {
        const { config, isCustom } = await loadWizardConfig(id);

        EditorState.wizardId = id;
        EditorState.config = deepClone(config);
        EditorState.isCustom = isCustom;
        EditorState.dirty = false;

        editorTitle.textContent = config.label ?? id;
        updateBadge(isCustom);

        renderPages();
    } catch (e) {
        editorPages.innerHTML = `<div class="editor-error">Fehler beim Laden: ${escHtml(e.message)}</div>`;
    }
}

function updateBadge(isCustom) {
    editorBadge.textContent = isCustom ? 'Angepasst' : 'Standard';
    editorBadge.className = 'editor-config-badge ' + (isCustom ? 'badge-custom' : 'badge-default');
}

// ============================================================
// Seiten rendern
// ============================================================

function renderPages() {
    editorPages.innerHTML = '';
    const pages = EditorState.config?.pages ?? [];

    pages.forEach((page, idx) => {
        const card = buildPageCard(page, idx);
        editorPages.appendChild(card);
    });
}

// ============================================================
// Seiten-Karte bauen
// ============================================================

function buildPageCard(page, pageIdx) {
    const card = document.createElement('div');
    card.className = 'page-card';
    card.dataset.pageIdx = pageIdx;
    card.draggable = true;

    // ---- Header ----
    const header = document.createElement('div');
    header.className = 'page-card-header';
    header.title = 'Seite verschieben';

    const dragHandle = document.createElement('span');
    dragHandle.className = 'page-drag-handle';
    dragHandle.textContent = '⠿';
    header.appendChild(dragHandle);

    const orderBadge = document.createElement('span');
    orderBadge.className = 'page-order-badge';
    orderBadge.textContent = pageIdx + 1;
    header.appendChild(orderBadge);

    const labelInput = document.createElement('input');
    labelInput.type = 'text';
    labelInput.className = 'page-label-input';
    labelInput.value = page.label ?? '';
    labelInput.placeholder = 'Seiten-Bezeichnung';
    labelInput.addEventListener('change', e => {
        EditorState.config.pages[pageIdx].label = e.target.value;
        markDirty();
    });
    header.appendChild(labelInput);

    const badgeInput = document.createElement('input');
    badgeInput.type = 'text';
    badgeInput.className = 'page-badge-input';
    badgeInput.value = page.badge ?? '';
    badgeInput.placeholder = 'Badge (opt.)';
    badgeInput.title = 'Optionaler Badge-Text (z.B. "Pflicht")';
    badgeInput.addEventListener('change', e => {
        EditorState.config.pages[pageIdx].badge = e.target.value;
        markDirty();
    });
    header.appendChild(badgeInput);

    const headerActions = document.createElement('div');
    headerActions.className = 'page-header-actions';

    const collapseBtn = document.createElement('button');
    collapseBtn.type = 'button';
    collapseBtn.className = 'btn-page-collapse';
    collapseBtn.title = 'Auf-/Zuklappen';
    collapseBtn.textContent = '▾';
    collapseBtn.addEventListener('click', () => togglePageCollapse(collapseBtn, fieldsList));
    headerActions.appendChild(collapseBtn);

    const deleteBtn = document.createElement('button');
    deleteBtn.type = 'button';
    deleteBtn.className = 'btn-page-delete';
    deleteBtn.title = 'Seite entfernen';
    deleteBtn.textContent = '×';
    deleteBtn.addEventListener('click', () => deletePage(pageIdx));
    headerActions.appendChild(deleteBtn);

    header.appendChild(headerActions);
    card.appendChild(header);

    // ---- Drag & Drop für Seiten ----
    card.addEventListener('dragstart', e => {
        if (e.target === card) {
            EditorState.draggingPageIdx = pageIdx;
            card.classList.add('dragging');
            e.dataTransfer.effectAllowed = 'move';
            e.dataTransfer.setData('text/plain', 'page:' + pageIdx);
        }
    });
    card.addEventListener('dragend', () => {
        card.classList.remove('dragging');
        EditorState.draggingPageIdx = null;
        document.querySelectorAll('.page-card').forEach(c => c.classList.remove('drag-over'));
    });
    card.addEventListener('dragover', e => {
        if (EditorState.draggingPageIdx !== null && EditorState.draggingPageIdx !== pageIdx) {
            e.preventDefault();
            e.dataTransfer.dropEffect = 'move';
            document.querySelectorAll('.page-card').forEach(c => c.classList.remove('drag-over'));
            card.classList.add('drag-over');
        }
    });
    card.addEventListener('drop', e => {
        e.preventDefault();
        const fromIdx = EditorState.draggingPageIdx;
        if (fromIdx !== null && fromIdx !== pageIdx) {
            movePage(fromIdx, pageIdx);
        }
    });

    // ---- Felder-Liste ----
    const fieldsList = document.createElement('div');
    fieldsList.className = 'page-fields page-fields-drop-zone';
    fieldsList.dataset.pageIdx = pageIdx;

    fieldsList.addEventListener('dragover', e => {
        if (EditorState.draggingField !== null) {
            e.preventDefault();
            e.dataTransfer.dropEffect = 'move';
            fieldsList.classList.add('drag-over-fields');
        }
    });
    fieldsList.addEventListener('dragleave', () => fieldsList.classList.remove('drag-over-fields'));
    fieldsList.addEventListener('drop', e => {
        e.preventDefault();
        fieldsList.classList.remove('drag-over-fields');
        if (EditorState.draggingField !== null) {
            const { pageIdx: fromPage, fieldIdx: fromField } = EditorState.draggingField;
            moveFieldToPage(fromPage, fromField, pageIdx, null);
        }
    });

    (page.fields ?? []).forEach((field, fieldIdx) => {
        fieldsList.appendChild(buildFieldRow(field, pageIdx, fieldIdx));
    });

    // "Feld hinzufügen"-Button
    const addFieldBtn = document.createElement('button');
    addFieldBtn.type = 'button';
    addFieldBtn.className = 'btn-add-field';
    addFieldBtn.textContent = '+ Feld hinzufügen';
    addFieldBtn.addEventListener('click', () => openAddFieldDialog(pageIdx));

    card.appendChild(fieldsList);
    card.appendChild(addFieldBtn);

    return card;
}

function togglePageCollapse(btn, fieldsList) {
    const collapsed = fieldsList.classList.toggle('collapsed');
    btn.classList.toggle('collapsed', collapsed);
}

// ============================================================
// Feld-Zeile bauen
// ============================================================

function buildFieldRow(field, pageIdx, fieldIdx) {
    const row = document.createElement('div');
    row.className = 'field-row';
    row.draggable = true;
    row.dataset.pageIdx = pageIdx;
    row.dataset.fieldIdx = fieldIdx;

    // Drag-Handle
    const dragHandle = document.createElement('span');
    dragHandle.className = 'field-drag-handle';
    dragHandle.textContent = '⠿';
    row.appendChild(dragHandle);

    // Label-Input
    const labelInput = document.createElement('input');
    labelInput.type = 'text';
    labelInput.className = 'field-label-input';
    labelInput.value = field.label ?? field.name ?? '';
    labelInput.placeholder = 'Feld-Bezeichnung';
    labelInput.addEventListener('change', e => {
        EditorState.config.pages[pageIdx].fields[fieldIdx].label = e.target.value;
        markDirty();
    });
    row.appendChild(labelInput);

    // Element-Tag
    const elementTag = document.createElement('span');
    elementTag.className = 'field-element-tag';
    elementTag.title = field.element ?? field.group ?? field.name ?? '';
    elementTag.textContent = field.element ?? field.group ?? field.name ?? '—';
    row.appendChild(elementTag);

    // Pflichtfeld-Toggle
    const reqLabel = document.createElement('label');
    reqLabel.className = 'field-required-toggle' + (field.required ? ' required-active' : '');
    reqLabel.title = 'Pflichtfeld';
    const reqCheck = document.createElement('input');
    reqCheck.type = 'checkbox';
    reqCheck.checked = !!field.required;
    reqCheck.addEventListener('change', e => {
        EditorState.config.pages[pageIdx].fields[fieldIdx].required = e.target.checked;
        reqLabel.classList.toggle('required-active', e.target.checked);
        markDirty();
    });
    reqLabel.appendChild(reqCheck);
    reqLabel.appendChild(document.createTextNode('Pflicht'));
    row.appendChild(reqLabel);

    // Verschieben-zu-Seite-Dropdown
    const moveSelect = buildMoveSelect(pageIdx, fieldIdx);
    row.appendChild(moveSelect);

    // Löschen-Button
    const deleteBtn = document.createElement('button');
    deleteBtn.type = 'button';
    deleteBtn.className = 'btn-field-delete';
    deleteBtn.title = 'Feld entfernen';
    deleteBtn.textContent = '×';
    deleteBtn.addEventListener('click', () => deleteField(pageIdx, fieldIdx));
    row.appendChild(deleteBtn);

    // ---- DnD für Felder ----
    row.addEventListener('dragstart', e => {
        EditorState.draggingField = { pageIdx, fieldIdx };
        row.classList.add('dragging');
        e.dataTransfer.effectAllowed = 'move';
        e.dataTransfer.setData('text/plain', `field:${pageIdx}:${fieldIdx}`);
        e.stopPropagation(); // Verhindert page-drag-start
    });
    row.addEventListener('dragend', () => {
        row.classList.remove('dragging');
        EditorState.draggingField = null;
        document.querySelectorAll('.field-row').forEach(r => r.classList.remove('drag-over'));
    });
    row.addEventListener('dragover', e => {
        if (EditorState.draggingField !== null) {
            e.preventDefault();
            e.stopPropagation();
            e.dataTransfer.dropEffect = 'move';
            document.querySelectorAll('.field-row').forEach(r => r.classList.remove('drag-over'));
            row.classList.add('drag-over');
        }
    });
    row.addEventListener('drop', e => {
        e.preventDefault();
        e.stopPropagation();
        if (EditorState.draggingField) {
            const { pageIdx: fromPage, fieldIdx: fromField } = EditorState.draggingField;
            moveFieldToPage(fromPage, fromField, pageIdx, fieldIdx);
        }
    });

    return row;
}

function buildMoveSelect(pageIdx, fieldIdx) {
    const select = document.createElement('select');
    select.className = 'field-move-select';
    select.title = 'Feld auf andere Seite verschieben';

    const defaultOpt = document.createElement('option');
    defaultOpt.value = '';
    defaultOpt.textContent = 'Seite wechseln…';
    select.appendChild(defaultOpt);

    (EditorState.config?.pages ?? []).forEach((p, idx) => {
        if (idx === pageIdx) return;
        const opt = document.createElement('option');
        opt.value = idx;
        opt.textContent = (idx + 1) + '. ' + (p.label ?? p.id);
        select.appendChild(opt);
    });

    select.addEventListener('change', e => {
        const targetIdx = parseInt(e.target.value, 10);
        if (!isNaN(targetIdx)) {
            moveFieldToPage(pageIdx, fieldIdx, targetIdx, null);
        }
        select.value = ''; // Reset
    });

    return select;
}

// ============================================================
// State-Mutationen
// ============================================================

function markDirty() {
    if (!EditorState.dirty) {
        EditorState.dirty = true;
        editorDirtyBanner.hidden = false;
        btnSaveConfig.disabled = false;
    }
}

function deletePage(pageIdx) {
    if (!confirm(`Seite "${EditorState.config.pages[pageIdx].label}" wirklich entfernen?`)) return;
    EditorState.config.pages.splice(pageIdx, 1);
    // order-Felder aktualisieren
    EditorState.config.pages.forEach((p, i) => { p.order = i + 1; });
    markDirty();
    renderPages();
}

function deleteField(pageIdx, fieldIdx) {
    EditorState.config.pages[pageIdx].fields.splice(fieldIdx, 1);
    markDirty();
    renderPages();
}

function movePage(fromIdx, toIdx) {
    const pages = EditorState.config.pages;
    const [moved] = pages.splice(fromIdx, 1);
    pages.splice(toIdx, 0, moved);
    pages.forEach((p, i) => { p.order = i + 1; });
    markDirty();
    renderPages();
}

/**
 * Verschiebt ein Feld von Seite fromPage, Position fromField
 * nach Seite toPage, vor Position beforeField (null = ans Ende).
 */
function moveFieldToPage(fromPage, fromField, toPage, beforeField) {
    if (fromPage === toPage && fromField === beforeField) return;

    const pages = EditorState.config.pages;
    const [field] = pages[fromPage].fields.splice(fromField, 1);

    if (beforeField !== null && fromPage === toPage) {
        // Nach dem splice hat sich der Index ggf. verschoben
        const adjusted = beforeField > fromField ? beforeField - 1 : beforeField;
        pages[toPage].fields.splice(adjusted, 0, field);
    } else if (beforeField !== null) {
        pages[toPage].fields.splice(beforeField, 0, field);
    } else {
        pages[toPage].fields.push(field);
    }

    markDirty();
    renderPages();
}

// ============================================================
// Dial: Feld hinzufügen
// ============================================================

function openAddFieldDialog(pageIdx) {
    pendingAddFieldPageIdx = pageIdx;
    addFieldSearch.value = '';
    renderElementList('');
    addFieldDialog.showModal();
    addFieldSearch.focus();
}

function filterElements() {
    renderElementList(addFieldSearch.value.trim().toLowerCase());
}

// Gruppenzuordnung: Element-ID → Gruppenname
const ELEMENT_GROUPS = {
    // Allgemein
    'text-name': 'Allgemein',
    'text-description': 'Allgemein',
    'text-location': 'Allgemein',
    'notes': 'Allgemein',
    'date-field': 'Allgemein',
    'department': 'Allgemein',
    // Netzwerk
    'ip-address': 'Netzwerk',
    'cidr': 'Netzwerk',
    'hostname': 'Netzwerk',
    'mac-address': 'Netzwerk',
    'vlan-id': 'Netzwerk',
    'subnet-mask': 'Netzwerk',
    'gateway-ip': 'Netzwerk',
    'dns-server': 'Netzwerk',
    'network-segment': 'Netzwerk',
    'public-ip': 'Netzwerk',
    'port': 'Netzwerk',
    'management-url': 'Netzwerk',
    // Software & Betrieb
    'software-select': 'Software & Betrieb',
    'version': 'Software & Betrieb',
    'vendor': 'Software & Betrieb',
    'environment': 'Software & Betrieb',
    'criticality': 'Software & Betrieb',
    'license-model': 'Software & Betrieb',
    'monitoring-tool': 'Software & Betrieb',
    'serial-number': 'Software & Betrieb',
    // Support
    'admin-contact': 'Support',
    'support-contact': 'Support',
    'support-contract': 'Support',
    'support-end-date': 'Support',
    // Verfügbarkeit & Logging
    'ha-enabled': 'Verfügbarkeit & Logging',
    'log-retention': 'Verfügbarkeit & Logging',
    'alert-email': 'Verfügbarkeit & Logging',
    // Referenzen
    'component-reference': 'Referenzen',
    'siem-reference': 'Referenzen',
    'firewall-reference': 'Referenzen',
    'backup-reference': 'Referenzen',
    'vm-hardware-reference': 'Referenzen',
    // Eingabe-Typen
    'text-input': 'Eingabe-Typen',
    'textarea-input': 'Eingabe-Typen',
    'number-input': 'Eingabe-Typen',
    'url-input': 'Eingabe-Typen',
    'email-input': 'Eingabe-Typen',
    'select-input': 'Eingabe-Typen',
    'checkbox-group': 'Eingabe-Typen',
    'radio-group': 'Eingabe-Typen',
    'range-slider': 'Eingabe-Typen',
    'toggle': 'Eingabe-Typen',
};

// Reihenfolge der Gruppen
const GROUP_ORDER = [
    'Allgemein',
    'Netzwerk',
    'Software & Betrieb',
    'Support',
    'Verfügbarkeit & Logging',
    'Referenzen',
    'Eingabe-Typen',
];

function renderElementList(query) {
    addFieldList.innerHTML = '';
    const elements = Object.values(EditorState.elements);

    const filtered = query
        ? elements.filter(e =>
            (e.label ?? '').toLowerCase().includes(query) ||
            (e.id ?? '').toLowerCase().includes(query) ||
            (e.description ?? '').toLowerCase().includes(query)
        )
        : elements;

    if (filtered.length === 0) {
        addFieldList.innerHTML = '<li class="element-list-empty">Keine Elemente gefunden</li>';
        return;
    }

    // Bei aktiver Suche: flache Liste ohne Gruppen
    if (query) {
        const sorted = [...filtered].sort((a, b) => (a.label ?? a.id).localeCompare(b.label ?? b.id, 'de'));
        sorted.forEach(el => addFieldList.appendChild(buildElementItem(el)));
        return;
    }

    // Ohne Suche: gruppierte Ansicht
    const grouped = {};
    filtered.forEach(el => {
        const group = ELEMENT_GROUPS[el.id] ?? 'Sonstige';
        if (!grouped[group]) grouped[group] = [];
        grouped[group].push(el);
    });

    // Alle bekannten Gruppen in definierter Reihenfolge, dann "Sonstige" ans Ende
    const orderedKeys = [
        ...GROUP_ORDER.filter(g => grouped[g]),
        ...Object.keys(grouped).filter(g => !GROUP_ORDER.includes(g)),
    ];

    orderedKeys.forEach(groupName => {
        const items = grouped[groupName].sort((a, b) =>
            (a.label ?? a.id).localeCompare(b.label ?? b.id, 'de')
        );

        // Gruppen-Header
        const header = document.createElement('li');
        header.className = 'element-group-header';
        header.textContent = groupName;
        addFieldList.appendChild(header);

        items.forEach(el => addFieldList.appendChild(buildElementItem(el)));
    });
}

function buildElementItem(element) {
    const li = document.createElement('li');
    li.className = 'element-item';

    const name = document.createElement('div');
    name.className = 'element-name';
    name.textContent = element.label ?? element.id;
    li.appendChild(name);

    if (element.description) {
        const desc = document.createElement('div');
        desc.className = 'element-desc';
        desc.textContent = element.description;
        li.appendChild(desc);
    }

    li.addEventListener('click', () => {
        addFieldFromElement(element);
        addFieldDialog.close();
    });

    return li;
}

function addFieldFromElement(element) {
    if (pendingAddFieldPageIdx === null) return;

    const newField = {
        name: element.id.replace(/-/g, '_'),
        element: element.id,
        label: element.label ?? element.id,
    };

    if (!EditorState.config.pages[pendingAddFieldPageIdx].fields) {
        EditorState.config.pages[pendingAddFieldPageIdx].fields = [];
    }

    EditorState.config.pages[pendingAddFieldPageIdx].fields.push(newField);
    markDirty();
    renderPages();
}

// ============================================================
// Dial: Seite hinzufügen
// ============================================================

function openAddPageDialog() {
    document.getElementById('newPageId').value = '';
    document.getElementById('newPageLabel').value = '';
    addPageDialog.showModal();
    document.getElementById('newPageId').focus();
}

function handleAddPageSubmit(e) {
    e.preventDefault();
    const id = document.getElementById('newPageId').value.trim();
    const label = document.getElementById('newPageLabel').value.trim();
    if (!id || !label) return;

    // Doppelte ID vermeiden
    if (EditorState.config.pages.some(p => p.id === id)) {
        alert(`Eine Seite mit der ID "${id}" existiert bereits.`);
        return;
    }

    const newPage = {
        id,
        label,
        order: (EditorState.config.pages.length + 1),
        fields: [],
    };

    EditorState.config.pages.push(newPage);
    markDirty();
    renderPages();
    addPageDialog.close();
}

// ============================================================
// Speichern / Zurücksetzen
// ============================================================

async function handleSave() {
    if (!EditorState.wizardId || !EditorState.config) return;

    btnSaveConfig.disabled = true;
    btnSaveConfig.textContent = 'Speichert…';

    try {
        await saveWizardConfig(EditorState.wizardId, EditorState.config);

        EditorState.dirty = false;
        EditorState.isCustom = true;
        editorDirtyBanner.hidden = true;
        updateBadge(true);
        refreshNavBadge(EditorState.wizardId, true);
    } catch (e) {
        alert('Fehler beim Speichern: ' + e.message);
        btnSaveConfig.disabled = false;
    } finally {
        btnSaveConfig.textContent = 'Speichern';
        if (!EditorState.dirty) {
            btnSaveConfig.disabled = true;
        }
    }
}

async function handleReset() {
    if (!EditorState.wizardId) return;

    if (!confirm('Standard-Konfiguration wiederherstellen? Alle Anpassungen gehen verloren.')) return;

    try {
        await deleteWizardConfig(EditorState.wizardId);
        EditorState.isCustom = false;
        EditorState.dirty = false;
        refreshNavBadge(EditorState.wizardId, false);

        // Config neu laden (Standard)
        await openWizardEditor(EditorState.wizardId);
    } catch (e) {
        alert('Fehler beim Zurücksetzen: ' + e.message);
    }
}

// ============================================================
// Sidebar-Badge aktualisieren
// ============================================================

function refreshNavBadge(wizardId, isCustom) {
    const btn = wizardNavList.querySelector(`.wizard-nav-item[data-id="${CSS.escape(wizardId)}"]`);
    if (!btn) return;

    const existing = btn.querySelector('.badge-custom');
    if (isCustom && !existing) {
        const badge = document.createElement('span');
        badge.className = 'badge-custom';
        badge.textContent = 'Angepasst';
        btn.appendChild(badge);
    } else if (!isCustom && existing) {
        existing.remove();
    }
}

// ============================================================
// Hilfsfunktionen
// ============================================================

function deepClone(obj) {
    return JSON.parse(JSON.stringify(obj));
}

function escHtml(str) {
    const d = document.createElement('div');
    d.textContent = str;
    return d.innerHTML;
}
