<?php 
 class Controllers{
    public function __construct(){
        $this -> views = new Views(); //crea un objeto de la clase Views
        $this->loadModel();//carga el modelo
    
    }
    public function loadModel(){
        //HomeModel
        $model=get_class($this)."Model";
        $routClass="Models/".$model.".php";
        if(file_exists($routClass)){
            require_once($routClass);
            $this->model=new $model();
        }
    }

 }

?>