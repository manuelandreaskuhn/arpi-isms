<?php

namespace ARPI\Helper;

/**
 * Rendert HTML-Formulare für Wizard-Seiten aus JSON-Konfigurationen.
 *
 * Unterstützte Feld-Typen: text, url, email, number, textarea, select,
 * radio, checkbox (toggle), checkbox-group, range, software-select, component-ref
 *
 * Gruppen werden per Include-Template gerendert, falls template_file gesetzt.
 * Andernfalls werden die Sub-Felder generisch als form-rows gerendert.
 */
class WizardRenderer
{
    /** Feld-Typen die immer die volle Breite einnehmen (kein 2-Spalten-Layout) */
    private const FULL_WIDTH_TYPES = ['textarea', 'checkbox-group', 'range', 'component-ref'];

    private ConfigLoader $loader;
    private Template     $template;

    public function __construct()
    {
        $this->loader   = ConfigLoader::getInstance();
        $this->template = new Template();
    }

    // -------------------------------------------------------------------------
    // Public API
    // -------------------------------------------------------------------------

    /**
     * Rendert alle Seiten eines Wizards als zusammenhängendes HTML.
     *
     * @param string $wizardId    ID des Wizards (z.B. "firewall")
     * @param array  $formValues  Aktuelle Formular-Werte (für Edit-Ansicht)
     */
    public function renderAllPages(string $wizardId, array $formValues = []): string
    {
        $pages = $this->loader->getResolvedPages($wizardId);
        $html  = '';

        foreach ($pages as $index => $page) {
            // Nur Seiten mit Feldern rendern; dynamic-list/embedded-one vorerst überspringen
            if (isset($page['type']) && $page['type'] !== 'fields') {
                continue;
            }

            $isFirst = ($index === 0);
            $html   .= $this->renderPage($page, $isFirst, $formValues);
        }

        return $html;
    }

    /**
     * Rendert eine einzelne Wizard-Seite als form-section.
     *
     * @param array $page        Aufgelöste Seiten-Konfiguration
     * @param bool  $isFirst     Erste Seite ist standardmäßig ausgeklappt
     * @param array $formValues  Aktuelle Formular-Werte
     */
    public function renderPage(array $page, bool $isFirst = false, array $formValues = []): string
    {
        $fields    = $page['fields'] ?? [];
        $fieldCount = $this->countFormFields($fields);
        $collapsed  = $isFirst ? '' : ' collapsed';

        $html  = '<div class="form-section' . $collapsed . '">' . "\n";
        $html .= $this->renderSectionTitle($page, $fieldCount);
        $html .= '    <div class="section-content">' . "\n";
        $html .= $this->renderFields($fields, $formValues);
        $html .= '    </div>' . "\n";

        // Software-Info-Panels nach dem section-content einfügen
        $html .= $this->renderSoftwareInfoPanels($fields);

        $html .= '</div>' . "\n";

        return $html;
    }

    // -------------------------------------------------------------------------
    // Sektion-Struktur
    // -------------------------------------------------------------------------

    private function renderSectionTitle(array $page, int $fieldCount): string
    {
        $label   = htmlspecialchars($page['label'] ?? '', ENT_QUOTES);
        $badge   = isset($page['badge'])
            ? '    <span class="section-badge">' . htmlspecialchars($page['badge'], ENT_QUOTES) . '</span>' . "\n"
            : '';
        $counter = $fieldCount > 0
            ? '    <span class="section-counter">0/' . $fieldCount . '</span>' . "\n"
            : '';

        return '    <div class="section-title">' . "\n"
            . '        <span>' . $label . '</span>' . "\n"
            . $badge
            . $counter
            . '        <span class="section-toggle-icon">▼</span>' . "\n"
            . '    </div>' . "\n";
    }

    /** Zählt darstellbare Einzel-Felder (keine Gruppen-Wrapper) */
    private function countFormFields(array $fields): int
    {
        $count = 0;
        foreach ($fields as $f) {
            if (($f['_type'] ?? 'field') === 'group') {
                $count += count($f['fields'] ?? []);
            } else {
                $count++;
            }
        }
        return $count;
    }

    // -------------------------------------------------------------------------
    // Felder rendern
    // -------------------------------------------------------------------------

    /**
     * Rendert alle Felder einer Seite in form-rows (max. 2 pro Zeile).
     * Gruppen und Full-Width-Felder werden immer als eigene Zeile gerendert.
     */
    private function renderFields(array $fields, array $formValues): string
    {
        $html   = '';
        $buffer = [];  // Puffer für 2-spaltige Anordnung

        $flush = function () use (&$buffer, &$html, $formValues) {
            if (empty($buffer)) return;
            $html .= '        <div class="form-row">' . "\n";
            foreach ($buffer as $f) {
                $html .= $this->renderFieldInGroup($f, $formValues);
            }
            $html .= '        </div>' . "\n";
            $buffer = [];
        };

        foreach ($fields as $field) {
            $type = $field['type'] ?? 'text';

            if (($field['_type'] ?? 'field') === 'group') {
                $flush();
                $html .= $this->renderGroup($field, $formValues);
                continue;
            }

            // Full-width Typen immer einzeln
            if (in_array($type, self::FULL_WIDTH_TYPES, true)) {
                $flush();
                $html .= '        <div class="form-row">' . "\n";
                $html .= $this->renderFieldInGroup($field, $formValues);
                $html .= '        </div>' . "\n";
                continue;
            }

            // Software-select mit Info-Panel immer einzeln (volle Breite)
            if ($type === 'software-select') {
                $flush();
                $html .= '        <div class="form-row">' . "\n";
                $html .= $this->renderFieldInGroup($field, $formValues);
                $html .= '        </div>' . "\n";
                continue;
            }

            $buffer[] = $field;

            // 2 Felder → Zeile abschließen
            if (count($buffer) === 2) {
                $flush();
            }
        }

        $flush(); // Rest rendern

        return $html;
    }

    /**
     * Rendert ein Feld in einem form-group-Container.
     * Konditionale Felder erhalten data-condition-Attribute.
     */
    private function renderFieldInGroup(array $field, array $formValues): string
    {
        $name       = $field['name'] ?? '';
        $value      = $formValues[$name] ?? '';
        $condition  = $this->buildConditionAttr($field['condition'] ?? null);
        $inputHtml  = $this->renderInput($field, $value);

        return '            <div class="form-group"' . $condition . '>' . "\n"
            . $this->renderLabel($field)
            . $inputHtml
            . $this->renderHelpText($field)
            . '            </div>' . "\n";
    }

    private function renderLabel(array $field): string
    {
        $label    = htmlspecialchars($field['label'] ?? '', ENT_QUOTES);
        $required = !empty($field['required']) ? ' <span class="required">*</span>' : '';
        $name     = $field['name'] ?? '';
        $tooltip  = !empty($name) ? ' <span class="help-icon" data-tooltip="' . htmlspecialchars($name, ENT_QUOTES) . '">?</span>' : '';

        return '                <label>' . "\n"
            . '                    ' . $label . $required . $tooltip . "\n"
            . '                </label>' . "\n";
    }

    private function renderHelpText(array $field): string
    {
        $validation = $field['validation'] ?? null;
        if (isset($validation['message'])) {
            return '                <div class="help-text">' . htmlspecialchars($validation['message'], ENT_QUOTES) . '</div>' . "\n";
        }
        if (isset($field['description'])) {
            return '                <div class="help-text">' . htmlspecialchars($field['description'], ENT_QUOTES) . '</div>' . "\n";
        }
        return '';
    }

    // -------------------------------------------------------------------------
    // Input-Typen
    // -------------------------------------------------------------------------

    private function renderInput(array $field, mixed $value): string
    {
        $type = $field['type'] ?? 'text';

        return match ($type) {
            'textarea'       => $this->renderTextarea($field, (string) $value),
            'select'         => $this->renderSelect($field, (string) $value),
            'software-select' => $this->renderSoftwareSelect($field, (string) $value),
            'radio'          => $this->renderRadio($field, (string) $value),
            'checkbox'       => $this->renderToggle($field, (bool) $value),
            'checkbox-group' => $this->renderCheckboxGroup($field, (array) $value),
            'range'          => $this->renderRange($field, $value),
            'component-ref'  => $this->renderComponentRef($field, (string) $value),
            default          => $this->renderTextInput($field, (string) $value),
        };
    }

    private function renderTextInput(array $field, string $value): string
    {
        $name        = htmlspecialchars($field['name'] ?? '', ENT_QUOTES);
        $type        = match ($field['type'] ?? 'text') {
            'email'  => 'email',
            'url'    => 'url',
            'number' => 'number',
            default  => 'text',
        };
        $placeholder = htmlspecialchars($field['placeholder'] ?? '', ENT_QUOTES);
        $required    = !empty($field['required']) ? ' required' : '';
        $pattern     = isset($field['validation']['pattern'])
            ? ' pattern="' . htmlspecialchars($field['validation']['pattern'], ENT_QUOTES) . '"'
            : '';
        $valEscaped  = htmlspecialchars($value, ENT_QUOTES);
        $valueAttr   = $valEscaped !== '' ? ' value="' . $valEscaped . '"' : '';
        $extra       = $this->buildDataAttributes($field['attributes'] ?? []);

        return '                <input type="' . $type . '" id="' . $name . '" name="' . $name . '"'
            . $required . $pattern . ' placeholder="' . $placeholder . '"' . $valueAttr . $extra . '>' . "\n";
    }

    private function renderTextarea(array $field, string $value): string
    {
        $name        = htmlspecialchars($field['name'] ?? '', ENT_QUOTES);
        $placeholder = htmlspecialchars($field['placeholder'] ?? '', ENT_QUOTES);
        $required    = !empty($field['required']) ? ' required' : '';
        $escaped     = htmlspecialchars($value, ENT_QUOTES);

        return '                <textarea id="' . $name . '" name="' . $name . '"'
            . $required . ' placeholder="' . $placeholder . '" rows="4">'
            . $escaped . '</textarea>' . "\n";
    }

    private function renderSelect(array $field, string $value): string
    {
        $name    = htmlspecialchars($field['name'] ?? '', ENT_QUOTES);
        $options = $field['options'] ?? [];
        $extra   = $this->buildDataAttributes($field['attributes'] ?? []);

        $html  = '                <div class="custom-select" data-name="' . $name . '"' . $extra . '>' . "\n";
        $html .= '                    <div class="select-trigger">' . "\n";
        $html .= '                        <span class="placeholder">Bitte wählen</span>' . "\n";
        $html .= '                        <span class="arrow">▼</span>' . "\n";
        $html .= '                    </div>' . "\n";
        $html .= '                    <div class="select-dropdown">' . "\n";
        $html .= '                        <div class="select-options">' . "\n";
        $html .= '                            <div class="select-option" data-value="">Bitte wählen</div>' . "\n";

        if (isset($options[0]['optgroup'])) {
            // Optgruppen
            foreach ($options as $group) {
                $html .= '                            <div class="select-optgroup">' . htmlspecialchars($group['optgroup'], ENT_QUOTES) . '</div>' . "\n";
                foreach ($group['items'] as $opt) {
                    $selected = ($value === ($opt['value'] ?? '')) ? ' data-selected="true"' : '';
                    $html .= '                            <div class="select-option" data-value="' . htmlspecialchars($opt['value'] ?? '', ENT_QUOTES) . '"' . $selected . '>' . htmlspecialchars($opt['label'] ?? '', ENT_QUOTES) . '</div>' . "\n";
                }
            }
        } else {
            foreach ($options as $opt) {
                $selected = ($value === ($opt['value'] ?? '')) ? ' data-selected="true"' : '';
                $html .= '                            <div class="select-option" data-value="' . htmlspecialchars($opt['value'] ?? '', ENT_QUOTES) . '"' . $selected . '>' . htmlspecialchars($opt['label'] ?? '', ENT_QUOTES) . '</div>' . "\n";
            }
        }

        $html .= '                        </div>' . "\n";
        $html .= '                    </div>' . "\n";
        $html .= '                </div>' . "\n";

        return $html;
    }

    /**
     * Software-Select: Custom-Select mit data-category für dynamische Software-Listen.
     * Das Info-Panel wird separat nach der Section über renderSoftwareInfoPanels() eingefügt.
     */
    private function renderSoftwareSelect(array $field, string $value): string
    {
        $name     = htmlspecialchars($field['name'] ?? '', ENT_QUOTES);
        $category = $field['attributes']['data-category'] ?? '';
        $extra    = 'data-category="' . htmlspecialchars($category, ENT_QUOTES) . '" data-software-select="true"';

        // Basis wie Select — Optionen werden per JS aus {{foreach:...data}} befüllt
        $html  = '                <div class="custom-select" data-name="' . $name . '" ' . $extra . '>' . "\n";
        $html .= '                    <div class="select-trigger">' . "\n";
        $html .= '                        <span class="placeholder">Bitte wählen</span>' . "\n";
        $html .= '                        <span class="arrow">▼</span>' . "\n";
        $html .= '                    </div>' . "\n";
        $html .= '                    <div class="select-dropdown">' . "\n";
        $html .= '                        <div class="select-options">' . "\n";
        $html .= '                            <div class="select-option" data-value="">Bitte wählen</div>' . "\n";
        $html .= '                            {{foreach:' . htmlspecialchars($category, ENT_QUOTES) . 'software}}' . "\n";
        $html .= '                            <div class="select-option" data-value="{{property:item.id}}">{{property:item.name}}</div>' . "\n";
        $html .= '                            {{/foreach}}' . "\n";
        $html .= '                        </div>' . "\n";
        $html .= '                    </div>' . "\n";
        $html .= '                </div>' . "\n";

        return $html;
    }

    private function renderRadio(array $field, string $value): string
    {
        $name    = htmlspecialchars($field['name'] ?? '', ENT_QUOTES);
        $options = $field['options'] ?? [];

        $html = '                <div class="radio-group">' . "\n";
        foreach ($options as $opt) {
            $optValue = htmlspecialchars($opt['value'] ?? '', ENT_QUOTES);
            $optLabel = htmlspecialchars($opt['label'] ?? '', ENT_QUOTES);
            $checked  = ($value === ($opt['value'] ?? '')) ? ' checked' : '';
            $html .= '                    <label class="radio-option">' . "\n";
            $html .= '                        <input type="radio" name="' . $name . '" value="' . $optValue . '"' . $checked . '>' . "\n";
            $html .= '                        <span>' . $optLabel . '</span>' . "\n";
            $html .= '                    </label>' . "\n";
        }
        $html .= '                </div>' . "\n";

        return $html;
    }

    private function renderToggle(array $field, bool $checked): string
    {
        $name    = htmlspecialchars($field['name'] ?? '', ENT_QUOTES);
        $chkAttr = $checked ? ' checked' : '';
        $status  = $checked ? 'Aktiviert' : 'Nicht aktiviert';

        return '                <div class="toggle-wrapper">' . "\n"
            . '                    <label class="toggle-switch">' . "\n"
            . '                        <input type="checkbox" id="' . $name . '" name="' . $name . '"' . $chkAttr . '>' . "\n"
            . '                        <span class="toggle-slider"></span>' . "\n"
            . '                    </label>' . "\n"
            . '                    <span class="toggle-status">' . $status . '</span>' . "\n"
            . '                </div>' . "\n";
    }

    private function renderCheckboxGroup(array $field, array $values): string
    {
        $name    = htmlspecialchars($field['name'] ?? '', ENT_QUOTES);
        $options = $field['options'] ?? [];

        $html = '                <div class="checkbox-group" id="' . $name . '-group">' . "\n";
        foreach ($options as $opt) {
            $optValue = htmlspecialchars($opt['value'] ?? '', ENT_QUOTES);
            $optLabel = htmlspecialchars($opt['label'] ?? '', ENT_QUOTES);
            $checked  = in_array($opt['value'] ?? '', $values, true) ? ' checked' : '';
            $html .= '                    <label class="checkbox-item">' . "\n";
            $html .= '                        <input type="checkbox" name="' . $name . '[]" value="' . $optValue . '"' . $checked . '>' . "\n";
            $html .= '                        <span>' . $optLabel . '</span>' . "\n";
            $html .= '                    </label>' . "\n";
        }
        $html .= '                </div>' . "\n";

        return $html;
    }

    private function renderRange(array $field, mixed $value): string
    {
        $name  = htmlspecialchars($field['name'] ?? '', ENT_QUOTES);
        $min   = $field['validation']['min'] ?? 0;
        $max   = $field['validation']['max'] ?? 100;
        $val   = $value !== '' ? (int) $value : (int) $min;
        $unit  = htmlspecialchars($field['attributes']['unit'] ?? '', ENT_QUOTES);

        return '                <div class="range-slider-wrapper">' . "\n"
            . '                    <input type="range" id="' . $name . '" name="' . $name . '"'
            . ' min="' . (int) $min . '" max="' . (int) $max . '" value="' . $val . '">' . "\n"
            . '                    <span class="range-value">' . $val . $unit . '</span>' . "\n"
            . '                </div>' . "\n";
    }

    private function renderComponentRef(array $field, string $value): string
    {
        $name         = htmlspecialchars($field['name'] ?? '', ENT_QUOTES);
        $componentType = htmlspecialchars($field['attributes']['component-type'] ?? '', ENT_QUOTES);
        $placeholder  = htmlspecialchars($field['placeholder'] ?? 'Komponente auswählen', ENT_QUOTES);

        return '                <div class="custom-select component-ref-select" data-name="' . $name . '"'
            . ' data-component-type="' . $componentType . '" data-selected-value="' . htmlspecialchars($value, ENT_QUOTES) . '">' . "\n"
            . '                    <div class="select-trigger">' . "\n"
            . '                        <span class="placeholder">' . $placeholder . '</span>' . "\n"
            . '                        <span class="arrow">▼</span>' . "\n"
            . '                    </div>' . "\n"
            . '                    <div class="select-dropdown">' . "\n"
            . '                        <div class="select-options">' . "\n"
            . '                            <div class="select-option" data-value="">Bitte wählen</div>' . "\n"
            . '                        </div>' . "\n"
            . '                    </div>' . "\n"
            . '                </div>' . "\n";
    }

    // -------------------------------------------------------------------------
    // Gruppen
    // -------------------------------------------------------------------------

    /**
     * Rendert eine Gruppe.
     * Existiert ein template_file für die Gruppe, wird das Template verwendet.
     * Andernfalls werden die Sub-Felder generisch als form-rows gerendert.
     */
    private function renderGroup(array $group, array $formValues): string
    {
        $groupId      = $group['id'] ?? '';
        $templateFile = $group['template_file'] ?? null;
        $condition    = $this->buildConditionAttr($group['condition'] ?? null);
        $label        = $group['label'] ?? '';

        // Template-Partial verwenden, falls vorhanden
        if ($templateFile && $this->template->exists($templateFile)) {
            $partialHtml = $this->template->render($templateFile, array_merge($formValues, [
                'group_id'    => $groupId,
                'group_label' => $label,
            ]));
            if ($condition !== '') {
                return '        <div class="group-wrapper"' . $condition . '>' . "\n"
                    . $partialHtml . "\n"
                    . '        </div>' . "\n";
            }
            return $partialHtml;
        }

        // Generisches Rendering
        $html = '        <div class="group-wrapper"' . $condition . '>' . "\n";

        if ($label !== '') {
            $html .= '            <div class="subsection-header">' . htmlspecialchars($label, ENT_QUOTES) . '</div>' . "\n";
        }

        $html .= $this->renderFields($group['fields'] ?? [], $formValues);
        $html .= '        </div>' . "\n";

        return $html;
    }

    // -------------------------------------------------------------------------
    // Software-Info-Panels
    // -------------------------------------------------------------------------

    /**
     * Gibt Info-Panel-Divs für alle software-select Felder einer Seite zurück.
     * Diese werden nach dem section-content eingefügt (wie im statischen Template).
     */
    private function renderSoftwareInfoPanels(array $fields): string
    {
        $html = '';
        foreach ($fields as $field) {
            if (($field['type'] ?? '') !== 'software-select') {
                continue;
            }
            $name     = $field['name'] ?? '';
            $category = $field['attributes']['data-category'] ?? $name;
            $html .= $this->renderSoftwareInfoPanel($name, $category);
        }
        return $html;
    }

    private function renderSoftwareInfoPanel(string $fieldName, string $category): string
    {
        $id = htmlspecialchars($fieldName . '-software-info-section', ENT_QUOTES);
        $categoryLabel = htmlspecialchars(ucfirst($category), ENT_QUOTES);

        return '    <div id="' . $id . '" class="collapsed">' . "\n"
            . '        <div class="section-content">' . "\n"
            . '            <div class="subsection-header">Informationen zur ' . $categoryLabel . '-Software</div>' . "\n"
            . '            <div class="software-info-container">' . "\n"
            . '                <div class="software-info-grid">' . "\n"
            . '                    <div class="software-info-item"><label>Software</label><span class="software-info-title"></span></div>' . "\n"
            . '                    <div class="software-info-item"><label>Hersteller</label><span class="software-vendor"></span></div>' . "\n"
            . '                </div>' . "\n"
            . '                <div class="software-info-grid">' . "\n"
            . '                    <div class="software-info-item"><label>Kategorie</label><span class="software-category"></span></div>' . "\n"
            . '                    <div class="software-info-item"><label>Typ</label><span class="software-type"></span></div>' . "\n"
            . '                </div>' . "\n"
            . '                <div class="software-info-description"><label>Beschreibung</label><p class="software-description-text"></p></div>' . "\n"
            . '                <div class="software-info-row">' . "\n"
            . '                    <div class="software-info-section"><label>Features</label><div class="software-features"></div></div>' . "\n"
            . '                    <div class="software-info-section"><label>Plattformen</label><div class="software-platforms"></div></div>' . "\n"
            . '                </div>' . "\n"
            . '                <div class="software-info-row">' . "\n"
            . '                    <div class="software-info-section"><label>Lizenzmodell</label><div class="software-license"></div></div>' . "\n"
            . '                    <div class="software-info-section"><label>Anwendungsfälle</label><div class="software-usecases"></div></div>' . "\n"
            . '                </div>' . "\n"
            . '                <div class="software-info-row">' . "\n"
            . '                    <div class="software-info-pricing"><label>Preisbereich</label><span class="software-pricing-text"></span></div>' . "\n"
            . '                    <div class="software-info-notes"><label>Hinweise</label><p class="software-notes-text"></p></div>' . "\n"
            . '                </div>' . "\n"
            . '                <div class="software-info-cpe"><label>CPE-Identifikatoren</label><div class="software-cpe-list"></div></div>' . "\n"
            . '            </div>' . "\n"
            . '        </div>' . "\n"
            . '    </div>' . "\n";
    }

    // -------------------------------------------------------------------------
    // Hilfsmethoden
    // -------------------------------------------------------------------------

    /**
     * Baut data-condition-Attribute für konditionale Felder/Gruppen.
     * Format: data-condition-field="fieldname" data-condition-op="eq" data-condition-value="val"
     */
    private function buildConditionAttr(?array $condition): string
    {
        if (empty($condition)) {
            return '';
        }

        $field    = htmlspecialchars($condition['field'] ?? '', ENT_QUOTES);
        $operator = htmlspecialchars($condition['operator'] ?? 'eq', ENT_QUOTES);
        $value    = is_array($condition['value'])
            ? htmlspecialchars(implode(',', $condition['value']), ENT_QUOTES)
            : htmlspecialchars((string) $condition['value'], ENT_QUOTES);

        return ' data-condition-field="' . $field . '"'
            . ' data-condition-op="' . $operator . '"'
            . ' data-condition-value="' . $value . '"';
    }

    /**
     * Baut zusätzliche data-* HTML-Attribute aus einem assoziativen Array.
     */
    private function buildDataAttributes(array $attributes): string
    {
        $parts = [];
        foreach ($attributes as $key => $val) {
            $parts[] = htmlspecialchars($key, ENT_QUOTES) . '="' . htmlspecialchars((string) $val, ENT_QUOTES) . '"';
        }
        return $parts !== [] ? ' ' . implode(' ', $parts) : '';
    }
}
