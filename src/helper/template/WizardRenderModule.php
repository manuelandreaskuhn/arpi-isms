<?php

namespace ARPI\Helper\Template;

use ARPI\Helper\WizardRenderer;

/**
 * Template-Modul für Wizard-Render-Platzhalter.
 *
 * Unterstützte Syntax:
 *
 *   {{render:wizard:{wizardId}:page:{pageId}}}
 *       Rendert die Felder (form-rows) einer Seite ohne Section-Wrapper.
 *       Der optionale Suffix `:fields` wird ignoriert – gleiche Ausgabe.
 *
 *   {{render:wizard:{wizardId}:page:{pageId}:fields}}
 *       Identisch zu oben (expliziter Hinweis im Template, keine andere Funktion).
 *
 *   {{render:wizard:{wizardId}:templates}}
 *       Rendert alle <template>-Blöcke der dynamic-list-Seiten eines Wizards.
 *       Muss außerhalb eines <form>-Tags stehen.
 */
class WizardRenderModule extends TemplateModule
{
    /** Regex für Seiten-Felder: {{render:wizard:{id}:page:{pageId}}} oder mit :fields */
    private const PATTERN_PAGE = '/\{\{render:wizard:([\w-]+):page:([\w-]+)(?::fields)?\}\}/';

    /** Regex für Entry-Templates: {{render:wizard:{id}:templates}} */
    private const PATTERN_TEMPLATES = '/\{\{render:wizard:([\w-]+):templates\}\}/';

    public function getName(): string
    {
        return 'wizard-render';
    }

    public function process(string $content, array $data): string
    {
        $renderer = new WizardRenderer();

        // Seiten-Felder ersetzen
        $content = preg_replace_callback(
            self::PATTERN_PAGE,
            static function (array $matches) use ($renderer): string {
                $wizardId = $matches[1];
                $pageId   = $matches[2];

                return $renderer->renderPageFields($wizardId, $pageId);
            },
            $content
        );

        // Entry-Templates ersetzen
        $content = preg_replace_callback(
            self::PATTERN_TEMPLATES,
            static function (array $matches) use ($renderer): string {
                $wizardId = $matches[1];

                return $renderer->renderEntryTemplates($wizardId);
            },
            $content
        );

        return $content;
    }
}
