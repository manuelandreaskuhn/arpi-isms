<?php
namespace ARPI\Sites\Wizards;

use ARPI\Helper\BaseSite;

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
