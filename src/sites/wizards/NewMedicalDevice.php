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
            
            $this->persist($device);
            $this->flush();
            
            return [
                'success' => true,
                'id' => $device->uuid,
                'message' => 'Medizingerät erstellt',
                'data' => EntityHydrator::extract($device)
            ];
        } catch (\Exception $e) {
            return ['success' => false, 'errors' => [$e->getMessage()]];
        }
    }
    
    public function update(string $id, array $data): array
    {
        $validator = new SchemaValidator();
        $schema = MedicalDeviceSchema::getSchema();
        unset($schema['required']);
        
        if (!$validator->validate($data, $schema)) {
            return ['success' => false, 'errors' => $validator->getErrors()];
        }
        
        try {
            $device = $this->find(MedicalDevice::class, $id);
            
            if (!$device) {
                return ['success' => false, 'errors' => ['Medizingerät nicht gefunden']];
            }
            
            EntityHydrator::hydrate($device, $data);
            $device->updatedat = new \DateTime();
            
            $this->flush();
            
            return [
                'success' => true,
                'id' => $id,
                'message' => 'Medizingerät aktualisiert',
                'data' => EntityHydrator::extract($device)
            ];
        } catch (\Exception $e) {
            return ['success' => false, 'errors' => [$e->getMessage()]];
        }
    }
    
    public function delete(string $id): array
    {
        try {
            $device = $this->find(MedicalDevice::class, $id);
            
            if (!$device) {
                return ['success' => false, 'errors' => ['Medizingerät nicht gefunden']];
            }
            
            $this->remove($device);
            $this->flush();
            
            return ['success' => true, 'message' => 'Medizingerät gelöscht'];
        } catch (\Exception $e) {
            return ['success' => false, 'errors' => [$e->getMessage()]];
        }
    }
}
