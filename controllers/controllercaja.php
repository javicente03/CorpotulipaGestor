<?php

class ControllersCaja{
    public function vale($router){
        $day = date("d");
        $month = date("m");
        $year = date("Y");
        return include("frontend/caja_chica/vale_caja_chica.php");
    }

    public function editarUt($router){
        include("backend/bd.php");
        $sql = "SELECT * FROM ut WHERE utid = 1";
        $ejecutar = $bd->query($sql);
        $data = $ejecutar->fetch_assoc();
        return include("frontend/caja_chica/editar_ut.php");
    }

}