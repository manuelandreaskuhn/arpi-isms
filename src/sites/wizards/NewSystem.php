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
            $system->createdat = new \DateTime();
            $system->updatedat = new \DateTime();
            
            $this->persist($system);
            $this->flush();
            
            return [
                'success' => true,
                'id' => $system->id,
                'message' => 'System erfolgreich erstellt',
                'data' => EntityHydrator::extract($system)
            ];
        } catch (\Exception $e) {
            return ['success' => false, 'errors' => [$e->getMessage()]];
        }
    }
    
    public function update(string $id, array $data): array
    {
        $validator = new SchemaValidator();
        $schema = SystemSchema::getSchema();
        unset($schema['required']);
        
        if (!$validator->validate($data, $schema)) {
            return ['success' => false, 'errors' => $validator->getErrors()];
        }
        
        try {
            $system = $this->find(System::class, $id);
            
            if (!$system) {
                return ['success' => false, 'errors' => ['System nicht gefunden']];
            }
            
            EntityHydrator::hydrate($system, $data);
            $system->updatedAt = new \DateTime();
            
            $this->flush();
            
            return [
                'success' => true,
                'id' => $id,
                'message' => 'System aktualisiert',
                'data' => EntityHydrator::extract($system)
            ];
        } catch (\Exception $e) {
            return ['success' => false, 'errors' => [$e->getMessage()]];
        }
    }
    
    public function delete(string $id): array
    {
        try {
            $system = $this->find(System::class, $id);
            
            if (!$system) {
                return ['success' => false, 'errors' => ['System nicht gefunden']];
            }
            
            $this->remove($system);
            $this->flush();
            
            return ['success' => true, 'message' => 'System gelöscht'];
        } catch (\Exception $e) {
            return ['success' => false, 'errors' => [$e->getMessage()]];
        }
    }
}
