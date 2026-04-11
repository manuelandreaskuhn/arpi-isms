<?php

namespace ARPI\Sites;

use ARPI\Helper\BaseSite;
use ARPI\Entities\Annotations\Css;

#[Css('/template/css/pages/assetmanagement.css')]
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
