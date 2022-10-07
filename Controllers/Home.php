<?php 
	require_once("Models/TCategoria.php");
	require_once("Models/TProducto.php");

	class Home extends Controllers{
		use TCategorias,//traer los metodos del trait TCategorias 
		TProducto;//traer los metodos del trait TProducto 
		
		public function __construct()
		{
			parent::__construct();
		}

		public function home()
		{

			// dep($this->getCategoriasT(CAT_SLIDER)); //editar las categorias que se muestran en el slider, esta en config/config.php
			
			// $data['page_id'] = 1;
			$data['page_tag'] = NOMBRE_EMPRESA;
			$data['page_title'] = NOMBRE_EMPRESA;
			$data['page_name'] = "Oh my Pet";
			$data['slider'] = $this->getCategoriasT(CAT_SLIDER);//editar las categorias que se muestran en el slider, esta en config/config.php
			$data['banner'] = $this->getCategoriasT(CAT_BANNER); //los mismo, en el banner
			$data['productos'] = $this->getProductosT();
			// dep($data);exit;
			$this->views->getView($this,"home",$data);
		}



	}
 ?>