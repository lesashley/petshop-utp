<?php 
	
	//define("BASE_URL", "http://localhost/petshop/");
	const BASE_URL = "http://localhost/petshop-utp";

	//Zona horaria
	date_default_timezone_set('America/Lima');

	//Datos de conexión a Base de Datos
	const DB_HOST = "localhost";
	const DB_NAME = "db_petshop";
	const DB_USER = "root";
	const DB_PASSWORD = "";
	const DB_CHARSET = "charset=utf8";

	//Deliminadores decimal y millar Ej. 24,1989.00
	const SPD = ".";
	const SPM = ",";

	//Simbolo de moneda
	const SMONEY = "S/. ";

	//Datos envios de correos
	const NOMBRE_REMITENTE = "Oh my pet ! Petshop";
	const EMAIL_REMITENTE = "no-reply@ohmypetpetshop.com";
	const NOMBRE_EMPRESA = "Oh my pet ! Petshop";
	const WEB_EMPRESA = "www.ohmypetpetshop.com";


 ?>