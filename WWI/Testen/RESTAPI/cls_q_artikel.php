<?php

class cls_q_artikel extends database
{
    public function getArticle(){
        $sql = 'SELECT * FROM StockItems';
        $statement = $this->connect()->query($sql);
        while($row = $statement->fetch()){
            echo 'de naam van het artikel is ' .  $row['stockitemname'] .
            ' en zal ' . $row['RecommendedRetailPrice'] . ' kosten. ' . '<br>';
        }
    }
}