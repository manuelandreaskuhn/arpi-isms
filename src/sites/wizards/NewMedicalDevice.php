<?php
namespace ARPI\Sites\Wizards;

use ARPI\Helper\BaseSite;
use ARPI\Entities\Annotations\Css;
use ARPI\Entities\Annotations\Js;
use ARPI\Helper\SchemaValidator;
use ARPI\Helper\ODM\EntityHydrator;
use ARPI\Schemas\MedicalDeviceSchema;
use ARPI\Entities\Documents\MedicalDevice;

#[Css('/template/css/wizard.css', '/template/css/pages/assetmanagement.css')]
#[Js('/template/js/wizards/wizards.js', '/template/js/wizards/medicaldevicewizard.js')]
class NewMedicalDevice extends BaseSite
{
    public function prepare(): void {}
    public function main(): string
    {
        return $this->renderTemplate('pages/wizards/komponenten/new-medicaldevice.html');
    }
    
    public function create(array $data): array
    {
        $validator = new SchemaValidator();
        if (!$validator->validate($data, MedicalDeviceSchema::getSchema())) {
            return ['success' => false, 'errors' => $validator->getErrors()];
        }
        
        try {
            $device = new MedicalDevice();
            EntityHydrator::hydrate($device, $data);
            $device->createdat = new \DateTime();
            $device->updatedat = new \DateTime();
            
            return ['success' => true, 'id' => $device->uuid, 'message' => 'Medizingerät erstellt'];
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
