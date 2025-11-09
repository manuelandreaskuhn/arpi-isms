<?php
namespace ARPI\Sites\Wizards;

use ARPI\Helper\BaseSite;
use ARPI\Entities\Annotations\Css;
use ARPI\Entities\Annotations\Js;
use ARPI\Helper\SchemaValidator;
use ARPI\Helper\ODM\EntityHydrator;
use ARPI\Schemas\TIInfrastructureSchema;
use ARPI\Entities\Documents\TIInfrastructure;

#[Css('/template/css/wizard.css', '/template/css/pages/assetmanagement.css')]
#[Js('/template/js/wizards/wizards.js', '/template/js/wizards/tiinfrastrukturwizard.js')]
class NewTIInfrastruktur extends BaseSite
{
    public function prepare(): void {}
    public function main(): string
    {
        return $this->renderTemplate('pages/wizards/komponenten/new-tiinfrastruktur.html');
    }
    
    public function create(array $data): array
    {
        $validator = new SchemaValidator();
        if (!$validator->validate($data, TIInfrastructureSchema::getSchema())) {
            return ['success' => false, 'errors' => $validator->getErrors()];
        }
        
        try {
            $ti = new TIInfrastructure();
            EntityHydrator::hydrate($ti, $data);
            $ti->createdat = new \DateTime();
            $ti->updatedat = new \DateTime();
            
            $this->persist($ti);
            $this->flush();
            
            return [
                'success' => true,
                'id' => $ti->uuid,
                'message' => 'TI-Infrastruktur erstellt',
                'data' => EntityHydrator::extract($ti)
            ];
        } catch (\Exception $e) {
            return ['success' => false, 'errors' => [$e->getMessage()]];
        }
    }
    
    public function update(string $id, array $data): array
    {
        $validator = new SchemaValidator();
        $schema = TIInfrastructureSchema::getSchema();
        unset($schema['required']);
        
        if (!$validator->validate($data, $schema)) {
            return ['success' => false, 'errors' => $validator->getErrors()];
        }
        
        try {
            $ti = $this->find(TIInfrastructure::class, $id);
            
            if (!$ti) {
                return ['success' => false, 'errors' => ['TI-Infrastruktur nicht gefunden']];
            }
            
            EntityHydrator::hydrate($ti, $data);
            $ti->updatedat = new \DateTime();
            
            $this->flush();
            
            return [
                'success' => true,
                'id' => $id,
                'message' => 'TI-Infrastruktur aktualisiert',
                'data' => EntityHydrator::extract($ti)
            ];
        } catch (\Exception $e) {
            return ['success' => false, 'errors' => [$e->getMessage()]];
        }
    }
    
    public function delete(string $id): array
    {
        try {
            $ti = $this->find(TIInfrastructure::class, $id);
            
            if (!$ti) {
                return ['success' => false, 'errors' => ['TI-Infrastruktur nicht gefunden']];
            }
            
            $this->remove($ti);
            $this->flush();
            
            return ['success' => true, 'message' => 'TI-Infrastruktur gelöscht'];
        } catch (\Exception $e) {
            return ['success' => false, 'errors' => [$e->getMessage()]];
        }
    }
}
