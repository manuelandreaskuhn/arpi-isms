<?php

namespace ARPI\API;

use ARPI\Helper\ConfigLoader;

/**
 * REST-API für das Lesen und Schreiben von Wizard-Konfigurationen.
 *
 * Routen:
 *   GET    /api/config/wizards           → Liste aller Wizard-IDs + isCustom-Flag
 *   GET    /api/config/wizard/{id}       → Aktive Config (custom > default) + isCustom
 *   GET    /api/config/wizard/{id}/default → Immer die Default-Config
 *   GET    /api/config/elements          → Vollständiger Elements-Katalog
 *   PUT    /api/config/wizard/{id}       → Custom-Config speichern (JSON-Body)
 *   DELETE /api/config/wizard/{id}       → Custom-Config löschen (Reset auf Default)
 */
class ConfigAPI
{
    private ConfigLoader $loader;

    public function __construct()
    {
        $this->loader = ConfigLoader::getInstance();
    }

    public function handleRequest(string $path, string $method): void
    {
        header('Content-Type: application/json; charset=utf-8');
        // Keine CORS-Wildcard in Produktion — nur same-origin
        header('X-Content-Type-Options: nosniff');

        try {
            $segments = $this->parsePath($path);

            // GET /api/config/wizards
            if ($method === 'GET' && $segments === ['wizards']) {
                $this->handleListWizards();
                return;
            }

            // GET /api/config/elements
            if ($method === 'GET' && $segments === ['elements']) {
                $this->handleGetElements();
                return;
            }

            // /api/config/wizard/{id}[/default]
            if (count($segments) >= 2 && $segments[0] === 'wizard') {
                $wizardId = $segments[1];

                if ($method === 'GET' && isset($segments[2]) && $segments[2] === 'default') {
                    $this->handleGetDefaultConfig($wizardId);
                    return;
                }

                if ($method === 'GET') {
                    $this->handleGetWizardConfig($wizardId);
                    return;
                }

                if ($method === 'PUT') {
                    $this->handleSaveWizardConfig($wizardId);
                    return;
                }

                if ($method === 'DELETE') {
                    $this->handleDeleteWizardConfig($wizardId);
                    return;
                }
            }

            $this->sendError('Endpoint not found', 404);
        } catch (\InvalidArgumentException $e) {
            $this->sendError($e->getMessage(), 400);
        } catch (\RuntimeException $e) {
            $this->sendError($e->getMessage(), 500);
        }
    }

    // -------------------------------------------------------------------------
    // Handler
    // -------------------------------------------------------------------------

    private function handleListWizards(): void
    {
        $ids = $this->loader->getAvailableWizardIds();

        $result = array_map(function (string $id) {
            return [
                'id'       => $id,
                'isCustom' => $this->loader->hasCustomConfig($id),
                'label'    => $this->fixLabel($this->loader->getDefaultWizardConfig($id)['label'] ?? $id),
            ];
        }, $ids);

        $this->sendSuccess($result);
    }

    private function handleGetWizardConfig(string $wizardId): void
    {
        $config = $this->loader->getWizardConfig($wizardId);

        $this->sendSuccess([
            'config'   => $config,
            'isCustom' => $this->loader->hasCustomConfig($wizardId),
        ]);
    }

    private function handleGetDefaultConfig(string $wizardId): void
    {
        $config = $this->loader->getDefaultWizardConfig($wizardId);
        $this->sendSuccess(['config' => $config, 'isCustom' => false]);
    }

    private function handleGetElements(): void
    {
        $catalog = $this->loader->getElementCatalog();
        $this->sendSuccess($catalog);
    }

    private function handleSaveWizardConfig(string $wizardId): void
    {
        $body = $this->readJsonBody();

        if ($body === null) {
            $this->sendError('Request body must be valid JSON', 400);
            return;
        }

        $this->loader->saveCustomConfig($wizardId, $body);

        $this->sendSuccess(['message' => "Custom config for '{$wizardId}' saved successfully"]);
    }

    private function handleDeleteWizardConfig(string $wizardId): void
    {
        $this->loader->deleteCustomConfig($wizardId);
        $this->sendSuccess(['message' => "Custom config for '{$wizardId}' deleted, default restored"]);
    }

    // -------------------------------------------------------------------------
    // Hilfsmethoden
    // -------------------------------------------------------------------------

    /**
     * Parst den Pfad unterhalb von /api/config/ in Segmente.
     * Beispiel: /api/config/wizard/firewall/default → ['wizard', 'firewall', 'default']
     *
     * @return string[]
     */
    private function parsePath(string $path): array
    {
        // Entferne /api/config/ Präfix
        $trimmed = preg_replace('#^/api/config/?#', '', $path);
        $segments = array_filter(explode('/', $trimmed), fn($s) => $s !== '');

        // Segmente bereinigen
        $clean = [];
        foreach (array_values($segments) as $seg) {
            $sanitized = preg_replace('/[^a-z0-9\-_]/', '', strtolower($seg));
            if ($sanitized !== '') {
                $clean[] = $sanitized;
            }
        }

        return $clean;
    }

    /**
     * Liest den JSON-Request-Body sicher ein.
     */
    private function readJsonBody(): ?array
    {
        $raw = file_get_contents('php://input');

        if ($raw === false || $raw === '') {
            return null;
        }

        // Größenlimit: 512 KB
        if (strlen($raw) > 524288) {
            throw new \InvalidArgumentException('Request body too large (max 512 KB)');
        }

        $decoded = json_decode($raw, true);

        if (json_last_error() !== JSON_ERROR_NONE) {
            return null;
        }

        if (!is_array($decoded)) {
            return null;
        }

        return $decoded;
    }

    private function sendSuccess(mixed $data): void
    {
        http_response_code(200);
        echo json_encode(['success' => true, 'data' => $data], JSON_UNESCAPED_UNICODE);
    }

    private function sendError(string $message, int $code = 400): void
    {
        http_response_code($code);
        echo json_encode(['success' => false, 'error' => $message], JSON_UNESCAPED_UNICODE);
    }

    private function fixLabel(string $label): string
    {
        // Beispiel: "Neues Backup-System", "Neuer Kommunikationsserver", etc..
        // → "Neues Backup-System" → "Backup-System", "Neuer Kommunikationsserver" → "Kommunikationsserver"
        // Splitte das Erste Wort (egal was es ist) ab.
        $parts = explode(' ', $label, 2);
        return $parts[1] ?? $label;
    }
}
