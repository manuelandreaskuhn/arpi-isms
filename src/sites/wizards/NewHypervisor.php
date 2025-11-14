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
            
            $this->persist($hypervisor);
            $this->flush();
            
            return [
                'success' => true,
                'id' => $hypervisor->uuid,
                'message' => 'Hypervisor erstellt',
                'data' => EntityHydrator::extract($hypervisor)
            ];
        } catch (\Exception $e) {
            return ['success' => false, 'errors' => [$e->getMessage()]];
        }
    }
    
    public function update(string $id, array $data): array
    {
        $validator = new SchemaValidator();
        $schema = HypervisorSchema::getSchema();
        unset($schema['required']);
        
        if (!$validator->validate($data, $schema)) {
            return ['success' => false, 'errors' => $validator->getErrors()];
        }
        
        try {
            $hypervisor = $this->find(Hypervisor::class, $id);
            
            if (!$hypervisor) {
                return ['success' => false, 'errors' => ['Hypervisor nicht gefunden']];
            }
            
            EntityHydrator::hydrate($hypervisor, $data);
            $hypervisor->updatedat = new \DateTime();
            
            $this->flush();
            
            return [
                'success' => true,
                'id' => $id,
                'message' => 'Hypervisor aktualisiert',
                'data' => EntityHydrator::extract($hypervisor)
            ];
        } catch (\Exception $e) {
            return ['success' => false, 'errors' => [$e->getMessage()]];
        }
    }
    
    public function delete(string $id): array
    {
        try {
            $hypervisor = $this->find(Hypervisor::class, $id);
            
            if (!$hypervisor) {
                return ['success' => false, 'errors' => ['Hypervisor nicht gefunden']];
            }
            
            $this->remove($hypervisor);
            $this->flush();
            
            return ['success' => true, 'message' => 'Hypervisor gelöscht'];
        } catch (\Exception $e) {
            return ['success' => false, 'errors' => [$e->getMessage()]];
        }
    }
}
