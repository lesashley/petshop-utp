<?php 


	class Nosotros extends Controllers{
	
		
		public function __construct()
		{
			parent::__construct();
			session_start();
		}

		public function Nosotros()
		{
			$data['page_tag'] = NOMBRE_EMPRESA;
			$data['page_title'] = NOMBRE_EMPRESA;
			$data['page_name'] = "Oh my Pet";
			// dep($data);exit;
			$this->views->getView($this,"nosotros",$data);
		}



	}
 ?>