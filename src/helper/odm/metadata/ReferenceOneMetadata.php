<?php
namespace ARPI\Helper\ODM\Metadata;

use ReflectionProperty;

/**
 * ReferenceOneMetadata beschreibt eine Referenz auf ein anderes Dokument (ReferenceOne).
 */
class ReferenceOneMetadata
{
    public string $name;
    public string $targetDocument;
    private ReflectionProperty $prop;

    /**
     * Erstellt eine neue ReferenceOneMetadata Instanz.
     * @param ReflectionProperty $prop
     * @param string $targetDocument
     */
    public function __construct(ReflectionProperty $prop, string $targetDocument)
    {
        $this->prop = $prop;
        $this->name = $prop->getName();
        $this->targetDocument = $targetDocument;
    }

    /**
     * Gibt das referenzierte Dokument zurück.
     * @param object $entity
     * @return mixed
     */
    public function getValue(object $entity)
    {
        $this->prop->setAccessible(true);
        return $this->prop->getValue($entity);
    }

    /**
     * Setzt das referenzierte Dokument.
     * @param object $entity
     * @param mixed $value
     */
    public function setValue(object $entity, $value): void
    {
        $this->prop->setAccessible(true);
        $this->prop->setValue($entity, $value);
    }
}
