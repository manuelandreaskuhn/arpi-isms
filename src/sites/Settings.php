<?php

namespace ARPI\Sites;

use ARPI\Helper\BaseSite;
use ARPI\Helper\ConfigLoader;
use ARPI\Entities\Annotations\Css;
use ARPI\Entities\Annotations\Js;

#[Css('/template/css/pages/settings.css')]
#[Js('/template/js/config-editor.js')]
class Settings extends BaseSite
{
    public function prepare(): void
    {
        $this->setTitle('Einstellungen');
    }

    public function main(): string
    {
        $loader = ConfigLoader::getInstance();
        $ids    = $loader->getAvailableWizardIds();

        $wizards = array_map(function (string $id) use ($loader) {
            try {
                $config = $loader->getDefaultWizardConfig($id);
                return [
                    'id'       => $id,
                    'label'    => $config['label'] ?? $id,
                    'icon'     => $config['icon']  ?? '',
                    'isCustom' => $loader->hasCustomConfig($id),
                ];
            } catch (\RuntimeException $e) {
                return ['id' => $id, 'label' => $id, 'icon' => '', 'isCustom' => false];
            }
        }, $ids);

        usort($wizards, fn($a, $b) => strcmp($a['label'], $b['label']));

        $this->data['wizards'] = $wizards;

        return $this->renderTemplate('pages/settings.html');
    }
}
