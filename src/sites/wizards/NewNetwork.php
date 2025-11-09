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
            
            return ['success' => true, 'id' => $network->uuid, 'message' => 'Netzwerk erstellt'];
        } catch (\Exception $e) {
            return ['success' => false, 'errors' => [$e->getMessage()]];
        }
    }
    
    public function update(string $id, array $data): array
    {
        return ['success' => true, 'id' => $id];
    }
    
    public function delete(string $id): array
    {
        return ['success' => true];
    }
}
