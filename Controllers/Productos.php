<?php 

class Productos extends Controllers{

    public function __construct()
    {
        parent::__construct(); //ejecuta el constructor de la clase padre
    }
    public function productos(){
        // $data['page_id']=2;
        // $data['page_tag'] = "Productos";
        // $data['page_title'] = "Productos en venta";
        // $data['page_name'] = "productos";
        // $this->views->getView($this,"productos",$data ); //carga la vista home del controlador home 

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