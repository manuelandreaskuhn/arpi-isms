<?php
namespace ARPI\Helper\Template;

/**
 * Internationalisierungs-Modul
 * Syntax: {{i18n:key|var1:value1|var2:value2}}
 */
class InternationalizationModule extends TemplateModule
{
    private array $translations = [];
    private string $locale = 'de';
    private string $decimalSeparator = ',';
    private string $thousandsSeparator = '.';
    private string $i18nDir;

    public function __construct()
    {
        // Setze den i18n Ordner relativ zum src Verzeichnis
        $this->i18nDir = dirname(__DIR__, 2) . '/i18n';
    }

    public function getName(): string
    {
        return 'i18n';
    }

    /**
     * Setzt die Übersetzungen
     */
    public function setTranslations(array $translations, string $locale = 'de'): void
    {
        $this->translations = $translations;
        $this->setLocale($locale);
    }

    /**
     * Lädt Übersetzungen aus einer Datei im i18n Ordner
     * @param string $filename Dateiname ohne Pfad (z.B. 'de.php', 'messages/de.php')
     * @param string $locale Locale-Code
     */
    public function loadTranslations(string $filename, string $locale = 'de'): void
    {
        // Normalisiere Pfad-Separatoren
        $filename = str_replace('\\', '/', $filename);
        
        // Entferne führende Slashes
        $filename = ltrim($filename, '/');
        
        // Baue vollständigen Pfad
        $filePath = $this->i18nDir . '/' . $filename;
        
        // Sicherheitsprüfung: Datei muss im i18n Verzeichnis liegen
        $realPath = realpath($filePath);
        $realI18nDir = realpath($this->i18nDir);
        
        if ($realPath === false || strpos($realPath, $realI18nDir) !== 0) {
            throw new \RuntimeException("Translation file must be in i18n directory: {$filename}");
        }
        
        if (!file_exists($realPath)) {
            throw new \RuntimeException("Translation file not found: {$filename}");
        }
        
        $this->translations = include $realPath;
        $this->setLocale($locale);
    }

    /**
     * Lädt Übersetzungen basierend auf Locale (sucht automatisch nach locale.php)
     * @param string $locale Locale-Code (z.B. 'de', 'en', 'fr')
     */
    public function loadLocale(string $locale): void
    {
        $filename = $locale . '.php';
        $this->loadTranslations($filename, $locale);
    }

    /**
     * Gibt den i18n Ordner zurück
     */
    public function getI18nDir(): string
    {
        return $this->i18nDir;
    }

    public function process(string $content, array $data): string
    {
        return preg_replace_callback('/\{\{i18n:([^}]+)\}\}/', function($matches) use ($data) {
            $parts = explode('|', $matches[1]);
            $key = trim($parts[0]);
            $variables = [];

            // Parse Variablen
            for ($i = 1; $i < count($parts); $i++) {
                if (strpos($parts[$i], ':') !== false) {
                    list($varKey, $varValue) = explode(':', $parts[$i], 2);
                    $variables[trim($varKey)] = $this->resolveValue(trim($varValue), $data);
                }
            }

            return $this->translate($key, $variables);
        }, $content);
    }

    /**
     * Übersetzt einen Key mit Variablen
     */
    public function translate(string $key, array $variables = []): string
    {
        $text = $this->translations[$key] ?? $key;

        // Ersetze Variablen
        foreach ($variables as $varKey => $varValue) {
            $text = str_replace('{' . $varKey . '}', $this->formatValue($varValue), $text);
        }

        return $text;
    }

    /**
     * Setzt die Trennzeichen für Zahlen
     */
    public function setNumberFormat(string $decimalSeparator, string $thousandsSeparator): void
    {
        $this->decimalSeparator = $decimalSeparator;
        $this->thousandsSeparator = $thousandsSeparator;
    }

    /**
     * Gibt den Dezimaltrenner zurück
     */
    public function getDecimalSeparator(): string
    {
        return $this->decimalSeparator;
    }

    /**
     * Gibt den Tausendertrenner zurück
     */
    public function getThousandsSeparator(): string
    {
        return $this->thousandsSeparator;
    }

    /**
     * Setzt Locale und passt Trennzeichen automatisch an
     */
    public function setLocale(string $locale): void
    {
        $this->locale = $locale;
        
        // Automatische Anpassung der Zahlenformatierung basierend auf Locale
        switch ($locale) {
            case 'en':
            case 'en_US':
            case 'en_GB':
                $this->decimalSeparator = '.';
                $this->thousandsSeparator = ',';
                break;
            case 'de':
            case 'de_DE':
            case 'de_AT':
            case 'de_CH':
                $this->decimalSeparator = ',';
                $this->thousandsSeparator = '.';
                break;
            case 'fr':
            case 'fr_FR':
                $this->decimalSeparator = ',';
                $this->thousandsSeparator = ' ';
                break;
            default:
                // Standard: deutsch
                $this->decimalSeparator = ',';
                $this->thousandsSeparator = '.';
        }
    }

    /**
     * Gibt die aktuelle Locale zurück
     */
    public function getLocale(): string
    {
        return $this->locale;
    }

    /**
     * Formatiert einen Wert basierend auf dem Typ
     */
    private function formatValue($value): string
    {
        if ($value instanceof \DateTime) {
            return $value->format('d.m.Y H:i:s');
        }
        
        if (is_numeric($value)) {
            if (is_float($value)) {
                return number_format($value, 2, $this->decimalSeparator, $this->thousandsSeparator);
            }
            return (string)$value;
        }

        return (string)$value;
    }

    /**
     * Löst einen Wert aus den Daten auf
     */
    private function resolveValue(string $value, array $data)
    {
        // Wenn es ein literaler Wert ist
        if (preg_match('/^["\'](.+)["\']$/', $value, $matches)) {
            return $matches[1];
        }

        // Wenn es eine Variable ist
        return $data[$value] ?? $value;
    }
}
