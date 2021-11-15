<?php
if(isset($router)){
    if(isset($_POST['id'])){
        include("bd.php");
        $query = $bd->query("SELECT * FROM facturas_cc WHERE id_sol_cc = ".$_POST['id']);
        return include("frontend/caja_chica/facturas_cc.php");
    }
}