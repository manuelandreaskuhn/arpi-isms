<?php
namespace ARPI\Helper;

/**
 * Einfacher JSON Schema Validator
 */
class SchemaValidator
{
    private array $errors = [];
    
    /**
     * Validiert Daten gegen Schema
     * 
     * @param array $data
     * @param array $schema
     * @return bool
     */
    public function validate(array $data, array $schema): bool
    {
        $this->errors = [];
        
        // Required fields prüfen
        if (isset($schema['required'])) {
            foreach ($schema['required'] as $field) {
                if (!isset($data[$field]) || $data[$field] === '' || $data[$field] === null) {
                    $this->errors[] = "Required field '{$field}' is missing";
                }
            }
        }
        
        // Properties validieren
        if (isset($schema['properties'])) {
            foreach ($data as $key => $value) {
                if (!isset($schema['properties'][$key])) {
                    continue; // Unbekannte Property ignorieren
                }
                
                $propertySchema = $schema['properties'][$key];
                $this->validateProperty($key, $value, $propertySchema);
            }
        }
        
        return empty($this->errors);
    }
    
    /**
     * Validiert einzelne Property
     * 
     * @param string $key
     * @param mixed $value
     * @param array $schema
     * @return void
     */
    private function validateProperty(string $key, $value, array $schema): void
    {
        // Typ prüfen
        if (isset($schema['type'])) {
            $types = is_array($schema['type']) ? $schema['type'] : [$schema['type']];
            $valid = false;
            
            foreach ($types as $type) {
                if ($type === 'null' && $value === null) {
                    $valid = true;
                    break;
                }
                if ($this->checkType($value, $type)) {
                    $valid = true;
                    break;
                }
            }
            
            if (!$valid && $value !== null) {
                $this->errors[] = "Field '{$key}' has invalid type";
            }
        }
        
        // Enum prüfen
        if (isset($schema['enum']) && $value !== null && $value !== '') {
            if (!in_array($value, $schema['enum'], true)) {
                $this->errors[] = "Field '{$key}' must be one of: " . implode(', ', $schema['enum']);
            }
        }
        
        // String-spezifische Validierungen
        if (isset($schema['minLength']) && is_string($value)) {
            if (strlen($value) < $schema['minLength']) {
                $this->errors[] = "Field '{$key}' is too short";
            }
        }
        
        if (isset($schema['maxLength']) && is_string($value)) {
            if (strlen($value) > $schema['maxLength']) {
                $this->errors[] = "Field '{$key}' is too long";
            }
        }
        
        // Numerische Validierungen
        if (isset($schema['minimum']) && is_numeric($value)) {
            if ($value < $schema['minimum']) {
                $this->errors[] = "Field '{$key}' is below minimum";
            }
        }
        
        // Array-Validierung
        if (isset($schema['items']) && is_array($value)) {
            foreach ($value as $item) {
                if (isset($schema['items']['enum'])) {
                    if (!in_array($item, $schema['items']['enum'], true)) {
                        $this->errors[] = "Array item in '{$key}' has invalid value";
                    }
                }
            }
        }
        
        // E-Mail Format
        if (isset($schema['format']) && $schema['format'] === 'email' && $value !== null) {
            if (!filter_var($value, FILTER_VALIDATE_EMAIL)) {
                $this->errors[] = "Field '{$key}' must be a valid email";
            }
        }
    }
    
    /**
     * Prüft Wert-Typ
     * 
     * @param mixed $value
     * @param string $type
     * @return bool
     */
    private function checkType($value, string $type): bool
    {
        switch ($type) {
            case 'string':
                return is_string($value);
            case 'number':
                return is_numeric($value);
            case 'integer':
                return is_int($value);
            case 'boolean':
                return is_bool($value);
            case 'array':
                return is_array($value);
            case 'object':
                return is_object($value) || is_array($value);
            case 'null':
                return $value === null;
            default:
                return true;
        }
    }
    
    /**
     * Gibt Validierungsfehler zurück
     * 
     * @return array
     */
    public function getErrors(): array
    {
        return $this->errors;
    }
}
