<?php

class ControllersCaja{
    public function vale($router){
        $day = date("d");
        $month = date("m");
        $year = date("Y");
        $id = $_SESSION['id'];
        include("backend/bd.php");
        $sql = "SELECT * FROM solicitud_cc WHERE id_usuario = $id AND validado = false";
        $ejecutar = $bd->query($sql);
        return include("frontend/caja_chica/vale_caja_chica.php");
    }

    public function editarUt($router){
        include("backend/bd.php");
        $data = ($bd->query("SELECT * FROM ut WHERE utid = 1"))->fetch_assoc();
        $data1 = ($bd->query("SELECT * FROM caja_chica WHERE idcc = 1"))->fetch_assoc();
        return include("frontend/caja_chica/editar_ut.php");
    }

    public function aceptarSolCc($router){
        include("backend/bd.php");
        $sql = "SELECT * FROM solicitud_cc INNER JOIN usuario ON solicitud_cc.id_usuario = usuario.id WHERE aprobado = false";
        $ejecutar = $bd->query($sql);
        return include("frontend/caja_chica/aceptar_sol_cc.php");
    }

    public function validarSolCc($router){
        include("backend/bd.php");        
        $sql = "SELECT * FROM solicitud_cc INNER JOIN usuario ON solicitud_cc.id_usuario = usuario.id WHERE efectuado = true AND validado = false";
        $ejecutar = $bd->query($sql);
        return include("frontend/caja_chica/validar_sol_cc.php");
    }

    public function subirFacturaCC($router){
        include("backend/bd.php");
        $solicitud = ($bd->query("SELECT * FROM solicitud_cc WHERE validado = false AND id_sol_cc = ".$router->getParam()))->fetch_assoc();
        if($solicitud['id_usuario'] != $_SESSION['id'] || $solicitud['aprobado'] == False)
            header("Location: ../404");
        $facturas = $bd->query("SELECT * FROM facturas_cc WHERE id_sol_cc = ".$router->getParam());
        return include("frontend/caja_chica/subir_factura_cc.php");
    }

    public function solicitudRepoCc($router){
        include("backend/bd.php");
        $date = date("Y-m-d");
        $ultima = ($bd->query("SELECT * FROM solicitud_repo_cc ORDER BY id_solicitud_repo_cc DESC LIMIT 1"))->fetch_assoc();
        if(isset($ultima['fecha'])){
            $anterior = $ultima['fecha'];
            // $sql = "SELECT * FROM solicitud_cc INNER JOIN usuario ON solicitud_cc.id_usuario = usuario.id INNER JOIN perfil ON usuario.id = perfil.id_usuario LEFT JOIN departamento ON perfil.departamento_id = departamento.departamento_id WHERE validado = true AND fecha BETWEEN '$anterior' AND '$date'";
            $sql = "SELECT * FROM solicitud_cc INNER JOIN usuario ON solicitud_cc.id_usuario = usuario.id INNER JOIN perfil ON usuario.id = perfil.id_usuario LEFT JOIN departamento ON perfil.departamento_id = departamento.departamento_id WHERE validado = true AND fecha > '$anterior' AND fecha <= '$date'";
        } else
            $sql = "SELECT * FROM solicitud_cc INNER JOIN usuario ON solicitud_cc.id_usuario = usuario.id INNER JOIN perfil ON usuario.id = perfil.id_usuario LEFT JOIN departamento ON perfil.departamento_id = departamento.departamento_id WHERE validado = true";
        $solicitudes = $bd->query($sql);
        $cc = ($bd->query("SELECT * FROM caja_chica WHERE idcc = 1"))->fetch_assoc();
        return include("frontend/caja_chica/solicitud_repo_cc.php");
    }

}