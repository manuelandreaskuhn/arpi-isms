<?php

namespace ARPI\Helper\ODM\Metadata;

use MongoDB\BSON\ObjectId;

/**
 * DynamicIdMetadata beschreibt das ID-Feld eines DynamicDocument.
 * Operiert auf dem internen Daten-Array von DynamicDocument statt auf einer ReflectionProperty.
 */
class DynamicIdMetadata
{
    public string $name = 'id';

    /**
     * Gibt den Wert des ID-Feldes aus einem DynamicDocument zurück.
     * @param object $entity DynamicDocument-Instanz
     * @return mixed
     */
    public function getValue(object $entity)
    {
        return $entity->id;
    }

    /**
     * Setzt den Wert des ID-Feldes in einem DynamicDocument.
     * @param object $entity DynamicDocument-Instanz
     * @param mixed  $value
     */
    public function setValue(object $entity, $value): void
    {
        $entity->id = $value;
    }
}
