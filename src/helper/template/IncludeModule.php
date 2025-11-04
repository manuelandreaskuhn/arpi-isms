<?php
namespace ARPI\Helper\Template;

/**
 * Include-Modul
 * Syntax: {{include:template/path|with:key:value|with:key2:value2}}
 */
class IncludeModule extends TemplateModule
{

    public function getName(): string
    {
        return 'include';
    }

    public function process(string $content, array $data): string
    {
        return preg_replace_callback(
            '/\{\{include:([\w\/\.-]+)(\|with:([\w\-]+):([^|}]+))*\}\}/',
            function($matches) use ($data) {
                $templatePath = $matches[1];
                $includedData = $data;

                // Zusätzliche Daten aus den "with"-Parametern extrahieren
                if (isset($matches[2])) {
                    preg_match_all('/\|with:([\w\-]+):([^|}]+)/', $matches[0], $withMatches, PREG_SET_ORDER);
                    foreach ($withMatches as $withMatch) {
                        $key = $withMatch[1];
                        $value = $withMatch[2];
                        $includedData[$key] = $value;
                    }
                }

                return $this->processTemplate($templatePath, $includedData);
            },
            $content
        );
    }

    /**
     * Verarbeitet ein Include Template mit Daten
     */
    private function processTemplate(string $templatePath, array $data): string
    {
        return $this->engine->render($templatePath, $data);
    }
    
}