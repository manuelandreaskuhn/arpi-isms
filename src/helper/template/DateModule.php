<?php
namespace ARPI\Helper\Template;

/**
 * Datum-Modul mit Internationalisierung
 * Syntax:
 * - {{date:path|timestamp}} - Unix Timestamp
 * - {{date:path|date}} - Nur Datum
 * - {{date:path|time}} - Nur Uhrzeit
 * - {{date:path|datetime}} - Datum und Uhrzeit
 * - {{date:path|relative}} - Relativ (vor X Minuten/seit X Tagen)
 * - {{date:path|format:Y-m-d}} - Custom Format
 */
class DateModule extends TemplateModule
{
    public function getName(): string
    {
        return 'date';
    }

    public function process(string $content, array $data): string
    {
        return preg_replace_callback(
            '/\{\{date:([\w\.]+)(?:\|(\w+)(?::([^}]+))?)?\}\}/',
            function($matches) use ($data) {
                $path = $matches[1];
                $format = $matches[2] ?? 'datetime';
                $customFormat = $matches[3] ?? null;

                $value = $this->resolvePath($path, $data);

                return $this->formatDate($value, $format, $customFormat);
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
     * Formatiert ein Datum
     */
    private function formatDate($value, string $format, ?string $customFormat): string
    {
        if ($value === null) {
            return '';
        }

        // Konvertiere zu DateTime
        $dateTime = $this->toDateTime($value);
        if (!$dateTime) {
            return '';
        }

        $i18nModule = $this->engine->getModule('i18n');

        switch ($format) {
            case 'timestamp':
                return (string)$dateTime->getTimestamp();

            case 'date':
                return $this->formatDateOnly($dateTime, $i18nModule);

            case 'time':
                return $this->formatTimeOnly($dateTime, $i18nModule);

            case 'datetime':
                return $this->formatDateTime($dateTime, $i18nModule);

            case 'relative':
                return $this->formatRelative($dateTime, $i18nModule);

            case 'format':
                return $dateTime->format($customFormat ?? 'Y-m-d H:i:s');

            default:
                return $this->formatDateTime($dateTime, $i18nModule);
        }
    }

    /**
     * Konvertiert einen Wert zu DateTime
     */
    private function toDateTime($value): ?\DateTimeInterface
    {
        if ($value instanceof \DateTimeInterface) {
            return $value;
        }

        if (is_numeric($value)) {
            // Unix Timestamp
            $dt = new \DateTime();
            $dt->setTimestamp((int)$value);
            return $dt;
        }

        if (is_string($value)) {
            try {
                return new \DateTime($value);
            } catch (\Exception $e) {
                return null;
            }
        }

        return null;
    }

    /**
     * Formatiert nur das Datum
     */
    private function formatDateOnly(\DateTimeInterface $dateTime, $i18nModule): string
    {
        if ($i18nModule instanceof InternationalizationModule) {
            $locale = $i18nModule->getLocale();
            
            switch (substr($locale, 0, 2)) {
                case 'en':
                    return $dateTime->format('m/d/Y');
                case 'de':
                    return $dateTime->format('d.m.Y');
                case 'fr':
                    return $dateTime->format('d/m/Y');
                default:
                    return $dateTime->format('Y-m-d');
            }
        }

        return $dateTime->format('d.m.Y');
    }

    /**
     * Formatiert nur die Uhrzeit
     */
    private function formatTimeOnly(\DateTimeInterface $dateTime, $i18nModule): string
    {
        if ($i18nModule instanceof InternationalizationModule) {
            $locale = $i18nModule->getLocale();
            
            switch (substr($locale, 0, 2)) {
                case 'en':
                    return $dateTime->format('h:i A');
                default:
                    return $dateTime->format('H:i');
            }
        }

        return $dateTime->format('H:i');
    }

    /**
     * Formatiert Datum und Uhrzeit
     */
    private function formatDateTime(\DateTimeInterface $dateTime, $i18nModule): string
    {
        if ($i18nModule instanceof InternationalizationModule) {
            $locale = $i18nModule->getLocale();
            
            switch (substr($locale, 0, 2)) {
                case 'en':
                    return $dateTime->format('m/d/Y h:i A');
                case 'de':
                    return $dateTime->format('d.m.Y H:i');
                case 'fr':
                    return $dateTime->format('d/m/Y H:i');
                default:
                    return $dateTime->format('Y-m-d H:i:s');
            }
        }

        return $dateTime->format('d.m.Y H:i');
    }

    /**
     * Formatiert relatives Datum (vor X Minuten/seit X Tagen)
     */
    private function formatRelative(\DateTimeInterface $dateTime, $i18nModule): string
    {
        $now = new \DateTime('now', $dateTime->getTimezone());
        $diff = $now->getTimestamp() - $dateTime->getTimestamp();
        $isPast = $diff > 0;
        $diff = abs($diff);

        // Berechne Zeiteinheiten
        $seconds = $diff;
        $minutes = floor($seconds / 60);
        $hours = floor($minutes / 60);
        $days = floor($hours / 24);
        $weeks = floor($days / 7);
        $months = floor($days / 30);
        $years = floor($days / 365);

        // Bestimme Zeiteinheit und Wert
        if ($years > 0) {
            $unit = 'years';
            $value = $years;
        } elseif ($months > 0) {
            $unit = 'months';
            $value = $months;
        } elseif ($weeks > 0) {
            $unit = 'weeks';
            $value = $weeks;
        } elseif ($days > 0) {
            $unit = 'days';
            $value = $days;
        } elseif ($hours > 0) {
            $unit = 'hours';
            $value = $hours;
        } elseif ($minutes > 0) {
            $unit = 'minutes';
            $value = $minutes;
        } else {
            $unit = 'seconds';
            $value = $seconds;
        }

        return $this->getRelativeString($value, $unit, $isPast, $i18nModule);
    }

    /**
     * Erstellt den relativen Zeitstring mit Übersetzung
     */
    private function getRelativeString(int $value, string $unit, bool $isPast, $i18nModule): string
    {
        if (!($i18nModule instanceof InternationalizationModule)) {
            return ($isPast ? 'vor ' : 'seit ') . $value . ' ' . $unit;
        }

        // Erstelle Translation-Keys
        $prefix = $isPast ? 'time_ago' : 'time_since';
        $unitKey = 'time_unit_' . $unit . ($value == 1 ? '_singular' : '_plural');

        // Hole Übersetzungen
        $prefixText = $i18nModule->translate($prefix);
        $unitText = $i18nModule->translate($unitKey);

        // Fallback wenn keine Übersetzung vorhanden
        if ($prefixText === $prefix) {
            $prefixText = $isPast ? 'vor' : 'seit';
        }
        
        if ($unitText === $unitKey) {
            $unitText = $this->getFallbackUnit($unit, $value);
        }

        return "{$prefixText} {$value} {$unitText}";
    }

    /**
     * Fallback für Zeiteinheiten ohne Übersetzung
     */
    private function getFallbackUnit(string $unit, int $value): string
    {
        $units = [
            'seconds' => $value == 1 ? 'Sekunde' : 'Sekunden',
            'minutes' => $value == 1 ? 'Minute' : 'Minuten',
            'hours' => $value == 1 ? 'Stunde' : 'Stunden',
            'days' => $value == 1 ? 'Tag' : 'Tagen',
            'weeks' => $value == 1 ? 'Woche' : 'Wochen',
            'months' => $value == 1 ? 'Monat' : 'Monaten',
            'years' => $value == 1 ? 'Jahr' : 'Jahren',
        ];

        return $units[$unit] ?? $unit;
    }
}
