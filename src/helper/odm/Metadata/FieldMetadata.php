<?php
namespace ARPI\Helper\ODM\Metadata;

use ReflectionProperty;

/**
 * FieldMetadata beschreibt ein normales Feld mit Typ und Nullable-Option.
 */
class FieldMetadata
{
    public string $name;
    public string $type;
    public bool $nullable;
    private ReflectionProperty $prop;
    private ?string $docComment = null;

    /**
     * Erstellt eine neue FieldMetadata Instanz.
     * @param ReflectionProperty $prop
     * @param string $type
     * @param bool $nullable
     */
    public function __construct(ReflectionProperty $prop, string $type = 'string', bool $nullable = false)
    {
        $this->prop = $prop;
        $this->name = $prop->getName();
        $this->type = $type;
        $this->nullable = $nullable;
        $this->docComment = $prop->getDocComment() ?: '';
    }

    /**
     * Gibt den Wert des Feldes für ein Entity zurück.
     * @param object $entity
     * @return mixed
     */
    public function getValue(object $entity)
    {
        $this->prop->setAccessible(true);
        return $this->prop->getValue($entity);
    }

    /**
     * Setzt den Wert des Feldes für ein Entity.
     * @param object $entity
     * @param mixed $value
     */
    public function setValue(object $entity, $value): void
    {
        $this->prop->setAccessible(true);
        $this->prop->setValue($entity, $value);
    }

    /**
     * Wandelt den Wert in den korrekten Typ um.
     * @param mixed $value
     * @return mixed
     */
    public function cast($value)
    {
        if ($value === null) return null;
        switch ($this->type) {
            case 'int': return (int)$value;
            case 'bool': return (bool)$value;
            case 'date': return is_string($value) ? new \MongoDB\BSON\UTCDateTime(strtotime($value)*1000) : $value;
            case 'string': default: return (string)$value;
        }
    }

    /**
     * Gibt den PHP-Typ des Feldes zurück.
     * @return string|null
     */
    public function getPhpType(): ?string
    {
        return $this->type;
    }
}
