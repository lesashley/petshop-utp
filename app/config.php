<?php


/**
 *INICIAR 
 
*/
session_start();
/**
 * URL constante
 */

 define ('PORT', '8848');
 define ('BASEPATH','/DESARROLLO_WEB_PETSHOP/');
 define('URL', 'http://localhost:'.PORT.BASEPATH);
 

 /**
  * Constantes para los paths de archivos 
  */

define ('DS', DIRECTORY_SEPARATOR);
define ('ROOT', getcwd().DS);
define('APP', ROOT.'app'.DS);
define('INCLUDES', ROOT.'includes'.DS);
define('VIEWS', ROOT.'views'.DS);


define('ASSETS', URL.'assets/');
define('CSS', ASSETS.'css/');
define('JS', ASSETS.'js/');
define('IMAGES', ASSETS.'images/');
define('PLUGINS',ASSETS.'plugins/');

/**
 * constantes adicionales 
 */

define('SHIPPING_COST', 110);

/**funciones personalizadas */

require_once APP.'functions.php';