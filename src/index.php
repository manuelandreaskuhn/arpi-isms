<?php
// Error Reporting (in Produktion ausschalten)
error_reporting(E_ALL);
ini_set('display_errors', '1');

// Autoloader
require_once __DIR__ . '/../vendor/autoload.php';

// Start Session
session_start();

// Erstelle Router
$router = new \ARPI\Helper\SiteRouter(__DIR__ . '/sites');

// Optional: Standard-Site setzen
$router->setDefaultSite('Home');

// Verarbeite Request und gebe HTML aus
echo $router->handle();

