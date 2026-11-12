<?php

namespace App\models;

use App\Services\Database;
use PDO;

class Joueur
{
    private PDO $pdoConnection;

    public function SelectionnerJoueurs(): array
    {
        $pdo = Database::getConnection();
        $statement = $pdo->query('SELECT * FROM Joueur ORDER BY id');
        $statement->execute();
        $joueurs = $statement->fetchAll();
        return $joueurs;
    }

    public function SelectionnerUnJoueur(): array | null
    { 
        $pdo = Database::getConnection();
        $statement = $pdo->query('SELECT * FROM Joueur');
        $statement->execute();
        $joueurs = $statement->fetch();
        return $joueurs;
    }

    public function IncrementerUnJoueur($id, $exemplaire): void
    {
        $pdo = Database::getConnection();
        $param = [':id' => $id, ':exemplaire' => $exemplaire];
        $statement = $pdo->query('UPDATE Joueur SET `Nombre`=":exemplaire" WHERE "id" = ":id"');
        $statement->execute();
    }
}
