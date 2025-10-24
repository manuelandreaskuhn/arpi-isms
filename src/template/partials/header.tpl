<!doctype html>

<html lang="{i18n-language}">
<head>
    <meta charset="utf-8">

    <title>Dashboard | ARPI</title>
    <meta name="description" content="ISMS with automatic asset management, risk management, process management and incident management - ARPI ISMS">
    <meta name="author" content="Manuel Andreas Kuhn">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <meta name="msapplication-TileColor" content="#007e9e">
    <meta name="theme-color" content="#007E9E">

    <link rel="stylesheet" href="/template/css/main.css">
    {{foreach:assetcss}}
        <link rel="stylesheet" href="{{property:value}}">
    {{/foreach}}
    {{foreach:assetjs}}
        <script type="module" src="{{property:value}}"></script>
    {{/foreach}}
</head>

<body>
    <header>
        <div id="logo">
            <img src="/template/images/logo.png">
        </div>

        <div id="quicksearch">
            <input type="text" name="searchtext" class="search" autocomplete="off" spellcheck="false" placeholder="Suche.." aria-label="Suche"/>
        </div>

        <nav>
            <ul>
                <strong>Prozessmanagement</strong>
                <li><a>Prozesslandkarte</a></li>
            </ul>

            <ul>
                <strong>Dokumentenmanagement</strong>
                <li><a>Richtlinien</a></li>
                <li><a>Konzepte</a></li>
                <li><a>Dokumente</a></li>
            </ul>

            <ul>
                <strong>Risikomanagement</strong>
                <li><a>Risiken</a></li>
            </ul>

            <ul>
                <strong>Vorfallsmanagement</strong>
                <li><a>Vorfälle</a></li>
            </ul>

            <ul>
                <strong>Assetmanagement</strong>
                <li><a>Systeme</a></li>
            </ul>

            <ul>
                <strong>Aufgabenmanagement</strong>
                <li><a>Aktuelle Aufgaben</a></li>
            </ul>
        </nav>

        <div id="account">
            <figure>
                <img src="/template/images/user-account.svg">
                <figcaption>
                    <strong>Manuel</strong>
                    <a>Einstellungen</a> | <a>Abmelden</a>
                </figcaption>
            </figure>
        </div>
    </header>

    <main>
