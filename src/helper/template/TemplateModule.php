<?php
namespace ARPI\Helper\Template;

use ARPI\Helper\Template;

/**
 * Abstrakte Basis-Klasse für Template-Module
 */
abstract class TemplateModule
{
    protected ?Template $engine = null;

    /**
     * Gibt den Namen des Moduls zurück
     */
    abstract public function getName(): string;

    /**
     * Verarbeitet den Template-Content
     */
    abstract public function process(string $content, array $data): string;

    /**
     * Initialisiert das Modul mit der Engine
     */
    public function initialize(Template $engine): void
    {
        $this->engine = $engine;
    }

    /**
     * Hilfsfunktion zum Escapen von HTML
     */
    protected function escape(string $value): string
    {
        return htmlspecialchars($value, ENT_QUOTES | ENT_HTML5, 'UTF-8');
    }
}
