<?php
namespace ARPI\Sites\Wizards;

use ARPI\Helper\BaseSite;
use ARPI\Entities\Annotations\Css;
use ARPI\Entities\Annotations\Js;
use ARPI\Helper\SchemaValidator;
use ARPI\Helper\ODM\EntityHydrator;
use ARPI\Schemas\NetworkSchema;
use ARPI\Entities\Documents\Network;

#[Css('/template/css/wizard.css', '/template/css/pages/assetmanagement.css')]
#[Js('/template/js/wizards/wizards.js', '/template/js/wizards/networkwizard.js')]
class NewNetwork extends BaseSite
{
    public function prepare(): void {}
    public function main(): string
    {
        return $this->renderTemplate('pages/wizards/komponenten/new-network.html');
    }
    
    public function create(array $data): array
    {
        $validator = new SchemaValidator();
        if (!$validator->validate($data, NetworkSchema::getSchema())) {
            return ['success' => false, 'errors' => $validator->getErrors()];
        }
        
        try {
            $network = new Network();
            EntityHydrator::hydrate($network, $data);
            $network->createdat = new \DateTime();
            $network->updatedat = new \DateTime();
            
            $this->persist($network);
            $this->flush();
            
            return [
                'success' => true,
                'id' => $network->uuid,
                'message' => 'Netzwerk erstellt',
                'data' => EntityHydrator::extract($network)
            ];
        } catch (\Exception $e) {
            return ['success' => false, 'errors' => [$e->getMessage()]];
        }
    }
    
    public function update(string $id, array $data): array
    {
        $validator = new SchemaValidator();
        $schema = NetworkSchema::getSchema();
        unset($schema['required']);
        
        if (!$validator->validate($data, $schema)) {
            return ['success' => false, 'errors' => $validator->getErrors()];
        }
        
        try {
            $network = $this->find(Network::class, $id);
            
            if (!$network) {
                return ['success' => false, 'errors' => ['Netzwerk nicht gefunden']];
            }
            
            EntityHydrator::hydrate($network, $data);
            $network->updatedat = new \DateTime();
            
            $this->flush();
            
            return [
                'success' => true,
                'id' => $id,
                'message' => 'Netzwerk aktualisiert',
                'data' => EntityHydrator::extract($network)
            ];
        } catch (\Exception $e) {
            return ['success' => false, 'errors' => [$e->getMessage()]];
        }
    }
    
    public function delete(string $id): array
    {
        try {
            $network = $this->find(Network::class, $id);
            
            if (!$network) {
                return ['success' => false, 'errors' => ['Netzwerk nicht gefunden']];
            }
            
            $this->remove($network);
            $this->flush();
            
            return ['success' => true, 'message' => 'Netzwerk gelöscht'];
        } catch (\Exception $e) {
            return ['success' => false, 'errors' => [$e->getMessage()]];
        }
    }
}
