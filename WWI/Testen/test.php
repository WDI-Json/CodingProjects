

<?php
require_once('RESTAPI/cls_database.php');
function Opvullen($tekst, $lengte) {
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
    $column = $dbc->query("DESCRIBE store");
    print $column;

    foreach($dbc->query($query) as $row) {
        print $row[0] . "\t" . "\t" ."|" . "\t" ;
        print $row[1] . "\t" . "\t" . "\t" ."|" ."\t";
        print $row[2] . "\t" . "\t" . "\t" ."|";
        print $row[3] . "\n";
    }

    }


PrintResultaat("SELECT * FROM store", "Overzicht van de winkels:");

   /* $sth = null;
    $dbh = null;*/







?>