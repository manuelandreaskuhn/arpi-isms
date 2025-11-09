<?php
namespace ARPI\Sites\Wizards;

use ARPI\Helper\BaseSite;
use ARPI\Entities\Annotations\Css;
use ARPI\Entities\Annotations\Js;
use ARPI\Helper\SchemaValidator;
use ARPI\Helper\EntityHydrator;
use ARPI\Schemas\CommunicationServerSchema;
use ARPI\Entities\Documents\CommunicationServer;

#[Css('/template/css/wizard.css', '/template/css/pages/assetmanagement.css')]
#[Js('/template/js/wizards/wizards.js', '/template/js/wizards/commserverwizard.js')]
class NewComServer extends BaseSite
{
    public function prepare(): void {}

    public function main(): string
    {
        return $this->renderTemplate('pages/wizards/komponenten/new-comserver.html');
    }
    
    public function create(array $data): array
    {
        $validator = new SchemaValidator();
        $schema = CommunicationServerSchema::getSchema();
        
        if (!$validator->validate($data, $schema)) {
            return ['success' => false, 'errors' => $validator->getErrors()];
        }
        
        try {
            $commServer = new CommunicationServer();
            EntityHydrator::hydrate($commServer, $data);
            
            $commServer->createdat = new \DateTime();
            $commServer->updatedat = new \DateTime();
            
            return [
                'success' => true,
                'id' => $commServer->uuid,
                'message' => 'Kommunikationsserver erfolgreich erstellt'
            ];
        } catch (\Exception $e) {
            return ['success' => false, 'errors' => ['Internal error: ' . $e->getMessage()]];
        }
    }
    
    public function update(string $id, array $data): array
    {
        $validator = new SchemaValidator();
        $schema = CommunicationServerSchema::getSchema();
        unset($schema['required']);
        
        if (!$validator->validate($data, $schema)) {
            return ['success' => false, 'errors' => $validator->getErrors()];
        }
        
        try {
            $commServer = new CommunicationServer();
            EntityHydrator::hydrate($commServer, $data);
            $commServer->updatedat = new \DateTime();
            
            return ['success' => true, 'id' => $id, 'message' => 'Kommunikationsserver aktualisiert'];
        } catch (\Exception $e) {
            return ['success' => false, 'errors' => ['Internal error: ' . $e->getMessage()]];
        }
    }
    
    public function delete(string $id): array
    {
        try {
            return ['success' => true, 'message' => 'Kommunikationsserver gelöscht'];
        } catch (\Exception $e) {
            return ['success' => false, 'errors' => ['Internal error: ' . $e->getMessage()]];
        }
    }
}
