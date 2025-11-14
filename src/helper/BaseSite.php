<?php
namespace ARPI\Helper;

use ARPI\Entities\Annotations\Css as CssAttr;
use ARPI\Entities\Annotations\Js as JsAttr;
use ARPI\Helper\ODM\EntityRepository;
use ARPI\Helper\ODM\UnitOfWork;

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
        // MongoDB-Konfiguration aus Umgebungsvariablen oder Defaults
        $mongoUri = $_ENV['MONGODB_URI'] ?? 'mongodb://localhost:27017';
        $dbName = $_ENV['MONGODB_DATABASE'] ?? 'arpi';
        
        // EntityRepository und UnitOfWork initialisieren
        $this->repository = new EntityRepository($mongoUri, $dbName);
        $this->unitOfWork = new UnitOfWork($this->repository);
        $this->repository->setUnitOfWork($this->unitOfWork);
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
    public function getCssFiles(): array { return $this->cssFiles; }
    public function getJsFiles(): array { return $this->jsFiles; }

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

    /**
     * Hilfsmethode für Transaktionen
     */
    protected function transaction(callable $callback): mixed
    {
        $session = $this->repository->getClient()->startSession();
        
        try {
            $session->startTransaction();
            $result = $callback($session);
            $session->commitTransaction();
            return $result;
        } catch (\Exception $e) {
            $session->abortTransaction();
            throw $e;
        }
    }
}
