<?php
require_once __DIR__ . '/../src/config/env.php';

use Slim\Factory\AppFactory;
use App\Services\Database;

$pdo = Database::getConnection();
$app = AppFactory::create();
$app->addRoutingMiddleware();
$app->addBodyParsingMiddleware();
$app->addErrorMiddleware(true, true, true);
$routes = require __DIR__ . '/../src/Routes/routes.php';
$routes($app);
$app->run();


$appName = $_ENV['APP_NAME']
?>
<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><?= $appName; ?></title>
</head>

<body>
    <h1><?= $appName; ?></h1>
</body>

</html>