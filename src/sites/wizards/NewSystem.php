<?php
namespace ARPI\Sites\Wizards;

use ARPI\Helper\BaseSite;
use ARPI\Entities\Annotations\Css;
use ARPI\Entities\Annotations\Js;
use ARPI\Helper\SchemaValidator;
use ARPI\Helper\ODM\EntityHydrator;
use ARPI\Schemas\SystemSchema;
use ARPI\Entities\Documents\System;

#[Css('/template/css/wizard.css', '/template/css/pages/assetmanagement.css')]
#[Js('/template/js/wizards/wizards.js', '/template/js/wizards/systemwizard.js')]
class NewSystem extends BaseSite
{
    public function prepare(): void {}
    public function main(): string
    {
        return $this->renderTemplate('pages/wizards/system/new-system.html');
    }
    
    public function create(array $data): array
    {
        $validator = new SchemaValidator();
        if (!$validator->validate($data, SystemSchema::getSchema())) {
            return ['success' => false, 'errors' => $validator->getErrors()];
        }
        
        try {
            $system = new System();
            EntityHydrator::hydrate($system, $data);
            $system->createdAt = new \DateTime();
            $system->updatedAt = new \DateTime();
            
            return ['success' => true, 'id' => $system->id, 'message' => 'System erfolgreich erstellt'];
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
