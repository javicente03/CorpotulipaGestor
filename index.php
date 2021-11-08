<?php

require 'Router.php';
require 'controllers/controller.php';
require 'controllers/controlleruser.php';
require 'controllers/controllercaja.php';

$router = new Router();
$controlsuper = new ControllersSuperuser();
$controluser = new ControllersUser();
$controlcaja = new ControllersCaja();

session_start();

switch ($router->getController()) {

    case 'Home':
        include("frontend/login.php");
        break;

    /* ************ LOGIN, LOGOUT Y PASSWORD ************ */
    case 'login': //Login si viene por GET muestra formulario, si viene por POST loguea
        if($_SERVER['REQUEST_METHOD'] == 'GET'){
            if(isset($_SESSION['id'])) //Valida que la haya no una sesión activa, de lo contrario manda al dahsboard
                header("Location: sesion");
            else
                $controluser->login($router);//Llamo al controlador de login
        } else if($_SERVER['REQUEST_METHOD'] == 'POST')
            include("backend/login_back.php"); //Ejecuto el logueado en el backend
        break;

    case 'logout': //Login si viene por GET muestra formulario, si viene por POST loguea
        if($_SERVER['REQUEST_METHOD'] == 'GET')
            include("backend/logout_back.php"); //Ejecuto el logueado en el backend
        break;

    case 'olvido_password': //Login si viene por GET muestra formulario, si viene por POST loguea
        if($_SERVER['REQUEST_METHOD'] == 'GET'){
            if(isset($_SESSION['id'])) //Valida que la haya no una sesión activa, de lo contrario manda al dahsboard
                header("Location: sesion");
            else
                $controluser->olvidoPassword($router);//Llamo al controlador de login
        } else if($_SERVER['REQUEST_METHOD'] == 'POST')
            include("backend/olvido_password_back.php"); //Ejecuto el logueado en el backend
        break;
    
    case 'resetear_password': //Login si viene por GET muestra formulario, si viene por POST loguea
        if($_SERVER['REQUEST_METHOD'] == 'GET'){
            if(isset($_SESSION['id'])) //Valida que la haya no una sesión activa, de lo contrario manda al dahsboard
                header("Location: sesion");
            else
                $controluser->resetearPassword($router);//Llamo al controlador de login
        } else if($_SERVER['REQUEST_METHOD'] == 'POST')
            include("backend/resetear_password_back.php"); //Ejecuto el logueado en el backend
        break;


    /* ************ SUPER USUARIO ************ */
    case 'generar_usuario': //Valida que haya una sesión activa, de lo contrario redirige a Login
        if(isset($_SESSION['id'])){
            if($_SESSION['permisos'] == "super"){//Requiere permisos de superusuario
                if($_SERVER['REQUEST_METHOD'] == 'GET'){
                    $controlsuper->generarUser($router);
                } else if($_SERVER['REQUEST_METHOD'] == 'POST')
                    include("backend/crear_usuario_back.php");
            } else
                header("Location: 404");    
        } else
            header("Location: login");
        break;

    case 'editar_usuario': //Valida que haya una sesión activa, de lo contrario redirige a Login
        if(isset($_SESSION['id'])){
            if($_SESSION['permisos'] == "super"){//Requiere permisos de superusuario
                if($_SERVER['REQUEST_METHOD'] == 'GET'){
                    if(!empty($router->getParam())) //Revisa que haya algun parametro
                        $controlsuper->editarUser($router); //llama la funcion del controlador
                    else
                        header("Location: 404");    
                } else if($_SERVER['REQUEST_METHOD'] == 'POST')//Por post invoca al backend
                    include("backend/editar_usuario_back.php");
            } else
                header("Location: ../404");    
        } else
            header("Location: ../login");
        break;

    case 'suspender_usuario': //Valida que haya una sesión activa, de lo contrario redirige a Login
        if(isset($_SESSION['id'])){
            if($_SESSION['permisos'] == "super"){//Requiere permisos de superusuario
                if($_SERVER['REQUEST_METHOD'] == 'POST')
                    include("backend/suspender_usuario_back.php");
            } else
                header("Location: 404");    
        } else
            header("Location: login");
        break;

    case 'departamentos': //Valida que haya una sesión activa, de lo contrario redirige a Login
        if(isset($_SESSION['id'])){
            if($_SESSION['permisos'] == "super"){//Requiere permisos de superusuario
                if($_SERVER['REQUEST_METHOD'] == 'GET'){
                    $controlsuper->departamentos($router); //llama la funcion del controlador
                } else if($_SERVER['REQUEST_METHOD'] == 'POST')
                    include("backend/crear_departamento_back.php");
            } else
                header("Location: 404");    
        } else
            header("Location: login");
        break;

    case 'editar_departamento': //Valida que haya una sesión activa, de lo contrario redirige a Login
        if(isset($_SESSION['id'])){
            if($_SESSION['permisos'] == "super"){//Requiere permisos de superusuario
                if($_SERVER['REQUEST_METHOD'] == 'GET'){
                    if(!empty($router->getParam())) //Revisa que haya algun parametro
                        $controlsuper->editarDepartamento($router); //llama la funcion del controlador
                    else
                        header("Location: 404");   
                } else if($_SERVER['REQUEST_METHOD'] == 'POST')
                    include("backend/editar_departamento_back.php");
            } else
                header("Location: ../404");    
        } else
            header("Location: ../login");
        break;

    case 'eliminar_departamento': //Valida que haya una sesión activa, de lo contrario redirige a Login
        if(isset($_SESSION['id'])){
            if($_SESSION['permisos'] == "super"){//Requiere permisos de superusuario
                if($_SERVER['REQUEST_METHOD'] == 'POST')
                    include("backend/eliminar_departamento_back.php");
            } else
                header("Location: 404");    
        } else
            header("Location: login");
        break;

    case 'cargos': //Valida que haya una sesión activa, de lo contrario redirige a Login
        if(isset($_SESSION['id'])){
            if($_SESSION['permisos'] == "super"){//Requiere permisos de superusuario
                if($_SERVER['REQUEST_METHOD'] == 'GET'){
                    $controlsuper->cargos($router); //llama la funcion del controlador
                } else if($_SERVER['REQUEST_METHOD'] == 'POST')
                    include("backend/crear_cargos_back.php");
            } else
                header("Location: 404");    
        } else
            header("Location: login");
        break;

    case 'editar_cargo': //Valida que haya una sesión activa, de lo contrario redirige a Login
        if(isset($_SESSION['id'])){
            if($_SESSION['permisos'] == "super"){//Requiere permisos de superusuario
                if($_SERVER['REQUEST_METHOD'] == 'GET'){
                    if(!empty($router->getParam())) //Revisa que haya algun parametro
                        $controlsuper->editarCargo($router); //llama la funcion del controlador
                    else
                        header("Location: 404");   
                } else if($_SERVER['REQUEST_METHOD'] == 'POST')
                    include("backend/editar_cargos_back.php");
            } else
                header("Location: ../404");    
        } else
            header("Location: ../login");
        break;

    case 'eliminar_cargo': //Valida que haya una sesión activa, de lo contrario redirige a Login
        if(isset($_SESSION['id'])){
            if($_SESSION['permisos'] == "super"){//Requiere permisos de superusuario
                if($_SERVER['REQUEST_METHOD'] == 'POST')
                    include("backend/eliminar_cargos_back.php");
            } else
                header("Location: 404");    
        } else
            header("Location: login");
        break;

    case 'permisos': //Valida que haya una sesión activa, de lo contrario redirige a Login
        if(isset($_SESSION['id'])){
            if($_SESSION['permisos'] == "super"){//Requiere permisos de superusuario
                if($_SERVER['REQUEST_METHOD'] == 'GET'){
                    $controlsuper->permisos($router); //llama la funcion del controlador
                } else if($_SERVER['REQUEST_METHOD'] == 'POST')
                    include("backend/crear_permiso_back.php");
            } else
                header("Location: 404");    
        } else
            header("Location: login");
        break;

    case 'eliminar_permiso': //Valida que haya una sesión activa, de lo contrario redirige a Login
        if(isset($_SESSION['id'])){
            if($_SESSION['permisos'] == "super"){//Requiere permisos de superusuario
                if($_SERVER['REQUEST_METHOD'] == 'POST')
                    include("backend/eliminar_permiso_back.php");
            } else
                header("Location: 404");    
        } else
            header("Location: login");
        break;


    /* ************ USUARIO Y PERFIL ************ */

    case 'sesion':
        if(isset($_SESSION['id'])) //Valida que haya una sesión activa, de lo contrario redirige a Login
            include("frontend/sesion.php");
        else
            header("Location: login");
        break;

    case 'editar_perfil': //Valida que haya una sesión activa, de lo contrario redirige a Login
        if(isset($_SESSION['id'])){
            if($_SERVER['REQUEST_METHOD'] == 'GET'){
                $controluser->editarPerfil($router); //llama la funcion del controlador
            } else if($_SERVER['REQUEST_METHOD'] == 'POST')
                include("backend/editar_perfil_back.php");    
        } else
            header("Location: login");
        break;

    case 'password': //Valida que haya una sesión activa, de lo contrario redirige a Login
        if(isset($_SESSION['id'])){
            if($_SERVER['REQUEST_METHOD'] == 'POST')
                include("backend/password_back.php");    
        } else
            header("Location: login");
        break;

    
    /* ************ USUARIO Y PERFIL ************ */
    case 'editar_ut':
        if(isset($_SESSION['id'])){
            if($_SERVER['REQUEST_METHOD'] == 'GET'){
                $controlcaja->editarUt($router); //llama la funcion del controlador
            } else if($_SERVER['REQUEST_METHOD'] == 'POST')
                include("backend/editar_ut_back.php");    
        } else
            header("Location: login");
        break;

    case 'vale_chica':
        if(isset($_SESSION['id'])){
            if($_SERVER['REQUEST_METHOD'] == 'GET'){
                $controlcaja->vale($router); //llama la funcion del controlador
            } else if($_SERVER['REQUEST_METHOD'] == 'POST')
                include("backend/vale_caja_chica_back.php");    
        } else
            header("Location: login");
        break;

    default:
        include("frontend/404.php"); //Pagina de error 404 Page Not Found
        break;
}