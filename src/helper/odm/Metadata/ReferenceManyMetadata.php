<?php
namespace ARPI\Helper\ODM\Metadata;

use ReflectionProperty;

/**
 * ReferenceManyMetadata beschreibt ein Array von Referenzen auf andere Dokumente (ReferenceMany).
 */
class ReferenceManyMetadata
{
    public string $name;
    public string $targetDocument;
    private ReflectionProperty $prop;

    /**
     * Erstellt eine neue ReferenceManyMetadata Instanz.
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
     * Gibt die referenzierten Dokumente als Array zurück.
     * @param object $entity
     * @return mixed
     */
    public function getValue(object $entity)
    {
        $this->prop->setAccessible(true);
        return $this->prop->getValue($entity);
    }

    /**
     * Setzt die referenzierten Dokumente.
     * @param object $entity
     * @param mixed $value
     */
    public function setValue(object $entity, $value): void
    {
        $this->prop->setAccessible(true);
        $this->prop->setValue($entity, $value);
    }
}
