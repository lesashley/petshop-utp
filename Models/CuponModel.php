<?php
class CuponModel extends Mysql
{       
    private $strCupon;
    private $intIdPersona;

    public function getCupon(string $cupon, int $idpersona)
    {
        $this->strCupon = $cupon;
        $this->intIdPersona = $idpersona;
        $this->con = new Mysql();

        $sql = "SELECT c.id_cupon, c.porcentaje_dscto FROM cupon c 
                INNER JOIN pedido p ON p.id_cupon = c.id_cupon 
                INNER JOIN persona e ON e.idpersona = p.personaid 
                WHERE e.idpersona = $this->intIdPersona AND c.descripcion = '$this->strCupon'";
        $request = $this->select($sql);

        if (empty($request)) {
            $sql = "SELECT id_cupon, porcentaje_dscto FROM cupon
                WHERE cantidad_uso < total AND fecha_inicio < NOW() AND fecha_fin > NOW() 
                AND estado = 'A' AND descripcion = '$this->strCupon'";
            $request = $this->select($sql);
        } else {
            $request = NULL;
        }

        return $request;
    }

    public function selectCupones()
	{
		$sql = "SELECT id_cupon as id, descripcion as cupon, porcentaje_dscto as porcentaje, cantidad_uso as cantidad, total, 
                DATE_FORMAT(fecha_inicio, '%d/%m/%Y') as fecha_inicio, DATE_FORMAT(fecha_fin, '%d/%m/%Y') as fecha_fin, estado 
                FROM cupon ORDER BY id DESC";
			
		$request = $this->select_all($sql);
		return $request;
	}
}

