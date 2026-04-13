<?php

namespace ARPI\Sites\Wizards;

use ARPI\Helper\BaseSite;
use ARPI\Entities\Annotations\Css;
use ARPI\Entities\Annotations\Js;
use ARPI\Helper\SchemaValidator;
use ARPI\Helper\ODM\EntityHydrator;
use ARPI\Helper\WizardSchemaBuilder;
use ARPI\Helper\ODM\DynamicDocument;

#[Css('/template/css/wizard.css', '/template/css/wizard-components.css', '/template/css/wizard-diagrams.css', '/template/css/pages/assetmanagement.css')]
#[Js('/template/js/wizards/wizards.js', '/template/js/wizards/firewallwizard.js')]
class NewFirewall extends BaseSite
{
    public function prepare(): void
    {
        $this->setTitle('Neue Firewall');
    }

    public function main(): string
    {
        return $this->renderWizard('firewall');
    }

    public function create(array $data): array
    {
        $validator = new SchemaValidator();
        $schema = (new WizardSchemaBuilder())->buildSchema('firewall');

        if (!$validator->validate($data, $schema)) {
            return ['success' => false, 'errors' => $validator->getErrors()];
        }

        try {
            $firewall = new DynamicDocument('firewall');
            EntityHydrator::hydrate($firewall, $data);

            $firewall->createdat = new \DateTime();
            $firewall->updatedat = new \DateTime();

            $this->persist($firewall);
            $this->flush();

            return [
                'success' => true,
                'id' => $firewall->uuid,
                'message' => 'Firewall erfolgreich erstellt',
                'data' => EntityHydrator::extract($firewall)
            ];
        } catch (\Exception $e) {
            return ['success' => false, 'errors' => ['Internal error: ' . $e->getMessage()]];
        }
    }

    public function update(string $id, array $data): array
    {
        $validator = new SchemaValidator();
        $schema = (new WizardSchemaBuilder())->buildSchema('firewall');
        unset($schema['required']);

        if (!$validator->validate($data, $schema)) {
            return ['success' => false, 'errors' => $validator->getErrors()];
        }

        try {
            $firewall = $this->findDynamic('firewall', $id);

            if (!$firewall) {
                return ['success' => false, 'errors' => ['Firewall nicht gefunden']];
            }

            EntityHydrator::hydrate($firewall, $data);
            $firewall->updatedat = new \DateTime();

            $this->flush();

            return [
                'success' => true,
                'id' => $id,
                'message' => 'Firewall erfolgreich aktualisiert',
                'data' => EntityHydrator::extract($firewall)
            ];
        } catch (\Exception $e) {
            return ['success' => false, 'errors' => ['Internal error: ' . $e->getMessage()]];
        }
    }

    public function delete(string $id): array
    {
        try {
            $firewall = $this->findDynamic('firewall', $id);

            if (!$firewall) {
                return ['success' => false, 'errors' => ['Firewall nicht gefunden']];
            }

            $this->remove($firewall);
            $this->flush();

            return ['success' => true, 'message' => 'Firewall erfolgreich gelöscht'];
        } catch (\Exception $e) {
            return ['success' => false, 'errors' => ['Internal error: ' . $e->getMessage()]];
        }
    }
}
