<?php 

class Dashboard extends Controllers{

    public function __construct()
    {
        parent::__construct(); //ejecuta el constructor de la clase padre
    }
    public function dashboard(){
        $data['page_id']=2;
        $data['page_tag'] = "Dashboard-Petshop";
        $data['page_title'] = "Dashboard-Petshop";
        $data['page_name'] = "dashboard";
       
        $this->views->getView($this,"dashboard",$data ); //carga la vista home del controlador dashboard

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