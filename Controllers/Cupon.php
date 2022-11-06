<?php
class Cupon extends Controllers
{
    public function __construct()
    {
        parent::__construct();
        session_start();
        if (empty($_SESSION['login'])) {
            header('Location: ' . base_url() . '/login');
            die();
        }
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
