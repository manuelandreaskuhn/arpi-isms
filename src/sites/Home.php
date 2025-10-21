<?php
namespace ARPI\Sites;

use ARPI\Helper\BaseSite;

class Home extends BaseSite
{
    public function prepare(): void
    {
        
    }

    public function main(): string
    {
        return $this->render('pages/home.tpl');
    }
}
