<?php

class Conexion
{
    // private $datos = array(
    //     "host" => "localhost",
    //     "user" => "root",
    //     "pass" => "",
    //     "db" => "petshop"
    // );
    // private $con;

    // public function __construct()
    // {
    //     $this->con = new mysqli($this->datos['host'],$this->datos['user'],$this->datos['pass'],$this->datos['db']);
    //     $this->con->query("SET NAMES 'utf8'");
    //     $this->con->query("SET CHARACTER SET 'utf8'");
    // }

    // public function consultaSimple($sql)
    // {
    //     $this->con->query($sql);
    // }

    // public function consultaRetorno($sql)
    // {
    //     $datos = $this->con->query($sql);
    //     return $datos;
    // }

    public function __construc()
    {
        $connectingString = "mysql:host=" . DB_HOST . ";dbname=" . DB_NAME . ";" . DB_CHARSET;
        try {
            $this->pdo = new PDO($connectingString, DB_USER, DB_PASSWORD);
            $this->pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (PDOException $e) {
            $this->conect = "Error de conexion";
            echo "ERROR: " . $e->getMessage();
        }
    }
    public function conect()
    {
        return $this->pdo;
    }
}
