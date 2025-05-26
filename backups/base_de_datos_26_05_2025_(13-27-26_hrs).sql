SET FOREIGN_KEY_CHECKS=0;

DROP DATABASE  IF EXISTS nominas_bd;
CREATE DATABASE IF NOT EXISTS nominas_bd;

USE nominas_bd;



CREATE TABLE `contratos` (
  `id_contrato` int NOT NULL AUTO_INCREMENT,
  `nombre_contrato` varchar(50) DEFAULT NULL,
  `descripcion` text,
  `estado` tinyint(1) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_contrato`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO contratos VALUES("1","Contrato A Término Indefinido","Es El Contrato Mediante El Cual El Trabajador Presta Sus Servicios Al Empleador Por Tiempo Indefinido. No Tiene Fecha De Finalización Pactada, Y Se Puede Terminar Por Voluntad De Las Partes O Causas Legales.","1","2025-05-26 12:57:59","2025-05-26 13:04:31");
INSERT INTO contratos VALUES("2","Contrato A Término Fijo","Es Aquel Que Se Celebra Por Un Periodo Determinado, Que No Puede Ser Superior A Tres Años. Puede Ser Renovado Indefinidamente Y Debe Constar Por Escrito, Indicando Fecha De Inicio Y Finalización.","1","2025-05-26 12:57:59","2025-05-26 13:05:00");
INSERT INTO contratos VALUES("3","Contrato Por Duración De La Obra O Labor","Se Firma Para La Realización De Una Labor O Proyecto Específico. Su Duración Es Incierta, Ya Que Termina Cuando Finaliza La Obra O Labor Para La Cual Fue Contratado El Trabajador.","1","2025-05-26 12:57:59","2025-05-26 13:05:26");
INSERT INTO contratos VALUES("4","Contrato De Aprendizaje","Es Un Contrato Especial Para Estudiantes Técnicos, Tecnólogos O Universitarios, Mediante El Cual Una Empresa Les Brinda Formación Práctica. No Genera Vínculo Laboral, Aunque Se Paga Un Apoyo Económico.","1","2025-05-26 12:57:59","2025-05-26 13:05:50");
INSERT INTO contratos VALUES("5","Contrato Ocasional, Accidental O Transitorio","Se Utiliza Para Labores Específicas Que No Hacen Parte De La Actividad Principal Del Empleador. Tiene Una Duración Máxima De 30 Días Y Está Regulado Por El Código Sustantivo Del Trabajo.","1","2025-05-26 12:57:59","2025-05-26 13:06:13");
INSERT INTO contratos VALUES("6","Contrato De Trabajo A Domicilio","Es Aquel En El Que El Trabajador Presta Sus Servicios Desde Su Residencia O Lugar Escogido Por él, Sin Supervisión Directa Y Utilizando Sus Propios Medios, Salvo Acuerdo Distinto.","1","2025-05-26 12:57:59","2025-05-26 13:06:34");





CREATE TABLE `detalle_nomina` (
  `id_detalle_nomina` int NOT NULL AUTO_INCREMENT,
  `id_nomina` int DEFAULT NULL,
  `id_empleado` int DEFAULT NULL,
  `meses` int DEFAULT '0',
  `valor_total` float DEFAULT '0',
  PRIMARY KEY (`id_detalle_nomina`),
  KEY `fk_detalle_nomina` (`id_nomina`),
  KEY `fk_detalle_empleado` (`id_empleado`),
  CONSTRAINT `fk_detalle_empleado` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`),
  CONSTRAINT `fk_detalle_nomina` FOREIGN KEY (`id_nomina`) REFERENCES `nominas` (`id_nomina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;






CREATE TABLE `empleados` (
  `id_empleado` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `cedula` varchar(10) DEFAULT NULL,
  `telefono` varchar(14) DEFAULT NULL,
  `sueldo` float DEFAULT NULL,
  `id_puesto` int DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_contrato` int DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_empleado`),
  KEY `fk_contrato` (`id_contrato`),
  KEY `fk_puesto` (`id_puesto`),
  CONSTRAINT `fk_contrato` FOREIGN KEY (`id_contrato`) REFERENCES `contratos` (`id_contrato`),
  CONSTRAINT `fk_puesto` FOREIGN KEY (`id_puesto`) REFERENCES `puestos` (`id_puesto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;






CREATE TABLE `modulos` (
  `id_modulo` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` text,
  `estado` tinyint(1) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_modulo`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO modulos VALUES("1","Dashboard","modulo de dashboard","1","2025-05-26 12:57:59","2025-05-26 12:57:59");
INSERT INTO modulos VALUES("2","Usuarios","modulo de usuarios","1","2025-05-26 12:58:00","2025-05-26 12:58:00");
INSERT INTO modulos VALUES("3","Roles","modulo de roles","1","2025-05-26 12:58:00","2025-05-26 12:58:00");
INSERT INTO modulos VALUES("4","Respaldo","modulo de respaldo","1","2025-05-26 12:58:00","2025-05-26 12:58:00");
INSERT INTO modulos VALUES("5","Empleados","modulo de empleados","1","2025-05-26 12:58:00","2025-05-26 12:58:00");
INSERT INTO modulos VALUES("6","Contractos","modulo de contractos","1","2025-05-26 12:58:00","2025-05-26 12:58:00");
INSERT INTO modulos VALUES("7","Puestos","modulo de puestos","1","2025-05-26 12:58:00","2025-05-26 12:58:00");
INSERT INTO modulos VALUES("8","Nominas","modulo de nominas","1","2025-05-26 12:58:00","2025-05-26 12:58:00");





CREATE TABLE `nominas` (
  `id_nomina` int NOT NULL AUTO_INCREMENT,
  `nombre_nomina` varchar(50) DEFAULT NULL,
  `periodo_inicio` varchar(50) DEFAULT NULL,
  `periodo_fin` varchar(50) DEFAULT NULL,
  `total` float DEFAULT '0',
  `estado_nomina` int DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_nomina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;






CREATE TABLE `permisos` (
  `id_permiso` int NOT NULL AUTO_INCREMENT,
  `id_modulo` int DEFAULT NULL,
  `id_rol` int DEFAULT NULL,
  `r` int DEFAULT NULL,
  `w` int DEFAULT NULL,
  `u` int DEFAULT NULL,
  `d` int DEFAULT NULL,
  PRIMARY KEY (`id_permiso`),
  KEY `fk_modulo` (`id_modulo`),
  KEY `fk_rol` (`id_rol`),
  CONSTRAINT `fk_modulo` FOREIGN KEY (`id_modulo`) REFERENCES `modulos` (`id_modulo`),
  CONSTRAINT `fk_rol` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO permisos VALUES("1","1","1","1","1","1","1");
INSERT INTO permisos VALUES("2","2","1","1","1","1","1");
INSERT INTO permisos VALUES("3","3","1","1","1","1","1");
INSERT INTO permisos VALUES("4","4","1","1","1","1","1");
INSERT INTO permisos VALUES("5","5","1","1","1","1","1");
INSERT INTO permisos VALUES("6","6","1","1","1","1","1");
INSERT INTO permisos VALUES("7","7","1","1","1","1","1");
INSERT INTO permisos VALUES("8","8","1","1","1","1","1");





CREATE TABLE `puestos` (
  `id_puesto` int NOT NULL AUTO_INCREMENT,
  `nombre_puesto` varchar(50) DEFAULT NULL,
  `descripcion` text,
  `estado` tinyint(1) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_puesto`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO puestos VALUES("1","Dueño","El Dueño Y Gerente De La Empresa","1","2025-05-26 12:57:59","2025-05-26 13:07:23");





CREATE TABLE `roles` (
  `id_rol` int NOT NULL AUTO_INCREMENT,
  `nombre_rol` varchar(50) DEFAULT NULL,
  `descripcion` text,
  `estado` tinyint(1) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO roles VALUES("1","Administrador","permisos de acceso a todo el sistema","1","2025-05-26 12:58:00","2025-05-26 12:58:00");
INSERT INTO roles VALUES("2","Empleado","Empleado Para Usos Basicos En La Plataforma","1","2025-05-26 13:20:58","2025-05-26 13:20:58");





CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `foto` varchar(1000) DEFAULT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `id_rol` int DEFAULT NULL,
  `password` text,
  `estado` tinyint(1) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_usuario`),
  KEY `fk_roles` (`id_rol`),
  CONSTRAINT `fk_roles` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO usuarios VALUES("1","Sergio Andres","Lozano Bueno","user-default.png","sergio","salozanob@unbosque.edu.co","1","$2y$10$HwDTMhcBuUFzbfkpBG36.OB0deecjl53A/i3xfVKyu3O8HQgLz5pa","1","2025-05-26 13:02:42","2025-05-26 13:02:42");
INSERT INTO usuarios VALUES("2","Sebastian","Lopez","1748283580_usuario1.png","sebas","sebastian@unbosque.edu.co","1","$2y$10$y.T4QtEaooPpHDd/cn3u0eXeNWFSiPQlSZ9mSYgbW32dfILMNCIDm","0","2025-05-26 13:19:40","2025-05-26 13:22:18");
INSERT INTO usuarios VALUES("3","Juan Esteban","Guerrero Llanos","1748283931_Juan.jpg","juanes","juan@unbosque.edu.co","2","$2y$10$dF196dkGOhL4byKOFfA42OR7X4XcMRb9LH7CAPr6F9qmFOrRK8Gpq","1","2025-05-26 13:25:31","2025-05-26 13:25:31");



SET FOREIGN_KEY_CHECKS=1;