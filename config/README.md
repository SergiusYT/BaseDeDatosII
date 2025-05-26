# Sistema de Nóminas PHP

## Configuración Esencial ⚙️

Archivo config.php contiene todas las constantes críticas:

```php
<?php
// 1️⃣ URLs BASE
define('BASE_URL', 'http://localhost/nominas/');  // URL raíz del sistema
define('ASSETS_URL', BASE_URL.'assets/');         // Ruta para archivos estáticos

// 2️⃣ DIRECTORIOS CLAVE
define('LIBS_DIR', 'libs/');    // Bibliotecas PHP
define('VIEWS_DIR', 'views/');  // Plantillas HTML/PHP

// 3️⃣ EXPRESIONES REGULARES (VALIDACIONES)
define('NAME_REGEX', '/^[a-zA-ZáéíóúñÁÉÍÓÚÑ\s]{2,50}$/');  // Nombres con tildes
define('EMAIL_REGEX', '/^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$/i');  // Emails válidos
define('PASS_REGEX', '/^(?=.\d)(?=.[a-z])(?=.*[A-Z]).{6,}$/');  // Contraseñas seguras

// 4️⃣ CONFIGURACIÓN GLOBAL
define('APP_NAME', 'NominaPro'); 
date_default_timezone_set("America/Bogota");  // Zona horaria Colombia