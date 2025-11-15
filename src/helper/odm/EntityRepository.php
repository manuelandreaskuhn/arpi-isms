<?php
namespace ARPI\Helper\ODM;

use ARPI\Helper\ODM\Exception\UnitOfWorkException;
use ARPI\Helper\ODM\Exception\ConnectionException;
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
    private string $uri;
    private string $dbName;

    /**
     * Erstellt eine neue EntityRepository Instanz.
     * @param string $uri MongoDB URI
     * @param string $dbName Name der Datenbank
     * @param bool $verifyConnection Ob die Verbindung sofort getestet werden soll (Standard: true)
     * @throws ConnectionException wenn Verbindung fehlschlägt
     */
    public function __construct(string $uri, string $dbName, bool $verifyConnection = true)
    {
        $this->uri = $uri;
        $this->dbName = $dbName;
        $this->client = new Client($uri);
        $this->db = $this->client->selectDatabase($dbName);
        $this->serializer = new EntitySerializer();

        // Verbindung sofort testen
        if ($verifyConnection) {
            $this->verifyConnection();
        }
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

        // ID immer zurücksetzen nach Insert
        if ($meta->idField) {
            $insertedId = $result->getInsertedId();
            $meta->idField->setValue($entity, $insertedId);
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

    /**
     * Prüft ob die MongoDB-Instanz Transaktionen unterstützt (Replica Set erforderlich).
     */
    public function supportsTransactions(): bool
    {
        try {
            $result = $this->db->command(['isMaster' => 1]);
            $isMaster = $result->toArray()[0];
            
            // Prüfe ob es ein Replica Set Member oder Mongos ist
            return isset($isMaster->setName) || isset($isMaster->msg) && $isMaster->msg === 'isdbgrid';
        } catch (\Exception $e) {
            return false;
        }
    }

    /**
     * Verifiziert die MongoDB-Verbindung durch einen Ping.
     * @throws ConnectionException wenn Verbindung fehlschlägt
     */
    private function verifyConnection(): void
    {
        try {
            // Führe einen einfachen Ping-Befehl aus
            $this->db->command(['ping' => 1]);
        } 
        catch (\MongoDB\Driver\Exception\AuthenticationException $e) {
            throw new ConnectionException(
                "MongoDB Authentication failed.",
                $this->uri,
                $this->dbName,
                0,
                $e
            );
        } 
        catch (\MongoDB\Driver\Exception\ConnectionException $e) {
            throw new ConnectionException(
                "Cannot connect to MongoDB server.\n" .
                "Is MongoDB running? Check with: docker-compose ps",
                $this->uri,
                $this->dbName,
                0,
                $e
            );
        } 
        catch (\Exception $e) {
            throw new ConnectionException(
                "MongoDB connection verification failed: " . $e->getMessage(),
                $this->uri,
                $this->dbName,
                0,
                $e
            );
        }
    }
}