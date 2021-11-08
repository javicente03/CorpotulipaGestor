<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link rel="stylesheet" href="../css/materialize.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>

<body>
    <div class="container">
        <div class="container" style="border: solid black 1px; border-radius: .5em;">


            <div class="row">
                <form action="../../backend/vale_caja_chica_back.php" method="post"
                    enctype="application/x-www-form-urlencoded">
                    <div class="col s12 input-field">
                        <i class="material-icons prefix">edit</i>
                        <label for="nombre">Vale de caja chica a nombre de:</label>
                        <input type="text" name="nombre" id="nombre" 
                        class="validate" value="<?php echo $_SESSION['nombre']." ".$_SESSION['apellido'] ?>" disabled>
                    </div>
                    <div class="col s12 m6 input-field">
                        <i class="material-icons prefix">event</i>
                        <label for="fecha">Fecha:</label>
                        <input type="text" name="fecha" id="fecha" class="datepicker validate" 
                        disabled>
                    </div>
                    <div class="col s12 m6 input-field">
                        <i class="material-icons prefix">grain</i>
                        <label for="bs">Bs:</label>
                        <input type="text" name="bs" id="bs" class="validate">
                    </div>
                    <div class="col s12 input-field">
                        <i class="material-icons prefix">note</i>
                        <label for="motivo">Motivo del vale de caja:</label>
                        <input type="text" name="motivo" id="motivo" class="validate">
                    </div>
                    <div class="col s12 input-field">
                        <i class="material-icons prefix">business</i>
                        <select name="departamento" id="departamento">
                            <option value="" disabled selected>Seleccione un departamento</option>
                            <option value="">OAF</option>
                        </select>
                    </div>
                    <div class="col s12 center">
                        <button type="submit" class="btn green black-text waves-effect waves-light"
                            style="font-weight: bold; border-radius: .5em;"><i
                                class="material-icons left">send</i>Enviar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <script src="../js/materialize.min.js"></script>
    <script src="../js/jquery-3.6.0.min.js"></script>
    <script>

        //Inicializacion de datepicker
        document.addEventListener('DOMContentLoaded', function () {
            var elems = document.querySelectorAll('.datepicker');
            var instances = M.Datepicker.init(elems,
                options = {
                    defaultDate: new Date(<?php echo $year.",".($month-1).",".$day ?>),
                    setDefaultDate: true
                }
            );
        });

        //Inicializacion de select
        document.addEventListener('DOMContentLoaded', function () {
            var elems = document.querySelectorAll('select');
            var instances = M.FormSelect.init(elems, options);
        });
    </script>
</body>

</html>