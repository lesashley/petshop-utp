<?php
 class Views {

    function getView($controller,$view,$data=""){ //recibe el controlador y la vista
        $controller=get_class($controller);//obtiene el nombre del controlador
        if($controller=="Home"){//si el controlador es home
            $view="Views/".$view.".php";//ruta de la vista
    }else{
        $view="Views/".$controller."/".$view.".php"; //ruta de la vista 
            }

            require_once($view); //requiere la vista
        }
 }

?>