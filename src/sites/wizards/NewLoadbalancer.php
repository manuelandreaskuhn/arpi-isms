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
#[Js('/template/js/wizards/wizards.js', '/template/js/wizards/loadbalancerwizard.js')]
class NewLoadbalancer extends BaseSite
{
    public function prepare(): void
    {
        $this->setTitle('Neuer Load Balancer');
    }

    public function main(): string
    {
        return $this->renderWizard('loadbalancer');
    }

    public function create(array $data): array
    {
        $validator = new SchemaValidator();
        if (!$validator->validate($data, (new WizardSchemaBuilder())->buildSchema('loadbalancer'))) {
            return ['success' => false, 'errors' => $validator->getErrors()];
        }

        try {
            $lb = new DynamicDocument('loadbalancer');
            EntityHydrator::hydrate($lb, $data);
            $lb->createdat = new \DateTime();
            $lb->updatedat = new \DateTime();

            $this->persist($lb);
            $this->flush();

            return [
                'success' => true,
                'id' => $lb->uuid,
                'message' => 'Load Balancer erfolgreich erstellt',
                'data' => EntityHydrator::extract($lb)
            ];
        } catch (\Exception $e) {
            return ['success' => false, 'errors' => [$e->getMessage()]];
        }
    }

    public function update(string $id, array $data): array
    {
        $validator = new SchemaValidator();
        $schema = (new WizardSchemaBuilder())->buildSchema('loadbalancer');
        unset($schema['required']);

        if (!$validator->validate($data, $schema)) {
            return ['success' => false, 'errors' => $validator->getErrors()];
        }

        try {
            $lb = $this->findDynamic('loadbalancer', $id);

            if (!$lb) {
                return ['success' => false, 'errors' => ['Load Balancer nicht gefunden']];
            }

            EntityHydrator::hydrate($lb, $data);
            $lb->updatedat = new \DateTime();

            $this->flush();

            return [
                'success' => true,
                'id' => $id,
                'message' => 'Load Balancer erfolgreich aktualisiert',
                'data' => EntityHydrator::extract($lb)
            ];
        } catch (\Exception $e) {
            return ['success' => false, 'errors' => [$e->getMessage()]];
        }
    }

    public function delete(string $id): array
    {
        try {
            $lb = $this->findDynamic('loadbalancer', $id);

            if (!$lb) {
                return ['success' => false, 'errors' => ['Load Balancer nicht gefunden']];
            }

            $this->remove($lb);
            $this->flush();

            return ['success' => true, 'message' => 'Load Balancer erfolgreich gelöscht'];
        } catch (\Exception $e) {
            return ['success' => false, 'errors' => [$e->getMessage()]];
        }
    }
}
