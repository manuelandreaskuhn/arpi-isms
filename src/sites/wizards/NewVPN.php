<?php
namespace ARPI\Sites\Wizards;

use ARPI\Helper\BaseSite;
use ARPI\Entities\Annotations\Css;
use ARPI\Entities\Annotations\Js;
use ARPI\Helper\SchemaValidator;
use ARPI\Helper\ODM\EntityHydrator;
use ARPI\Helper\WizardSchemaBuilder;
use ARPI\Helper\ODM\DynamicDocument;

#[Css('/template/css/wizard.css', '/template/css/pages/assetmanagement.css')]
#[Js('/template/js/wizards/wizards.js', '/template/js/wizards/vpnwizard.js')]
class NewVPN extends BaseSite
{
    public function prepare(): void
    {
        $this->setTitle('Neues VPN-System');
    }

    public function main(): string
    {
        return $this->renderWizard('vpn');
    }
    
    /**
     * Erstellt ein neues VPN-System
     * 
     * @param array $data JSON-Daten vom Client
     * @return array Response mit Status und Daten
     */
    public function create(array $data): array
    {
        // 1. Schema validieren
        $validator = new SchemaValidator();
        $schema = (new WizardSchemaBuilder())->buildSchema('vpn');
        
        if (!$validator->validate($data, $schema)) {
            return [
                'success' => false,
                'errors' => $validator->getErrors()
            ];
        }
        
        // 2. Entity erstellen
        $vpn = new DynamicDocument('vpn');
        
        // 3. Daten hydratieren
        try {
            EntityHydrator::hydrate($vpn, $data);
            
            // 4. Zeitstempel setzen
            $vpn->createdat = new \DateTime();
            $vpn->updatedat = new \DateTime();
            
            // 5. In Datenbank speichern
            $this->persist($vpn);
            $this->flush();
            
            // 6. Erfolgs-Response
            return [
                'success' => true,
                'id' => $vpn->uuid,
                'message' => 'VPN-System erfolgreich erstellt',
                'data' => EntityHydrator::extract($vpn)
            ];
            
        } catch (\Exception $e) {
            return [
                'success' => false,
                'errors' => ['Internal error: ' . $e->getMessage()]
            ];
        }
    }
    
    /**
     * Aktualisiert ein bestehendes VPN-System
     * 
     * @param string $id UUID des VPN-Systems
     * @param array $data Aktualisierte Daten
     * @return array Response mit Status
     */
    public function update(string $id, array $data): array
    {
        // 1. Schema validieren
        $validator = new SchemaValidator();
        $schema = (new WizardSchemaBuilder())->buildSchema('vpn');
        
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
            // 2. VPN-System aus DB laden
            $vpn = $this->findDynamic('vpn', $id);
            
            if (!$vpn) {
                return [
                    'success' => false,
                    'errors' => ['VPN-System nicht gefunden']
                ];
            }
            
            // 3. Daten hydratieren
            EntityHydrator::hydrate($vpn, $data);
            
            // 4. Zeitstempel aktualisieren
            $vpn->updatedat = new \DateTime();
            
            // 5. Speichern
            $this->flush();
            
            return [
                'success' => true,
                'id' => $id,
                'message' => 'VPN-System erfolgreich aktualisiert',
                'data' => EntityHydrator::extract($vpn)
            ];
            
        } catch (\Exception $e) {
            return [
                'success' => false,
                'errors' => ['Internal error: ' . $e->getMessage()]
            ];
        }
    }
    
    /**
     * Löscht ein VPN-System
     * 
     * @param string $id UUID des VPN-Systems
     * @return array Response mit Status
     */
    public function delete(string $id): array
    {
        try {
            // VPN-System aus DB laden
            $vpn = $this->findDynamic('vpn', $id);
            
            if (!$vpn) {
                return [
                    'success' => false,
                    'errors' => ['VPN-System nicht gefunden']
                ];
            }
            
            $this->remove($vpn);
            $this->flush();
            
            return [
                'success' => true,
                'message' => 'VPN-System erfolgreich gelöscht'
            ];
            
        } catch (\Exception $e) {
            return [
                'success' => false,
                'errors' => ['Internal error: ' . $e->getMessage()]
            ];
        }
    }
}
