<?php
namespace ARPI\Sites;

use ARPI\Helper\BaseSite;
use ARPI\API\WizardAPI;

/**
 * Zentraler API-Endpoint
 * Verteilt alle /api/* Requests an die entsprechenden Handler
 */
class API extends BaseSite
{
    public function prepare(): void
    {
        // API-Request behandeln
        $path = $this->getAPIPath();
        $method = $_SERVER['REQUEST_METHOD'];
        
        // Wizard-API aufrufen
        $wizardAPI = new WizardAPI();
        $wizardAPI->handleRequest($path, $method);
        exit;
    }

    public function main(): string
    {
        // Wird nie erreicht, da prepare() immer exit aufruft
        // Fallback für den Fall, dass prepare() nicht beendet
        header('Content-Type: application/json');
        http_response_code(404);
        return json_encode([
            'success' => false,
            'errors' => ['API endpoint not found']
        ]);
    }
    
    /**
     * Ermittelt den API-Pfad aus GET-Parameter oder REQUEST_URI
     * 
     * @return string
     */
    private function getAPIPath(): string
    {
        // Pfad aus GET-Parameter (von .htaccess)
        if (isset($_GET['path'])) {
            return '/api/' . trim($_GET['path'], '/');
        }
        
        // Fallback: Aus REQUEST_URI parsen
        $path = $_SERVER['REQUEST_URI'];
        
        // Query-String entfernen
        if (($pos = strpos($path, '?')) !== false) {
            $path = substr($path, 0, $pos);
        }
        
        return $path;
    }
}
