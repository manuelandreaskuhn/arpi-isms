<?php

namespace ARPI\Helper\ODM;

use ARPI\Helper\ConfigLoader;
use MongoDB\BSON\ObjectId;

/**
 * DynamicDocument ist ein generisches Dokument-Objekt, dessen Struktur
 * zur Laufzeit aus einer Wizard-JSON-Konfiguration abgeleitet wird.
 *
 * Es ersetzt statische Entity-Klassen (z.B. Firewall.php) für alle
 * Wizard-gesteuerten Entitäten. Statische Entitäten (User, Customer etc.)
 * bleiben davon unberührt.
 *
 * Verwendung:
 *   $doc = new DynamicDocument('firewall');
 *   $doc->name = 'FW-01';
 *   $doc->managementip = '10.0.0.1';
 *   EntityHydrator::hydrate($doc, $formData);
 */
class DynamicDocument
{
    /** MongoDB ObjectId (ID-Feld) */
    public ?ObjectId $id = null;

    /** Interne Felddaten */
    private array $data = [];

    /** Wizard-ID (z.B. "firewall") */
    private string $wizardId;

    /** Name der MongoDB-Collection */
    private string $collectionName;

    /** UUID-Präfix für neue Dokumente */
    private string $uuidPrefix;

    /**
     * @param string $wizardId  Wizard-ID wie in den JSON-Configs definiert (z.B. "firewall")
     */
    public function __construct(string $wizardId)
    {
        $config = ConfigLoader::getInstance()->getWizardConfig($wizardId);

        $this->wizardId      = $wizardId;
        $this->collectionName = $config['collection']   ?? $wizardId . 's';
        $this->uuidPrefix    = $config['uuid_prefix']  ?? $wizardId . '_';
        $this->id            = new ObjectId();

        // UUID automatisch setzen
        $this->data['uuid'] = uniqid($this->uuidPrefix, true);
    }

    // -------------------------------------------------------------------------
    // Magic property access (alle Felder außer id)
    // -------------------------------------------------------------------------

    public function __get(string $name)
    {
        return $this->data[$name] ?? null;
    }

    public function __set(string $name, $value): void
    {
        $this->data[$name] = $value;
    }

    public function __isset(string $name): bool
    {
        return isset($this->data[$name]);
    }

    public function __unset(string $name): void
    {
        unset($this->data[$name]);
    }

    // -------------------------------------------------------------------------
    // Metadaten-Zugriff für ODM
    // -------------------------------------------------------------------------

    public function getWizardId(): string
    {
        return $this->wizardId;
    }

    public function getCollectionName(): string
    {
        return $this->collectionName;
    }

    /**
     * Gibt alle Felddaten (ohne id) als Array zurück.
     */
    public function toArray(): array
    {
        return $this->data;
    }
}
