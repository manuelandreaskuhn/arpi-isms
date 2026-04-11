<?php

namespace ARPI\Sites;

use ARPI\Helper\BaseSite;
use ARPI\Entities\Annotations\Css;

#[Css('/template/css/pages/assetmanagement.css')]
class ApplicationManagement extends BaseSite
{
    public function prepare(): void
    {
        $this->setTitle('Applikationen');
    }

    public function main(): string
    {
        return $this->renderTemplate('pages/application-management.html');
    }
}
