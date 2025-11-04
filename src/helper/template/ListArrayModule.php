<?php
namespace ARPI\Helper\Template;

/**
 * Listen/Array-Modul
 * Syntax: {{foreach:variableName}}...{{index}}{{key}}{{value}}{{/foreach}}
 */
class ListArrayModule extends TemplateModule
{
    public function getName(): string
    {
        return 'listarray';
    }

    public function process(string $content, array $data): string
    {
        return preg_replace_callback(
            '/\{\{foreach:(\w+)\}\}(.*?)\{\{\/foreach\}\}/s',
            function($matches) use ($data) {
                $varName = $matches[1];
                $template = $matches[2];

                if (!isset($data[$varName]) || !is_iterable($data[$varName])) {
                    return "<!-- Variable '" . htmlspecialchars($varName, ENT_QUOTES, 'UTF-8') . "' not found or not iterable -->";
                }

                $items = $data[$varName];
                $output = '';
                $index = 0;

                foreach ($items as $key => $value) {
                    $itemData = array_merge($data, [
                        'index' => $index,
                        'key' => $key,
                        'value' => $value,
                        'item' => $value // Zusätzlicher Zugriff
                    ]);

                    $output .= $this->processTemplate($template, $itemData);
                    $index++;
                }

                return $output;
            },
            $content
        );
    }

    /**
     * Verarbeitet ein Template mit Daten
     */
    private function processTemplate(string $template, array $data): string
    {
        // Nutze das PropertyModule für die Verarbeitung
        $propertyModule = $this->engine->getModule('property');
        
        if ($propertyModule) {
            $template = $propertyModule->process($template, $data);
        }

        return $template;
    }
}
