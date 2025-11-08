<?php
namespace ARPI\Helper\ODM\Metadata;

use ReflectionProperty;

/**
 * IdMetadata beschreibt das ID-Feld einer Entity.
 */
class IdMetadata
{
    public string $name;
    private ReflectionProperty $prop;

    /**
     * Erstellt eine neue IdMetadata Instanz.
     * @param ReflectionProperty $prop
     */
    public function __construct(ReflectionProperty $prop)
    {
        $this->prop = $prop;
        $this->name = $prop->getName();
    }

    /**
     * Gibt den Wert des ID-Feldes zurück.
     * @param object $entity
     * @return mixed
     */
    public function getValue(object $entity)
    {
        $this->prop->setAccessible(true);
        return $this->prop->getValue($entity);
    }

    /**
     * Setzt den Wert des ID-Feldes.
     * @param object $entity
     * @param mixed $value
     */
    public function setValue(object $entity, $value): void
    {
        $this->prop->setAccessible(true);
        $this->prop->setValue($entity, $value);
    }
}
