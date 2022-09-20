<?php 

	class Dashboard extends Controllers{
		public function __construct()
		{
			parent::__construct();
			session_start();
			if(empty($_SESSION['login'])){
				header('Location: '.base_url().'/login');
			}
			getPermisos(1);  //para que solo puedan entrar los usuarios con permisos 1 (administrador) 
		}

		public function dashboard()
		{
			$data['page_id'] = 2;
			$data['page_tag'] = "Dashboard - Petshop";
			$data['page_title'] = "Dashboard - Petshop";
			$data['page_name'] = "dashboard";
			$this->views->getView($this,"dashboard",$data);
		}

	}
 ?>