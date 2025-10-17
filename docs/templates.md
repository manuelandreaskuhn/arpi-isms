# Template Verzeichnis

Dieser Ordner enthält alle HTML-Templates für die Anwendung.

## Struktur

Organisieren Sie Ihre Templates in Unterordnern für bessere Übersicht:

```
template/
├── layouts/          # Layout-Templates
│   ├── main.html
│   └── admin.html
├── pages/            # Seiten-Templates
│   ├── home.html
│   └── about.html
├── components/       # Wiederverwendbare Komponenten
│   ├── header.html
│   └── footer.html
└── emails/          # E-Mail-Templates
    └── welcome.html
```

## Verwendung

```php
$template = new Template();

// Template aus Unterordner laden
$output = $template->render('pages/home.html', ['title' => 'Willkommen']);

// Verschachtelte Ordner
$output = $template->render('emails/user/welcome.html', $data);

// Prüfen ob Template existiert
if ($template->exists('pages/about.html')) {
    $output = $template->render('pages/about.html');
}
```

## Template-Syntax

### 1. Variablen

Einfacher Zugriff auf globale Variablen:

```html
<h1>{{title}}</h1>
<p>{{description}}</p>
```

### 2. Properties

Erweiterte Property-Zugriffe mit verschiedenen Modifiern:

```html
<!-- Escaped output (Standard) -->
{{property:user.name}}

<!-- Raw HTML (nicht escaped) -->
{{property:content.html|raw}}

<!-- JSON output -->
{{property:settings|json}}

<!-- Original value (ohne Type-Conversion) -->
{{property:timestamp|original}}

<!-- Verschachtelte Properties -->
{{property:user.address.city}}
{{property:order.customer.email}}
```

**Type-Conversion:**
- **Boolean**: `true`/`false`
- **DateTime**: `25.12.2024 15:30` (lokalisiert)
- **Enum**: Wert oder Name
- **Array**: Komma-separiert
- **Float**: `1.234,56` (mit Tausendertrennern)
- **Entity mit toString()**: Automatischer Aufruf
- **Objekte**: Klassenname als Fallback

### 3. Listen und Arrays

Iterieren über Listen mit Zugriff auf Index, Key und Value:

```html
{{foreach:items}}
    <div class="item">
        <span>Index: {{index}}</span>
        <span>Key: {{key}}</span>
        <span>Value: {{value}}</span>
        
        <!-- Property-Zugriffe auf Objekte -->
        {{property:value.name}}
        {{property:value.price}}
        
        <!-- Oder mit 'item' -->
        {{property:item.id}}
    </div>
{{/foreach}}
```

**Beispiel mit Entity-Objekten:**

```html
{{foreach:users}}
    <tr>
        <td>{{property:item.id}}</td>
        <td>{{property:item.username}}</td>
        <td>{{property:item.email}}</td>
        <td>{{date:item.createdAt|relative}}</td>
    </tr>
{{/foreach}}
```

### 4. Enums

Iterieren über Enum-Werte mit optionaler Sortierung:

```html
<!-- Einfache Iteration -->
{{enum:StatusEnum}}
    <option value="{{key}}">{{name}}</option>
{{/enum}}

<!-- Sortiert aufsteigend -->
{{enum:StatusEnum|sorted|asc}}
    <option value="{{key}}">{{name}}</option>
{{/enum}}

<!-- Sortiert absteigend -->
{{enum:StatusEnum|sorted|desc}}
    <li>{{name}}: {{value}}</li>
{{/enum}}
```

**Verfügbare Variablen:**
- `{{key}}`: Der Enum-Wert (bei BackedEnum) oder Name
- `{{name}}`: Der Enum-Name
- `{{value}}`: Der Enum-Wert

### 5. Internationalisierung (i18n)

Übersetzen von Texten mit Variablen-Unterstützung:

```html
<!-- Einfache Übersetzung -->
<h1>{{i18n:welcome}}</h1>

<!-- Mit Variablen -->
<p>{{i18n:greeting|name:John}}</p>

<!-- Mit dynamischen Werten -->
<p>{{i18n:items_count|count:5}}</p>

<!-- Mit mehreren Variablen -->
<p>{{i18n:order_summary|total:99.99|items:3}}</p>
```

**Übersetzungsdateien:** Liegen in `src/i18n/`

```php
// src/i18n/de.php
return [
    'welcome' => 'Willkommen',
    'greeting' => 'Hallo {name}!',
    'items_count' => 'Sie haben {count} Artikel',
];
```

**Locale setzen:**

```php
$i18nModule = $template->getModule('i18n');
$i18nModule->loadLocale('de');  // Lädt src/i18n/de.php
$i18nModule->setLocale('en_US'); // Passt Zahlen- und Datumsformate an
```

### 6. Datum und Uhrzeit

Formatierung von Datumswerten mit Internationalisierung:

```html
<!-- Unix Timestamp -->
{{date:createdAt|timestamp}}
<!-- Ausgabe: 1703516400 -->

<!-- Nur Datum (lokalisiert) -->
{{date:createdAt|date}}
<!-- DE: 25.12.2024, EN: 12/25/2024, FR: 25/12/2024 -->

<!-- Nur Uhrzeit (lokalisiert) -->
{{date:createdAt|time}}
<!-- DE: 15:30, EN: 03:30 PM -->

<!-- Datum und Uhrzeit (lokalisiert) -->
{{date:createdAt|datetime}}
<!-- DE: 25.12.2024 15:30, EN: 12/25/2024 03:30 PM -->

<!-- Relatives Datum -->
{{date:createdAt|relative}}
<!-- DE: vor 5 Minuten, seit 2 Tagen -->
<!-- EN: 5 minutes ago, 2 days since -->

<!-- Custom Format -->
{{date:createdAt|format:Y-m-d}}
{{date:createdAt|format:d.m.Y H:i:s}}

<!-- In Schleifen -->
{{foreach:posts}}
    <p>{{date:item.publishedAt|relative}}</p>
{{/foreach}}
```

**Unterstützte Eingabe-Formate:**
- `DateTime` / `DateTimeInterface` Objekte
- Unix Timestamp (numerisch)
- String-Datums (wird automatisch geparst)

**Relative Zeitangaben:**
- Sekunden, Minuten, Stunden
- Tage, Wochen, Monate, Jahre
- Automatische Plural-/Singularformen
- Vollständig übersetzbar

### 7. Bedingungen (Conditionals)

Überprüfung von Variablen auf Existenz, Werte und Bedingungen:

#### Einfache Bedingungen

```html
<!-- Existenz prüfen -->
{{if:user}}
    <p>Benutzer ist angemeldet</p>
{{/if}}

<!-- Not/Negation -->
{{if:user|not}}
    <p>Kein Benutzer angemeldet</p>
{{/if}}

<!-- Empty Check -->
{{if:items|empty}}
    <p>Keine Einträge vorhanden</p>
{{/if}}

<!-- Not Empty -->
{{if:items|notempty}}
    <p>Es gibt Einträge</p>
{{/if}}
```

#### If-Else

```html
{{if:user}}
    <p>Willkommen {{property:user.name}}</p>
{{else}}
    <p>Bitte melden Sie sich an</p>
{{/if}}
```

#### If-ElseIf-Else

```html
{{if:user.role|equals:admin}}
    <p>Administrator-Panel</p>
{{elseif:user.role|equals:moderator}}
    <p>Moderator-Panel</p>
{{elseif:user.role|equals:user}}
    <p>Benutzer-Panel</p>
{{else}}
    <p>Gast-Ansicht</p>
{{/if}}
```

#### Vergleichsoperatoren

**Gleichheit:**
```html
<!-- Gleich (loose comparison) -->
{{if:status|equals:active}}...{{/if}}
{{if:count|eq:5}}...{{/if}}

<!-- Nicht gleich -->
{{if:status|notequals:inactive}}...{{/if}}
{{if:status|neq:deleted}}...{{/if}}

<!-- Strikt gleich (===) -->
{{if:value|same:100}}...{{/if}}
{{if:value|identical:true}}...{{/if}}

<!-- Strikt nicht gleich (!==) -->
{{if:value|notsame:0}}...{{/if}}
```

**Größer/Kleiner:**
```html
<!-- Größer als -->
{{if:age|gt:18}}
    <p>Volljährig</p>
{{/if}}

<!-- Größer oder gleich -->
{{if:score|gte:50}}
    <p>Bestanden</p>
{{/if}}

<!-- Kleiner als -->
{{if:temperature|lt:0}}
    <p>Frost!</p>
{{/if}}

<!-- Kleiner oder gleich -->
{{if:stock|lte:10}}
    <p>Nur noch wenige verfügbar</p>
{{/if}}
```

#### Boolean Checks

```html
{{if:isActive|true}}
    <span class="active">Aktiv</span>
{{/if}}

{{if:isDeleted|false}}
    <p>Eintrag ist verfügbar</p>
{{/if}}
```

#### String Operationen

```html
<!-- Enthält -->
{{if:email|contains:@}}
    <p>Gültige E-Mail-Adresse</p>
{{/if}}

<!-- Enthält nicht -->
{{if:message|notcontains:spam}}
    <p>Nachricht ist sauber</p>
{{/if}}

<!-- Beginnt mit -->
{{if:filename|startswith:test_}}
    <p>Test-Datei</p>
{{/if}}

<!-- Endet mit -->
{{if:filename|endswith:.pdf}}
    <p>PDF-Dokument</p>
{{/if}}
```

#### Array/Collection Checks

```html
<!-- Wert ist im Array -->
{{if:allowedRoles|in:admin}}
    <p>Admin-Zugriff erlaubt</p>
{{/if}}

<!-- Wert ist nicht im Array -->
{{if:blockedUsers|notin:{{property:user.id}}}}
    <p>Zugriff gewährt</p>
{{/if}}
```

#### Type Checks

```html
<!-- Null Check -->
{{if:value|isnull}}
    <p>Kein Wert gesetzt</p>
{{/if}}

{{if:value|isnotnull}}
    <p>Wert vorhanden</p>
{{/if}}

<!-- Type Checks -->
{{if:data|isarray}}...{{/if}}
{{if:user|isobject}}...{{/if}}
{{if:name|isstring}}...{{/if}}
{{if:count|isnumeric}}...{{/if}}
{{if:active|isbool}}...{{/if}}
```

#### Property-Pfade in Bedingungen

```html
<!-- Verschachtelte Properties -->
{{if:user.profile.verified|true}}
    <span class="verified">✓</span>
{{/if}}

{{if:order.total|gt:100}}
    <p>Kostenloser Versand!</p>
{{/if}}

<!-- In Schleifen -->
{{foreach:orders}}
    {{if:item.status|equals:shipped}}
        <span class="shipped">Versendet</span>
    {{elseif:item.status|equals:pending}}
        <span class="pending">In Bearbeitung</span>
    {{else}}
        <span class="cancelled">Storniert</span>
    {{/if}}
{{/foreach}}
```

#### Vergleich mit Variablen

```html
<!-- Literale Werte -->
{{if:age|gt:18}}...{{/if}}
{{if:name|equals:"John"}}...{{/if}}
{{if:price|lte:99.99}}...{{/if}}

<!-- Mit anderen Variablen -->
{{if:user.id|equals:currentUserId}}
    <p>Das ist Ihr Profil</p>
{{/if}}

{{if:post.authorId|equals:user.id}}
    <button>Bearbeiten</button>
{{/if}}
```

#### Verschachtelte Bedingungen

```html
{{if:user}}
    {{if:user.isPremium|true}}
        <div class="premium-features">
            {{if:user.credits|gt:0}}
                <p>Sie haben {{property:user.credits}} Credits</p>
            {{else}}
                <p>Keine Credits mehr verfügbar</p>
            {{/if}}
        </div>
    {{else}}
        <a href="/upgrade">Upgrade auf Premium</a>
    {{/if}}
{{/if}}
```

#### Praktische Beispiele

**Benutzer-Status anzeigen:**
```html
{{if:user|not}}
    <a href="/login">Anmelden</a>
{{else}}
    {{if:user.role|equals:admin}}
        <a href="/admin">Admin-Panel</a>
    {{/if}}
    <span>Hallo, {{property:user.name}}</span>
    <a href="/logout">Abmelden</a>
{{/if}}
```

**Produktverfügbarkeit:**
```html
{{foreach:products}}
    <div class="product">
        <h3>{{property:item.name}}</h3>
        <p>{{property:item.price}} €</p>
        
        {{if:item.stock|gt:10}}
            <span class="available">Auf Lager</span>
        {{elseif:item.stock|gt:0}}
            <span class="low-stock">Nur noch {{property:item.stock}} verfügbar</span>
        {{else}}
            <span class="out-of-stock">Ausverkauft</span>
        {{/if}}
    </div>
{{/foreach}}
```

**Zugriffskontrolle:**
```html
{{if:currentUser.id|equals:post.authorId}}
    <button onclick="editPost()">Bearbeiten</button>
    <button onclick="deletePost()">Löschen</button>
{{elseif:currentUser.role|equals:admin}}
    <button onclick="moderatePost()">Moderieren</button>
{{/if}}
```

#### Verfügbare Operatoren

**Existenz:**
- `exists` - Variable existiert (Standard wenn kein Operator)
- `notexists`, `not` - Variable existiert nicht

**Empty:**
- `empty` - Wert ist leer (empty())
- `notempty`, `filled` - Wert ist nicht leer

**Boolean:**
- `true` - Wert ist true
- `false` - Wert ist false

**Gleichheit:**
- `equals`, `eq` - Gleich (==)
- `notequals`, `neq`, `ne` - Nicht gleich (!=)
- `same`, `identical` - Strikt gleich (===)
- `notsame`, `notidentical` - Strikt nicht gleich (!==)

**Vergleiche:**
- `gt`, `greater` - Größer als (>)
- `gte`, `greaterorequal` - Größer oder gleich (>=)
- `lt`, `less` - Kleiner als (<)
- `lte`, `lessorequal` - Kleiner oder gleich (<=)

**Strings:**
- `contains` - Enthält String
- `notcontains` - Enthält String nicht
- `startswith` - Beginnt mit
- `endswith` - Endet mit

**Arrays:**
- `in` - Wert ist im Array
- `notin` - Wert ist nicht im Array

**Types:**
- `isnull` - Ist null
- `isnotnull` - Ist nicht null
- `isarray` - Ist Array
- `isobject` - Ist Objekt
- `isstring` - Ist String
- `isnumeric` - Ist numerisch
- `isbool` - Ist Boolean

## Konfiguration

### Template-Ordner setzen

```php
$template = new Template('/custom/template/path');

// Oder später ändern
$template->setTemplateDir('/another/path');
```

### Globale Variablen

```php
$template->setGlobal('siteName', 'Meine Website');
$template->setGlobal('currentUser', $userObject);

// Im Template verfügbar als:
// {{siteName}}
// {{property:currentUser.name}}
```

### Internationalisierung konfigurieren

```php
$i18nModule = $template->getModule('i18n');

// Locale laden (lädt automatisch de.php)
$i18nModule->loadLocale('de');

// Spezifische Datei laden
$i18nModule->loadTranslations('messages/common.php', 'de');

// Zahlenformat manuell setzen
$i18nModule->setNumberFormat(',', '.');

// Locale setzen (passt automatisch Formate an)
$i18nModule->setLocale('en_US');
```

## Vollständiges Beispiel

```html
<!DOCTYPE html>
<html lang="de">
<head>
    <title>{{property:page.title}}</title>
</head>
<body>
    <header>
        <h1>{{i18n:welcome}}</h1>
        {{if:user}}
            <p>{{i18n:greeting|name:{{property:user.name}}}}</p>
        {{else}}
            <a href="/login">{{i18n:login}}</a>
        {{/if}}
    </header>

    <main>
        <h2>{{i18n:recent_posts}}</h2>
        
        {{if:posts|empty}}
            <p>{{i18n:no_posts}}</p>
        {{else}}
            <div class="posts">
                {{foreach:posts}}
                    <article>
                        <h3>{{property:item.title}}</h3>
                        <p>{{property:item.excerpt|raw}}</p>
                        <footer>
                            <span>{{property:item.author.name}}</span>
                            <time>{{date:item.publishedAt|relative}}</time>
                            
                            {{if:item.authorId|equals:user.id}}
                                <button>{{i18n:edit}}</button>
                            {{/if}}
                        </footer>
                    </article>
                {{/foreach}}
            </div>
        {{/if}}

        {{if:user.role|equals:admin}}
            <h2>{{i18n:status_filter}}</h2>
            <select name="status">
                {{enum:StatusEnum|sorted|asc}}
                    <option value="{{key}}">{{name}}</option>
                {{/enum}}
            </select>
        {{/if}}
    </main>

    <footer>
        <p>{{date:now|datetime}}</p>
    </footer>
</body>
</html>
```

```php
// PHP Code
$template = new Template();

// i18n konfigurieren
$i18nModule = $template->getModule('i18n');
$i18nModule->loadLocale('de');

// Daten bereitstellen
$template->render('pages/home.html', [
    'page' => $pageObject,
    'user' => $currentUser,
    'posts' => $blogPosts,
    'now' => new DateTime()
]);
```

## Sicherheit

- **Automatisches HTML-Escaping**: Alle Property-Ausgaben werden standardmäßig escaped
- **UTF-8 Ausgabe**: Alle Strings werden in UTF-8 ausgegeben
- **Path Traversal Schutz**: Template-Dateien müssen im Template-Ordner liegen
- **i18n Path Schutz**: Übersetzungen nur aus `src/i18n/`
- **Raw-Modifier**: Nur bewusst mit `|raw` deaktivieren

## Best Practices

1. **Organisieren Sie Templates in Unterordnern** nach Funktion
2. **Verwenden Sie sprechende Variablennamen** in den Daten
3. **Nutzen Sie Enums** für Status, Kategorien, etc.
4. **Übersetzen Sie alle Texte** mit i18n
5. **Escapen Sie nur bei Bedarf mit raw** und seien Sie vorsichtig
6. **Nutzen Sie relative Datumsangaben** für bessere UX
7. **Formatieren Sie Zahlen** automatisch über Property-Modul
8. **Erstellen Sie wiederverwendbare Components** in components/
9. **Verwenden Sie Bedingungen** für bedingte Anzeige von Inhalten
10. **Kombinieren Sie Bedingungen mit Schleifen** für dynamische Listen
11. **Nutzen Sie Type-Checks** für robuste Templates
12. **Vermeiden Sie zu tiefe Verschachtelungen** - extrahieren Sie in Components
