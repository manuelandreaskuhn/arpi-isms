<?php
namespace ARPI\Helper\Template;

/**
 * Enum-Modul
 * Syntax: {{enum:EnumClass|sorted|asc/desc}}...{{key}}{{name}}{{/enum}}
 */
class EnumModule extends TemplateModule
{
    public function getName(): string
    {
        return 'enum';
    }

    public function process(string $content, array $data): string
    {
        return preg_replace_callback(
            '/\{\{enum:([^}]+)\}\}(.*?)\{\{\/enum\}\}/s',
            function($matches) use ($data) {
                $params = explode('|', $matches[1]);
                $enumClass = trim($params[0]);
                $sorted = isset($params[1]) && trim($params[1]) === 'sorted';
                $order = isset($params[2]) ? strtolower(trim($params[2])) : 'asc';
                $template = $matches[2];

                if (!enum_exists($enumClass)) {
                    return "<!-- Enum not found: " . htmlspecialchars($enumClass, ENT_QUOTES, 'UTF-8') . " -->";
                }

                $cases = $enumClass::cases();

                // Sortieren falls gewünscht
                if ($sorted) {
                    usort($cases, function($a, $b) use ($order) {
                        $result = strcmp($a->name, $b->name);
                        return $order === 'desc' ? -$result : $result;
                    });
                }

                $output = '';
                foreach ($cases as $case) {
                    $caseData = [
                        'key' => $case instanceof \BackedEnum ? $case->value : $case->name,
                        'name' => $case->name,
                        'value' => $case instanceof \BackedEnum ? $case->value : $case->name
                    ];

                    $output .= $this->processTemplate($template, array_merge($data, $caseData));
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
        return preg_replace_callback('/\{\{(\w+)\}\}/', function($matches) use ($data) {
            return $this->escape($data[$matches[1]] ?? '');
        }, $template);
    }
}
