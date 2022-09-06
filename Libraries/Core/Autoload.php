
<?php
spl_autoload_register(function($class){ //carga las clases automaticamente
        if(file_exists("Libraries/".'Core/'.$class.".php")){ //si el archivo existe
            require_once("Libraries/".'Core/'.$class.".php");//requiere el archivo
    }
});
?>