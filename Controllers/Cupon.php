<?php
class Cupon extends Controllers
{
    public function __construct()
    {
        parent::__construct();
        session_start();
        session_regenerate_id(true);
        if(empty($_SESSION['login']))
        {
            header('Location: '.base_url().'/login');
        }
        getPermisos(14);
    }
    public function Cupon()
    {
        if(empty($_SESSION['permisosMod']['r'])){
            header("Location:".base_url().'/dashboard');
        }
        $data['page_tag'] = "Cupones";
        $data['page_title'] = '<i class="fas fa-user-tag"></i>'." CUPONES";
        $data['page_name'] = "cupones";
        $data['page_functions_js'] = "functions_cupones.js";
        $this->views->getView($this,"cupones",$data);
    }


public function getCupones(){
    if($_SESSION['permisosMod']['r']){
        $arrData = $this->model->selectCupones();
         
        for ($i=0; $i < count($arrData) ; $i++) { 
            $btnView = '';
            if($_SESSION['permisosMod']['r']){
                $btnView = '<button class="btn btn-info btn-sm" onClick="fntViewInfo('.$arrData[$i]['id'].')" title="Ver Cupon"><i class="far fa-eye"></i></button>';
            }
            $arrData[$i]['options'] = '<div class="text-center">'.$btnView.'</div>';
        }
         echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
    }
    die();
}

    public function validar($cupon)
    {
        $strCupon = strtoupper(strClean($cupon));
        $arrData = $this->model->getCupon($strCupon, $_SESSION['idUser']);

        if (empty($arrData)) {
            $arrResponse = array('status' => false, 'msg' => 'Cupón ingresado no valido');
        } else {
            $arrResponse = array('status' => true, 'msg' => 'Cupón ingresado valido', 'data' => $arrData);
        }

        echo json_encode($arrResponse, JSON_UNESCAPED_UNICODE);

        die();
    }

}
?>
