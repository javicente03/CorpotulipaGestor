<?php

class ControllersCaja{
    public function vale($router){
        $day = date("d");
        $month = date("m");
        $year = date("Y");
        $id = $_SESSION['id'];
        include("backend/bd.php");
        $sql = "SELECT * FROM solicitud_cc WHERE id_usuario = $id";
        $ejecutar = $bd->query($sql);
        return include("frontend/caja_chica/vale_caja_chica.php");
    }

    public function editarUt($router){
        include("backend/bd.php");
        $sql = "SELECT * FROM ut WHERE utid = 1";
        $ejecutar = $bd->query($sql);
        $data = $ejecutar->fetch_assoc();
        return include("frontend/caja_chica/editar_ut.php");
    }

    public function aceptarSolCc($router){
        include("backend/bd.php");
        $sql = "SELECT * FROM solicitud_cc INNER JOIN usuario ON solicitud_cc.id_usuario = usuario.id WHERE aprobado = false";
        $ejecutar = $bd->query($sql);
        return include("frontend/caja_chica/aceptar_sol_cc.php");
    }

    public function subirFacturaCC($router){
        include("backend/bd.php");
        $solicitud = ($bd->query("SELECT * FROM solicitud_cc WHERE id_sol_cc = ".$router->getParam()))->fetch_assoc();
        if($solicitud['id_usuario'] != $_SESSION['id'] || $solicitud['aprobado'] == False)
            header("Location: ../404");
        $facturas = $bd->query("SELECT * FROM facturas_cc WHERE id_sol_cc = ".$router->getParam());
        return include("frontend/caja_chica/subir_factura_cc.php");
    }

}