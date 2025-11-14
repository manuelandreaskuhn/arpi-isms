<?php
namespace ARPI\Sites\Wizards;

use ARPI\Helper\BaseSite;
use ARPI\Entities\Annotations\Css;
use ARPI\Entities\Annotations\Js;
use ARPI\Helper\SchemaValidator;
use ARPI\Helper\ODM\EntityHydrator;
use ARPI\Schemas\BackupSystemSchema;
use ARPI\Entities\Documents\BackupSystem;

#[Css('/template/css/wizard.css', '/template/css/pages/assetmanagement.css')]
#[Js('/template/js/wizards/wizards.js', '/template/js/wizards/backupwizard.js')]
class NewBackup extends BaseSite
{
    public function prepare(): void
    {
        // Keine spezielle Vorbereitung nötig
    }

    public function main(): string
    {
        return $this->renderTemplate('pages/wizards/komponenten/new-backup.html');
    }
    
    /**
     * Erstellt ein neues Backup-System
     * 
     * @param array $data JSON-Daten vom Client
     * @return array Response mit Status und Daten
     */
    public function create(array $data): array
    {
        // 1. Schema validieren
        $validator = new SchemaValidator();
        $schema = BackupSystemSchema::getSchema();
        
        if (!$validator->validate($data, $schema)) {
            return [
                'success' => false,
                'errors' => $validator->getErrors()
            ];
        }
        
        // 2. Entity erstellen
        $backupSystem = new BackupSystem();
        
        // 3. Daten hydratieren
        try {
            EntityHydrator::hydrate($backupSystem, $data);
            
            // 4. Zeitstempel setzen
            $backupSystem->createdat = new \DateTime();
            $backupSystem->updatedat = new \DateTime();
            
            // 5. In Datenbank speichern
            $this->persist($backupSystem);
            $this->flush();
            
            // 6. Erfolgs-Response
            return [
                'success' => true,
                'id' => $backupSystem->uuid,
                'message' => 'Backup-System erfolgreich erstellt',
                'data' => EntityHydrator::extract($backupSystem)
            ];
            
        } catch (\Exception $e) {
            return [
                'success' => false,
                'errors' => ['Internal error: ' . $e->getMessage()]
            ];
        }
    }
    
    /**
     * Aktualisiert ein bestehendes Backup-System
     * 
     * @param string $id UUID des Backup-Systems
     * @param array $data Aktualisierte Daten
     * @return array Response mit Status
     */
    public function update(string $id, array $data): array
    {
        // 1. Schema validieren
        $validator = new SchemaValidator();
        $schema = BackupSystemSchema::getSchema();
        
        // Für Update sind nicht alle Felder required
        $updateSchema = $schema;
        unset($updateSchema['required']);
        
        if (!$validator->validate($data, $updateSchema)) {
            return [
                'success' => false,
                'errors' => $validator->getErrors()
            ];
        }
        
        try {
            // 2. Backup-System aus DB laden
            $backupSystem = $this->find(BackupSystem::class, $id);
            
            if (!$backupSystem) {
                return [
                    'success' => false,
                    'errors' => ['Backup-System nicht gefunden']
                ];
            }
            
            // 3. Daten hydratieren
            EntityHydrator::hydrate($backupSystem, $data);
            
            // 4. Zeitstempel aktualisieren
            $backupSystem->updatedat = new \DateTime();
            
            // 5. Speichern
            $this->flush();
            
            return [
                'success' => true,
                'id' => $id,
                'message' => 'Backup-System erfolgreich aktualisiert',
                'data' => EntityHydrator::extract($backupSystem)
            ];
            
        } catch (\Exception $e) {
            return [
                'success' => false,
                'errors' => ['Internal error: ' . $e->getMessage()]
            ];
        }
    }
    
    /**
     * Löscht ein Backup-System
     * 
     * @param string $id UUID des Backup-Systems
     * @return array Response mit Status
     */
    public function delete(string $id): array
    {
        try {
            // Backup-System aus DB laden
            $backupSystem = $this->find(BackupSystem::class, $id);
            
            if (!$backupSystem) {
                return [
                    'success' => false,
                    'errors' => ['Backup-System nicht gefunden']
                ];
            }
            
            $this->remove($backupSystem);
            $this->flush();
            
            return [
                'success' => true,
                'message' => 'Backup-System erfolgreich gelöscht'
            ];
            
        } catch (\Exception $e) {
            return [
                'success' => false,
                'errors' => ['Internal error: ' . $e->getMessage()]
            ];
        }
    }
}
