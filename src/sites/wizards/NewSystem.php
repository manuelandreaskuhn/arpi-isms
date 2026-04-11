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
#[Js('/template/js/wizards/wizards.js', '/template/js/wizards/systemwizard.js')]
class NewSystem extends BaseSite
{
    public function prepare(): void 
    {
        $this->setTitle('Neues System');
    }
    
    public function main(): string
    {
        return $this->renderWizard('system');
    }
    
    public function create(array $data): array
    {
        $validator = new SchemaValidator();
        if (!$validator->validate($data, (new WizardSchemaBuilder())->buildSchema('system'))) {
            return ['success' => false, 'errors' => $validator->getErrors()];
        }
        
        try {
            $system = new DynamicDocument('system');
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
        $schema = (new WizardSchemaBuilder())->buildSchema('system');
        unset($schema['required']);
        
        if (!$validator->validate($data, $schema)) {
            return ['success' => false, 'errors' => $validator->getErrors()];
        }
        
        try {
            $system = $this->findDynamic('system', $id);
            
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
            $system = $this->findDynamic('system', $id);
            
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
