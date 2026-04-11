<?php

namespace ARPI\Helper;

/**
 * Erzeugt ein SchemaValidator-kompatibles Schema aus einer Wizard-Konfiguration.
 *
 * Iteriert über alle aufgelösten Seiten/Felder des Wizards und sammelt:
 *  - Pflichtfelder (required: true)
 *  - Typ, Enum-Optionen und Validierungsregeln (pattern, min, max)
 */
class WizardSchemaBuilder
{
    private ConfigLoader $loader;

    public function __construct()
    {
        $this->loader = ConfigLoader::getInstance();
    }

    /**
     * Erzeugt ein vollständiges Schema für den angegebenen Wizard.
     *
     * Das zurückgegebene Array ist direkt mit SchemaValidator::validate() kompatibel.
     */
    public function buildSchema(string $wizardId): array
    {
        $pages   = $this->loader->getResolvedPages($wizardId);
        $required   = [];
        $properties = [];

        foreach ($pages as $page) {
            if (!isset($page['fields'])) {
                continue;
            }

            foreach ($page['fields'] as $field) {
                $this->processField($field, $required, $properties);
            }
        }

        return [
            'type'       => 'object',
            'required'   => $required,
            'properties' => $properties,
        ];
    }

    // -------------------------------------------------------------------------
    // Felder verarbeiten
    // -------------------------------------------------------------------------

    private function processField(array $field, array &$required, array &$properties): void
    {
        // Gruppen-Feld: jedes Sub-Feld einzeln verarbeiten
        if (($field['_type'] ?? null) === 'group') {
            foreach ($field['fields'] ?? [] as $subField) {
                $this->processField($subField, $required, $properties);
            }
            return;
        }

        $name = $field['name'] ?? null;
        if ($name === null || $name === '') {
            return;
        }

        // Pflichtfeld registrieren
        if (!empty($field['required'])) {
            if (!in_array($name, $required, true)) {
                $required[] = $name;
            }
        }

        // Duplikate überspringen (erstes Vorkommen gewinnt)
        if (isset($properties[$name])) {
            return;
        }

        $properties[$name] = $this->buildPropertySchema($field);
    }

    /**
     * Erzeugt das Property-Schema für ein einzelnes, aufgelöstes Feld.
     */
    private function buildPropertySchema(array $field): array
    {
        $prop = [];
        $type = $field['type'] ?? 'text';

        // --- Basis-Typ ---
        if ($type === 'number') {
            $prop['type'] = 'number';
        } elseif ($type === 'email') {
            $prop['type']   = 'string';
            $prop['format'] = 'email';
        } else {
            $prop['type'] = 'string';
        }

        // --- Inline-Optionen (select / radio / checkbox-group) ---
        if (in_array($type, ['select', 'radio'], true) && isset($field['options'])) {
            $prop['enum'] = array_column($field['options'], 'value');
        }

        if ($type === 'checkbox-group' && isset($field['options'])) {
            $prop['type']  = 'array';
            $prop['items'] = ['enum' => array_column($field['options'], 'value')];
        }

        // --- Validierungsregeln aus Element-Definition ---
        if (isset($field['validation']) && is_array($field['validation'])) {
            $v = $field['validation'];

            if (isset($v['pattern'])) {
                $prop['pattern'] = $v['pattern'];
            }
            if (isset($v['min'])) {
                $prop['minimum'] = (int) $v['min'];
            }
            if (isset($v['max'])) {
                $prop['maximum'] = (int) $v['max'];
            }
            if (isset($v['minLength'])) {
                $prop['minLength'] = (int) $v['minLength'];
            }
            if (isset($v['maxLength'])) {
                $prop['maxLength'] = (int) $v['maxLength'];
            }
        }

        return $prop;
    }
}
