<?php

namespace ARPI\Helper;

use ARPI\Entities\Annotations\Css as CssAttr;
use ARPI\Entities\Annotations\Js as JsAttr;
use ARPI\Helper\ODM\EntityRepository;
use ARPI\Helper\ODM\UnitOfWork;
use ARPI\Helper\ODM\Exception\ConnectionException;

/**
 * Abstrakte Basis-Klasse für Sites
 * Bietet gemeinsame Funktionalität
 */
abstract class BaseSite implements SiteInterface
{
    protected Template $template;
    protected array $data = [];

    /**
     * Asset-Listen für die Seite
     */
    protected array $cssFiles = [];
    protected array $jsFiles = [];

    /**
     * ODM Components
     */
    protected EntityRepository $repository;
    protected UnitOfWork $unitOfWork;

    public function __construct()
    {
        $this->template = new Template();
        $this->initGlobals();
        $this->initODM();

        // Annotationen der Kindklasse einlesen (@css / @js)
        $this->parseClassAssetAnnotations();
    }

    /**
     * Initialisiert globale Template-Variablen
     */
    protected function initGlobals(): void
    {
        // i18n initialisieren
        $i18nModule = $this->template->getModule('i18n');
    }

    /**
     * Initialisiert ODM (EntityRepository und UnitOfWork)
     */
    protected function initODM(): void
    {
        try {
            $config = Config::getInstance();

            // Sichere Konfiguration mit Credentials-Handling
            $mongoUri = $config->getMongoDbUri();
            $dbName = $config->getMongoDbDatabase();

            // EntityRepository und UnitOfWork initialisieren
            // verifyConnection=true testet die Verbindung sofort
            $this->repository = new EntityRepository($mongoUri, $dbName, true);
            $this->unitOfWork = new UnitOfWork($this->repository);
            $this->repository->setUnitOfWork($this->unitOfWork);
        } catch (ConnectionException $e) {
            error_log("MongoDB Connection failed: " . $e->getMessage());
            die("Database connection error. Please contact the administrator.");
        }
    }

    /**
     * Standard-Implementierung für prepare
     */
    public function prepare(): void
    {
        // Kann von Child-Klassen überschrieben werden
    }

    /**
     * Standard-Implementierung für save
     */
    public function save(): void
    {
        // Kann von Child-Klassen überschrieben werden
    }

    public function setTitle(string $title): void
    {
        $this->data['site_title'] = $title;
    }

    /**
     * Hilfsmethode zum Rendern mit Layout
     */
    protected function render(string $contentTemplate): string
    {
        // Rendere Content
        return $this->template->render($contentTemplate, $this->data);
    }

    /**
     * Ermöglicht das Setzen mehrerer CSS-Dateien auf einmal
     */
    public function setCssFiles(array $files): void
    {
        $this->cssFiles = array_values(array_unique($files));
    }

    /**
     * Einzelne CSS-Datei hinzufügen
     */
    public function addCssFile(string $file): void
    {
        if (!in_array($file, $this->cssFiles, true)) {
            $this->cssFiles[] = $file;
        }
    }

    /**
     * Ermöglicht das Setzen mehrerer JS-Dateien auf einmal
     */
    public function setJsFiles(array $files): void
    {
        $this->jsFiles = array_values(array_unique($files));
    }

    /**
     * Einzelne JS-Datei hinzufügen
     */
    public function addJsFile(string $file): void
    {
        if (!in_array($file, $this->jsFiles, true)) {
            $this->jsFiles[] = $file;
        }
    }

    // Optional: Getter, falls benötigt
    public function getCssFiles(): array
    {
        return $this->cssFiles;
    }
    public function getJsFiles(): array
    {
        return $this->jsFiles;
    }

    /**
     * Klassen-Annotationen (@css / @js) einlesen und Assets übernehmen.
     * Unterstützt mehrere Annotationen sowie Komma-separierte Listen.
     */
    protected function parseClassAssetAnnotations(): void
    {
        try {
            $rc = new \ReflectionClass($this);
            foreach ($rc->getAttributes(CssAttr::class) as $attr) {
                $inst = $attr->newInstance();
                foreach ($inst->files as $css) {
                    $this->addCssFile($css);
                }
            }
            foreach ($rc->getAttributes(JsAttr::class) as $attr) {
                $inst = $attr->newInstance();
                foreach ($inst->files as $js) {
                    $this->addJsFile($js);
                }
            }
        } catch (\ReflectionException $e) {
            // still proceed without annotations
        }
    }

    /**
     * Rendert einen vollständigen Wizard aus seiner JSON-Konfiguration.
     * Erzeugt Breadcrumb, Error-Box, <form>, Sektionen (via WizardRenderer),
     * Floating-Bar und optionales Help-Include – identisch zur statischen Vorlage.
     *
     * @param string $wizardId  ID aus src/config/wizards/{wizardId}.json
     * @param array  $values    Optionale Formular-Werte (Edit-Modus)
     */
    protected function renderWizard(string $wizardId, array $values = []): string
    {
        $config   = ConfigLoader::getInstance()->getWizardConfig($wizardId);
        $renderer = new WizardRenderer();

        $formId   = htmlspecialchars($config['form_id']            ?? 'wizardForm',         ENT_QUOTES);
        $label    = htmlspecialchars($config['breadcrumb_label']   ?? ($config['label'] ?? ''), ENT_QUOTES);
        $section  = htmlspecialchars($config['breadcrumb_section'] ?? 'Komponenten',         ENT_QUOTES);
        $safeWizardId = htmlspecialchars($wizardId, ENT_QUOTES);

        // Software-Daten aus Konfiguration automatisch laden
        $this->loadWizardSoftwareData($config['software_data'] ?? []);

        // Wenn template_path gesetzt, vollständiges statisches Template verwenden
        // (für Wizards mit dynamischen Listen wie dem System-Wizard)
        if (!empty($config['template_path'])) {
            $GLOBALS['assetcss'] = $this->cssFiles;
            $GLOBALS['assetjs']  = $this->jsFiles;

            $tplContent = '{{include:' . $config['template_path'] . '}}';
            $processed  = $this->template->process($tplContent, $this->data);

            return $this->render('partials/header.html')
                . $processed
                . $this->render('partials/footer.html');
        }

        $sectionUrlMap = [
            'Komponenten'   => '/ComponentManagement.html',
            'Systeme'       => '/SystemManagement.html',
            'Applikationen' => '/ApplicationManagement.html',
        ];
        $sectionUrl = htmlspecialchars($sectionUrlMap[$config['breadcrumb_section'] ?? 'Komponenten'] ?? '/AssetManagement.html', ENT_QUOTES);

        $aside = '<aside class="wizardnavigation-enabled">' . "\n"
            . '    <div class="breadcrumb">' . "\n"
            . '        <a href="/AssetManagement.html">Assetmanagement</a><i>›</i>' . "\n"
            . '        <a href="' . $sectionUrl . '">' . $section . '</a><i>›</i>' . "\n"
            . '        <p>' . $label . '</p>' . "\n"
            . '    </div>' . "\n"
            . '    <div class="page-header-container"><div class="page-header"></div></div>' . "\n"
            . '</aside>' . "\n";

        $errorBox = '<div class="error-management" id="formErrorManagement" style="display:none;">' . "\n"
            . '    <div class="error-header"><span class="error-icon">!</span>'
            . '<span class="error-title">Fehler im Formular</span></div>' . "\n"
            . '    <div class="error-content"><ul class="error-list"></ul></div>' . "\n"
            . '</div>' . "\n";

        $sections        = $renderer->renderAllPages($wizardId, $values);
        $entryTemplates = $renderer->renderEntryTemplates($wizardId);
        $form = '<form id="' . $formId . '" data-instance-uuid="" data-wizard-id="' . $safeWizardId . '">' . "\n"
            . $sections
            . '</form>' . "\n"
            . $entryTemplates;

        $floatingBar = '<div class="floating-form-management">' . "\n"
            . '    <div class="form-status-container">' . "\n"
            . '        <span class="form-status-icon">●</span>' . "\n"
            . '        <div class="form-status-text">' . "\n"
            . '            <span class="form-status" data-lastchange="" data-status="unchanged">Keine Änderungen</span>' . "\n"
            . '            <span class="form-lastchange"></span>' . "\n"
            . '        </div>' . "\n"
            . '    </div>' . "\n"
            . '    <button type="submit" form="' . $formId . '" class="btn-save" disabled>' . "\n"
            . '        <span class="btn-save-icon"></span>' . "\n"
            . '        <span class="btn-save-text">Speichern</span>' . "\n"
            . '    </button>' . "\n"
            . '</div>' . "\n";

        $wizardHtml = $aside . $errorBox . $form . $floatingBar;

        // Template-Engine für {{include:...}} im Help-Include ausführen
        $processed = $this->template->process($wizardHtml, $this->data);

        $GLOBALS['assetcss'] = $this->cssFiles;
        $GLOBALS['assetjs']  = $this->jsFiles;

        return $this->render('partials/header.html')
            . $processed
            . $this->render('partials/footer.html');
    }

    /**
     * Lädt Software-Daten und stellt sie als Template-Variable bereit.
     * Konfiguriert über "software_data" im Wizard-JSON: ["templateKey" => "softwareType"]
     */
    protected function loadWizardSoftwareData(array $softwareDataMap): void
    {
        foreach ($softwareDataMap as $templateKey => $softwareType) {
            if (!isset($this->data[$templateKey])) {
                $this->data[$templateKey] = $this->getSoftwareData($softwareType);
            }
        }
    }

    protected function renderTemplate(string $templateName): string
    {
        // Header, Navi, Footer etc. einbinden
        $GLOBALS['assetcss'] = $this->cssFiles;
        $GLOBALS['assetjs'] = $this->jsFiles;

        $headertemplate = $this->render('partials/header.html');
        $footertemplate = $this->render('partials/footer.html');

        $template = $this->template->render($templateName, $this->data);

        return $headertemplate . $template . $footertemplate;
    }

    protected function getSoftwareData(string $softwareType): array
    {
        $datafolder = dirname(__DIR__) . '/data/';
        $jsonfile = "";
        switch ($softwareType) {
            case 'firewall':
                $jsonfile = $datafolder . 'firewall-software.json';
                break;
            case 'antivirus':
                $jsonfile = $datafolder . 'antivirus-software.json';
                break;
            case 'backup':
                $jsonfile = $datafolder . 'backup-software.json';
                break;
            case 'hypervisor':
                $jsonfile = $datafolder . 'hypervisor-software.json';
                break;
            case 'siem':
                $jsonfile = $datafolder . 'siem-software.json';
                break;
            case 'vpn':
                $jsonfile = $datafolder . 'vpn-software.json';
                break;
            // Weitere Softwaretypen können hier hinzugefügt werden
            default:
                return [];
        }
        if (!file_exists($jsonfile)) {
            return [];
        }
        $jsonContent = file_get_contents($jsonfile);
        $data = json_decode($jsonContent, true) ?? [];
        if (\key_exists('software', $data)) {
            return $data['software'];
        }
        return $data;
    }

    /**
     * Hilfsmethode für Redirects
     */
    protected function redirect(string $url, int $statusCode = 302): void
    {
        header("Location: {$url}", true, $statusCode);
        exit;
    }

    /**
     * Hilfsmethode zum Setzen von Template-Daten
     */
    protected function setData(string $key, $value): void
    {
        $this->data[$key] = $value;
    }

    /**
     * Hilfsmethode zum Holen von POST-Daten
     */
    protected function getPost(string $key, $default = null)
    {
        return $_POST[$key] ?? $default;
    }

    /**
     * Hilfsmethode zum Holen von GET-Daten
     */
    protected function getQuery(string $key, $default = null)
    {
        return $_GET[$key] ?? $default;
    }

    /**
     * Prüft ob Request ein POST ist
     */
    protected function isPost(): bool
    {
        return $_SERVER['REQUEST_METHOD'] === 'POST';
    }

    /**
     * Hilfsmethode zum Persistieren eines Entity
     */
    protected function persist(object $entity): void
    {
        $this->unitOfWork->persist($entity);
    }

    /**
     * Hilfsmethode zum Entfernen eines Entity
     */
    protected function remove(object $entity): void
    {
        $this->unitOfWork->remove($entity);
    }

    /**
     * Hilfsmethode zum Flushen aller Änderungen
     */
    protected function flush(): void
    {
        $this->unitOfWork->flush();
    }

    /**
     * Hilfsmethode zum Laden eines Entity
     */
    protected function find(string $entityClass, $id): ?object
    {
        return $this->repository->find($entityClass, $id);
    }

    /**
     * Hilfsmethode zum Laden eines DynamicDocument anhand der Wizard-ID
     */
    protected function findDynamic(string $wizardId, $id): ?\ARPI\Helper\ODM\DynamicDocument
    {
        return $this->repository->findDynamic($wizardId, $id);
    }

    /**
     * Hilfsmethode zum Prüfen ob Entity geändert wurde
     */
    protected function isEntityDirty(object $entity): bool
    {
        return $this->unitOfWork->isEntityDirty($entity);
    }

    /**
     * Hilfsmethode zum Leeren der UnitOfWork
     */
    protected function clearUnitOfWork(): void
    {
        $this->unitOfWork->clear();
    }
}
