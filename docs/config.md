# Konfigurationsverwaltung

Die ARPI-ISMS Anwendung unterstützt verschiedene Methoden zur Konfiguration, die sich für unterschiedliche Deployment-Szenarien eignen.

## Inhaltsverzeichnis

1. [Docker Secrets (Empfohlen)](#docker-secrets)
2. [Umgebungsvariablen](#umgebungsvariablen)
3. [.env Dateien](#env-dateien)
4. [Prioritätsreihenfolge](#prioritätsreihenfolge)

---

## Docker Secrets

### Beschreibung
Docker Secrets ist der **sicherste Weg** für Docker-Deployments. Secrets werden in separaten Dateien gespeichert und nur den berechtigten Services zur Verfügung gestellt.

### Vorteile
- **Höchste Sicherheit**: Credentials in separaten, geschützten Dateien
- **Kein Klartext im Code**: Credentials niemals in Konfigurationsdateien
- **Granulare Berechtigungen**: Jeder Service erhält nur seine benötigten Secrets
- **Standard für Docker**: Best Practice für containerisierte Anwendungen

### Nachteile
- Erfordert Docker Compose v3.1+
- Secret-Dateien müssen manuell erstellt werden
- Etwas komplexer im Setup als einfache Umgebungsvariablen

### Setup

#### 1. Secret-Verzeichnis und -Dateien erstellen

```bash
# Verzeichnis erstellen
mkdir -p /var/www/html/arpi-isms/secrets
cd /var/www/html/arpi-isms/secrets

# Secrets erstellen
echo "arpi_admin" > mongodb_username.txt
openssl rand -base64 32 > mongodb_password.txt
openssl rand -base64 32 > redis_password.txt

# Berechtigungen einschränken
chmod 600 *.txt
chown www-data:www-data *.txt
```

**Verzeichnisstruktur:**
```
/var/www/html/arpi-isms/
├── secrets/                      ← Hier liegen die Secret-Dateien
│   ├── mongodb_username.txt      ← Username (z.B. "arpi_admin")
│   ├── mongodb_password.txt      ← Generiertes Passwort
│   └── redis_password.txt        ← Generiertes Passwort
├── docker-compose.yml
└── .env
```

#### 2. docker-compose.yml konfigurieren

```yaml
services:
  php:
    secrets:
      - mongodb_username
      - mongodb_password
      - redis_password
    environment:
      - MONGODB_URI=mongodb://mongo:27017
      - MONGODB_DATABASE=arpi

  mongo:
    environment:
      - MONGO_INITDB_ROOT_USERNAME_FILE=/run/secrets/mongodb_username
      - MONGO_INITDB_ROOT_PASSWORD_FILE=/run/secrets/mongodb_password
    secrets:
      - mongodb_username
      - mongodb_password

secrets:
  mongodb_username:
    file: ./secrets/mongodb_username.txt
  mongodb_password:
    file: ./secrets/mongodb_password.txt
  redis_password:
    file: ./secrets/redis_password.txt
```

#### 3. Container starten

```bash
cd /var/www/html/arpi-isms
docker-compose up -d
```

### Zugriff in der Anwendung

Die `Config`-Klasse liest automatisch aus `/run/secrets/`:

```php
// Automatisch: Secrets werden aus /run/secrets/ geladen
$config = Config::getInstance();
$mongoUri = $config->getMongoDbUri(); // Enthält Username und Passwort
```

**Wie es funktioniert:**

1. Docker mountet `./secrets/mongodb_password.txt` → `/run/secrets/mongodb_password` im Container
2. `Config`-Klasse liest `/run/secrets/mongodb_password`
3. Passwort wird in MongoDB URI eingebaut

### Passwort-Rotation

```bash
cd /var/www/html/arpi-isms/secrets

# Neues Passwort generieren
openssl rand -base64 32 > mongodb_password.txt

# Container neu starten
docker-compose restart php mongo
```

---

## Umgebungsvariablen

### Beschreibung
Umgebungsvariablen sind die **Standard-Methode** für Cloud-Deployments und einfache Setups.

### Vorteile 
- **Plattform-agnostisch**: Funktioniert überall
- **Einfache Integration**: Standard in CI/CD Pipelines
- **Keine Dateien nötig**: Alles über Umgebung

### Nachteile
- Sichtbar in Prozessliste (`ps aux`)
- Bei falsch konfigurierten Systemen im Error-Log sichtbar
- Keine native Verschlüsselung

### Setup

#### 1. Systemweit (Linux/Unix)

```bash
# /etc/environment oder ~/.bashrc
export MONGODB_URI="mongodb://localhost:27017"
export MONGODB_DATABASE="arpi"
export MONGODB_USERNAME="arpi_user"
export MONGODB_PASSWORD="secure_password"
export REDIS_HOST="localhost"
export REDIS_PORT="6379"
```

Nach Änderungen System neu laden:
```bash
source /etc/environment
# oder
source ~/.bashrc
```

#### 2. Docker Compose

```yaml
services:
  php:
    environment:
      - MONGODB_URI=mongodb://mongo:27017
      - MONGODB_DATABASE=arpi
      - MONGODB_USERNAME=arpi_user
      - MONGODB_PASSWORD=secure_password
      - REDIS_HOST=redis
      - REDIS_PORT=6379
```

**Nicht empfohlen:** Passwörter im Klartext in `docker-compose.yml`

#### 3. Apache/Nginx

**Apache (.htaccess oder VirtualHost):**
```apache
SetEnv MONGODB_URI "mongodb://localhost:27017"
SetEnv MONGODB_DATABASE "arpi"
SetEnv MONGODB_USERNAME "arpi_user"
SetEnv MONGODB_PASSWORD "secure_password"
```

**Nginx (fastcgi_params oder server block):**
```nginx
location ~ \.php$ {
    fastcgi_param MONGODB_URI "mongodb://localhost:27017";
    fastcgi_param MONGODB_DATABASE "arpi";
    fastcgi_param MONGODB_USERNAME "arpi_user";
    fastcgi_param MONGODB_PASSWORD "secure_password";
}
```

#### 4. Systemd Service

```ini
# /etc/systemd/system/arpi-isms.service
[Service]
Environment="MONGODB_URI=mongodb://localhost:27017"
Environment="MONGODB_DATABASE=arpi"
Environment="MONGODB_USERNAME=arpi_user"
Environment="MONGODB_PASSWORD=secure_password"
```

### Zugriff in der Anwendung

```php
// Automatisch via Config-Klasse
$config = Config::getInstance();
$uri = $config->get('MONGODB_URI');

// Oder direkt
$uri = $_ENV['MONGODB_URI'] ?? $_SERVER['MONGODB_URI'];
```

---

## .env Dateien

### Beschreibung
**.env Dateien** sind ideal für **Development** und **manuelle Installationen**. Einfach zu verwalten, aber weniger sicher für Production.

### Vorteile 
- **Sehr einfach**: Nur eine Textdatei editieren
- **Übersichtlich**: Alle Configs an einem Ort
- **Git-ignore freundlich**: `.env` nicht committen, `.env.example` als Template
- **Schnelles Setup**: Perfekt für lokale Entwicklung

### Nachteile 
- **Klartext-Passwords**: Dateien enthalten unverschlüsselte Credentials
- **Dateiberechtigungen**: Müssen korrekt gesetzt werden
- **Versehentliches Committen**: Risiko, Secrets ins Git zu pushen

### Setup

#### 1. .env.example erstellen (Template)

```bash
# /var/www/html/arpi-isms/.env.example
# MongoDB Configuration
MONGODB_URI=mongodb://localhost:27017
MONGODB_DATABASE=arpi
MONGODB_USERNAME=
MONGODB_PASSWORD=

# Redis Configuration
REDIS_HOST=localhost
REDIS_PORT=6379
REDIS_PASSWORD=

# Application
APP_ENV=development
```

#### 2. Eigene .env erstellen

```bash
cd /var/www/html/arpi-isms

# .env kopieren und anpassen
cp .env.example .env
nano .env
```

**Beispiel .env:**
```bash
# /var/www/html/arpi-isms/.env
# MongoDB Configuration
MONGODB_URI=mongodb://localhost:27017
MONGODB_DATABASE=arpi
MONGODB_USERNAME=arpi_user
MONGODB_PASSWORD=aBc123XyZ789SecurePass

# Redis Configuration
REDIS_HOST=localhost
REDIS_PORT=6379
REDIS_PASSWORD=rEdIs456SecurePass

# Application
APP_ENV=production
```

#### 3. Berechtigungen setzen

```bash
# Nur Owner kann lesen/schreiben
chmod 600 /var/www/html/arpi-isms/.env

# Apache/Nginx User Zugriff geben
chown www-data:www-data /var/www/html/arpi-isms/.env
```

#### 4. .gitignore konfigurieren

```gitignore
# /var/www/html/arpi-isms/.gitignore
.env
.env.local
.env.production
secrets/
```

### Zugriff in der Anwendung

Die `Config`-Klasse lädt automatisch `.env.local` oder `.env`:

```php
$config = Config::getInstance();
$dbName = $config->get('MONGODB_DATABASE');
```

---

## Prioritätsreihenfolge

Die `Config`-Klasse lädt Konfiguration in folgender **Priorität** (höchste zuerst):

```
1. Docker Secrets (/run/secrets/)          ← Höchste Priorität
2. Umgebungsvariablen ($_ENV, $_SERVER)
3. .env.local Datei
4. .env Datei                              ← Niedrigste Priorität
```
