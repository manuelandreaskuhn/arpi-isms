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
            
            return ['success' => true, 'id' => $siem->uuid, 'message' => 'SIEM-System erstellt'];
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
