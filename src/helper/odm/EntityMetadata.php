<?php
namespace ARPI\Helper\ODM;

use ARPI\Helper\ODM\Metadata\EmbedManyMetadata;
use ARPI\Helper\ODM\Metadata\EmbedOneMetadata;
use ARPI\Helper\ODM\Metadata\FieldMetadata;
use ARPI\Helper\ODM\Metadata\IdMetadata;
use ARPI\Helper\ODM\Metadata\ReferenceManyMetadata;
use ARPI\Helper\ODM\Metadata\ReferenceOneMetadata;
use ReflectionClass;
use ReflectionProperty;

/**
 * EntityMetadata liest die Annotationen einer Entity und speichert die Metadaten
 * für Felder, Embeds und Referenzen.
 */
class EntityMetadata
{
    public string $collection;
    /** @var FieldMetadata[] */
    public array $fields = [];
    public ?IdMetadata $idField = null;
    /** @var EmbedOneMetadata[] */
    public array $embedOneFields = [];
    /** @var EmbedManyMetadata[] */
    public array $embedManyFields = [];
    /** @var ReferenceOneMetadata[] */
    public array $referenceOneFields = [];
    /** @var ReferenceManyMetadata[] */
    public array $referenceManyFields = [];
    public bool $isDocument = false;
    public bool $isEmbeddedDocument = false;

    /**
     * Erstellt EntityMetadata aus einem Entity-Objekt.
     * @param object $entity
     * @return self
     */
    public static function fromEntity(object $entity): self
    {
        $meta = new self();
        $ref = new ReflectionClass($entity);

        $classDoc = $ref->getDocComment() ?: '';
        if (preg_match('/@ODM\\\\Document\(collection="([^"]+)"\)/', $classDoc, $matches)) {
            $meta->collection = $matches[1];
            $meta->isDocument = true;
        } elseif (preg_match('/@ODM\\\\Document/', $classDoc)) {
            $meta->collection = strtolower($ref->getShortName());
            $meta->isDocument = true;
        } elseif (preg_match('/@ODM\\\\EmbeddedDocument/', $classDoc)) {
            $meta->collection = '';
            $meta->isEmbeddedDocument = true;
        } else {
            $meta->collection = strtolower($ref->getShortName());
        }

        foreach ($ref->getProperties() as $prop) {
            $doc = $prop->getDocComment() ?: '';

            if (preg_match('/@Id/', $doc)) {
                $meta->idField = new IdMetadata($prop);
                continue;
            }
            if (preg_match('/@Field\((.*?)\)/', $doc, $m)) {
                $args = self::parseArgs($m[1]);
                $meta->fields[] = new FieldMetadata($prop, $args['type'] ?? 'string', $args['nullable'] ?? false);
                continue;
            }
            if (preg_match('/@ODM\\\\EmbedOne\(targetDocument=([^\)]+)\)/', $doc, $m)) {
                $meta->embedOneFields[] = new EmbedOneMetadata($prop, trim($m[1], '"\''));
                continue;
            }
            if (preg_match('/@ODM\\\\EmbedMany\(targetDocument=([^\)]+)\)/', $doc, $m)) {
                $meta->embedManyFields[] = new EmbedManyMetadata($prop, trim($m[1], '"\''));
                continue;
            }
            if (preg_match('/@ODM\\\\ReferenceOne\(targetDocument=([^\)]+)\)/', $doc, $m)) {
                $meta->referenceOneFields[] = new ReferenceOneMetadata($prop, trim($m[1], '"\''));
                continue;
            }
            if (preg_match('/@ODM\\\\ReferenceMany\(targetDocument=([^\)]+)\)/', $doc, $m)) {
                $meta->referenceManyFields[] = new ReferenceManyMetadata($prop, trim($m[1], '"\''));
                continue;
            }
        }
        return $meta;
    }

    /**
     * Parst die Argumente einer Annotation.
     * @param string $args
     * @return array
     */
    private static function parseArgs(string $args): array
    {
        $result = [];
        foreach (explode(',', $args) as $arg) {
            [$k, $v] = array_map('trim', explode('=', $arg));
            $result[$k] = $v === 'true' ? true : ($v === 'false' ? false : $v);
        }
        return $result;
    }
}
