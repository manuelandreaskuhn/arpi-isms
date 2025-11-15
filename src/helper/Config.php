<?php
namespace ARPI\Helper;

/**
 * Sichere Konfigurationsverwaltung
 * Unterstützt .env-Dateien, Docker Secrets und Umgebungsvariablen
 */
class Config
{
    private static ?self $instance = null;
    private array $config = [];
    private bool $loaded = false;
    private array $configSources = [];

    private function __construct()
    {
        $this->load();
    }

    public static function getInstance(): self
    {
        if (self::$instance === null) {
            self::$instance = new self();
        }
        return self::$instance;
    }

    /**
     * Lädt Konfiguration in folgender Priorität:
     * 1. Docker Secrets (/run/secrets/)
     * 2. Umgebungsvariablen
     * 3. .env Datei
     */
    private function load(): void
    {
        if ($this->loaded) {
            return;
        }

        // 1. .env Datei laden (niedrigste Priorität)
        $this->loadEnvFile();

        // 2. Umgebungsvariablen überschreiben .env
        $this->loadEnvironmentVariables();

        // 3. Docker Secrets haben höchste Priorität
        $this->loadDockerSecrets();

        $this->loaded = true;
    }

    /**
     * Lädt .env Datei falls vorhanden
     */
    private function loadEnvFile(): void
    {
        $rootDir = dirname(__DIR__, 2);
        $envFiles = ['.env.local', '.env'];

        foreach ($envFiles as $envFile) {
            $envPath = $rootDir . '/' . $envFile;
            if (file_exists($envPath)) {
                $this->parseEnvFile($envPath);
                $this->configSources['env_file'] = $envPath;
                break;
            }
        }
    }

    /**
     * Parst .env Datei
     */
    private function parseEnvFile(string $path): void
    {
        $lines = file($path, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
        foreach ($lines as $line) {
            if (strpos(trim($line), '#') === 0) {
                continue;
            }
            
            if (strpos($line, '=') !== false) {
                list($key, $value) = explode('=', $line, 2);
                $key = trim($key);
                $value = trim($value);
                $value = trim($value, '"\'');
                $this->config[$key] = $value;
            }
        }
    }

    /**
     * Lädt Umgebungsvariablen
     */
    private function loadEnvironmentVariables(): void
    {
        foreach ($_ENV as $key => $value) {
            $this->config[$key] = $value;
        }
        
        foreach ($_SERVER as $key => $value) {
            if (!isset($this->config[$key])) {
                $this->config[$key] = $value;
            }
        }
    }

    /**
     * Lädt Docker Secrets aus /run/secrets/
     */
    private function loadDockerSecrets(): void
    {
        $secretsDir = '/run/secrets';
        
        if (!is_dir($secretsDir)) {
            return;
        }

        $secretMapping = [
            'mongodb_uri' => 'MONGODB_URI',
            'mongodb_database' => 'MONGODB_DATABASE',
            'mongodb_username' => 'MONGODB_USERNAME',
            'mongodb_password' => 'MONGODB_PASSWORD',
            'redis_password' => 'REDIS_PASSWORD',
        ];

        foreach ($secretMapping as $secretFile => $envKey) {
            $secretPath = $secretsDir . '/' . $secretFile;
            if (file_exists($secretPath)) {
                $value = trim(file_get_contents($secretPath));
                if ($value !== '') {
                    $this->config[$envKey] = $value;
                    $this->configSources[$envKey] = $secretPath;
                }
            }
        }
    }

    /**
     * Holt Konfigurationswert
     */
    public function get(string $key, $default = null)
    {
        return $this->config[$key] ?? $default;
    }

    /**
     * Holt Debug-Informationen als String
     */
    public function getConfigInfo(bool $detailed = false): array
    {
        if ($detailed) {
            return [
                'config_keys' => array_map(function ($key) {
                    return [
                        'value' => $this->config[$key] ?? null,
                        'source' => $this->configSources[$key] ?? 'environment_vars',
                        'masked' => in_array($key, ['MONGODB_PASSWORD', 'REDIS_PASSWORD']),
                    ];
                }, array_keys($this->config)),
                'sources' => $this->configSources,
                'using_env_file' => isset($this->configSources['env_file']) ? $this->configSources['env_file'] : null,
                'env_file' => $this->configSources['env_file'] ?? null,
                'using_docker_secrets' => isset($this->configSources['MONGODB_USERNAME']) && strpos($this->configSources['MONGODB_USERNAME'], '/run/secrets/') === 0,
                'mongodb_username_source' => $this->configSources['MONGODB_USERNAME'] ?? null,
                'mongodb_password_source' => $this->configSources['MONGODB_PASSWORD'] ?? null,
            ];
        }

        return $this->config;
    }

    /**
     * Baut MongoDB URI mit Credentials
     */
    public function getMongoDbUri(): string
    {
        $uri = $this->get('MONGODB_URI', 'mongodb://localhost:27017');
        $username = $this->get('MONGODB_USERNAME');
        $password = $this->get('MONGODB_PASSWORD');
        $database = $this->get('MONGODB_DATABASE', 'arpi');

        // Wenn Credentials vorhanden, in URI einbauen
        if ($username && $password) {
            // mongodb://user:pass@host:port zu mongodb://host:port parsen
            $parsed = parse_url($uri);
            $scheme = $parsed['scheme'] ?? 'mongodb';
            $host = $parsed['host'] ?? 'localhost';
            $port = $parsed['port'] ?? 27017;
            
            $encodedUser = rawurlencode($username);
            $encodedPass = rawurlencode($password);
            
            return "{$scheme}://{$encodedUser}:{$encodedPass}@{$host}:{$port}/{$database}?authSource={$database}";
        }

        return $uri;
    }

    /**
     * Holt MongoDB Datenbanknamen
     */
    public function getMongoDbDatabase(): string
    {
        return $this->get('MONGODB_DATABASE', 'arpi');
    }
}
