<?php
namespace ARPI\Helper;

/**
 * Abstrakte Basis-Klasse für Sites
 * Bietet gemeinsame Funktionalität
 */
abstract class BaseSite implements SiteInterface
{
    protected Template $template;
    protected array $data = [];

    public function __construct()
    {
        $this->template = new Template();
        $this->initGlobals();
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

    protected function renderTemplate(string $templateName): string
    {
        //Header, Navi, Footer
        $headertemplate = $this->render('partials/header.tpl');
        $footertemplate = $this->render('partials/footer.tpl');

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
