<?php
namespace ARPI\Helper;

use ARPI\Helper\Template\TemplateModule;

/**
 * Modulare HTML Template Engine
 */
class Template
{
    private array $modules = [];
    private array $globals = [];
    private string $templateDir;

    public function __construct(string $templateDir = '')
    {
        // Standardmäßig auf src/template setzen, falls kein Pfad angegeben
        if (empty($templateDir)) {
            $templateDir = dirname(__DIR__) . '/template';
        }
        
        $this->templateDir = rtrim($templateDir, '/\\');
        $this->loadDefaultModules();
    }

    /**
     * Lädt die Standard-Module
     */
    private function loadDefaultModules(): void
    {
        $this->registerModule(new Template\InternationalizationModule());
        $this->registerModule(new Template\EnumModule());
        $this->registerModule(new Template\ListArrayModule());
        $this->registerModule(new Template\PropertyModule());
        $this->registerModule(new Template\DateModule());
        $this->registerModule(new Template\ConditionalModule());
    }

    /**
     * Registriert ein Template-Modul
     */
    public function registerModule(TemplateModule $module): void
    {
        $this->modules[$module->getName()] = $module;
        $module->initialize($this);
    }

    /**
     * Setzt eine globale Variable
     */
    public function setGlobal(string $name, $value): void
    {
        $this->globals[$name] = $value;
    }

    /**
     * Gibt eine globale Variable zurück
     */
    public function getGlobal(string $name, $default = null)
    {
        return $this->globals[$name] ?? $default;
    }

    /**
     * Gibt alle globalen Variablen zurück
     */
    public function getGlobals(): array
    {
        return $this->globals;
    }

    /**
     * Rendert ein Template
     * Unterstützt Unterordner: 'ordner/unterordner/template.html'
     */
    public function render(string $templateFile, array $data = []): string
    {
        $filePath = $this->resolveTemplatePath($templateFile);
        
        if (!file_exists($filePath)) {
            throw new \RuntimeException("Template file not found: {$filePath}");
        }

        $content = file_get_contents($filePath);
        return $this->process($content, $data);
    }

    /**
     * Löst den vollständigen Pfad zu einer Template-Datei auf
     */
    private function resolveTemplatePath(string $templateFile): string
    {
        // Normalisiere Pfad-Separatoren
        $templateFile = str_replace('\\', '/', $templateFile);
        
        // Entferne führende Slashes
        $templateFile = ltrim($templateFile, '/');
        
        // Baue vollständigen Pfad
        return $this->templateDir . '/' . $templateFile;
    }

    /**
     * Prüft ob ein Template existiert
     */
    public function exists(string $templateFile): bool
    {
        return file_exists($this->resolveTemplatePath($templateFile));
    }

    /**
     * Gibt den Template-Ordner zurück
     */
    public function getTemplateDir(): string
    {
        return $this->templateDir;
    }

    /**
     * Setzt den Template-Ordner
     */
    public function setTemplateDir(string $templateDir): void
    {
        $this->templateDir = rtrim($templateDir, '/\\');
    }

    /**
     * Verarbeitet Template-Content
     */
    public function process(string $content, array $data = []): string
    {
        // Merge data with globals
        $data = array_merge($this->globals, $data);

        // Process modules in order
        foreach ($this->modules as $module) {
            $content = $module->process($content, $data);
        }

        return $content;
    }

    /**
     * Gibt ein Modul zurück
     */
    public function getModule(string $name): ?TemplateModule
    {
        return $this->modules[$name] ?? null;
    }
}
