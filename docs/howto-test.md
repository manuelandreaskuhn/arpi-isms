# Docker Setup für lokale Entwicklung

## Installation unter Debian / Ubuntu

### 1. Docker Engine & Compose Plugin installieren (offizielles Repository empfohlen)

```bash
# Alte Versionen entfernen (optional)
sudo apt-get remove -y docker docker-engine docker.io containerd runc || true

# Paketquellen aktualisieren und Voraussetzungen installieren
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg lsb-release

# GPG Key hinzufügen
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo $ID)/gpg | \
  sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Repository hinzufügen
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/$(. /etc/os-release; echo $ID) \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Installieren
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

### 2. (Optional) Benutzer zur docker Gruppe hinzufügen
```bash
sudo usermod -aG docker $USER
# Neue Session laden:
newgrp docker
```

### 3. Funktion testen
```bash
docker version
docker compose version         # Offizielles Compose Plugin
```


## Option A: Repository klonen

```bash
git clone <REPO_URL> arpi-isms
cd arpi-isms
```

## Option B: Projekt bereits vorhanden

Falls der Code z.B. durch ein anderes Deployment oder manuelles Kopieren schon liegt, einfach in das Verzeichnis wechseln und direkt bauen/starten:

```bash
cd /var/www/html/arpi-isms
```

## Docker starten und Tests ausführen

Optional: Schreibrechte für aktuellen Benutzer sicherstellen (wenn Container root-Dateien angelegt hat):
```bash
sudo chown -R $USER:$USER .
```

### Container neu bauen (z.B. nach Dockerfile-Änderungen):
```bash
docker compose build
```

### Docker starten:
```bash
docker compose up -d
```

### Tests ausführen:
```bash
docker compose exec php vendor/bin/phpunit --configuration phpunit.xml
```

## Wichtige Befehle

Composer Dependencies (falls vendor/ fehlt oder aktualisiert werden soll):
```bash
docker compose run --rm php composer install
# oder Update:
docker compose run --rm php composer update
```

Logs prüfen:
```bash
docker compose logs -f
```

Neu starten (schnell):
```bash
docker compose restart
```

Hard Reset (Achtung: Volumes + Daten weg):
```bash
docker compose down -v
docker compose up -d
```
