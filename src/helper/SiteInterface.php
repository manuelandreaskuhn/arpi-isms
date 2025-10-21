<?php
namespace ARPI\Helper;

/**
 * Interface für Site-Klassen
 * Jede Site muss dieses Interface implementieren
 */
interface SiteInterface
{
    /**
     * Vorbereitung der Site (z.B. Laden von Daten)
     * Wird vor save() und main() aufgerufen
     */
    public function prepare(): void;

    /**
     * Speichern von Daten (z.B. POST-Requests)
     * Wird nach prepare() und vor main() aufgerufen
     * Nur bei POST-Requests
     */
    public function save(): void;

    /**
     * Hauptausgabe der Site
     * Wird als letztes aufgerufen
     * @return string HTML-Output
     */
    public function main(): string;
}
