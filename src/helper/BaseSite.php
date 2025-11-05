<?php
namespace ARPI\Helper;

use ARPI\Entities\Annotations\Css as CssAttr;
use ARPI\Entities\Annotations\Js as JsAttr;

/**
 * Abstrakte Basis-Klasse für Sites
 * Bietet gemeinsame Funktionalität
 */
abstract class BaseSite implements SiteInterface
{
    protected Template $template;
    protected array $data = [];

    /**
     * Asset-Listen für die Seite
     */
    protected array $cssFiles = [];
    protected array $jsFiles = [];

    public function __construct()
    {
        $this->template = new Template();
        $this->initGlobals();

        // Annotationen der Kindklasse einlesen (@css / @js)
        $this->parseClassAssetAnnotations();
    }

    /**
     * Initialisiert globale Template-Variablen
     */
    protected function initGlobals(): void
    {
        // i18n initialisieren
        $i18nModule = $this->template->getModule('i18n');
        
    }

    /**
     * Standard-Implementierung für prepare
     */
    public function prepare(): void
    {
        // Kann von Child-Klassen überschrieben werden
    }

    /**
     * Standard-Implementierung für save
     */
    public function save(): void
    {
        // Kann von Child-Klassen überschrieben werden
    }

    /**
     * Hilfsmethode zum Rendern mit Layout
     */
    protected function render(string $contentTemplate): string
    {
        // Rendere Content
        return $this->template->render($contentTemplate, $this->data);
    }

    /**
     * Ermöglicht das Setzen mehrerer CSS-Dateien auf einmal
     */
    public function setCssFiles(array $files): void
    {
        $this->cssFiles = array_values(array_unique($files));
    }

    /**
     * Einzelne CSS-Datei hinzufügen
     */
    public function addCssFile(string $file): void
    {
        if (!in_array($file, $this->cssFiles, true)) {
            $this->cssFiles[] = $file;
        }
    }

    /**
     * Ermöglicht das Setzen mehrerer JS-Dateien auf einmal
     */
    public function setJsFiles(array $files): void
    {
        $this->jsFiles = array_values(array_unique($files));
    }

    /**
     * Einzelne JS-Datei hinzufügen
     */
    public function addJsFile(string $file): void
    {
        if (!in_array($file, $this->jsFiles, true)) {
            $this->jsFiles[] = $file;
        }
    }

    // Optional: Getter, falls benötigt
    public function getCssFiles(): array { return $this->cssFiles; }
    public function getJsFiles(): array { return $this->jsFiles; }

    /**
     * Klassen-Annotationen (@css / @js) einlesen und Assets übernehmen.
     * Unterstützt mehrere Annotationen sowie Komma-separierte Listen.
     */
    protected function parseClassAssetAnnotations(): void
    {
        try {
            $rc = new \ReflectionClass($this);
            foreach ($rc->getAttributes(CssAttr::class) as $attr) {
                $inst = $attr->newInstance();
                foreach ($inst->files as $css) {
                    $this->addCssFile($css);
                }
            }
            foreach ($rc->getAttributes(JsAttr::class) as $attr) {
                $inst = $attr->newInstance();
                foreach ($inst->files as $js) {
                    $this->addJsFile($js);
                }
            }
        } catch (\ReflectionException $e) {
            // still proceed without annotations
        }
    }

    protected function renderTemplate(string $templateName): string
    {
        // Header, Navi, Footer etc. einbinden
        $GLOBALS['assetcss'] = $this->cssFiles;
        $GLOBALS['assetjs'] = $this->jsFiles;

        $headertemplate = $this->render('partials/header.html');
        $footertemplate = $this->render('partials/footer.html');

        $template = $this->template->render($templateName, $this->data);

        return $headertemplate . $template . $footertemplate;
    }

    /**
     * Hilfsmethode für Redirects
     */
    protected function redirect(string $url, int $statusCode = 302): void
    {
        header("Location: {$url}", true, $statusCode);
        exit;
    }

    /**
     * Hilfsmethode zum Setzen von Template-Daten
     */
    protected function setData(string $key, $value): void
    {
        $this->data[$key] = $value;
    }

    /**
     * Hilfsmethode zum Holen von POST-Daten
     */
    protected function getPost(string $key, $default = null)
    {
        return $_POST[$key] ?? $default;
    }

    /**
     * Hilfsmethode zum Holen von GET-Daten
     */
    protected function getQuery(string $key, $default = null)
    {
        return $_GET[$key] ?? $default;
    }

    /**
     * Prüft ob Request ein POST ist
     */
    protected function isPost(): bool
    {
        return $_SERVER['REQUEST_METHOD'] === 'POST';
    }
}
