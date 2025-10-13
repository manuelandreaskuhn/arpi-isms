<?php
namespace ARPI\Helper\ODM\Metadata;

use ReflectionProperty;

/**
 * EmbedManyMetadata beschreibt ein Array von eingebetteten Dokumenten (EmbedMany).
 */
class EmbedManyMetadata
{
    public string $name;
    public string $targetDocument;
    private ReflectionProperty $prop;

    /**
     * Erstellt eine neue EmbedManyMetadata Instanz.
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
     * Gibt die eingebetteten Dokumente als Array zurück.
     * @param object $entity
     * @return mixed
     */
    public function getValue(object $entity)
    {
        $this->prop->setAccessible(true);
        return $this->prop->getValue($entity);
    }
}
