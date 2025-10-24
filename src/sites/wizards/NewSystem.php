<?php
namespace ARPI\Sites\Wizards;

use ARPI\Helper\BaseSite;
use ARPI\Entities\Annotations\Css;
use ARPI\Entities\Annotations\Js;

#[Css('/template/css/wizard.css')]
#[Js('/template/js/wizards/wizards.js')]
class NewSystem extends BaseSite
{
    public function prepare(): void
    {
        
    }

    public function main(): string
    {
        return $this->renderTemplate('pages/wizards/system/newsystem.tpl');
    }
}
