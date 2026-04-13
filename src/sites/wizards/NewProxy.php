<?php

namespace ARPI\Sites\Wizards;

use ARPI\Helper\BaseSite;
use ARPI\Entities\Annotations\Css;
use ARPI\Entities\Annotations\Js;
use ARPI\Helper\SchemaValidator;
use ARPI\Helper\ODM\EntityHydrator;
use ARPI\Helper\WizardSchemaBuilder;
use ARPI\Helper\ODM\DynamicDocument;

#[Css('/template/css/wizard.css', '/template/css/wizard-components.css', '/template/css/pages/assetmanagement.css')]
#[Js('/template/js/wizards/wizards.js', '/template/js/wizards/proxywizard.js')]
class NewProxy extends BaseSite
{
    public function prepare(): void
    {
        $this->setTitle('Neuer Proxy-Server');
    }

    public function main(): string
    {
        return $this->renderWizard('proxy');
    }

    public function create(array $data): array
    {
        $validator = new SchemaValidator();
        if (!$validator->validate($data, (new WizardSchemaBuilder())->buildSchema('proxy'))) {
            return ['success' => false, 'errors' => $validator->getErrors()];
        }

        try {
            $proxy = new DynamicDocument('proxy');
            EntityHydrator::hydrate($proxy, $data);
            $proxy->createdat = new \DateTime();
            $proxy->updatedat = new \DateTime();

            $this->persist($proxy);
            $this->flush();

            return [
                'success' => true,
                'id' => $proxy->uuid,
                'message' => 'Proxy-Server erstellt',
                'data' => EntityHydrator::extract($proxy)
            ];
        } catch (\Exception $e) {
            return ['success' => false, 'errors' => [$e->getMessage()]];
        }
    }

    public function update(string $id, array $data): array
    {
        $validator = new SchemaValidator();
        $schema = (new WizardSchemaBuilder())->buildSchema('proxy');
        unset($schema['required']);

        if (!$validator->validate($data, $schema)) {
            return ['success' => false, 'errors' => $validator->getErrors()];
        }

        try {
            $proxy = $this->findDynamic('proxy', $id);

            if (!$proxy) {
                return ['success' => false, 'errors' => ['Proxy-Server nicht gefunden']];
            }

            EntityHydrator::hydrate($proxy, $data);
            $proxy->updatedat = new \DateTime();

            $this->flush();

            return [
                'success' => true,
                'id' => $id,
                'message' => 'Proxy-Server aktualisiert',
                'data' => EntityHydrator::extract($proxy)
            ];
        } catch (\Exception $e) {
            return ['success' => false, 'errors' => [$e->getMessage()]];
        }
    }

    public function delete(string $id): array
    {
        try {
            $proxy = $this->findDynamic('proxy', $id);

            if (!$proxy) {
                return ['success' => false, 'errors' => ['Proxy-Server nicht gefunden']];
            }

            $this->remove($proxy);
            $this->flush();

            return ['success' => true, 'message' => 'Proxy-Server gelöscht'];
        } catch (\Exception $e) {
            return ['success' => false, 'errors' => [$e->getMessage()]];
        }
    }
}
