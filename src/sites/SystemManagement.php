<?php

namespace ARPI\Sites;

use ARPI\Helper\BaseSite;
use ARPI\Entities\Annotations\Css;

#[Css('/template/css/pages/assetmanagement.css')]
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
