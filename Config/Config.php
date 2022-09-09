

<?php
//comenten nada fuera de las etiquetas php , el p$to jason las toma como dato =ERROR xD
// define('BASE_URL', 'http://localhost/petshop/');
 //archivo de configuracion 
const BASE_URL = "http://localhost/petshop-utp"; //
const LIBS = "Libraries/"; //Librerias

//zona horaria
date_default_timezone_set('America/Lima');

//VARIABLES GLOBALES PARA LA CONEXION A BD

const DB_HOST = "localhost";
const DB_NAME = "db_petshop";
const DB_USER = "root";
const DB_PASSWORD = "";
const DB_CHARSET = "charset=utf8";


//delimitadores decimal y millar ej: 1,000.00
const SPD = ".";
const SPM = ";";

//SIMBOLO DE MONEDA
const SMONEY = "S/.";

?>