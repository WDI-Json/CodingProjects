<?php
require_once('RESTAPI/cls_database.php');
function Opvullen($tekst, $lengte)
{
    return
        str_pad($tekst, $lengte);
}

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
    foreach($column as $head)
    {
        print($head) . "\t" ."|" ."\n";
        foreach ($result as $row) {
            print($row[$head] . "\t" . "\t" . "\t"  );
            /*
            print $row[$column[0]] . "\t" . "\t" . "\t" . "|" . "\t";
            print $row[$column[1]] . "\t" . "\t" . "\t" . "\t" . "|" . "\t";
            print $row[$column[2]] . "\t" . "\t" . "\t" . "|" . "\t";
            print $row[$column[3]] . "\n";*/
        }}


}


PrintResultaat("SELECT store_id, manager_staff_id, address_id, last_update FROM store", "Overzicht van de winkels:");
/*PrintResultaat("SELECT
film_info.title AS Filmtitel,
film_info.release_year AS Omschrijving, 
film_info.rating AS Leeftijd,
SUM(betaling.amount) AS Bedrag 
FROM payment AS Betaling
LEFT JOIN rental AS huur_info
ON huur_info.rental_id = betaling.rental_id
LEFT JOIN inventory AS inventory
ON inventory.inventory_id = huur_info.inventory_id
LEFT JOIN film AS film_info
ON film_info.film_id = inventory.film_id
WHERE YEAR(payment_date) = '2015'
GROUP BY 
film_info.title,
film_info.release_year,
film_info.rating
LIMIT 4", "Opbrengst per film in 2015");

PrintResultaat("SELECT 
act.first_name AS Voornaam, 
act.last_name AS Achternaam,
act.date_of_birth AS Geboortedatum,
actor_id  
FROM actor as act
ORDER BY date_of_birth ASC
LIMIT 1", "Oudste acteur");
*/


?>