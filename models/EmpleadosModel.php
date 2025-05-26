<?php
    require_once("./libraries/core/mysql.php");
    class EmpleadosModel extends Mysql{
        public $int_id_empleado;
        public $str_nombrre;
        public $str_apellido;
        public $str_cedula;
        public $str_telefono;
        public $float_sueldo;
        public $int_id_puesto;
        public $int_id_contrato;
        public $int_estado;


        public function __construct(){
            parent::__construct();
        }

        public function getTotalEmpleado() {
            $sql = "SELECT fn_total_empleados() AS total";
            $result = $this->select_sql($sql);
            return $result['total'];
        }


        public function getTotalSueldo() {
            $sql = "SELECT fn_total_sueldo() AS total";
            return $this->select_sql_all($sql);
        }


        public function selectEmpleados(){
            $sql = "SELECT empl.id_empleado,empl.nombre,empl.apellido,empl.cedula,empl.telefono,
            empl.sueldo,puest.nombre_puesto,cont.nombre_contrato,empl.estado FROM empleados as empl 
            INNER JOIN contratos as cont ON empl.id_contrato = cont.id_contrato 
            INNER JOIN puestos as puest ON empl.id_puesto = puest.id_puesto";
            $request = $this->select_sql_all($sql);
            return $request;
        }

        public function selectEmpleadosReporte(){
            $sql = "SELECT empl.id_empleado,empl.cedula,empl.nombre,empl.apellido,empl.telefono,empl.sueldo,puest.nombre_puesto FROM empleados as empl 
            INNER JOIN contratos as cont ON empl.id_contrato = cont.id_contrato 
            INNER JOIN puestos as puest ON empl.id_puesto = puest.id_puesto ORDER BY empl.id_empleado ASC";
            $request = $this->select_sql_all($sql);
            return $request;
        }



        public function selectEmpleado(int $id_empleado){
            $this->int_id_empleado = $id_empleado;
            $sql = "SELECT empl.id_empleado,empl.nombre,empl.apellido,empl.cedula,empl.telefono,
            empl.sueldo,puest.id_puesto,cont.id_contrato,empl.estado FROM empleados as empl 
            INNER JOIN contratos as cont ON empl.id_contrato = cont.id_contrato 
            INNER JOIN puestos as puest ON empl.id_puesto = puest.id_puesto 
            WHERE empl.id_empleado = $this->int_id_empleado";
            $request = $this->select_sql($sql);
            return $request;
        }

        public function insertEmpleado($str_nombre, $str_apellido, $str_cedula, $str_telefono, $float_sueldo, $int_id_puesto, $int_id_contrato, $int_estado) {
            $sql = "CALL sp_insert_empleado(?, ?, ?, ?, ?, ?, ?, ?, @resultado)";
            $params = array($str_nombre, $str_apellido, $str_cedula, $str_telefono, $float_sueldo, $int_id_puesto, $int_id_contrato, $int_estado);
            $this->insert_sql($sql, $params);

            $result = $this->select_sql("SELECT @resultado AS resultado");
            return $result['resultado'];
        }


        public function updateEmpleado($id_empleado, $str_nombre, $str_apellido, $str_cedula, $str_telefono, $float_sueldo, $int_id_puesto, $int_id_contrato, $int_estado) {
            $sql = "CALL sp_update_empleado(?, ?, ?, ?, ?, ?, ?, ?, ?)";
            $params = array($id_empleado, $str_nombre, $str_apellido, $str_cedula, $str_telefono, $float_sueldo, $int_id_puesto, $int_id_contrato, $int_estado);
            return $this->update_sql($sql, $params);
        }
       

        public function deleteEmpleado($id_empleado) {
            $sql = "CALL sp_delete_empleado(?)";
            $params = array($id_empleado);
            return $this->update_sql($sql, $params);
        }


    }

?>