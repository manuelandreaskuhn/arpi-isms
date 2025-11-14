<?php
namespace ARPI\Helper\ODM\Metadata;

use ReflectionProperty;

/**
 * EmbedOneMetadata beschreibt ein eingebettetes Dokument (EmbedOne).
 */
class EmbedOneMetadata
{
    public string $name;
    public string $targetDocument;
    private ReflectionProperty $prop;

    /**
     * Erstellt eine neue EmbedOneMetadata Instanz.
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
     * Gibt das eingebettete Dokument zurück.
     * @param object $entity
     * @return mixed
     */
    public function getValue(object $entity)
    {
        $this->prop->setAccessible(true);
        return $this->prop->getValue($entity);
    }
}
