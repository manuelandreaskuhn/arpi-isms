<?php
namespace ARPI\Helper\Template;

/**
 * Bedingungen-Modul
 * Syntax:
 * - {{if:variable}}...{{/if}}
 * - {{if:variable|equals:value}}...{{/if}}
 * - {{if:variable|not}}...{{/if}}
 * - {{if:variable|empty}}...{{/if}}
 * - {{if:variable|notempty}}...{{/if}}
 * - {{if:property.path|gt:5}}...{{/if}}
 * - {{if:variable}}...{{else}}...{{/if}}
 * - {{if:variable}}...{{elseif:other}}...{{else}}...{{/if}}
 */
class ConditionalModule extends TemplateModule
{
    public function getName(): string
    {
        return 'conditional';
    }

    public function process(string $content, array $data): string
    {
        // Verarbeite if/elseif/else/endif Strukturen
        return preg_replace_callback(
            '/\{\{if:([^}]+)\}\}(.*?)(?:\{\{elseif:([^}]+)\}\}(.*?))*(?:\{\{else\}\}(.*?))?\{\{\/if\}\}/s',
            function($matches) use ($data) {
                return $this->processIfBlock($matches, $data);
            },
            $content
        );
    }

    /**
     * Verarbeitet einen if-Block
     */
    private function processIfBlock(array $matches, array $data): string
    {
        $fullMatch = $matches[0];
        
        // Extrahiere alle Bedingungen und Blöcke
        $blocks = $this->parseConditionalBlock($fullMatch);
        
        // Evaluiere Bedingungen
        foreach ($blocks as $block) {
            if ($block['type'] === 'if' || $block['type'] === 'elseif') {
                if ($this->evaluateCondition($block['condition'], $data)) {
                    return $block['content'];
                }
            } elseif ($block['type'] === 'else') {
                return $block['content'];
            }
        }
        
        return '';
    }

    /**
     * Parsed einen conditional Block in seine Teile
     */
    private function parseConditionalBlock(string $block): array
    {
        $blocks = [];
        
        // Parse if
        if (preg_match('/\{\{if:([^}]+)\}\}(.*?)(?=\{\{(?:elseif|else|\/if)\}\})/s', $block, $ifMatch)) {
            $blocks[] = [
                'type' => 'if',
                'condition' => $ifMatch[1],
                'content' => $ifMatch[2]
            ];
        }
        
        // Parse elseif (mehrfach möglich)
        preg_match_all('/\{\{elseif:([^}]+)\}\}(.*?)(?=\{\{(?:elseif|else|\/if)\}\})/s', $block, $elseifMatches, PREG_SET_ORDER);
        foreach ($elseifMatches as $match) {
            $blocks[] = [
                'type' => 'elseif',
                'condition' => $match[1],
                'content' => $match[2]
            ];
        }
        
        // Parse else
        if (preg_match('/\{\{else\}\}(.*?)\{\{\/if\}\}/s', $block, $elseMatch)) {
            $blocks[] = [
                'type' => 'else',
                'condition' => null,
                'content' => $elseMatch[1]
            ];
        }
        
        return $blocks;
    }

    /**
     * Evaluiert eine Bedingung
     */
    private function evaluateCondition(string $condition, array $data): bool
    {
        // Parse Bedingung: variable|operator:value
        $parts = explode('|', $condition, 2);
        $varPath = trim($parts[0]);
        $operator = 'exists';
        $compareValue = null;
        
        if (isset($parts[1])) {
            $operatorParts = explode(':', $parts[1], 2);
            $operator = trim($operatorParts[0]);
            $compareValue = isset($operatorParts[1]) ? trim($operatorParts[1]) : null;
        }
        
        // Hole Wert
        $value = $this->resolvePath($varPath, $data);
        
        // Evaluiere basierend auf Operator
        return $this->evaluateOperator($value, $operator, $compareValue, $data);
    }

    /**
     * Evaluiert einen Operator
     */
    private function evaluateOperator($value, string $operator, $compareValue, array $data): bool
    {
        switch ($operator) {
            // Existenz
            case 'exists':
                return $value !== null;
            
            case 'notexists':
            case 'not':
                return $value === null;
            
            // Empty Checks
            case 'empty':
                return empty($value);
            
            case 'notempty':
            case 'filled':
                return !empty($value);
            
            // Boolean
            case 'true':
                return $value === true || $value === 'true' || $value === 1 || $value === '1';
            
            case 'false':
                return $value === false || $value === 'false' || $value === 0 || $value === '0' || $value === '';
            
            // Gleichheit
            case 'equals':
            case 'eq':
                $compareValue = $this->resolveCompareValue($compareValue, $data);
                return $value == $compareValue;
            
            case 'notequals':
            case 'neq':
            case 'ne':
                $compareValue = $this->resolveCompareValue($compareValue, $data);
                return $value != $compareValue;
            
            // Strict Gleichheit
            case 'same':
            case 'identical':
                $compareValue = $this->resolveCompareValue($compareValue, $data);
                return $value === $compareValue;
            
            case 'notsame':
            case 'notidentical':
                $compareValue = $this->resolveCompareValue($compareValue, $data);
                return $value !== $compareValue;
            
            // Vergleiche
            case 'gt':
            case 'greater':
                $compareValue = $this->resolveCompareValue($compareValue, $data);
                return $value > $compareValue;
            
            case 'gte':
            case 'greaterorequal':
                $compareValue = $this->resolveCompareValue($compareValue, $data);
                return $value >= $compareValue;
            
            case 'lt':
            case 'less':
                $compareValue = $this->resolveCompareValue($compareValue, $data);
                return $value < $compareValue;
            
            case 'lte':
            case 'lessorequal':
                $compareValue = $this->resolveCompareValue($compareValue, $data);
                return $value <= $compareValue;
            
            // String Operationen
            case 'contains':
                $compareValue = $this->resolveCompareValue($compareValue, $data);
                return is_string($value) && strpos($value, $compareValue) !== false;
            
            case 'notcontains':
                $compareValue = $this->resolveCompareValue($compareValue, $data);
                return is_string($value) && strpos($value, $compareValue) === false;
            
            case 'startswith':
                $compareValue = $this->resolveCompareValue($compareValue, $data);
                return is_string($value) && strpos($value, $compareValue) === 0;
            
            case 'endswith':
                $compareValue = $this->resolveCompareValue($compareValue, $data);
                return is_string($value) && substr($value, -strlen($compareValue)) === $compareValue;
            
            // Array/Collection Operationen
            case 'in':
                if (is_array($value) || $value instanceof \Traversable) {
                    $compareValue = $this->resolveCompareValue($compareValue, $data);
                    return in_array($compareValue, is_array($value) ? $value : iterator_to_array($value));
                }
                return false;
            
            case 'notin':
                if (is_array($value) || $value instanceof \Traversable) {
                    $compareValue = $this->resolveCompareValue($compareValue, $data);
                    return !in_array($compareValue, is_array($value) ? $value : iterator_to_array($value));
                }
                return true;
            
            // Type Checks
            case 'isnull':
                return $value === null;
            
            case 'isnotnull':
                return $value !== null;
            
            case 'isarray':
                return is_array($value);
            
            case 'isobject':
                return is_object($value);
            
            case 'isstring':
                return is_string($value);
            
            case 'isnumeric':
                return is_numeric($value);
            
            case 'isbool':
                return is_bool($value);
            
            default:
                return false;
        }
    }

    /**
     * Löst einen Vergleichswert auf
     */
    private function resolveCompareValue($value, array $data)
    {
        if ($value === null) {
            return null;
        }
        
        // String Literals
        if (preg_match('/^["\'](.+)["\']$/', $value, $matches)) {
            return $matches[1];
        }
        
        // Numerische Werte
        if (is_numeric($value)) {
            return strpos($value, '.') !== false ? (float)$value : (int)$value;
        }
        
        // Boolean Literals
        if ($value === 'true') return true;
        if ($value === 'false') return false;
        if ($value === 'null') return null;
        
        // Ansonsten als Variable behandeln
        return $this->resolvePath($value, $data);
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
}
