<?php
namespace ARPI\Sites\Wizards;

use ARPI\Helper\BaseSite;
use ARPI\Entities\Annotations\Css;
use ARPI\Entities\Annotations\Js;

#[Css('/template/css/wizard.css', '/template/css/pages/assetmanagement.css')]
#[Js('/template/js/wizards/wizards.js', '/template/js/wizards/commserverwizard.js')]
class NewComServer extends BaseSite
{
    public function prepare(): void
    {
        
    }

    public function main(): string
    {
        return $this->renderTemplate('pages/wizards/komponenten/new-comserver.html');
    }
}
