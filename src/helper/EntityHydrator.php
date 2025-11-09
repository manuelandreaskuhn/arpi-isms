<?php
namespace ARPI\Helper;

use MongoDB\BSON\ObjectId;

/**
 * Generischer Entity Hydrator
 * Befüllt Entity-Properties aus Array-Daten
 */
class EntityHydrator
{
    /**
     * Hydratiert eine Entity mit Daten
     * 
     * @param object $entity Die zu befüllende Entity
     * @param array $data Die Daten als Array
     * @return object Die befüllte Entity
     */
    public static function hydrate(object $entity, array $data): object
    {
        $reflection = new \ReflectionClass($entity);
        
        foreach ($data as $key => $value) {
            if (!$reflection->hasProperty($key)) {
                continue; // Property existiert nicht
            }
            
            $property = $reflection->getProperty($key);
            
            // Typ-konvertierung basierend auf Property-Typ
            $type = self::getPropertyType($property);
            $convertedValue = self::convertValue($value, $type);
            
            $entity->$key = $convertedValue;
        }
        
        return $entity;
    }
    
    /**
     * Ermittelt den Property-Typ aus Reflection
     * 
     * @param \ReflectionProperty $property
     * @return string|null
     */
    private static function getPropertyType(\ReflectionProperty $property): ?string
    {
        $type = $property->getType();
        
        if (!$type) {
            return null;
        }
        
        if ($type instanceof \ReflectionNamedType) {
            return $type->getName();
        }
        
        return null;
    }
    
    /**
     * Konvertiert einen Wert basierend auf Zieltyp
     * 
     * @param mixed $value
     * @param string|null $type
     * @return mixed
     */
    private static function convertValue($value, ?string $type)
    {
        if ($value === null) {
            return null;
        }
        
        switch ($type) {
            case 'int':
                return (int) $value;
                
            case 'float':
                return (float) $value;
                
            case 'bool':
                return filter_var($value, FILTER_VALIDATE_BOOLEAN);
                
            case 'string':
                return (string) $value;
                
            case 'array':
                return is_array($value) ? $value : [$value];
                
            case 'DateTime':
                if ($value instanceof \DateTime) {
                    return $value;
                }
                return new \DateTime($value);
                
            case 'ObjectId':
            case 'MongoDB\\BSON\\ObjectId':
                if ($value instanceof ObjectId) {
                    return $value;
                }
                return new ObjectId($value);
                
            default:
                return $value;
        }
    }
    
    /**
     * Extrahiert Daten aus Entity zurück in Array
     * 
     * @param object $entity
     * @return array
     */
    public static function extract(object $entity): array
    {
        $reflection = new \ReflectionClass($entity);
        $data = [];
        
        foreach ($reflection->getProperties(\ReflectionProperty::IS_PUBLIC) as $property) {
            $name = $property->getName();
            $value = $entity->$name;
            
            // ObjectId zu String konvertieren
            if ($value instanceof ObjectId) {
                $data[$name] = (string) $value;
            }
            // DateTime zu ISO-String
            elseif ($value instanceof \DateTime) {
                $data[$name] = $value->format('c');
            }
            // Normale Werte
            else {
                $data[$name] = $value;
            }
        }
        
        return $data;
    }
}
