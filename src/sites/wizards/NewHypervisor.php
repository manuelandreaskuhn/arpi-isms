<?php
namespace ARPI\Sites\Wizards;

use ARPI\Helper\BaseSite;
use ARPI\Entities\Annotations\Css;
use ARPI\Entities\Annotations\Js;
use ARPI\Helper\SchemaValidator;
use ARPI\Helper\ODM\EntityHydrator;
use ARPI\Schemas\HypervisorSchema;
use ARPI\Entities\Documents\Hypervisor;

#[Css('/template/css/wizard.css', '/template/css/pages/assetmanagement.css')]
#[Js('/template/js/wizards/wizards.js', '/template/js/wizards/hypervisorwizard.js')]
class NewHypervisor extends BaseSite
{
    public function prepare(): void {}
    public function main(): string
    {
        return $this->renderTemplate('pages/wizards/komponenten/new-hypervisor.html');
    }
    
    public function create(array $data): array
    {
        $validator = new SchemaValidator();
        if (!$validator->validate($data, HypervisorSchema::getSchema())) {
            return ['success' => false, 'errors' => $validator->getErrors()];
        }
        
        try {
            $hypervisor = new Hypervisor();
            EntityHydrator::hydrate($hypervisor, $data);
            $hypervisor->createdat = new \DateTime();
            $hypervisor->updatedat = new \DateTime();
            
            return ['success' => true, 'id' => $hypervisor->uuid, 'message' => 'Hypervisor erstellt'];
        } catch (\Exception $e) {
            return ['success' => false, 'errors' => [$e->getMessage()]];
        }
    }
    
    public function update(string $id, array $data): array
    {
        // ...existing pattern...
        return ['success' => true, 'id' => $id];
    }
    
    public function delete(string $id): array
    {
        return ['success' => true];
    }
}
