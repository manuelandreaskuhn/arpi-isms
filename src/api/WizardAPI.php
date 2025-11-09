<?php
namespace ARPI\API;

/**
 * Generalisierte API für Wizard-Endpoints
 * Verteilt Requests an die entsprechenden Wizard-Klassen
 */
class WizardAPI
{
    /**
     * Mapping von Resource-Namen zu Wizard-Klassen
     */
    private const RESOURCE_MAP = [
        'backup-systems' => \ARPI\Sites\Wizards\NewBackup::class,
        'hypervisors' => \ARPI\Sites\Wizards\NewHypervisor::class,
        'firewalls' => \ARPI\Sites\Wizards\NewFirewall::class,
        'networks' => \ARPI\Sites\Wizards\NewNetwork::class,
        'proxies' => \ARPI\Sites\Wizards\NewProxy::class,
        'siems' => \ARPI\Sites\Wizards\NewSIEM::class,
        'ti-infrastructures' => \ARPI\Sites\Wizards\NewTIInfrastruktur::class,
        'communication-servers' => \ARPI\Sites\Wizards\NewComServer::class,
        'systems' => \ARPI\Sites\Wizards\NewSystem::class,
    ];
    
    /**
     * Behandelt eingehende API-Requests
     * 
     * @param string $path Request-Pfad (z.B. /api/backup-systems)
     * @param string $method HTTP-Methode (GET, POST, PUT, DELETE)
     * @return void
     */
    public function handleRequest(string $path, string $method): void
    {
        header('Content-Type: application/json');
        
        // Parse Request-Pfad
        $pathParts = explode('/', trim($path, '/'));
        
        // Format: /api/{resource} oder /api/{resource}/{id}
        if (count($pathParts) < 2 || $pathParts[0] !== 'api') {
            $this->sendError(404, ['Invalid API endpoint']);
            return;
        }
        
        $resource = $pathParts[1];
        $id = $pathParts[2] ?? null;
        
        // Wizard-Klasse ermitteln
        if (!isset(self::RESOURCE_MAP[$resource])) {
            $this->sendError(404, ["Resource '{$resource}' not found"]);
            return;
        }
        
        $wizardClass = self::RESOURCE_MAP[$resource];
        
        // Wizard instanziieren
        try {
            $wizard = new $wizardClass();
        } catch (\Exception $e) {
            $this->sendError(500, ['Failed to initialize wizard: ' . $e->getMessage()]);
            return;
        }
        
        // Request-Methode behandeln
        switch ($method) {
            case 'POST':
                $this->handleCreate($wizard);
                break;
                
            case 'PUT':
            case 'PATCH':
                if (!$id) {
                    $this->sendError(400, ['ID required for update']);
                    return;
                }
                $this->handleUpdate($wizard, $id);
                break;
                
            case 'DELETE':
                if (!$id) {
                    $this->sendError(400, ['ID required for delete']);
                    return;
                }
                $this->handleDelete($wizard, $id);
                break;
                
            case 'GET':
                if ($id) {
                    $this->handleGet($wizard, $id);
                } else {
                    $this->handleList($wizard);
                }
                break;
                
            default:
                $this->sendError(405, ['Method not allowed']);
                break;
        }
    }
    
    /**
     * Behandelt CREATE-Request (POST)
     * 
     * @param object $wizard
     * @return void
     */
    private function handleCreate(object $wizard): void
    {
        $data = $this->getJsonInput();
        
        if ($data === null) {
            $this->sendError(400, ['Invalid JSON']);
            return;
        }
        
        if (!method_exists($wizard, 'create')) {
            $this->sendError(501, ['Create method not implemented']);
            return;
        }
        
        $result = $wizard->create($data);
        
        if ($result['success']) {
            $this->sendSuccess(201, $result);
        } else {
            $this->sendError(400, $result['errors']);
        }
    }
    
    /**
     * Behandelt UPDATE-Request (PUT/PATCH)
     * 
     * @param object $wizard
     * @param string $id
     * @return void
     */
    private function handleUpdate(object $wizard, string $id): void
    {
        $data = $this->getJsonInput();
        
        if ($data === null) {
            $this->sendError(400, ['Invalid JSON']);
            return;
        }
        
        if (!method_exists($wizard, 'update')) {
            $this->sendError(501, ['Update method not implemented']);
            return;
        }
        
        $result = $wizard->update($id, $data);
        
        if ($result['success']) {
            $this->sendSuccess(200, $result);
        } else {
            $this->sendError(400, $result['errors']);
        }
    }
    
    /**
     * Behandelt DELETE-Request
     * 
     * @param object $wizard
     * @param string $id
     * @return void
     */
    private function handleDelete(object $wizard, string $id): void
    {
        if (!method_exists($wizard, 'delete')) {
            $this->sendError(501, ['Delete method not implemented']);
            return;
        }
        
        $result = $wizard->delete($id);
        
        if ($result['success']) {
            $this->sendSuccess(200, $result);
        } else {
            $this->sendError(400, $result['errors']);
        }
    }
    
    /**
     * Behandelt GET-Request für einzelnes Item
     * 
     * @param object $wizard
     * @param string $id
     * @return void
     */
    private function handleGet(object $wizard, string $id): void
    {
        if (!method_exists($wizard, 'get')) {
            $this->sendError(501, ['Get method not implemented']);
            return;
        }
        
        $result = $wizard->get($id);
        
        if ($result['success']) {
            $this->sendSuccess(200, $result);
        } else {
            $this->sendError(404, $result['errors']);
        }
    }
    
    /**
     * Behandelt GET-Request für Liste
     * 
     * @param object $wizard
     * @return void
     */
    private function handleList(object $wizard): void
    {
        if (!method_exists($wizard, 'list')) {
            $this->sendError(501, ['List method not implemented']);
            return;
        }
        
        $result = $wizard->list();
        
        if ($result['success']) {
            $this->sendSuccess(200, $result);
        } else {
            $this->sendError(400, $result['errors']);
        }
    }
    
    /**
     * Liest JSON-Input aus Request-Body
     * 
     * @return array|null
     */
    private function getJsonInput(): ?array
    {
        $jsonData = file_get_contents('php://input');
        $data = json_decode($jsonData, true);
        
        if (json_last_error() !== JSON_ERROR_NONE) {
            return null;
        }
        
        return $data;
    }
    
    /**
     * Sendet Erfolgs-Response
     * 
     * @param int $statusCode
     * @param array $data
     * @return void
     */
    private function sendSuccess(int $statusCode, array $data): void
    {
        http_response_code($statusCode);
        echo json_encode($data);
    }
    
    /**
     * Sendet Fehler-Response
     * 
     * @param int $statusCode
     * @param array $errors
     * @return void
     */
    private function sendError(int $statusCode, array $errors): void
    {
        http_response_code($statusCode);
        echo json_encode([
            'success' => false,
            'errors' => $errors
        ]);
    }
}
