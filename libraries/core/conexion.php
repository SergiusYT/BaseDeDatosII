<?php 
    class Conexion{
        private $conect;

        public function __construct(){
          
        }
        
        public function connect(){
        try {
            $this->conect = new PDO("mysql:host=127.0.0.1;port=3306;dbname=nominas_bd;", "root", "ProyectoBD");
            $this->conect->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            return $this->conect;
        } catch (PDOException $e) {
            echo "Error: " . $e->getMessage();
        }
        }
    }
?>