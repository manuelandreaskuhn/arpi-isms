<?php
namespace ARPI\Helper\ODM;

/**
 * EntitySerializer ist verantwortlich für die Serialisierung von Entity-Objekten in MongoDB-Dokumente.
 */
class EntitySerializer
{
    /**
     * Serialisiert ein Entity-Objekt rekursiv in ein Array für MongoDB.
     * @param object $entity
     * @param EntityMetadata $meta
     * @return array
     */
    public function serializeEntity(object $entity, EntityMetadata $meta): array
    {
        $data = [];

        $this->serializeFields($data, $entity, $meta);
        $this->serializeEmbedOne($data, $entity, $meta);
        $this->serializeEmbedMany($data, $entity, $meta);
        $this->serializeReferenceOne($data, $entity, $meta);
        $this->serializeReferenceMany($data, $entity, $meta);

        // ID-Feld
        if ($meta->idField) {
            $idValue = $meta->idField->getValue($entity);
            if ($idValue !== null) {
                $data['_id'] = $idValue;
            }
        }

        return $data;
    }

    /**
     * Serialisiert ein Entity für Hash-Berechnung (optimiert für Dirty Checking).
     * @param object $entity
     * @param EntityMetadata $meta
     * @return array
     */
    public function serializeEntityForHash(object $entity, EntityMetadata $meta): array
    {
        // Vereinfachte Serialisierung nur für relevante Felder
        $data = [];

        foreach ($meta->fields as $field) {
            $value = $field->getValue($entity);
            $data[$field->name] = $field->cast($value);
        }

        // Nur IDs für Referenzen (nicht die ganzen Objekte)
        foreach ($meta->referenceOneFields as $refMeta) {
            $refValue = $refMeta->getValue($entity);
            if (is_object($refValue)) {
                $refEntityMeta = EntityMetadata::fromEntity($refValue);
                $data[$refMeta->name] = $refEntityMeta->idField 
                    ? $refEntityMeta->idField->getValue($refValue) 
                    : null;
            } else {
                $data[$refMeta->name] = $refValue;
            }
        }

        foreach ($meta->referenceManyFields as $refMeta) {
            $refValues = $refMeta->getValue($entity);
            if (is_array($refValues)) {
                $data[$refMeta->name] = array_map(function($item) {
                    if (is_object($item)) {
                        $refEntityMeta = EntityMetadata::fromEntity($item);
                        return $refEntityMeta->idField ? $refEntityMeta->idField->getValue($item) : null;
                    }
                    return $item;
                }, $refValues);
            } else {
                $data[$refMeta->name] = [];
            }
        }

        return $data;
    }

    /**
     * Serialisiert normale Felder (@Field).
     * @param array $data
     * @param object $entity
     * @param EntityMetadata $meta
     */
    private function serializeFields(array &$data, object $entity, EntityMetadata $meta): void
    {
        foreach ($meta->fields as $field) {
            $value = $field->getValue($entity);
            $data[$field->name] = $field->nullable && $value === null ? null : $field->cast($value);
        }
    }

    /**
     * Serialisiert ein eingebettetes Dokument (@ODM\EmbedOne).
     * @param array $data
     * @param object $entity
     * @param EntityMetadata $meta
     */
    private function serializeEmbedOne(array &$data, object $entity, EntityMetadata $meta): void
    {
        foreach ($meta->embedOneFields as $embedMeta) {
            $embedValue = $embedMeta->getValue($entity);
            $data[$embedMeta->name] = $embedValue !== null
                ? $this->serializeEntity($embedValue, EntityMetadata::fromEntity($embedValue))
                : null;
        }
    }

    /**
     * Serialisiert ein Array von eingebetteten Dokumenten (@ODM\EmbedMany).
     * @param array $data
     * @param object $entity
     * @param EntityMetadata $meta
     */
    private function serializeEmbedMany(array &$data, object $entity, EntityMetadata $meta): void
    {
        foreach ($meta->embedManyFields as $embedMeta) {
            $embedValues = $embedMeta->getValue($entity);
            $data[$embedMeta->name] = is_array($embedValues)
                ? array_map(
                    fn($item) => $item !== null
                        ? $this->serializeEntity($item, EntityMetadata::fromEntity($item))
                        : null,
                    $embedValues
                )
                : [];
        }
    }

    /**
     * Serialisiert eine Referenz auf ein Dokument (@ODM\ReferenceOne).
     * @param array $data
     * @param object $entity
     * @param EntityMetadata $meta
     */
    private function serializeReferenceOne(array &$data, object $entity, EntityMetadata $meta): void
    {
        foreach ($meta->referenceOneFields as $refMeta) {
            $refValue = $refMeta->getValue($entity);
            if (is_object($refValue)) {
                $refEntityMeta = EntityMetadata::fromEntity($refValue);
                $data[$refMeta->name] = $refEntityMeta->idField
                    ? $refEntityMeta->idField->getValue($refValue)
                    : null;
            } else {
                $data[$refMeta->name] = $refValue;
            }
        }
    }

    /**
     * Serialisiert ein Array von Referenzen auf Dokumente (@ODM\ReferenceMany).
     * @param array $data
     * @param object $entity
     * @param EntityMetadata $meta
     */
    private function serializeReferenceMany(array &$data, object $entity, EntityMetadata $meta): void
    {
        foreach ($meta->referenceManyFields as $refMeta) {
            $refValues = $refMeta->getValue($entity);
            if (is_array($refValues)) {
                $data[$refMeta->name] = array_map(function($item) {
                    if (is_object($item)) {
                        $refEntityMeta = EntityMetadata::fromEntity($item);
                        return $refEntityMeta->idField ? $refEntityMeta->idField->getValue($item) : null;
                    }
                    return $item;
                }, $refValues);
            } else {
                $data[$refMeta->name] = [];
            }
        }
    }

    /**
     * Deserialisiert Daten in ein Entity-Objekt.
     * @param object $entity
     * @param array $data
     * @param EntityMetadata $meta
     */
    public function deserializeEntity(object $entity, array $data, EntityMetadata $meta): void
    {
        // Normale Felder
        foreach ($meta->fields as $field) {
            if (array_key_exists($field->name, $data)) {
                $field->setValue($entity, $data[$field->name]);
            }
        }

        // ID-Feld
        if ($meta->idField && array_key_exists('_id', $data)) {
            $meta->idField->setValue($entity, $data['_id']);
        }

        // Referenzen (nur IDs setzen, keine vollständigen Objekte laden)
        foreach ($meta->referenceOneFields as $refMeta) {
            if (array_key_exists($refMeta->name, $data)) {
                $refMeta->setValue($entity, $data[$refMeta->name]);
            }
        }

        foreach ($meta->referenceManyFields as $refMeta) {
            if (array_key_exists($refMeta->name, $data)) {
                $refMeta->setValue($entity, $data[$refMeta->name]);
            }
        }
    }
}
