<?php
namespace ARPI\Sites\Wizards;

use ARPI\Helper\BaseSite;
use ARPI\Entities\Annotations\Css;
use ARPI\Entities\Annotations\Js;
use ARPI\Helper\SchemaValidator;
use ARPI\Helper\ODM\EntityHydrator;
use ARPI\Schemas\SIEMSchema;
use ARPI\Entities\Documents\SIEMSystem;

#[Css('/template/css/wizard.css', '/template/css/pages/assetmanagement.css')]
#[Js('/template/js/wizards/wizards.js', '/template/js/wizards/siemwizard.js')]
class NewSIEM extends BaseSite
{
    public function prepare(): void {}
    public function main(): string
    {
        return $this->renderTemplate('pages/wizards/komponenten/new-siem.html');
    }
    
    public function create(array $data): array
    {
        $validator = new SchemaValidator();
        if (!$validator->validate($data, SIEMSchema::getSchema())) {
            return ['success' => false, 'errors' => $validator->getErrors()];
        }
        
        try {
            $siem = new SIEMSystem();
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
        $schema = SIEMSchema::getSchema();
        unset($schema['required']);
        
        if (!$validator->validate($data, $schema)) {
            return ['success' => false, 'errors' => $validator->getErrors()];
        }
        
        try {
            $siem = $this->find(SIEMSystem::class, $id);
            
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
            $siem = $this->find(SIEMSystem::class, $id);
            
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
