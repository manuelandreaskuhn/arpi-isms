<?php

namespace ARPI\Sites;

use ARPI\Helper\BaseSite;
use ARPI\Entities\Annotations\Css;
use ARPI\Entities\Annotations\Js;

#[Css('/template/css/pages/assetmanagement.css', '/template/css/pages/listtable.css')]
#[Js('/template/js/system-management.js')]
class SystemManagement extends BaseSite
{
    public function prepare(): void
    {
        // Site Title
        $this->setTitle('System Management');
    }

    public function main(): string
    {
        return $this->renderTemplate('pages/system-management.html');
    }
}
