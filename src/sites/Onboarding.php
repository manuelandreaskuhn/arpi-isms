<?php
namespace ARPI\Sites;

use ARPI\Helper\BaseSite;

class Onboarding extends BaseSite
{
    public function prepare(): void
    {
        
    }

    public function save(): void
    {
        if ($this->isPost()) {
            // Verarbeite Formular-Daten
        }
    }

    public function main(): string
    {
        return $this->render('pages/onboarding.html');
    }
}
