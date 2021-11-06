<?php

/*Deze class is bedoeld om verbinding te maken met de database.
 */

class database
{
    //parameters
    private $servername = 'localhost';
    private $db_name = 'wideworldimporters';
    private $username = 'root';
    private $password = '';
    private $charset = 'utf8mb8';
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
            ";charset=" . $this->charset,
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