<?php
namespace ARPI\Helper\Template;

/**
 * Property-Modul mit Sicherheit und Type-Conversion
 * Syntax: 
 * - {{property:path}} - Escaped output
 * - {{property:path|raw}} - Raw output
 * - {{property:path|json}} - JSON output
 * - {{property:path|original}} - Original value
 */
class PropertyModule extends TemplateModule
{
    public function getName(): string
    {
        return 'property';
    }

    public function process(string $content, array $data): string
    {
        return preg_replace_callback(
            '/\{\{property:([\w\.]+)(?:\|(\w+))?\}\}/',
            function($matches) use ($data) {
                $path = $matches[1];
                $modifier = $matches[2] ?? 'escape';

                $value = $this->resolvePath($path, $data);

                return $this->formatValue($value, $modifier);
            },
            $content
        );
    }

    /**
     * Löst einen Property-Pfad auf
     */
    private function resolvePath(string $path, array $data)
    {
        $parts = explode('.', $path);
        $current = $data;

        foreach ($parts as $part) {
            if (is_array($current) && isset($current[$part])) {
                $current = $current[$part];
            } elseif (is_object($current)) {
                // Versuche Getter-Methode
                $getter = 'get' . ucfirst($part);
                if (method_exists($current, $getter)) {
                    $current = $current->$getter();
                } elseif (isset($current->$part)) {
                    $current = $current->$part;
                } else {
                    return null;
                }
            } else {
                return null;
            }
        }

        return $current;
    }

    /**
     * Formatiert einen Wert basierend auf Modifier
     */
    private function formatValue($value, string $modifier): string
    {
        if ($value === null) {
            return '';
        }

        // Original-Wert
        if ($modifier === 'original') {
            return $this->convertToString($value);
        }

        // JSON-Output
        if ($modifier === 'json') {
            return json_encode($value, JSON_UNESCAPED_UNICODE | JSON_HEX_TAG | JSON_HEX_AMP | JSON_HEX_QUOT | JSON_HEX_APOS);
        }

        // Type-basierte Konvertierung
        $stringValue = $this->convertByType($value);

        // Raw oder Escaped
        if ($modifier === 'raw') {
            return $stringValue;
        }

        return $this->escape($stringValue);
    }

    /**
     * Konvertiert einen Wert basierend auf dem Typ
     */
    private function convertByType($value): string
    {
        // Boolean
        if (is_bool($value)) {
            return $value ? 'true' : 'false';
        }

        // DateTime
        if ($value instanceof \DateTime || $value instanceof \DateTimeInterface) {
            return $value->format('d.m.Y H:i:s');
        }

        // Enum
        if ($value instanceof \UnitEnum) {
            return $value instanceof \BackedEnum ? (string)$value->value : $value->name;
        }

        // Custom Entity mit toString
        if (is_object($value)) {
            $class = get_class($value);
            
            // Prüfe ob es eine Entity ist (im entities Ordner)
            if (strpos($class, '\\Entity\\') !== false || strpos($class, '\\Entities\\') !== false) {
                if (method_exists($value, 'toString')) {
                    return $value->toString();
                }
                if (method_exists($value, '__toString')) {
                    return (string)$value;
                }
            }
            
            return get_class($value);
        }

        // Array
        if (is_array($value)) {
            return implode(', ', $value);
        }

        // Numeric
        if (is_numeric($value)) {
            if (is_float($value)) {
                return $this->formatNumber($value);
            }
            return (string)$value;
        }

        return (string)$value;
    }

    /**
     * Formatiert eine Zahl mit den Trennzeichen aus dem i18n-Modul
     */
    private function formatNumber(float $value): string
    {
        $i18nModule = $this->engine->getModule('i18n');
        
        if ($i18nModule instanceof InternationalizationModule) {
            $decimalSep = $i18nModule->getDecimalSeparator();
            $thousandsSep = $i18nModule->getThousandsSeparator();
            return number_format($value, 2, $decimalSep, $thousandsSep);
        }
        
        // Fallback
        return number_format($value, 2, ',', '.');
    }

    /**
     * Konvertiert zu String ohne Formatierung
     */
    private function convertToString($value): string
    {
        if (is_bool($value)) {
            return $value ? '1' : '0';
        }

        if ($value instanceof \DateTime || $value instanceof \DateTimeInterface) {
            return $value->format('Y-m-d H:i:s');
        }

        if (is_array($value) || is_object($value)) {
            return json_encode($value, JSON_UNESCAPED_UNICODE | JSON_HEX_TAG | JSON_HEX_AMP | JSON_HEX_QUOT | JSON_HEX_APOS);
        }

        return (string)$value;
    }
}
