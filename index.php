<?php
require_once("Config/Config.php");

 $url =!empty($_GET['url']) ? $_GET['url'] : 'home/home';
 $arrUrl= explode("/", $url); //explode: separa la url en un array
 $controller = $arrUrl[0]; //selecciona el primer elemento del array (home)
 $method = $arrUrl[0]; //selecciona el segundo elemento del array 
 $params = ""; //selecciona el tercer elemento del array

 if(!empty($arrUrl[1])){ //si el segundo elemento del array no esta vacio
     if($arrUrl[1] != ""){ //si el segundo elemento del array es diferente de vacio
         $method = $arrUrl[1]; //selecciona el segundo elemento del array
     }
 }

 if(!empty($arrUrl[2])){ //si el tercer elemento del array no esta vacio
     if($arrUrl[2] != ""){ //si el tercer elemento del array es diferente de vacio
         for($i=2; $i < count($arrUrl); $i++){ //recorre el array desde el tercer elemento
             $params .= $arrUrl[$i].','; //concatena los elementos del array
         }
       
        $params = trim($params, '/'); //elimina los espacios en blanco
       
     }
 }
 require_once("Libraries/Core/Autoload.php"); //carga el archivo autoload
 require_once("Libraries/Core/Load.php"); //carga el archivo load

 


?>