<?php 
	
	//define("BASE_URL", "http://localhost/petshop/");
	// const BASE_URL = "http://localhost/petshop-utp";
	const BASE_URL = "http://localhost:8080/petshop-utp/";

	//Zona horaria
	date_default_timezone_set('America/Lima');

	//Datos de conexión a Base de Datos
	const DB_HOST = "localhost";
	const DB_NAME = "db_petshop";
	const DB_USER = "root";
	const DB_PASSWORD = "";
	const DB_CHARSET = "charset=utf8";

	//Datos Empresa

	const DIRECCION = "DIRECCION DE EJEMPLO";
	const TELEFONOEMPRESA = "123456789";
	const WHATSAPP = "51902216601";
	const EMAIL_EMPRESA = "ohmypet@gmail.com";
	const EMAIL_PEDIDOS= "ohmypetpedidos@gmail.com";
	const EMAIL_SUSCRIPCION="ohmypet@gmail.com";

	//Deliminadores decimal y millar Ej. 24,1989.00
	const SPD = ".";
	const SPM = ",";

	//Simbolo de moneda
	const SMONEY = "S/. ";

	//Datos envios de correos
	const NOMBRE_REMITENTE = "Oh my pet ! Petshop";
	const EMAIL_REMITENTE = "no-reply@ohmypetpetshop.com";
	const NOMBRE_EMPRESA = "Oh my pet!";
	const WEB_EMPRESA = "www.ohmypetpetshop.com";

	const CAT_SLIDER = "1,2,3"; //categorias que se van a mostrar en el slider
	const CAT_BANNER = "1,2,3"; //categorias que se van a mostrar en el banner

	//Datos para Encriptar / Desencriptar
	const KEY = 'abelosh';
	const METHODENCRIPT = "AES-128-ECB";

	//Envío
	const COSTOENVIO = 50;
	
 ?>