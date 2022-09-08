
<!-- archivo de configuracion -->
<?php

// define('BASE_URL', 'http://localhost/petshop/');

const BASE_URL = "http://localhost/petshop-utp"; //
const LIBS = "Libraries/"; //Librerias

//zona horaria
date_default_timezone_set('America/Lima');

//VARIABLES GLOBALES PARA LA CONEXION A BD

const DB_HOST = "localhost";
const DB_NAME = "petshop";
const DB_USER = "root";
const DB_PASSWORD = "";
const DB_CHARSET = "charset=utf8";


//delimitadores decimal y millar ej: 1,000.00
const SPD = ".";
const SPM = ";";

//SIMBOLO DE MONEDA
const SMONEY = "S/.";

?>