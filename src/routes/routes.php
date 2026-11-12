<?php
use App\controllers\AccueilController;
use Slim\App;
return function (App $app) {
$app->get('/', [AccueilController::class, 'index']);
};