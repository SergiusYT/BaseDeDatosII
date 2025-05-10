<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title><?php echo $data["page_title"];?></title>
        <link rel="stylesheet" href="<?php echo server_url; ?>assets/vendor/bootstrap/css/bootstrap.min.css">
        <link href="<?php echo server_url; ?>assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
        <link rel="stylesheet" href="<?php echo server_url; ?>assets/libs/css/style.css">
        <link rel="stylesheet" href="<?php echo server_url; ?>assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
        <link rel="icon" type="image/png" href="<?php echo server_url; ?>assets/images/nomina-icon.png" sizes="16x16" />
        <style>
            html, body {
                height: 100%;
                margin: 0;
                font-family: 'Circular Std', sans-serif;
                background-size: 400% 400%;
                animation: gradientBG 10s ease infinite;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            @keyframes gradientBG {
                0% {
                    background-position: 0% 50%;
                }
                50% {
                    background-position: 100% 50%;
                }
                100% {
                    background-position: 0% 50%;
                }
            }

            #particles-js {
                position: fixed;
                width: 100%;
                height: 100%;
                z-index: 0;
                top: 0;
                left: 0;
                background: linear-gradient(-45deg, #ff1e1e, #0055a4, #ffe600);
                background-size: 400% 400%;
                animation: gradientBG 10s ease infinite;
            }

            .splash-container {
                position: relative;
                z-index: 2;
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 30px;
                transform: translateX(-280px); /* Mueve el splash a la izquierda */
            }



            .login-animations {
                position: absolute;
                left: 65%;
                top: 50%;
                transform: translateY(-50%);
                display: flex;
                flex-direction: column;
                gap: 20px;
                justify-content: center;
                align-items: center;
                z-index: 3;
            }

            .animation {
                width: 30vw; /* Tamaño fijo de la animación */
                height: 30vw; /* Tamaño fijo de la animación */
                position: absolute; /* Fija la animación en la posición */
                left: 50%;
                top: 50%;
                transform: translate(-50%, -50%); /* Centra la animación */
                opacity: 0;
                transition: opacity 1s ease-in-out; /* Añade una transición suave para la opacidad */
            }



            .card {
                width: 100%;
                max-width: 400px;
                background-color: #091b2f;
                border-radius: 16px;
                box-shadow: 0 10px 25px rgba(0, 0, 0, 0.5);
                padding: 30px 25px;
                color: white;
                position: relative;
                z-index: 2;
            }

            .card-header {
                background: none;
                border-bottom: none;
                margin-bottom: 15px;
            }

            .logo-img {
                width: 160px;
            }

            .form-control {
                border-radius: 12px;
                padding: 12px;
                font-size: 16px;
                border: 1px solid #ccc;
            }

            .form-group {
                margin-bottom: 20px;
            }

            .btn-dark {
                background-color: #1e3c72;
                border: none;
                border-radius: 12px;
                padding: 12px;
                font-size: 16px;
            }

            .btn-dark:hover {
                background-color: #284a8a;
            }

            .input-group-btn .btn {
                border-radius: 0 12px 12px 0;
            }

            .card-footer {
                background: none;
                border-top: none;
                margin-top: 20px;
                text-align: center;
            }

            .btn-circle {
                width: 100%;
                padding: 10px 0;
                border-radius: 8px;
                margin-bottom: 10px;
                font-weight: bold;
            }

            .btn-info {
                background-color: #007bff;
                border: none;
            }

            .btn-info:hover {
                background-color: #0056b3;
            }

            .btn-danger {
                background-color: #dc3545;
                border: none;
            }

            .btn-danger:hover {
                background-color: #a71d2a;
            }
            </style>
        <script src="https://unpkg.com/@dotlottie/player-component@2.7.12/dist/dotlottie-player.mjs" type="module"></script>
    </head>
    <body>
     <div id="particles-js"></div> <!-- contenedor de partículas -->
     <div class="login-animations">
            <dotlottie-player id="anim1" src="https://lottie.host/8cdbef14-424f-415d-80be-48ebb2eb8bb6/54Ax1pcWQL.json"
                class= "animation" background="transparent" speed="1" loop autoplay></dotlottie-player>
            
            <dotlottie-player id="anim2" src="https://lottie.host/2fdb9ab5-3da6-40ee-97cb-706bfc065a2d/5BidebatZQ.json"
                class= "animation" background="transparent" speed="1" loop autoplay></dotlottie-player>
            <div id="anim3" class= "animation" style="width: 40vw; height: 40vw;"></div>
            <div id="anim4" class= "animation"></div>    
        </div>
        <div class="splash-container new-style">
            <div class="card ">
                <div class="card-header text-center"><a href="<?php echo server_url?>login"><img class="logo-img" src="<?php echo server_url; ?>assets/images/Logo_V1.jpg" alt="logo" width="200"></a><span class="splash-description"></span></div>
                <div class="card-body">
                    <form name="formLogin" id="formLogin" action="">
                        <input id="csrf" name="csrf" type="hidden" value="<?php echo $data["csrf"]; ?>">
                        <div class="form-group">
                            <input class="form-control form-control-lg" id="username" name="username" type="text" placeholder="ingrese su usuario" autocomplete="off">
                        </div>
                        <div class="form-group input-group">
                            <input class="form-control" id="password" name="password" type="password" placeholder="ingrese su contraseña">
                            <span class="input-group-btn">
                                <button id="show_password" class="btn btn-dark btn-lg" type="button" onclick="mostrarPassword()"> <span class="fa fa-eye-slash icon"></span> </button>
                            </span>
                        </div>
                        <button type="submit" class="btn btn-dark btn-lg btn-block"><i class="fas fa-sign-in-alt"></i> Iniciar sesión</button>
                    </form>
                </div>
            </div>
        </div>
        <script src="<?php echo server_url; ?>assets/vendor/jquery/jquery-3.3.1.min.js"></script>
        <script src="<?php echo server_url; ?>assets/js/functions_login.js"></script>
        <script src="<?php echo server_url; ?>assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
        <script type="text/javascript" src="<?php echo server_url; ?>assets/js/functions_principales.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bodymovin/5.7.4/lottie.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/particles.js@2.0.0/particles.min.js"></script>
        <script>
            particlesJS("particles-js", {
                "particles": {
                    "number": {
                        "value": 200,
                        "density": {
                            "enable": true,
                            "value_area": 800
                        }
                    },
                    "color": {
                        "value": "#ffffff"
                    },
                    "shape": {
                        "type": "circle"
                    },
                    "opacity": {
                        "value": 0.4
                    },
                    "size": {
                        "value": 4
                    },
                    "line_linked": {
                        "enable": true,
                        "distance": 120,
                        "color": "#ffffff",
                        "opacity": 0.3,
                        "width": 1
                    },
                    "move": {
                        "enable": true,
                        "speed": 2
                    }
                },
                "interactivity": {
                    "events": {
                        "onhover": {
                            "enable": true,
                            "mode": "repulse"
                        }
                    }
                },
                "retina_detect": true
            });
        </script>
        <script>
            lottie.loadAnimation({
                container: document.getElementById('anim3'),
                renderer: 'svg',
                loop: true,
                autoplay: true,
                path: 'https://assets10.lottiefiles.com/packages/lf20_w51pcehl.json'
            });

            lottie.loadAnimation({
                container: document.getElementById('anim4'),
                renderer: 'svg',
                loop: true,
                autoplay: true,
                path: 'https://assets9.lottiefiles.com/packages/lf20_jcikwtux.json'
            });
        </script>
        <script>
            document.addEventListener("DOMContentLoaded", () => {
                const animations = [
                    document.getElementById("anim1"),
                    document.getElementById("anim2"),
                    document.getElementById("anim3"),
                    document.getElementById("anim4")
                ];

                let current = 0;

                function showNextAnimation() {
                    // Oculta todas
                    animations.forEach(anim => anim.style.opacity = "0");

                    // Muestra la siguiente
                    if (animations[current]) {
                        animations[current].style.opacity = "1";
                        current++;
                        // Espera 3 segundos antes de mostrar la siguiente
                        setTimeout(showNextAnimation, 3000);
                    } else {
                        // Reinicia o puedes eliminar esta línea si no quieres bucle
                        current = 0;
                        setTimeout(showNextAnimation, 600);
                    }
                }

                showNextAnimation();
            });
        </script>

    </body>
</html>