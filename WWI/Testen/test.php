<?php
require_once('RESTAPI/cls_database.php');
function Opvullen($tekst, $lengte)
{
    return
        str_pad($tekst, $lengte);
}

/*
 Maak nu een functie PrintResultaat($result, $titel), waaraan je een array die je vanuit de Select()
functie krijgt, kan meegeven en tevens een titel die netjes boven het resultaat wordt getoond.
Elke rij uit het resultaat wordt netjes op een volgende regel geprint.
Je kunt de kopjes die je boven de informatie zou willen hebben ophalen uit
het array met de functie array_keys().
Wanneer je het volgende voorbeeld gebruikt:
  */
function PrintResultaat($query, $titel)
{
    $con = new database();
    $dbc = $con->connect();
    print $titel . "\n";

    $sql = $query;
    $stmt = $dbc->prepare($sql);
    $stmt->execute();
    $result = $stmt->fetchall(PDO::FETCH_ASSOC);
    $column = array_keys($result[0]);
    print $column[0] . "\t" . "|" . "\t" . $column[1] . "|" . "\t" . $column[2] . "\t" . "|" . "\t" . $column[3] . "\n";
    foreach ($result as $row) {
        print $row['store_id'] . "\t" . "\t" . "\t" . "|" . "\t";
        print $row['manager_staff_id'] . "\t" . "\t" . "\t" . "\t" . "|" . "\t";
        print $row['address_id'] . "\t" . "\t" . "\t" . "|" . "\t";
        print $row['last_update'] . "\n";
    }


}


PrintResultaat("SELECT * FROM store", "Overzicht van de winkels:");


?>