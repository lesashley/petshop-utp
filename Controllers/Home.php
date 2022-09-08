<?php 

class Home extends Controllers{

    public function __construct()
    {
        parent::__construct(); //ejecuta el constructor de la clase padre
    }
    public function home(){
        $data['page_id']=1;
        $data['page_tag'] = "Home";
        $data['page_title'] = "Pagina Principal";
        $data['page_name'] = "home";
        $data['page_content']="lorem ipsum dolor sit amet, consectetur adipisicing elit. Quisquam, quod.";;
        $this->views->getView($this,"home",$data ); //carga la vista home del controlador home 

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