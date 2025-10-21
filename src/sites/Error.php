<?php
namespace ARPI\Sites;

use ARPI\Helper\BaseSite;

class Error extends BaseSite
{
    public function prepare(): void
    {
        http_response_code(404);
    }

    public function main(): string
    {
        return $this->render('pages/error.tpl');
    }
}
