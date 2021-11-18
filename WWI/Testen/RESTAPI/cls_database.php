<?php

/*Deze class is bedoeld om verbinding te maken met de database.
 */

class database
{
    //parameters
    private $servername = 'localhost:3306';
    private $db_name = 'sakila';
    private $username = 'root';
    private $password = '';
    private $connection;

    //verbinding met DB
    public function connect()
    {
        /*leeggooien $connection om eerdere verbinding leeg te hebben bij aanvang */
        $this->connection = null;
        /*Tijdens mijn poging om te verbinden wil ik het weten als er iets misgaat.
        Daarom vang ik een eventuele fout af met een Catch.
        */
        try {
            //connectionstring
            $this->connection = new PDO(
            "mysql:host=" . $this->servername .
            ";dbname=" . $this->db_name,
            $this->username,
            $this->password
            );
            $this->connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (PDOException $errordescription) {
            echo "Connection failed: " . $errordescription->getMessage();
        }
        return $this->connection;
    }

}

?>