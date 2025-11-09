<?php
namespace ARPI\Sites\Wizards;

use ARPI\Helper\BaseSite;
use ARPI\Entities\Annotations\Css;
use ARPI\Entities\Annotations\Js;
use ARPI\Helper\SchemaValidator;
use ARPI\Helper\ODM\EntityHydrator;
use ARPI\Schemas\FirewallSchema;
use ARPI\Entities\Documents\Firewall;

#[Css('/template/css/wizard.css', '/template/css/pages/assetmanagement.css')]
#[Js('/template/js/wizards/wizards.js', '/template/js/wizards/firewallwizard.js')]
class NewFirewall extends BaseSite
{
    public function prepare(): void {}

    public function main(): string
    {
        return $this->renderTemplate('pages/wizards/komponenten/new-firewall.html');
    }
    
    public function create(array $data): array
    {
        $validator = new SchemaValidator();
        $schema = FirewallSchema::getSchema();
        
        if (!$validator->validate($data, $schema)) {
            return ['success' => false, 'errors' => $validator->getErrors()];
        }
        
        try {
            $firewall = new Firewall();
            EntityHydrator::hydrate($firewall, $data);
            
            $firewall->createdat = new \DateTime();
            $firewall->updatedat = new \DateTime();
            
            // TODO: DocumentManager persist & flush
            
            return [
                'success' => true,
                'id' => $firewall->uuid,
                'message' => 'Firewall erfolgreich erstellt'
            ];
        } catch (\Exception $e) {
            return ['success' => false, 'errors' => ['Internal error: ' . $e->getMessage()]];
        }
    }
    
    public function update(string $id, array $data): array
    {
        $validator = new SchemaValidator();
        $schema = FirewallSchema::getSchema();
        unset($schema['required']);
        
        if (!$validator->validate($data, $schema)) {
            return ['success' => false, 'errors' => $validator->getErrors()];
        }
        
        try {
            // TODO: Load from DB
            $firewall = new Firewall();
            EntityHydrator::hydrate($firewall, $data);
            $firewall->updatedat = new \DateTime();
            
            return ['success' => true, 'id' => $id, 'message' => 'Firewall erfolgreich aktualisiert'];
        } catch (\Exception $e) {
            return ['success' => false, 'errors' => ['Internal error: ' . $e->getMessage()]];
        }
    }
    
    public function delete(string $id): array
    {
        try {
            // TODO: DocumentManager remove & flush
            return ['success' => true, 'message' => 'Firewall erfolgreich gelöscht'];
        } catch (\Exception $e) {
            return ['success' => false, 'errors' => ['Internal error: ' . $e->getMessage()]];
        }
    }
}
