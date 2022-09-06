
<?php
spl_autoload_register(function($class){ //carga las clases automaticamente
        if(file_exists(LIBS.'Core/'.$class.".php")){ //si el archivo existe
            require_once(LIBS.'Core/'.$class.".php");//requiere el archivo
    }
});
?>