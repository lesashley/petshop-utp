<?php 

class Home extends Controllers{

    public function __construct()
    {
        parent::__construct(); //ejecuta el constructor de la clase padre
    }
    public function home($parems){
        $this->views->getView($this,"home"); //carga la vista home del controlador home 
    }
    public function datos($params){
        echo "Dato recibido: ".$params;
    }
    public function carrito($params){
        $carrito = $this->model->getCarrito($params);
        echo $carrito;
    }
}
?>