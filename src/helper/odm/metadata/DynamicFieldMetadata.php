<?php

namespace ARPI\Helper\ODM\Metadata;

/**
 * DynamicFieldMetadata beschreibt ein Feld eines DynamicDocument.
 * Im Gegensatz zu FieldMetadata benötigt diese Klasse keine ReflectionProperty —
 * getValue/setValue operieren auf dem internen Daten-Array von DynamicDocument.
 */
class DynamicFieldMetadata
{
    public string $name;
    public string $type;
    public bool $nullable;

    /**
     * @param string $name     Feldname (=Key im DynamicDocument-Datenarray)
     * @param string $type     ODM-Typ: string|int|float|bool|array|date
     * @param bool   $nullable Ob null erlaubt ist
     */
    public function __construct(string $name, string $type = 'string', bool $nullable = true)
    {
        $this->name     = $name;
        $this->type     = $type;
        $this->nullable = $nullable;
    }

    /**
     * Gibt den Wert des Feldes aus einem DynamicDocument zurück.
     * @param object $entity DynamicDocument-Instanz
     * @return mixed
     */
    public function getValue(object $entity)
    {
        return $entity->{$this->name};
    }

    /**
     * Setzt den Wert des Feldes in einem DynamicDocument.
     * @param object $entity DynamicDocument-Instanz
     * @param mixed  $value
     */
    public function setValue(object $entity, $value): void
    {
        $entity->{$this->name} = $value;
    }

    /**
     * Wandelt einen Wert in den korrekten ODM-Typ um.
     * @param mixed $value
     * @return mixed
     */
    public function cast($value)
    {
        if ($value === null) {
            return null;
        }
        switch ($this->type) {
            case 'int':
                return (int) $value;
            case 'float':
                return (float) $value;
            case 'bool':
                return (bool) $value;
            case 'array':
                return is_array($value) ? $value : [$value];
            case 'date':
                return is_string($value)
                    ? new \MongoDB\BSON\UTCDateTime(strtotime($value) * 1000)
                    : $value;
            case 'string':
            default:
                return (string) $value;
        }
    }
}
