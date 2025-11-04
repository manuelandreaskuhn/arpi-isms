<?php
namespace ARPI\Helper;


/**
 * Site Router
 * Verarbeitet HTTP-Requests und lädt entsprechende Site-Klassen
 */
class SiteRouter
{
    private string $sitesNamespace = 'ARPI\\Sites\\';
    private string $sitesPath;
    private string $defaultSite = 'Home';

    public function __construct(string $sitesPath)
    {
        $this->sitesPath = rtrim($sitesPath, '/\\');
    }

    /**
     * Verarbeitet den Request und gibt die HTML-Ausgabe zurück
     */
    public function handle(): string
    {
        try {
            // Hole Site-Name aus Query-Parameter
            $siteName = $_GET['site'] ?? $this->defaultSite;
            
            // Bereinige Site-Name (Security)
            $siteName = $this->sanitizeSiteName($siteName);
            
            // Lade und instanziiere Site
            $site = $this->loadSite($siteName);
            
            // Führe Site-Lifecycle aus
            return $this->executeSite($site);
            
        } catch (\Exception $e) {
            return $this->handleError($e);
        }
    }

    /**
     * Bereinigt den Site-Namen (Security)
     */
    private function sanitizeSiteName(string $siteName): string
    {
        // Entferne gefährliche Zeichen
        $siteName = preg_replace('/[^a-zA-Z0-9\/_-]/', '', $siteName);
        
        // Entferne führende/trailing Slashes
        $siteName = trim($siteName, '/');
        
        // Verhindere Directory Traversal
        $siteName = str_replace(['..', './'], '', $siteName);
        
        // Konvertiere zu Pascal Case für Klassennamen
        $parts = explode('/', $siteName);
        $parts = array_map(function($part) {
            // Entferne Bindestriche und konvertiere zu PascalCase
            return str_replace(' ', '', ucwords(str_replace(['-', '_'], ' ', $part)));
        }, $parts);
        
        return implode('\\', $parts);
    }

    /**
     * Lädt eine Site-Klasse
     */
    private function loadSite(string $siteName): SiteInterface
    {
        $className = $this->sitesNamespace . $siteName;
        
        // Prüfe ob Klasse existiert
        if (!class_exists($className)) {
            throw new \RuntimeException("Site not found: {$siteName}");
        }
        
        // Instanziiere Site
        $site = new $className();
        
        // Prüfe Interface
        if (!$site instanceof SiteInterface) {
            throw new \RuntimeException("Site must implement SiteInterface: {$siteName}");
        }
        
        return $site;
    }

    /**
     * Führt den Site-Lifecycle aus: prepare -> save -> main
     */
    private function executeSite(SiteInterface $site): string
    {
        // 1. Prepare (immer)
        $site->prepare();
        
        // 2. Save (nur bei POST)
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $site->save();
            
            // Optional: Redirect nach POST (Post/Redirect/Get Pattern)
            if (isset($_POST['_redirect']) && $_POST['_redirect']) {
                header('Location: ' . $_SERVER['REQUEST_URI']);
                exit;
            }
        }
        
        // 3. Main (HTML-Ausgabe)
        return $site->main();
    }

    /**
     * Fehlerbehandlung
     */
    private function handleError(\Exception $e): string
    {
        // Log Error
        error_log("SiteRouter Error: " . $e->getMessage());
        
        // Versuche Error-Site zu laden
        try {
            $errorSite = $this->loadSite('Error');
            $errorSite->setException($e);
            $errorSite->prepare();
            return $errorSite->main();
        } catch (\Exception $innerException) {
            // Fallback wenn Error-Site nicht existiert
            http_response_code(500);
            return $this->renderBasicError($e);
        }
    }

    /**
     * Rendert einen einfachen Fehler (Fallback)
     */
    private function renderBasicError(\Exception $e): string
    {
        $message = htmlspecialchars($e->getMessage(), ENT_QUOTES, 'UTF-8');
        return $message;
    }

    /**
     * Setzt den Standard-Site-Namen
     */
    public function setDefaultSite(string $siteName): void
    {
        $this->defaultSite = $siteName;
    }

    /**
     * Setzt den Sites-Namespace
     */
    public function setSitesNamespace(string $namespace): void
    {
        $this->sitesNamespace = rtrim($namespace, '\\') . '\\';
    }
}
