<?php 

class Errors extends Controllers{

    public function __construct()
    {
        parent::__construct(); //ejecuta el constructor de la clase padre
        }
    public function notFound(){
        $this->views->getView($this,"error"); //carga la vista home del controlador home 
        }
    }
    $notFound =new Errors();
    $notFound->notFound();

?>