/**
 * Wizard Debug Mode
 * Aktivieren / Deaktivieren mit der ALT-Taste.
 *
 * Visualisierungen:
 *  1. Farbiges Highlighting nach Feld-Herkunft:
 *       – catalog     (blau)  : Feld aus Element-Katalog
 *       – inline      (gelb)  : Feld direkt im Wizard-JSON definiert
 *       – group-generic (orange): Gruppe, generisch gerendert
 *       – group-template (grün): Gruppe via HTML-Template-Partial
 *  2. Info-Badges: Element-ID, Typ, Name, Required, Condition
 *  3. Conditions: aktuelle Sichtbarkeit + Bedingung sichtbar machen
 *  4. Validierungsinfo: pattern / min / max direkt am Feld
 *  5. Floating Debug-Panel: Übersicht Felder, Typen, Conditions, aktuelle Werte
 */

let debugActive = false;
let styleEl = null;
let panel = null;

// ─────────────────────────────────────────────
// Toggle
// ─────────────────────────────────────────────

document.addEventListener('keyup', (e) => {
    if (e.key === 'Alt' && !e.shiftKey && !e.ctrlKey && !e.metaKey) {
        debugActive ? disable() : enable();
        debugActive = !debugActive;
    }
});

// Verhindert Browser-Menü beim Alt-Down im Debug-Modus
document.addEventListener('keydown', (e) => {
    if (e.key === 'Alt' && debugActive) e.preventDefault();
});

// ─────────────────────────────────────────────
// Enable / Disable
// ─────────────────────────────────────────────

function enable() {
    injectStyles();
    document.body.setAttribute('data-wizard-debug', '1');
    addFieldBadges();
    addGroupBadges();
    addConditionBadges();
    addValidationBadges();
    showPanel();
    toast('Debug-Modus aktiviert', '#2b6cb0');
}

function disable() {
    document.body.removeAttribute('data-wizard-debug');
    if (styleEl) { styleEl.remove(); styleEl = null; }
    document.querySelectorAll('.wdbg').forEach(el => el.remove());
    if (panel) { panel.remove(); panel = null; }
    if (sectionObserver) { sectionObserver.disconnect(); sectionObserver = null; }
    toast('Debug-Modus deaktiviert', '#4a5568');
}

// ─────────────────────────────────────────────
// CSS Injection
// ─────────────────────────────────────────────

function injectStyles() {
    styleEl = document.createElement('style');
    styleEl.id = 'wizard-debug-css';
    styleEl.textContent = `
/* ── Feld-Herkunft ──────────────────────────────── */
[data-wizard-debug] .form-group[data-debug-origin="catalog"] {
    outline: 2px solid #4299e1;
    background: #ebf8ff;
    border-radius: 6px;
    position: relative;
}
[data-wizard-debug] .form-group[data-debug-origin="inline"] {
    outline: 2px solid #ecc94b;
    background: #fffff0;
    border-radius: 6px;
    position: relative;
}
[data-wizard-debug] .group-wrapper[data-debug-origin="group-generic"] {
    outline: 2px dashed #ed8936;
    background: rgba(237,137,54,0.05);
    border-radius: 8px;
    position: relative;
}
[data-wizard-debug] .group-wrapper[data-debug-origin="group-template"] {
    outline: 2px dashed #48bb78;
    background: rgba(72,187,120,0.05);
    border-radius: 8px;
    position: relative;
}

/* ── Conditional: versteckt ─────────────────────── */
[data-wizard-debug] .form-group[style*="display: none"],
[data-wizard-debug] .form-group[style*="display:none"],
[data-wizard-debug] .group-wrapper[style*="display: none"],
[data-wizard-debug] .group-wrapper[style*="display:none"] {
    display: block !important;
    opacity: 0.35;
    outline-color: #9f7aea !important;
    background: rgba(159,122,234,0.07) !important;
}

/* ── Badges ─────────────────────────────────────── */
.wdbg {
    display: inline-flex;
    align-items: center;
    gap: 4px;
    padding: 1px 6px;
    border-radius: 4px;
    font-size: 10px;
    font-family: monospace;
    font-weight: 600;
    line-height: 1.6;
    pointer-events: none;
    white-space: nowrap;
    z-index: 9999;
}
.wdbg-field {
    position: absolute;
    top: 2px;
    right: 4px;
    flex-wrap: wrap;
    gap: 2px;
    background: transparent;
    padding: 0;
}
.wdbg-group {
    position: absolute;
    top: 4px;
    right: 6px;
}
.wdbg-tag {
    padding: 1px 5px;
    border-radius: 3px;
    font-size: 10px;
    font-family: monospace;
}
.wdbg-tag.catalog  { background:#bee3f8; color:#2a69ac; }
.wdbg-tag.inline   { background:#fefcbf; color:#975a16; }
.wdbg-tag.type     { background:#e9d8fd; color:#553c9a; }
.wdbg-tag.name     { background:#e2e8f0; color:#2d3748; }
.wdbg-tag.required { background:#fed7d7; color:#c53030; }
.wdbg-tag.optional { background:#f0fff4; color:#276749; }
.wdbg-tag.cond     { background:#fbd38d; color:#7b341e; }
.wdbg-tag.cond-off { background:#e9d8fd; color:#553c9a; border: 1px dashed #9f7aea; }
.wdbg-tag.valid    { background:#c6f6d5; color:#22543d; }
.wdbg-tag.gtpl     { background:#c6f6d5; color:#22543d; }
.wdbg-tag.ggen     { background:#feebc8; color:#7b341e; }
.wdbg-cond-overlay {
    position: absolute;
    bottom: 2px;
    left: 4px;
    font-size: 9px;
    font-family: monospace;
    color: #7b341e;
    background: rgba(251,211,141,0.85);
    padding: 0 4px;
    border-radius: 3px;
    pointer-events: none;
}

/* ── Debug Panel ────────────────────────────────── */
#wdbg-panel {
    position: fixed;
    top: 70px;
    left: 16px;
    width: 360px;
    max-height: calc(100vh - 90px);
    overflow: hidden;
    display: flex;
    flex-direction: column;
    background: #fff;
    border: 2px solid #4299e1;
    border-radius: 10px;
    box-shadow: 0 4px 24px rgba(0,0,0,0.18);
    z-index: 99999;
    font-size: 12px;
    font-family: monospace;
}
#wdbg-panel-scroll {
    overflow: auto;
    flex: 1;
}
#wdbg-panel-header {
    background: #4299e1;
    color: #fff;
    padding: 8px 12px;
    font-weight: 700;
    font-size: 13px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    border-radius: 8px 8px 0 0;
    cursor: move;
    user-select: none;
    flex-shrink: 0;
    white-space: nowrap;
}
#wdbg-panel-header button {
    background: none;
    border: none;
    color: #fff;
    font-size: 16px;
    cursor: pointer;
    line-height: 1;
    padding: 0 4px;
}
#wdbg-panel-body { padding: 10px; }
.wdbg-stat-row {
    display: flex;
    gap: 6px;
    flex-wrap: wrap;
    margin-bottom: 8px;
    flex-direction: column;
}
.wdbg-stat {
    background: #ebf8ff;
    border: 1px solid #bee3f8;
    border-radius: 5px;
    padding: 3px 8px;
    color: #2a69ac;
    font-weight: 600;
}
.wdbg-section-block { 
    margin-bottom: 10px; 
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    height: stretch;
    width: max-content;
}
.wdbg-section-title {
    font-weight: 700;
    color: #2d3748;
    border-bottom: 1px solid #e2e8f0;
    padding-bottom: 2px;
    margin-bottom: 4px;
    padding-top: 4px;
}
.wdbg-section-block.wdbg-active > .wdbg-section-title {
    color: #2b6cb0;
    background: #ebf8ff;
    border-radius: 4px;
    padding: 2px 6px;
    margin-left: -6px;
}
.wdbg-section-block.wdbg-inactive {
    opacity: 0.45;
}
#wdbg-section-bar {
    flex-shrink: 0;
    background: #2b4c7e;
    color: #bee3f8;
    font-family: monospace;
    font-size: 11px;
    font-weight: 600;
    padding: 4px 12px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    border-bottom: 1px solid #2a69ac;
}
.wdbg-field-row {
    display: flex;
    align-items: center;
    gap: 4px;
    padding: 2px 0;
    border-bottom: 1px solid #f7fafc;
    flex-wrap: wrap;
}
.wdbg-field-value {
    margin-left: auto;
    color: #2b6cb0;
    max-width: 100px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}
`;
    document.head.appendChild(styleEl);
}

// ─────────────────────────────────────────────
// Badge Injection
// ─────────────────────────────────────────────

function addFieldBadges() {
    document.querySelectorAll('.form-group[data-debug-origin]').forEach(fg => {
        const origin = fg.dataset.debugOrigin;
        const element = fg.dataset.debugElement || '';
        const type = fg.dataset.debugType || '';
        const name = fg.dataset.debugName || '';
        const required = fg.dataset.debugRequired === '1';

        const wrap = mk('div', 'wdbg wdbg-field');

        if (element) wrap.appendChild(tag(element, 'catalog'));
        else if (type) wrap.appendChild(tag(type, 'inline'));

        wrap.appendChild(tag(type, 'type'));
        wrap.appendChild(tag(name, 'name'));
        wrap.appendChild(tag(required ? 'required' : 'optional', required ? 'required' : 'optional'));

        fg.appendChild(wrap);
    });
}

function addGroupBadges() {
    document.querySelectorAll('.group-wrapper[data-debug-origin]').forEach(gw => {
        const origin = gw.dataset.debugOrigin;
        const id = gw.dataset.debugId || '—';
        const template = gw.dataset.debugTemplate || '';

        const wrap = mk('div', 'wdbg wdbg-group');

        if (origin === 'group-template') {
            wrap.appendChild(tag('template', 'gtpl'));
            wrap.appendChild(tag(id, 'name'));
            if (template) {
                const short = template.split('/').pop();
                wrap.appendChild(tag(short, 'gtpl'));
            }
        } else {
            wrap.appendChild(tag('generic', 'ggen'));
            wrap.appendChild(tag(id, 'name'));
        }

        gw.appendChild(wrap);
    });
}

function addConditionBadges() {
    document.querySelectorAll('[data-condition-field]').forEach(el => {
        const field = el.dataset.conditionField || '';
        const op = el.dataset.conditionOp || 'eq';
        const val = el.dataset.conditionValue ?? '';
        const isHidden = el.style.display === 'none' || el.style.display === '';

        const overlayText = `if ${field} ${op} "${val}"`;

        const overlay = mk('div', 'wdbg wdbg-cond-overlay');
        overlay.textContent = overlayText;
        el.appendChild(overlay);

        // Badge im Feld selbst, falls form-group
        const fieldBadgeWrap = el.querySelector('.wdbg-field');
        if (fieldBadgeWrap) {
            fieldBadgeWrap.appendChild(tag('cond', isHidden ? 'cond-off' : 'cond'));
        }
    });
}

function addValidationBadges() {
    document.querySelectorAll('.form-group[data-debug-origin]').forEach(fg => {
        const input = fg.querySelector('input[pattern], input[min], input[max], input[maxlength]');
        if (!input) return;

        const parts = [];
        if (input.pattern) parts.push('/' + input.pattern + '/');
        if (input.min) parts.push('min:' + input.min);
        if (input.max) parts.push('max:' + input.max);
        if (input.maxLength && input.maxLength > 0) parts.push('maxlen:' + input.maxLength);

        if (parts.length === 0) return;

        const wrap = fg.querySelector('.wdbg-field') || mk('div', 'wdbg wdbg-field');
        parts.forEach(p => wrap.appendChild(tag(p, 'valid')));

        if (!fg.querySelector('.wdbg-field')) {
            fg.appendChild(wrap);
        }
    });
}

// ─────────────────────────────────────────────
// Floating Panel
// ─────────────────────────────────────────────

let sectionObserver = null;

function showPanel() {
    panel = document.createElement('div');
    panel.id = 'wdbg-panel';

    const header = mk('div', '');
    header.id = 'wdbg-panel-header';
    header.innerHTML = '🔍 Wizard Debug&nbsp;<span style="font-weight:400;font-size:11px;opacity:0.85">ALT zum Schließen</span>';
    const closeBtn = document.createElement('button');
    closeBtn.textContent = '✕';
    closeBtn.addEventListener('click', () => { disable(); debugActive = false; });
    header.appendChild(closeBtn);

    const body = mk('div', '');
    body.id = 'wdbg-panel-body';
    const sectionBar = document.createElement('div');
    sectionBar.id = 'wdbg-section-bar';
    sectionBar.textContent = '—';
    const scroll = document.createElement('div');
    scroll.id = 'wdbg-panel-scroll';
    scroll.appendChild(body);
    panel.appendChild(header);
    panel.appendChild(sectionBar);
    panel.appendChild(scroll);
    document.body.appendChild(panel);

    renderPanelBody();
    makeDraggable(panel, header);
    watchSections();
}

function renderPanelBody() {
    const body = document.getElementById('wdbg-panel-body');
    if (!body) return;
    body.innerHTML = '';

    // Stats row (static — based on full form, not just active section)
    const allFields = document.querySelectorAll('.form-group[data-debug-origin]');
    const catalogCnt = document.querySelectorAll('.form-group[data-debug-origin="catalog"]').length;
    const inlineCnt = document.querySelectorAll('.form-group[data-debug-origin="inline"]').length;
    const reqCnt = document.querySelectorAll('.form-group[data-debug-required="1"]').length;
    const condCnt = document.querySelectorAll('.form-group[data-condition-field]').length;
    const tplGrpCnt = document.querySelectorAll('.group-wrapper[data-debug-origin="group-template"]').length;
    const genGrpCnt = document.querySelectorAll('.group-wrapper[data-debug-origin="group-generic"]').length;

    const statsRow = mk('div', 'wdbg-stat-row');
    [
        ['Felder', allFields.length],
        ['Katalog', catalogCnt],
        ['Inline', inlineCnt],
        ['Required', reqCnt],
        ['Conditions', condCnt],
        ['Tpl-Gruppen', tplGrpCnt],
        ['Gen-Gruppen', genGrpCnt],
    ].forEach(([label, count]) => {
        const s = mk('span', 'wdbg-stat');
        s.textContent = label + ': ' + count;
        statsRow.appendChild(s);
    });
    body.appendChild(statsRow);

    // Per-section field table
    document.querySelectorAll('.form-section').forEach((section, idx) => {
        const isActive = !section.classList.contains('collapsed');
        const titleEl = section.querySelector('.section-title span');
        const sectionTitle = titleEl ? titleEl.textContent.trim() : ('Sektion ' + (idx + 1));

        const block = mk('div', 'wdbg-section-block');
        block.classList.toggle('wdbg-active', isActive);
        block.classList.toggle('wdbg-inactive', !isActive);

        const titleDiv = mk('div', 'wdbg-section-title');
        titleDiv.textContent = (isActive ? '▶ ' : '') + (idx + 1) + '. ' + sectionTitle;
        block.appendChild(titleDiv);

        // Update the fixed section bar
        if (isActive) {
            const bar = document.getElementById('wdbg-section-bar');
            if (bar) bar.textContent = '▶ Seite ' + (idx + 1) + ': ' + sectionTitle;
        }

        section.querySelectorAll('.form-group[data-debug-origin]').forEach(fg => {
            const name = fg.dataset.debugName || '—';
            const element = fg.dataset.debugElement || fg.dataset.debugType || '—';
            const type = fg.dataset.debugType || '';
            const req = fg.dataset.debugRequired === '1';
            const hasCond = !!fg.dataset.conditionField;
            const hidden = fg.style.display === 'none';

            const row = mk('div', 'wdbg-field-row');

            row.appendChild(tag(element, 'catalog'));
            row.appendChild(tag(type, 'type'));
            row.appendChild(tag(name, 'name'));
            if (req) row.appendChild(tag('req', 'required'));
            if (hasCond) row.appendChild(tag('if', hidden ? 'cond-off' : 'cond'));

            // Current value
            const input = fg.querySelector('input, textarea, select');
            const customSel = fg.querySelector('.custom-select');
            let currentVal = '';
            if (customSel) {
                currentVal = customSel.dataset.value ?? '';
            } else if (input) {
                currentVal = input.type === 'checkbox' ? (input.checked ? '✓' : '✗') : (input.value || '');
            }
            if (currentVal !== '') {
                const valSpan = mk('span', 'wdbg-field-value');
                valSpan.textContent = currentVal.length > 16 ? currentVal.slice(0, 16) + '…' : currentVal;
                valSpan.title = currentVal;
                row.appendChild(valSpan);
            }

            block.appendChild(row);
        });

        body.appendChild(block);

        // Scroll active section block into view in the panel
        if (isActive) {
            requestAnimationFrame(() => block.scrollIntoView({ behavior: 'smooth', block: 'nearest' }));
        }
    });
}

function watchSections() {
    if (sectionObserver) sectionObserver.disconnect();
    sectionObserver = new MutationObserver(() => renderPanelBody());
    document.querySelectorAll('.form-section').forEach(s => {
        sectionObserver.observe(s, { attributes: true, attributeFilter: ['class'] });
    });
}

// ─────────────────────────────────────────────
// Helpers
// ─────────────────────────────────────────────

function mk(tag, cls) {
    const el = document.createElement(tag || 'div');
    if (cls) el.className = cls;
    el.classList.add('wdbg');
    return el;
}

function tag(text, cls) {
    const el = document.createElement('span');
    el.className = 'wdbg wdbg-tag ' + cls;
    el.textContent = text;
    return el;
}

function toast(msg, color = '#2b6cb0') {
    const t = document.createElement('div');
    t.textContent = msg;
    Object.assign(t.style, {
        position: 'fixed', bottom: '24px', left: '50%', transform: 'translateX(-50%)',
        background: color, color: '#fff', padding: '8px 20px', borderRadius: '6px',
        fontFamily: 'monospace', fontSize: '13px', fontWeight: '600',
        zIndex: '999999', boxShadow: '0 2px 8px rgba(0,0,0,0.25)',
        transition: 'opacity 0.4s',
    });
    document.body.appendChild(t);
    setTimeout(() => { t.style.opacity = '0'; setTimeout(() => t.remove(), 400); }, 1800);
}

function makeDraggable(el, handle) {
    let ox = 0, oy = 0, startX = 0, startY = 0;
    handle.addEventListener('mousedown', (e) => {
        e.preventDefault();
        startX = e.clientX; startY = e.clientY;
        ox = el.offsetLeft; oy = el.offsetTop;
        const onMove = (ev) => {
            el.style.right = 'auto';
            el.style.left = (ox + ev.clientX - startX) + 'px';
            el.style.top = (oy + ev.clientY - startY) + 'px';
        };
        const onUp = () => {
            document.removeEventListener('mousemove', onMove);
            document.removeEventListener('mouseup', onUp);
        };
        document.addEventListener('mousemove', onMove);
        document.addEventListener('mouseup', onUp);
    });
}
