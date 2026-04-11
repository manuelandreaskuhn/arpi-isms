<?php

namespace ARPI\Helper\ODM;

use ARPI\Helper\ConfigLoader;
use ARPI\Helper\ODM\Metadata\DynamicFieldMetadata;
use ARPI\Helper\ODM\Metadata\DynamicIdMetadata;
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
    public IdMetadata|DynamicIdMetadata|null $idField = null;
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
     * DynamicDocument-Instanzen werden direkt aus der Wizard-Konfiguration aufgebaut.
     * @param object $entity
     * @return self
     */
    public static function fromEntity(object $entity): self
    {
        if ($entity instanceof DynamicDocument) {
            return self::fromDynamicDocument($entity);
        }

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

            if (preg_match('/@ODM\\\\Id/', $doc)) {
                $meta->idField = new IdMetadata($prop);
                continue;
            }
            if (preg_match('/@ODM\\\\Field\((.*?)\)/', $doc, $m)) {
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
     * Erstellt EntityMetadata für ein DynamicDocument aus der Wizard-Konfiguration.
     * Die Felder werden aus den aufgelösten Wizard-Seiten abgeleitet.
     * @param DynamicDocument $doc
     * @return self
     */
    private static function fromDynamicDocument(DynamicDocument $doc): self
    {
        $meta = new self();
        $meta->collection = $doc->getCollectionName();
        $meta->isDocument = true;

        // ID-Feld
        $meta->idField = new DynamicIdMetadata();

        // uuid immer als erstes String-Feld hinzufügen
        $meta->fields[] = new DynamicFieldMetadata('uuid', 'string', false);

        // Felder aus dem Wizard-Config ableiten
        $config = ConfigLoader::getInstance()->getWizardConfig($doc->getWizardId());

        foreach ($config['pages'] ?? [] as $page) {
            foreach ($page['fields'] ?? [] as $field) {
                // Gruppen-Einträge überspringen (haben kein 'name'-Key auf Top-Level)
                if (!isset($field['name'])) {
                    continue;
                }
                $name = $field['name'];
                if ($name === 'uuid') {
                    continue; // bereits hinzugefügt
                }
                $type = self::elementTypeToOdmType($field['element'] ?? 'text-input');
                $meta->fields[] = new DynamicFieldMetadata($name, $type, true);
            }
        }

        // Zeitstempel-Felder (werden immer gesetzt)
        $meta->fields[] = new DynamicFieldMetadata('createdat', 'date', true);
        $meta->fields[] = new DynamicFieldMetadata('updatedat', 'date', true);

        return $meta;
    }

    /**
     * Bildet einen Element-Typ aus dem Wizard-Katalog auf einen ODM-Typ ab.
     * @param string $elementType
     * @return string
     */
    private static function elementTypeToOdmType(string $elementType): string
    {
        return match ($elementType) {
            'toggle', 'ha-enabled', 'checkbox' => 'bool',
            'number-input', 'range-slider', 'log-retention', 'port',
            'vlan-id', 'number', 'range'       => 'int',
            'checkbox-group'                   => 'array',
            default                            => 'string',
        };
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
            if (!str_contains($arg, '=')) {
                continue;
            }
            [$k, $v] = array_map('trim', explode('=', $arg, 2));
            // Entferne umgebende Anführungszeichen
            $v = trim($v, '"\'');
            $result[$k] = $v === 'true' ? true : ($v === 'false' ? false : $v);
        }
        return $result;
    }
}
