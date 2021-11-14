<?php
if(isset($router)){
    include("bd.php");
    if($_POST['method'] == 'ac'){
        $id = $_POST['id'];
        $sql = "UPDATE solicitud_cc SET aprobado = true WHERE id_sol_cc = $id";
        $query = $bd->query($sql);
        if($query){
            echo "ok";
        } else {
            echo "¡Oh no! ha ocurrido un error inesperado";
        }
    } else if($_POST['method'] == 'dc'){
        $id = $_POST['id'];
        $solicitud = ($bd->query("SELECT * FROM solicitud_cc WHERE id_sol_cc = $id"))->fetch_assoc();
        $id_user = $solicitud['id_usuario'];
        $user = ($bd->query("SELECT * FROM usuario WHERE id = $id_user"))->fetch_assoc();
        $query = $bd->query("DELETE FROM solicitud_cc WHERE id_sol_cc = $id");
        if($query){
            $fecha = date("Y-m-d");
            $texto = "La solicitud de dinero por caja chica que enviaste ha sido rechazada";
            $bd->query("INSERT INTO notificaciones (id_usuario,texto,fecha) VALUES ('$id_user','$texto','$fecha')");
            echo "ok";
        } else {
            echo "¡Oh no! ha ocurrido un error inesperado";
        }
    }
} else {
    header("Location: ../404");
}