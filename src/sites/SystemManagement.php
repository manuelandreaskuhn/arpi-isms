<?php
namespace ARPI\Sites;

use ARPI\Helper\BaseSite;
use ARPI\Entities\Annotations\Css;
use ARPI\Entities\Annotations\Js;

#[Css('/template/css/pages/assetmanagement.css', '/template/css/wizard.css')]
#[Js('/template/js/wizards/wizards.js')]
class SystemManagement extends BaseSite
{
    public function prepare(): void
    {
        
    }

    public function main(): string
    {
        return $this->renderTemplate('pages/system_management.tpl');
    }
}
