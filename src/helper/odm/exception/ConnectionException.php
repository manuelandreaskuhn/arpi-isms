<?php
namespace ARPI\Helper\ODM\Exception;

/**
 * Exception für MongoDB-Verbindungsfehler
 */
class ConnectionException extends \RuntimeException
{
    private string $uri;
    private string $dbName;

    /**
     * @param string $message Fehlermeldung
     * @param string $uri MongoDB URI (ohne Credentials im Klartext!)
     * @param string $dbName Datenbankname
     * @param int $code Error code
     * @param \Throwable|null $previous Previous exception
     */
    public function __construct(
        string $message,
        string $uri = '',
        string $dbName = '',
        int $code = 0,
        ?\Throwable $previous = null
    ) {
        parent::__construct($message, $code, $previous);
        $this->uri = $this->sanitizeUri($uri);
        $this->dbName = $dbName;
    }

    /**
     * Entfernt Credentials aus der URI für sichere Anzeige
     * Zeigt erste 3 und letzte 2 Zeichen des Passworts für Debugging
     */
    private function sanitizeUri(string $uri): string
    {
        // mongodb://user:pass@host:port -> mongodb://user:pas***rd@host:port
        return preg_replace_callback(
            '/^(mongodb(?:\+srv)?:\/\/)([^:]+):([^@]+)@/',
            function ($matches) {
                $username = $matches[2];
                $password = $matches[3];
                
                // Zeige erste 3 und letzte 2 Zeichen vom Passwort
                $maskedPassword = $this->maskPassword($password);
                
                return $matches[1] . $username . ':' . $maskedPassword . '@';
            },
            $uri
        ) ?? $uri;
    }

    /**
     * Maskiert Passwort: zeigt erste 3 und letzte 2 Zeichen
     */
    private function maskPassword(string $password): string
    {
        $len = strlen($password);
        
        if ($len <= 5) {
            // Zu kurzes Passwort: komplett maskieren
            return str_repeat('*', $len);
        }
        
        $first = substr($password, 0, 3);
        $last = substr($password, -2);
        $middle = str_repeat('*', $len - 5);
        
        return $first . $middle . $last;
    }

    /**
     * Gibt eine benutzerfreundliche Fehlermeldung mit Hilfestellung zurück.
     */
    public function getUserFriendlyMessage(): string
    {
        $message = "MongoDB Connection Error\n";
        $message .= str_repeat("=", 50) . "\n\n";
        
        $message .= "Error: " . $this->getMessage() . "\n\n";
        
        if ($this->uri) {
            $message .= "MongoDB URI: " . $this->uri . "\n";
        }
        
        if ($this->dbName) {
            $message .= "Database: " . $this->dbName . "\n";
        }
        
        // Config-Info hinzufügen
        try {
            $config = \ARPI\Helper\Config::getInstance();
            $configInfo = $config->getConfigInfo(true);
            
            $message .= "\nConfiguration Method:\n";
            
            if ($configInfo['using_docker_secrets']) {
                $message .= "Using Docker Secrets\n";
                $message .= "  - Username from: " . $this->formatSource($configInfo['mongodb_username_source']) . "\n";
                $message .= "  - Password from: " . $this->formatSource($configInfo['mongodb_password_source']) . "\n";
            } elseif ($configInfo['using_env_file']) {
                $message .= "Using .env file\n";
                $message .= "  - Config file: " . $configInfo['env_file'] . "\n";
            } else {
                $message .= "Using Environment Variables\n";
            }
        } catch (\Exception $e) {
            // Config konnte nicht geladen werden
        }
        
        $message .= "\n" . str_repeat("-", 50) . "\n";
        $message .= "Troubleshooting:\n\n";
        
        // Angepasste Troubleshooting-Schritte basierend auf Konfigurationsmethode
        $message .= $this->getTroubleshootingSteps();
        
        if ($this->getPrevious()) {
            $message .= str_repeat("-", 50) . "\n";
            $message .= "Original Error:\n";
            $message .= $this->getPrevious()->getMessage() . "\n";
        }
        
        return $message;
    }

    /**
     * Formatiert die Quelle für lesbare Ausgabe
     */
    private function formatSource(string $source): string
    {
        return match($source) {
            'docker_secret' => '/run/secrets/ (Docker Secret)',
            'environment' => 'Environment Variable',
            'server' => 'Server Variable',
            '.env' => '.env file',
            '.env.local' => '.env.local file',
            default => $source
        };
    }

    /**
     * Gibt spezifische Troubleshooting-Schritte basierend auf der Konfigurationsmethode
     */
    private function getTroubleshootingSteps(): string
    {
        try {
            $config = \ARPI\Helper\Config::getInstance();
            $configInfo = $config->getConfigInfo(true);
            
            if ($configInfo['using_docker_secrets']) {
                return $this->getDockerSecretsTroubleshooting();
            } elseif ($configInfo['using_env_file']) {
                return $this->getEnvFileTroubleshooting();
            } else {
                return $this->getEnvironmentVariablesTroubleshooting();
            }
        } catch (\Exception $e) {
            return "";
        }
    }

    /**
     * Troubleshooting für Docker Secrets
     */
    private function getDockerSecretsTroubleshooting(): string
    {
        return "1. Check if MongoDB container is running:\n" .
               "   docker-compose ps\n\n" .
               
               "2. Verify Docker Secrets exist:\n" .
               "   ls -la /var/www/html/arpi-isms/secrets/\n" .
               "   Should contain: mongodb_username.txt, mongodb_password.txt\n\n" .
               
               "3. Check secret file contents:\n" .
               "   cat /var/www/html/arpi-isms/secrets/mongodb_username.txt\n" .
               "   cat /var/www/html/arpi-isms/secrets/mongodb_password.txt\n\n" .
               
               "4. Verify secrets are mounted in container:\n" .
               "   docker exec arpi-isms-php ls -la /run/secrets/\n\n" .
               
               "5. Check MongoDB logs:\n" .
               "   docker-compose logs mongo\n\n" .
               
               "6. Test MongoDB authentication:\n" .
               "   docker exec arpi-isms-mongo mongosh -u \$(cat secrets/mongodb_username.txt) -p \$(cat secrets/mongodb_password.txt) --authenticationDatabase admin\n\n" .
               "7. Recreate secrets and restart:\n" .
               "   cd /var/www/html/arpi-isms/secrets\n" .
               "   openssl rand -base64 32 > mongodb_password.txt\n" .
               "   docker-compose down\n" .
               "   docker-compose up -d\n\n";
    }

    /**
     * Troubleshooting für .env Dateien
     */
    private function getEnvFileTroubleshooting(): string
    {
        return "1. Check if MongoDB is running:\n" .
               "   If using Docker: docker-compose ps\n" .
               "   If manual install: systemctl status mongod\n\n" .
               
               "2. Verify .env file exists and is readable:\n" .
               "   ls -la /var/www/html/arpi-isms/.env\n" .
               "   cat /var/www/html/arpi-isms/.env\n\n" .
               
               "3. Check .env file permissions:\n" .
               "   chmod 600 /var/www/html/arpi-isms/.env\n" .
               "   chown www-data:www-data /var/www/html/arpi-isms/.env\n\n" .
               
               "4. Verify credentials in .env:\n" .
               "   grep MONGODB /var/www/html/arpi-isms/.env\n\n" .
               
               "5. Test MongoDB connection manually:\n" .
               "   mongosh mongodb://username:password@localhost:27017\n\n" .
               "6. Restart web server:\n" .
               "   If Docker: docker-compose restart php\n" .
               "   If Apache: systemctl restart apache2\n" .
               "   If Nginx: systemctl restart php-fpm\n\n";
    }

    /**
     * Troubleshooting für Umgebungsvariablen
     */
    private function getEnvironmentVariablesTroubleshooting(): string
    {
        return "1. Check if MongoDB is running:\n" .
               "   docker-compose ps (for Docker)\n" .
               "   systemctl status mongod (for manual install)\n\n" .
               
               "2. Verify environment variables are set:\n" .
               "   printenv | grep MONGODB\n\n" .
               
               "3. Check variables in PHP:\n" .
               "   php -r \"var_dump(getenv('MONGODB_URI'));\"\n\n" .
               
               "4. For Docker Compose, check environment section:\n" .
               "   cat docker-compose.yml | grep -A 10 environment\n\n" .
               
               "5. For systemd service, check Environment:\n" .
               "   systemctl cat your-service.service\n\n" .
               
               "6. Restart service/container:\n" .
               "   docker-compose restart (for Docker)\n" .
               "   systemctl restart your-service (for systemd)\n\n";
    }


    public function getUri(): string
    {
        return $this->uri;
    }

    public function getDbName(): string
    {
        return $this->dbName;
    }
}
