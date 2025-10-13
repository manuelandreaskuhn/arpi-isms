<?php
namespace ARPI\Helper\ODM;

use ARPI\Helper\ODM\Exception\UnitOfWorkException;
use MongoDB\Client;
use MongoDB\Driver\Session;
use MongoDB\BSON\ObjectId;

/**
 * EntityRepository ist ein schlankes Object Document Mapper für MongoDB.
 * Es serialisiert PHP-Objekte mit Annotationen in MongoDB-Dokumente.
 */
class EntityRepository
{
    private Client $client;
    private $db;
    private ?UnitOfWork $unitOfWork = null;
    private EntitySerializer $serializer;

    /**
     * Erstellt eine neue EntityRepository Instanz.
     * @param string $uri MongoDB URI
     * @param string $dbName Name der Datenbank
     */
    public function __construct(string $uri, string $dbName)
    {
        $this->client = new Client($uri);
        $this->db = $this->client->selectDatabase($dbName);
        $this->serializer = new EntitySerializer();
    }    

    /**
     * Gibt den MongoDB Client zurück.
     */
    public function getClient(): Client
    {
        return $this->client;
    }

    /**
     * Gibt den EntitySerializer zurück.
     */
    public function getSerializer(): EntitySerializer
    {
        return $this->serializer;
    }

    /**
     * Setzt die aktuelle Unit of Work.
     */
    public function setUnitOfWork(UnitOfWork $unitOfWork): void
    {
        $this->unitOfWork = $unitOfWork;
    }

    /**
     * Speichert ein Entity-Objekt in der zugehörigen MongoDB-Collection.
     * @param object $entity
     * @return \MongoDB\InsertOneResult
     */
    public function save(object $entity)
    {
        $meta = EntityMetadata::fromEntity($entity);
        $collection = $this->db->selectCollection($meta->collection);

        $data = $this->serializer->serializeEntity($entity, $meta);

        return $collection->insertOne($data);
    }

    /**
     * Fügt ein Entity in die Datenbank ein (mit optionaler Session).
     */
    public function insert(object $entity, ?Session $session = null): \MongoDB\InsertOneResult
    {
        $meta = EntityMetadata::fromEntity($entity);
        $collection = $this->db->selectCollection($meta->collection);

        $data = $this->serializer->serializeEntity($entity, $meta);
        
        $options = $session ? ['session' => $session] : [];
        $result = $collection->insertOne($data, $options);

        // ID zurücksetzen, falls generiert
        if ($meta->idField && !$meta->idField->getValue($entity)) {
            $meta->idField->setValue($entity, $result->getInsertedId());
        }

        return $result;
    }

    /**
     * Aktualisiert ein Entity in der Datenbank (mit optionaler Session).
     */
    public function update(object $entity, ?Session $session = null): \MongoDB\UpdateResult
    {
        $meta = EntityMetadata::fromEntity($entity);
        $collection = $this->db->selectCollection($meta->collection);

        if (!$meta->idField) {
            throw new UnitOfWorkException("Cannot update entity without ID field");
        }

        $id = $meta->idField->getValue($entity);
        if (!$id) {
            throw new UnitOfWorkException("Cannot update entity with null ID");
        }

        $data = $this->serializer->serializeEntity($entity, $meta);
        unset($data['_id']); // ID nicht in Update-Daten

        $options = $session ? ['session' => $session] : [];
        return $collection->updateOne(['_id' => $id], ['$set' => $data], $options);
    }

    /**
     * Löscht ein Entity aus der Datenbank (mit optionaler Session).
     */
    public function delete(object $entity, ?Session $session = null): \MongoDB\DeleteResult
    {
        $meta = EntityMetadata::fromEntity($entity);
        $collection = $this->db->selectCollection($meta->collection);

        if (!$meta->idField) {
            throw new UnitOfWorkException("Cannot delete entity without ID field");
        }

        $id = $meta->idField->getValue($entity);
        if (!$id) {
            throw new UnitOfWorkException("Cannot delete entity with null ID");
        }

        $options = $session ? ['session' => $session] : [];
        return $collection->deleteOne(['_id' => $id], $options);
    }

    /**
     * Lädt ein Entity anhand seiner ID.
     */
    public function find(string $entityClass, $id): ?object
    {
        $entity = new $entityClass();
        $meta = EntityMetadata::fromEntity($entity);
        $collection = $this->db->selectCollection($meta->collection);

        $document = $collection->findOne(['_id' => $id instanceof ObjectId ? $id : new ObjectId($id)]);
        
        if (!$document) {
            return null;
        }

        $this->serializer->deserializeEntity($entity, $document->toArray(), $meta);
        
        // In Unit of Work registrieren, falls vorhanden
        if ($this->unitOfWork) {
            $this->unitOfWork->attach($entity);
        }

        return $entity;
    }
}