<?php

namespace ARPI\Sites;

use ARPI\Helper\BaseSite;
use ARPI\Entities\Annotations\Css;
use ARPI\Entities\Annotations\Js;

#[Css('/template/css/pages/assetmanagement.css', '/template/css/pages/listtable.css', '/template/css/pages/applicationmanagement.css')]
#[Js('/template/js/application-management.js')]
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
