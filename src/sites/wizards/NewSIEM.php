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
#[Js('/template/js/wizards/wizards.js', '/template/js/wizards/siemwizard.js')]
class NewSIEM extends BaseSite
{
    public function prepare(): void 
    {
        $this->setTitle('Neues SIEM-System');
    }
    
    public function main(): string
    {
        return $this->renderWizard('siem');
    }
    
    public function create(array $data): array
    {
        $validator = new SchemaValidator();
        if (!$validator->validate($data, (new WizardSchemaBuilder())->buildSchema('siem'))) {
            return ['success' => false, 'errors' => $validator->getErrors()];
        }
        
        try {
            $siem = new DynamicDocument('siem');
            EntityHydrator::hydrate($siem, $data);
            $siem->createdat = new \DateTime();
            $siem->updatedat = new \DateTime();
            
            $this->persist($siem);
            $this->flush();
            
            return [
                'success' => true,
                'id' => $siem->uuid,
                'message' => 'SIEM-System erstellt',
                'data' => EntityHydrator::extract($siem)
            ];
        } catch (\Exception $e) {
            return ['success' => false, 'errors' => [$e->getMessage()]];
        }
    }
    
    public function update(string $id, array $data): array
    {
        $validator = new SchemaValidator();
        $schema = (new WizardSchemaBuilder())->buildSchema('siem');
        unset($schema['required']);
        
        if (!$validator->validate($data, $schema)) {
            return ['success' => false, 'errors' => $validator->getErrors()];
        }
        
        try {
            $siem = $this->findDynamic('siem', $id);
            
            if (!$siem) {
                return ['success' => false, 'errors' => ['SIEM-System nicht gefunden']];
            }
            
            EntityHydrator::hydrate($siem, $data);
            $siem->updatedat = new \DateTime();
            
            $this->flush();
            
            return [
                'success' => true,
                'id' => $id,
                'message' => 'SIEM-System aktualisiert',
                'data' => EntityHydrator::extract($siem)
            ];
        } catch (\Exception $e) {
            return ['success' => false, 'errors' => [$e->getMessage()]];
        }
    }
    
    public function delete(string $id): array
    {
        try {
            $siem = $this->findDynamic('siem', $id);
            
            if (!$siem) {
                return ['success' => false, 'errors' => ['SIEM-System nicht gefunden']];
            }
            
            $this->remove($siem);
            $this->flush();
            
            return ['success' => true, 'message' => 'SIEM-System gelöscht'];
        } catch (\Exception $e) {
            return ['success' => false, 'errors' => [$e->getMessage()]];
        }
    }
}
