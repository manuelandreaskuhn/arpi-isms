# Template Verzeichnis

Der Ordner "template" enthält alle HTML-Templates für die Anwendung.

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
```

## Template-Syntax

### Variablen
```html
<h1>{{title}}</h1>
```

### Listen iterieren
```html
{{foreach:items}}
    <li>{{index}}: {{value.name}}</li>
{{/foreach}}
```

### Properties mit Modifiern
```html
{{property:user.email}}           <!-- Escaped -->
{{property:user.bio|raw}}         <!-- Raw HTML -->
{{property:data|json}}            <!-- JSON -->
```

### Internationalisierung
```html
{{i18n:welcome_message}}
{{i18n:greeting|name:John}}
```

### Enums
```html
{{enum:StatusEnum|sorted|asc}}
    <option value="{{key}}">{{name}}</option>
{{/enum}}
```
