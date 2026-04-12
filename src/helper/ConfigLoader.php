<?php

namespace ARPI\Helper;

/**
 * Lädt und löst Wizard-Konfigurationen aus JSON-Dateien auf.
 *
 * Hierarchie:
 *   elements/catalog.json  →  atomare Felder
 *   groups/catalog.json    →  Gruppen aus mehreren Feldern
 *   wizards/{id}.json      →  Wizard-Seiten mit Feld-Referenzen
 */
class ConfigLoader
{
    private static ?self $instance = null;

    private string $configDir;
    private string $customConfigDir;

    /** @var array<string, array> */
    private array $elementMap = [];

    /** @var array<string, array> */
    private array $groupMap = [];

    /** @var array<string, array> */
    private array $wizardCache = [];

    private bool $catalogsLoaded = false;

    private function __construct()
    {
        $this->configDir = dirname(__DIR__) . '/config';
        $this->customConfigDir = $this->configDir . '/custom';
    }

    public static function getInstance(): self
    {
        if (self::$instance === null) {
            self::$instance = new self();
        }
        return self::$instance;
    }

    // -------------------------------------------------------------------------
    // Public API
    // -------------------------------------------------------------------------

    /**
     * Gibt die rohe Wizard-Konfiguration zurück (unaufgelöst).
     * Kundenspezifische Config in custom/wizards/ hat Vorrang vor der Default-Config.
     *
     * @throws \RuntimeException wenn die Datei nicht gefunden wird
     */
    public function getWizardConfig(string $wizardId): array
    {
        if (!isset($this->wizardCache[$wizardId])) {
            $wizardId = $this->sanitizeWizardId($wizardId);

            // Custom-Config bevorzugen
            $customPath  = $this->customConfigDir . '/wizards/' . $wizardId . '.json';
            $defaultPath = $this->configDir        . '/wizards/' . $wizardId . '.json';

            if (file_exists($customPath)) {
                $path = $customPath;
            } elseif (file_exists($defaultPath)) {
                $path = $defaultPath;
            } else {
                throw new \RuntimeException("Wizard config not found: {$wizardId}");
            }

            $raw = file_get_contents($path);
            $decoded = json_decode($raw, true);

            if (json_last_error() !== JSON_ERROR_NONE) {
                throw new \RuntimeException(
                    "Invalid JSON in wizard config '{$wizardId}': " . json_last_error_msg()
                );
            }

            $this->wizardCache[$wizardId] = $decoded;
        }

        return $this->wizardCache[$wizardId];
    }

    /**
     * Gibt immer die Default-Wizard-Config zurück (ignoriert Custom).
     *
     * @throws \RuntimeException wenn die Datei nicht gefunden wird
     */
    public function getDefaultWizardConfig(string $wizardId): array
    {
        $wizardId = $this->sanitizeWizardId($wizardId);
        $path = $this->configDir . '/wizards/' . $wizardId . '.json';

        if (!file_exists($path)) {
            throw new \RuntimeException("Default wizard config not found: {$wizardId}");
        }

        $decoded = json_decode(file_get_contents($path), true);

        if (json_last_error() !== JSON_ERROR_NONE) {
            throw new \RuntimeException(
                "Invalid JSON in default wizard config '{$wizardId}': " . json_last_error_msg()
            );
        }

        return $decoded;
    }

    /**
     * Prüft, ob eine kundenspezifische Config für den Wizard existiert.
     */
    public function hasCustomConfig(string $wizardId): bool
    {
        $wizardId = $this->sanitizeWizardId($wizardId);
        return file_exists($this->customConfigDir . '/wizards/' . $wizardId . '.json');
    }

    /**
     * Speichert eine kundenspezifische Wizard-Config atomisch.
     *
     * @throws \InvalidArgumentException bei ungültiger Config
     * @throws \RuntimeException bei Schreibfehlern
     */
    public function saveCustomConfig(string $wizardId, array $config): void
    {
        $wizardId = $this->sanitizeWizardId($wizardId);
        $this->validateWizardConfig($wizardId, $config);

        $dir = $this->customConfigDir . '/wizards';
        if (!is_dir($dir) && !mkdir($dir, 0755, true)) {
            throw new \RuntimeException("Cannot create custom config directory: {$dir}");
        }

        $path = $dir . '/' . $wizardId . '.json';
        $json = json_encode($config, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);

        // Atomisches Schreiben: temp-Datei + rename
        $tmp = tempnam($dir, '.tmp_');
        if ($tmp === false || file_put_contents($tmp, $json) === false) {
            throw new \RuntimeException("Cannot write custom config for wizard: {$wizardId}");
        }
        if (!rename($tmp, $path)) {
            unlink($tmp);
            throw new \RuntimeException("Cannot save custom config for wizard: {$wizardId}");
        }

        // Cache invalidieren
        unset($this->wizardCache[$wizardId]);
    }

    /**
     * Löscht die kundenspezifische Config (setzt auf Default zurück).
     *
     * @throws \RuntimeException wenn das Löschen fehlschlägt
     */
    public function deleteCustomConfig(string $wizardId): void
    {
        $wizardId = $this->sanitizeWizardId($wizardId);
        $path = $this->customConfigDir . '/wizards/' . $wizardId . '.json';

        if (file_exists($path) && !unlink($path)) {
            throw new \RuntimeException("Cannot delete custom config for wizard: {$wizardId}");
        }

        unset($this->wizardCache[$wizardId]);
    }

    /**
     * Gibt alle bekannten Wizard-IDs zurück (aus Default-Configs).
     *
     * @return array<string> Liste der Wizard-IDs
     */
    public function getAvailableWizardIds(): array
    {
        $pattern = $this->configDir . '/wizards/*.json';
        $files   = glob($pattern) ?: [];

        return array_map(
            fn(string $f) => basename($f, '.json'),
            $files
        );
    }

    /**
     * Gibt alle Seiten des Wizards zurück, mit aufgelösten Feld- und
     * Gruppen-Referenzen.
     */
    public function getResolvedPages(string $wizardId): array
    {
        $config = $this->getWizardConfig($wizardId);
        $resolved = [];

        foreach ($config['pages'] as $page) {
            if (isset($page['fields'])) {
                $page['fields'] = array_map(
                    fn(array $f) => $this->resolveField($f),
                    $page['fields']
                );
            }
            $resolved[] = $page;
        }

        return $resolved;
    }

    /**
     * Löst eine einzelne Felddefinition auf:
     *  - Element-Referenz ("element" key)  → Element-Daten + Feld-Overrides
     *  - Gruppen-Referenz ("group" key)    → Gruppe mit aufgelösten Sub-Feldern
     *  - Inline-Definition               → unverändert zurückgegeben
     */
    public function resolveField(array $fieldDef): array
    {
        // ------- Gruppen-Referenz -------
        if (isset($fieldDef['group'])) {
            return $this->resolveGroupRef($fieldDef);
        }

        // ------- Element-Referenz -------
        if (isset($fieldDef['element'])) {
            $element = $this->getElementById($fieldDef['element']);

            if ($element !== null) {
                // Feld-Definition überschreibt Element-Defaults
                $resolved = array_merge($element, $fieldDef);
                $resolved['_type'] = 'field';
                unset($resolved['element']); // Referenz-Key entfernen
                return $resolved;
            }
        }

        // ------- Inline-Feld (kein Referenz-Key) -------
        $fieldDef['_type'] = 'field';
        return $fieldDef;
    }

    /**
     * Gibt ein Element aus dem Katalog anhand seiner ID zurück.
     */
    public function getElementById(string $id): ?array
    {
        $this->ensureCatalogs();
        return $this->elementMap[$id] ?? null;
    }

    /**
     * Gibt eine Gruppe aus dem Katalog anhand ihrer ID zurück.
     */
    public function getGroupById(string $id): ?array
    {
        $this->ensureCatalogs();
        return $this->groupMap[$id] ?? null;
    }

    /**
     * Gibt den vollständigen Elements-Katalog zurück (alle atomaren Elemente).
     *
     * @return array<string, array> Map von Element-ID zu Element-Definition
     */
    public function getElementCatalog(): array
    {
        $this->ensureCatalogs();
        return $this->elementMap;
    }

    // -------------------------------------------------------------------------
    // Internes Auflösen
    // -------------------------------------------------------------------------

    private function resolveGroupRef(array $fieldDef): array
    {
        $group = $this->getGroupById($fieldDef['group']);

        if ($group === null) {
            // Unbekannte Gruppe: als Inline-Feld zurückgeben
            $fieldDef['_type'] = 'group';
            return $fieldDef;
        }

        // Label aus Gruppen-Referenz überschreibt Katalog-Label
        if (isset($fieldDef['label_override'])) {
            $group['label'] = $fieldDef['label_override'];
        }

        // Einzelne Felder innerhalb der Gruppe überschreiben
        if (isset($fieldDef['field_overrides']) && is_array($fieldDef['field_overrides'])) {
            $overrides = $fieldDef['field_overrides'];

            foreach ($group['fields'] as &$gField) {
                $fieldName = $gField['name'] ?? null;
                if ($fieldName !== null && isset($overrides[$fieldName])) {
                    $gField = array_merge($gField, $overrides[$fieldName]);
                }
            }
            unset($gField);
        }

        // Sub-Felder der Gruppe auflösen (element_ref → Element-Daten)
        foreach ($group['fields'] as &$gField) {
            $gField = $this->resolveGroupField($gField);
        }
        unset($gField);

        // Condition und andere Metadaten aus der Referenz übernehmen
        if (isset($fieldDef['condition'])) {
            $group['condition'] = $fieldDef['condition'];
        }

        $group['_type'] = 'group';
        return $group;
    }

    /**
     * Löst ein einzelnes Feld innerhalb einer Gruppe auf (element_ref).
     */
    private function resolveGroupField(array $gField): array
    {
        if (!isset($gField['element_ref'])) {
            $gField['_type'] = 'field';
            return $gField;
        }

        $element = $this->getElementById($gField['element_ref']);

        if ($element !== null) {
            $resolved = array_merge($element, $gField);
            $resolved['_type'] = 'field';
            unset($resolved['element_ref']);
            return $resolved;
        }

        $gField['_type'] = 'field';
        return $gField;
    }

    // -------------------------------------------------------------------------
    // Lazy-Loading der Kataloge
    // -------------------------------------------------------------------------

    private function ensureCatalogs(): void
    {
        if ($this->catalogsLoaded) {
            return;
        }

        $this->loadElementCatalog();
        $this->loadGroupCatalog();
        $this->catalogsLoaded = true;
    }

    private function loadElementCatalog(): void
    {
        $path = $this->configDir . '/elements/catalog.json';
        $elements = $this->decodeJsonFile($path, 'Element catalog')['elements'] ?? [];

        foreach ($elements as $element) {
            if (isset($element['id'])) {
                $this->elementMap[$element['id']] = $element;
            }
        }
    }

    private function loadGroupCatalog(): void
    {
        $path = $this->configDir . '/groups/catalog.json';
        $groups = $this->decodeJsonFile($path, 'Group catalog')['groups'] ?? [];

        foreach ($groups as $group) {
            if (isset($group['id'])) {
                $this->groupMap[$group['id']] = $group;
            }
        }
    }

    // -------------------------------------------------------------------------
    // Validierung & Hilfsmethoden
    // -------------------------------------------------------------------------

    /**
     * Bereinigt und validiert eine Wizard-ID (nur Kleinbuchstaben, Ziffern, Bindestriche).
     *
     * @throws \InvalidArgumentException bei ungültigem Format
     */
    private function sanitizeWizardId(string $wizardId): string
    {
        $clean = preg_replace('/[^a-z0-9\-]/', '', strtolower($wizardId));

        if ($clean === '' || strlen($clean) > 64) {
            throw new \InvalidArgumentException("Invalid wizard ID: {$wizardId}");
        }

        return $clean;
    }

    /**
     * Basisvalidierung einer Wizard-Config vor dem Speichern.
     *
     * @throws \InvalidArgumentException bei strukturellen Fehlern
     */
    private function validateWizardConfig(string $wizardId, array $config): void
    {
        if (!isset($config['wizard_id']) || $config['wizard_id'] !== $wizardId) {
            throw new \InvalidArgumentException(
                "wizard_id mismatch: expected '{$wizardId}', got '" . ($config['wizard_id'] ?? 'missing') . "'"
            );
        }

        if (!isset($config['pages']) || !is_array($config['pages'])) {
            throw new \InvalidArgumentException('Config must contain a "pages" array');
        }

        foreach ($config['pages'] as $index => $page) {
            if (!isset($page['id']) || !is_string($page['id']) || $page['id'] === '') {
                throw new \InvalidArgumentException("Page at index {$index} is missing a valid 'id'");
            }
            if (!isset($page['label']) || !is_string($page['label']) || $page['label'] === '') {
                throw new \InvalidArgumentException("Page '{$page['id']}' is missing a 'label'");
            }
            if (isset($page['fields']) && !is_array($page['fields'])) {
                throw new \InvalidArgumentException("Page '{$page['id']}': 'fields' must be an array");
            }
        }
    }

    private function decodeJsonFile(string $path, string $label): array
    {
        if (!file_exists($path)) {
            throw new \RuntimeException("{$label} not found: {$path}");
        }

        $decoded = json_decode(file_get_contents($path), true);

        if (json_last_error() !== JSON_ERROR_NONE) {
            throw new \RuntimeException(
                "{$label} contains invalid JSON: " . json_last_error_msg()
            );
        }

        return $decoded;
    }
}
