<?php 

class Roles extends Controllers{

    public function __construct()
    {
        parent::__construct(); //ejecuta el constructor de la clase padre
    }
    public function Roles(){
        $data['page_id']=3;
        $data['page_tag'] = "Roles Usuario";
        $data['page_title'] = "rol_usuario";
        $data['page_name'] = "Roles Usuario <small> Petshop</small>";
       
        $this->views->getView($this,"roles",$data ); //carga la vista home del controlador dashboard

    }
    // public function datos($params){
    //     echo "Dato recibido: ".$params;
    // }
    // public function carrito($params){
    //     $carrito = $this->model->getCarrito($params);
    //     echo $carrito;
    // }
}
?>