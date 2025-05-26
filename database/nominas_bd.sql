DROP DATABASE  IF EXISTS nominas_bd;
CREATE DATABASE IF NOT EXISTS nominas_bd;
USE nominas_bd;

DROP TABLE IF EXISTS contratos;
CREATE TABLE contratos(
id_contrato int(11) auto_increment,
nombre_contrato varchar(50),
descripcion text,
estado boolean,
fecha_crea DATETIME,
fecha_modifica DATETIME default now(),
PRIMARY KEY (id_contrato));

DROP TABLE IF EXISTS puestos;
CREATE TABLE puestos(
id_puesto int(11) auto_increment,
nombre_puesto varchar(50),
descripcion text,
estado boolean,
fecha_crea DATETIME,
fecha_modifica DATETIME default now(),
PRIMARY KEY (id_puesto));

DROP TABLE IF EXISTS nominas;
CREATE TABLE nominas(
id_nomina int(11) auto_increment,
nombre_nomina varchar(50),
periodo_inicio varchar(50),
periodo_fin varchar(50),
total float DEFAULT 0.00,
estado_nomina int(11),
estado boolean,
fecha_crea DATETIME,
fecha_modifica DATETIME default now(),
PRIMARY KEY (id_nomina));


DROP TABLE IF EXISTS empleados;
CREATE TABLE empleados(
id_empleado int(11) auto_increment,
nombre varchar(50),
apellido varchar(50),
cedula varchar(10),
telefono varchar(14),
sueldo float,
id_puesto int(11),
fecha_crea DATETIME,
id_contrato int(11),
estado boolean,
fecha_modifica DATETIME default now(),
PRIMARY KEY (id_empleado));


DROP TABLE IF EXISTS detalle_nomina;
CREATE TABLE detalle_nomina(
id_detalle_nomina int (11) auto_increment,
id_nomina int(11),
id_empleado int(11),
meses int(11) default 0,
valor_total float DEFAULT 0.00,
PRIMARY KEY (id_detalle_nomina));



DROP TABLE IF EXISTS roles;
CREATE TABLE roles(
    id_rol int(11) auto_increment,
    nombre_rol varchar(50),
    descripcion text,
    estado boolean,
fecha_crea DATETIME,
fecha_modifica DATETIME default now(),
    PRIMARY KEY(id_rol)
);  
DROP TABLE IF EXISTS usuarios;
CREATE TABLE usuarios(
    id_usuario INT(11) auto_increment,
    nombre  varchar(50),
    apellido  varchar(50),
    foto varchar(1000),
    usuario  varchar(50),
    email  varchar(100),
    id_rol int(11),
    password text,
    estado boolean,
fecha_crea DATETIME,
fecha_modifica DATETIME default now(),
    PRIMARY KEY(id_usuario)
);
DROP TABLE IF EXISTS modulos;
CREATE TABLE modulos(
    id_modulo INT(11) auto_increment,
    nombre varchar(50),
    descripcion text,
    estado boolean,
fecha_crea DATETIME,
fecha_modifica DATETIME default now(),
    PRIMARY KEY(id_modulo)
);
DROP TABLE IF EXISTS permisos;
CREATE TABLE permisos(
    id_permiso int(11)  auto_increment,
    id_modulo int(11),
    id_rol  int(11),
    r int(11),
    w int(11),
    u int(11),
    d int(11),
    PRIMARY KEY(id_permiso)
);



ALTER TABLE empleados ADD CONSTRAINT fk_contrato FOREIGN KEY (id_contrato) REFERENCES contratos(id_contrato);
ALTER TABLE empleados ADD CONSTRAINT fk_puesto FOREIGN KEY (id_puesto) REFERENCES puestos(id_puesto);
ALTER TABLE usuarios ADD CONSTRAINT fk_roles FOREIGN KEY (id_rol)  REFERENCES roles(id_rol);
ALTER TABLE permisos ADD CONSTRAINT fk_modulo FOREIGN KEY (id_modulo) REFERENCES modulos(id_modulo);
ALTER TABLE permisos ADD CONSTRAINT fk_rol FOREIGN KEY (id_rol) REFERENCES roles(id_rol);
ALTER TABLE detalle_nomina ADD CONSTRAINT fk_detalle_nomina FOREIGN KEY (id_nomina) REFERENCES nominas(id_nomina);
ALTER TABLE detalle_nomina ADD CONSTRAINT fk_detalle_empleado FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado);

INSERT INTO contratos (nombre_contrato,descripcion,estado,fecha_crea) values('Contrato indefinido','Es todo contrato que concierta la prestación de servicios por un tiempo ilimitado.',1,now());
INSERT INTO contratos (nombre_contrato,descripcion,estado,fecha_crea) values('Contrato indefinido de fijos-discontinuos','Es el que se realiza para trabajos que son fijos
pero no se repiten en determinadas fechas, produciendo discontinuidad en el tiempo.',1,now());
INSERT INTO contratos (nombre_contrato,descripcion,estado,fecha_crea) values('Contratos en prácticas','Sirven para facilitar las prácticas profesionales 
a los trabajadores con título universitario o formación profesional,',1,now());

INSERT INTO contratos (nombre_contrato,descripcion,estado,fecha_crea) values('Contrato Para La Formación','Este contrato tiene como finalidad la adquisición de formación teórico-práctica 
necesaria para la realización adecuada de un trabajo que requiera algún tipo de cualificación o acreditación.,',1,now());


INSERT INTO contratos (nombre_contrato,descripcion,estado,fecha_crea) values('Contrato De Obra O Servicio Determinado','Es aquel que se firma para la realización de
una obra o servicio, con autonomía y cuya duración sea incierta.,',1,now());


INSERT INTO contratos (nombre_contrato,descripcion,estado,fecha_crea) values('Contratos De Inserción','Para participar en programas públicos de realización de obras y servicios de interés general y social. El objetivo que se persigue es por un lado,
la adquisición de experiencia laboral, y por otro, facilitar la mejora de la ocupación al desempleado.',1,now());

INSERT INTO puestos(nombre_puesto,descripcion,estado,fecha_crea) values("Gerente general","dueño",1,now());

INSERT INTO modulos (nombre,descripcion,estado,fecha_crea) values('Dashboard','modulo de dashboard',1,now());
INSERT INTO modulos (nombre,descripcion,estado,fecha_crea) values('Usuarios','modulo de usuarios',1,now());
INSERT INTO modulos (nombre,descripcion,estado,fecha_crea) values('Roles','modulo de roles',1,now());
INSERT INTO modulos (nombre,descripcion,estado,fecha_crea) values('Respaldo','modulo de respaldo',1,now());
INSERT INTO modulos (nombre,descripcion,estado,fecha_crea) values('Empleados','modulo de empleados',1,now());
INSERT INTO modulos (nombre,descripcion,estado,fecha_crea) values('Contractos','modulo de contractos',1,now());
INSERT INTO modulos (nombre,descripcion,estado,fecha_crea) values('Puestos','modulo de puestos',1,now());
INSERT INTO modulos (nombre,descripcion,estado,fecha_crea) values('Nominas','modulo de nominas',1,now());

INSERT INTO roles (nombre_rol,descripcion,estado,fecha_crea) values ("Administrador","permisos de acceso a todo el sistema",1,now());

INSERT INTO permisos (id_modulo,id_rol,r,w,u,d) VALUES (1,1,1,1,1,1);
INSERT INTO permisos (id_modulo,id_rol,r,w,u,d) VALUES (2,1,1,1,1,1);
INSERT INTO permisos (id_modulo,id_rol,r,w,u,d) VALUES (3,1,1,1,1,1);
INSERT INTO permisos (id_modulo,id_rol,r,w,u,d) VALUES (4,1,1,1,1,1);
INSERT INTO permisos (id_modulo,id_rol,r,w,u,d) VALUES (5,1,1,1,1,1);
INSERT INTO permisos (id_modulo,id_rol,r,w,u,d) VALUES (6,1,1,1,1,1);
INSERT INTO permisos (id_modulo,id_rol,r,w,u,d) VALUES (7,1,1,1,1,1);
INSERT INTO permisos (id_modulo,id_rol,r,w,u,d) VALUES (8,1,1,1,1,1);


INSERT INTO usuarios (nombre,apellido,foto,usuario,email,id_rol,password,estado,fecha_crea) VALUES ("Sergio Andres","Lozano Bueno","user-default.png","sergio","salozanob@unbosque.edu.co",1,"$2y$10$HwDTMhcBuUFzbfkpBG36.OB0deecjl53A/i3xfVKyu3O8HQgLz5pa",1,now())


-- PROCEDIMIENTOS ALMACENADOS, FUNCIONES Y TRIGGER EMPLEADOS

DELIMITER $$

CREATE PROCEDURE sp_insert_empleado(
    IN p_nombre VARCHAR(50),
    IN p_apellido VARCHAR(50),
    IN p_cedula VARCHAR(10),
    IN p_telefono VARCHAR(14),
    IN p_sueldo FLOAT,
    IN p_id_puesto INT,
    IN p_id_contrato INT,
    IN p_estado BOOLEAN,
    OUT p_resultado VARCHAR(20)
)
BEGIN
    DECLARE v_count INT;

    SELECT COUNT(*) INTO v_count FROM empleados WHERE cedula = p_cedula;

    IF v_count = 0 THEN
        INSERT INTO empleados(nombre, apellido, cedula, telefono, sueldo, id_puesto, id_contrato, estado, fecha_crea)
        VALUES(p_nombre, p_apellido, p_cedula, p_telefono, p_sueldo, p_id_puesto, p_id_contrato, p_estado, NOW());
        SET p_resultado = 'inserted';
    ELSE
        SET p_resultado = 'exist';
    END IF;
END$$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE sp_update_empleado(
    IN p_id_empleado INT,
    IN p_nombre VARCHAR(50),
    IN p_apellido VARCHAR(50),
    IN p_cedula VARCHAR(10),
    IN p_telefono VARCHAR(14),
    IN p_sueldo FLOAT,
    IN p_id_puesto INT,
    IN p_id_contrato INT,
    IN p_estado BOOLEAN
)
BEGIN
    UPDATE empleados
    SET nombre = p_nombre,
        apellido = p_apellido,
        cedula = p_cedula,
        telefono = p_telefono,
        sueldo = p_sueldo,
        id_puesto = p_id_puesto,
        id_contrato = p_id_contrato,
        estado = p_estado,
        fecha_modifica = NOW()
    WHERE id_empleado = p_id_empleado;
END$$

DELIMITER ;



DELIMITER $$

CREATE PROCEDURE sp_delete_empleado(
    IN p_id_empleado INT
)
BEGIN
    UPDATE empleados
    SET estado = 0,
        fecha_modifica = NOW()
    WHERE id_empleado = p_id_empleado;
END$$

DELIMITER ;




DELIMITER $$

CREATE FUNCTION fn_total_empleados() RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;
    SELECT COUNT(*) INTO total FROM empleados WHERE estado != 0;
    RETURN total;
END$$

DELIMITER ;




DELIMITER $$

CREATE FUNCTION fn_total_sueldo() RETURNS FLOAT
DETERMINISTIC
BEGIN
    DECLARE total FLOAT;
    SELECT SUM(sueldo) INTO total FROM empleados WHERE estado != 0;
    RETURN IFNULL(total, 0);
END$$

DELIMITER ;



DELIMITER $$

CREATE TRIGGER trg_empleado_modificado
BEFORE UPDATE ON empleados
FOR EACH ROW
BEGIN
    SET NEW.fecha_modifica = NOW();
END$$

DELIMITER ;



-- PROCEDIMIENTOS ALMACENADOS, FUNCIONES Y TRIGGER lOGIN

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_login_user$$
CREATE PROCEDURE sp_login_user(IN p_username VARCHAR(50))
BEGIN
    SELECT id_usuario, password, estado
    FROM usuarios
    WHERE usuario = p_username;
END$$
DELIMITER ;



DELIMITER $$
DROP PROCEDURE IF EXISTS sp_session_login$$
CREATE PROCEDURE sp_session_login(IN p_id_usuario INT)
BEGIN
    SELECT us.id_usuario, us.nombre, us.apellido, us.foto, us.usuario, us.email,
           r.id_rol, r.nombre_rol, us.estado 
    FROM usuarios us
    INNER JOIN roles r ON us.id_rol = r.id_rol
    WHERE us.id_usuario = p_id_usuario;
END$$
DELIMITER ;





--PROCEDIMIENTO ALMACENADO NOMINA


DELIMITER //
CREATE PROCEDURE getNominasReporte()
BEGIN
    SELECT id_nomina, nombre_nomina, periodo_inicio, periodo_fin, estado_nomina, total
    FROM nominas
    WHERE estado != 0;
END;
//
DELIMITER ;



