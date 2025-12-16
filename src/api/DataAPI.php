<?php
namespace ARPI\API;

class DataAPI {
    private $dataDir;
    private $allowedFiles = ['firewall-software'];
    
    public function __construct() {
        // Set data directory path (one level up from api folder)
        $this->dataDir = dirname(__DIR__) . '/data/';
    }
    
    public function handleRequest(string $path, string $method) {
        header('Content-Type: application/json');
        header('Access-Control-Allow-Origin: *');
        header('Access-Control-Allow-Methods: GET');
        header('Access-Control-Allow-Headers: Content-Type');

        // Only allow GET requests
        if ($method !== 'GET') {
            $this->sendError('Method not allowed', 405);
            return;
        }
        
        // Get and validate requested file
        $file = $this->getSecureFileName($path);
        if (!$file) {
            $this->sendError('Invalid or missing file parameter', 400);
            return;
        }
        
        // Get optional ID parameter
        $id = $this->getSecureId($path);
        
        // Read and return data
        $this->getData($file, $id);
    }
    
    private function getSecureFileName(string $path) {
        // Get file parameter from query string (path=firewall-software/palo-alto)
        $pathParts = explode('/', trim($path, '/'));

        // Format: /api/data/{file} or /api/data/{file}/{id}
        if (count($pathParts) < 3) {
            return null;
        }
        $file = $pathParts[2];
        
        // Remove any path traversal attempts
        $file = basename($file);
        
        // Remove file extension if provided
        $file = preg_replace('/\.json$/', '', $file);
        
        // Validate against whitelist
        if (!in_array($file, $this->allowedFiles)) {
            return null;
        }
        
        return $file;
    }
    
    private function getSecureId(string $path) {
        // Get ID parameter from query string (path=firewall-software/palo-alto)
        $pathParts = explode('/', trim($path, '/'));
        
        // Format: /api/data/{file} or /api/data/{file}/{id}
        if (count($pathParts) < 4) {
            return null;
        }
        
        $id = $pathParts[3];
        
        // Sanitize ID: only allow alphanumeric, hyphens, and underscores
        $id = preg_replace('/[^a-zA-Z0-9_-]/', '', $id);
        
        // Limit length to prevent DoS
        if (strlen($id) > 100) {
            return null;
        }
        
        return $id;
    }
    
    private function getData($file, $id = null) {
        $filePath = $this->dataDir . $file . '.json';
        
        // Check if file exists and is readable
        if (!file_exists($filePath) || !is_readable($filePath)) {
            $this->sendError('Data file not found or not readable', 404);
            return;
        }
        
        // Read file content
        $content = file_get_contents($filePath);
        if ($content === false) {
            $this->sendError('Failed to read data file', 500);
            return;
        }
        
        // Decode JSON
        $data = json_decode($content, true);
        if ($data === null && json_last_error() !== JSON_ERROR_NONE) {
            $this->sendError('Invalid JSON in data file: ' . json_last_error_msg(), 500);
            return;
        }
        
        // If ID is provided, filter the software array
        if ($id !== null) {
            $filtered = $this->findSoftwareById($data, $id);
            if ($filtered === null) {
                $this->sendError('Software with ID "' . htmlspecialchars($id) . '" not found', 404);
                return;
            }
            $this->sendSuccess($filtered);
        } else {
            // Return all data
            $this->sendSuccess($data);
        }
    }
    
    private function findSoftwareById($data, $id) {
        // Check if software array exists
        if (!isset($data['software']) || !is_array($data['software'])) {
            return null;
        }
        
        // Search for software with matching ID
        foreach ($data['software'] as $software) {
            if (isset($software['id']) && $software['id'] === $id) {
                return $software;
            }
        }
        
        return null;
    }
    
    private function sendSuccess($data) {
        http_response_code(200);
        echo json_encode([
            'success' => true,
            'data' => $data
        ], JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE);
    }
    
    private function sendError($message, $code = 400) {
        http_response_code($code);
        echo json_encode([
            'success' => false,
            'error' => $message
        ], JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE);
    }
}