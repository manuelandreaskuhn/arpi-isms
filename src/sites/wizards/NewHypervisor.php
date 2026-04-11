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
#[Js('/template/js/wizards/wizards.js', '/template/js/wizards/hypervisorwizard.js')]
class NewHypervisor extends BaseSite
{
    public function prepare(): void 
    {
        $this->setTitle('Neuer Hypervisor');
    }

    public function main(): string
    {
        return $this->renderWizard('hypervisor');
    }
    
    public function create(array $data): array
    {
        $validator = new SchemaValidator();
        if (!$validator->validate($data, (new WizardSchemaBuilder())->buildSchema('hypervisor'))) {
            return ['success' => false, 'errors' => $validator->getErrors()];
        }
        
        try {
            $hypervisor = new DynamicDocument('hypervisor');
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
        $schema = (new WizardSchemaBuilder())->buildSchema('hypervisor');
        unset($schema['required']);
        
        if (!$validator->validate($data, $schema)) {
            return ['success' => false, 'errors' => $validator->getErrors()];
        }
        
        try {
            $hypervisor = $this->findDynamic('hypervisor', $id);
            
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
            $hypervisor = $this->findDynamic('hypervisor', $id);
            
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
