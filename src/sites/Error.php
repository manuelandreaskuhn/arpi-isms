<?php
namespace ARPI\Sites;

use ARPI\Helper\BaseSite;

class Error extends BaseSite
{

    protected ?\Exception $exception = null;

    public function setException(\Exception $exception): void
    {
        $this->exception = $exception;
    }

    public function prepare(): void
    {
        if ($this->exception !== null) {
            $GLOBALS['title'] = $this->exception->getCode() ? 'Fehler ' . $this->exception->getCode() : 'Unbekannter Fehler';
            $GLOBALS['message'] = $this->exception->getMessage() ? $this->exception->getMessage() : 'Die angeforderte Seite wurde nicht gefunden.';
        } else {
            $GLOBALS['title'] = 'Unbekannter Fehler';
            $GLOBALS['message'] = 'Die angeforderte Seite wurde nicht gefunden.';
        }

        $code = ($this->exception && $this->exception->getCode() >= 400 && $this->exception->getCode() <= 599)
            ? $this->exception->getCode()
            : 404;
        
        http_response_code($code);
        $GLOBALS['title'] = 'Unbekannter Fehler';
        $GLOBALS['message'] = 'Die angeforderte Seite wurde nicht gefunden.';
    }

    public function main(): string
    {
        return $this->render('pages/error.html');
    }
}
