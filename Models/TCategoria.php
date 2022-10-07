<?php

require_once("Libraries/Core/Mysql.php");
trait TCategorias{
private $con;

public function getCategoriasT(string $categorias){

    $this->con =new Mysql();
    $sql = "SELECT  idcategoria, nombre, descripcion, portada,ruta, status FROM categoria WHERE status!=0 AND idcategoria IN ($categorias) ";
    $request = $this->con->select_all($sql);

    if(count($request)>0){
        for($c=0;$c<count($request);$c++){
            $request[$c]['portada'] =BASE_URL."/Assets/images/uploads/".$request[$c]['portada'];
        }
}

return $request;
}
}
?>
