<?php

namespace ARPI\API;

/**
 * Help-API: liefert Tooltip-Definitionen als HTML für einen Wizard on demand.
 * GET /api/help/{wizard-id}
 */
class HelpAPI
{
    /**
     * Maps wizard-id → one or more help file paths relative to template/pages/wizards/
     */
    private const FILE_MAP = [
        'backup'          => ['komponenten/help/backup-help.html'],
        'comserver'       => ['komponenten/help/commserver-help.html'],
        'firewall'        => ['komponenten/help/firewall-help.html'],
        'hypervisor'      => ['komponenten/help/hypervisor-help.html'],
        'loadbalancer'    => ['komponenten/help/loadbalancer-help.html'],
        'medicaldevice'   => ['komponenten/help/medicaldevice-help.html'],
        'network'         => ['komponenten/help/network-help.html'],
        'proxy'           => ['komponenten/help/proxy-help.html'],
        'siem'            => ['komponenten/help/siem-help.html'],
        'system'          => [
            'system/help/new-system-help.html',
            'system/help/vm-help.html',
            'system/help/hardware-help.html',
            'system/help/database-help.html',
            'system/help/backup-help.html',
            'system/help/loadbalancer-help.html',
            'system/help/firewall-help.html',
            'system/help/client-help.html',
            'system/help/meddevice-help.html',
            'system/help/medinterface-help.html',
            'system/help/container-help.html',
            'system/help/proxy-help.html',
            'system/help/siem-help.html',
            'system/help/ti-help.html',
            'system/help/vpn-help.html',
        ],
        'tiinfrastruktur' => ['komponenten/help/tiinfrastruktur-help.html'],
        'vpn'             => ['komponenten/help/vpn-help.html'],
    ];

    private string $basePath;

    public function __construct()
    {
        $this->basePath = (string) realpath(__DIR__ . '/../template/pages/wizards');
    }

    public function handleRequest(string $path, string $method): void
    {
        if ($method !== 'GET') {
            $this->sendError(405, 'Method not allowed');
            return;
        }

        $wizardId = trim(substr($path, strlen('/api/help')), '/');

        if ($wizardId === '' || !array_key_exists($wizardId, self::FILE_MAP)) {
            $this->sendError(404, 'Help content not found');
            return;
        }

        $html = $this->buildHtml($wizardId);

        if ($html === '') {
            $this->sendError(404, 'Help content not found');
            return;
        }

        header('Content-Type: text/html; charset=UTF-8');
        echo $html;
    }

    private function buildHtml(string $wizardId): string
    {
        $html = '';

        foreach (self::FILE_MAP[$wizardId] as $relPath) {
            $filePath = $this->basePath . '/' . $relPath;
            $realPath = realpath($filePath);

            // Prevent path traversal
            if ($realPath === false || strpos($realPath, $this->basePath) !== 0) {
                continue;
            }

            $content = file_get_contents($realPath);
            if ($content !== false) {
                $html .= $content . "\n";
            }
        }

        return $html;
    }

    private function sendError(int $code, string $message): void
    {
        http_response_code($code);
        header('Content-Type: application/json');
        echo json_encode(['success' => false, 'errors' => [$message]]);
    }
}
