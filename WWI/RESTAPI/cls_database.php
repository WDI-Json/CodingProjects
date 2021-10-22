<?php

/*Deze class is bedoeld om verbinding te maken met de database. Dit is onderdeel van de REST-api.
 */

class database
{
    //parameters
    private $host = 'localhost';
    private $db_name = 'Mysql';
    private $username = 'root';
    private $password = '123456';
    private $connection;

    //verbinding met DB
    public function connect()
    {
        $this->connection = null;
        /*Tijdens mijn poging om te verbinden wil ik het weten als er iets misgaat.
        Daarom vang ik een eventuele fout af met een Catch.
        */
        try {
            //connectionstring
            $this->connection = new PDO('mysql:host=' . $this->host . ';dbname=' .
                $this->db_name, $this->username, $this->password);
            $this->connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (PDOException $errordescription) {
            echo 'Connection error: ' . $errordescription->getMessage();
        }
        return $this->connection;
    }

}

?>