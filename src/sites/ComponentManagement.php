<?php

namespace ARPI\Sites;

use ARPI\Helper\BaseSite;
use ARPI\Entities\Annotations\Css;
use ARPI\Entities\Annotations\Js;

#[Css('/template/css/pages/assetmanagement.css')]
#[Js('/template/js/component-management.js')]
class ComponentManagement extends BaseSite
{
    public function prepare(): void
    {
        $this->setTitle('Komponenten');
    }

    public function main(): string
    {
        return $this->renderTemplate('pages/component-management.html');
    }
}
