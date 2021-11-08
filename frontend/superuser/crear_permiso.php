<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CORPOTULIPA - Cargos</title>
</head>
<body>
    <?php
        if(!isset($router))
            header("Location: ../404");
    ?>
    <form id="form">
        <select name="accion" id="accion">
            <option value="Editar_UT_Caja_Chica">Editar UT Caja Chica</option>
        </select>
        <select name="cargo" id="cargo">
            <?php
                while($cargos=$proceso1->fetch_assoc()){
                   echo "<option value='".$cargos['cargo_id']."'>".$cargos['cargo']."</option>";
                }
            ?>
        </select>
        <button type="submit" id="crear" >Crear</button>        
    </form>
    <table id="tabla">
        <thead>
            <th>Acción</th>
            <th>Cargo</th>
            <th>Eliminar</th>
        </thead>
        <tbody>
            <?php
            while ($data = $proceso->fetch_assoc()) {
            ?>    
		    <tr>
            <td><?php echo $data["accion"]?></td>
            <td><?php echo $data["cargo"]?></td>
            <td><button type="button" onclick="eliminar(<?php echo $data['permiso_id']?>)">Eliminar</button></td>
            </tr>
            <?php } ?>
        </tbody>
    </table>
    <script src="frontend/js/jquery-3.6.0.min.js"></script>
    <script>
        $('#form').submit(function(e) {
            e.preventDefault();
            $.ajax({
                type: "POST",
                url: 'permisos',
                data: $(this).serialize(),
                enctype:'application/x-www-form-urlencoded',
                success: function(response)
                {
                    if(response=="ok" || response.substring(0, 15) == "<!DOCTYPE html>"){
                        location.href = "";
                    } else {
                        alert(response)
                    }
                }
            });
        });

        function eliminar(id){
            option = confirm("¿Seguro desea eliminar este Permiso?");
            if (option) {           
                event.preventDefault();
                $.ajax({
                    type: "POST",
                    url: 'eliminar_permiso',
                    data: {id:id},
                    success: function(response)
                    {
                        if(response=="ok" || response.substring(0, 15) == "<!DOCTYPE html>"){
                            location.href=""
                        } else {
                            alert(response)
                        }
                    }
                });
            }
        }
    </script>    
</body>
</html>