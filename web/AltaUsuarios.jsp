<%-- 
    Document   : AltaUsuarios
    Author     : Alvaro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>LBTienda</title>
    <link href="./public/css/bootstrap.min.css" rel="stylesheet">
    <link href="./public/css/font-awesome.min.css" rel="stylesheet">
    <link href="./public/css/prettyPhoto.css" rel="stylesheet">
    <link href="./public/css/price-range.css" rel="stylesheet">
    <link href="./public/css/animate.css" rel="stylesheet">
	<link href="./public/css/main.css" rel="stylesheet">
	<link href="./public/css/responsive.css" rel="stylesheet">
        <link href="./public/css/bootstrap-dialog.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="../Publico/images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../Publico/images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../Publico/images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../Publico/images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../Publico/images/ico/apple-touch-icon-57-precomposed.png">
</head><!--/head-->

<body>
	<%@include file="WEB-INF/jspf/menu.jspf" %>
	
	<section id="form" style="margin-top:0"><!--form-->
		<div class="container">
			<div class="row">
				<div class="col-sm-3">
					<div class="login-form"><!--login form-->
						<h2>Login a tu cuenta</h2>
						<form action="inicioSesion" method="POST" id="loginForm">
                                                        <input type="text" name="tipo" value="login" style="display: none;"/>
							<input name="correo" type="email" placeholder="Email" required/>
							<input name="password" type="password" placeholder="Contraseña" required/>
                                                        <br>
							<span>
								<a href="#" class="active">¿Has olvidado la contraseña?</a>
							</span>
                                                        <br><br>
                                                        <div class="col-md-8" style="padding-left: 0px;">
                                                            <input class="submit login_submit" type="submit" value="Login">
                                                        </div>
							
						</form>
					</div><!--/login form-->
				</div>
				<div class="col-sm-1">
					<h2 class="or">O</h2>
				</div>
				<div class="col-sm-8">
					<div class="signup-form"><!--sign up form-->
						<h2>Regístrate!</h2>
						<form action="creaUsuario" method="POST" id="registerForm">
                                                    <input type="text" name="tipo" value="registro" style="display: none;"/>
                                                    <div class="row">
                                                    <div class="col-sm-4">
                                                        <input type="text" name="nombre" placeholder="Nombre" required/>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <input type="text" name="primer_apellido" placeholder="Primer apellido" required/>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <input type="text" name="segundo_apellido" placeholder="Segundo apellido" required/>
                                                    </div>
                                                    </div>
                                                    <div class="row">
                                                    <div class="col-sm-8">
                                                        <input type="text" name="direccion" placeholder="Direccion" required/>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <input type="number" name="cp" placeholder="Código postal" required/>
                                                    </div>
                                                    </div>
                                                    <div class="row">
                                                    <div class="col-sm-8">
                                                        <input type="text" name="ciudad" placeholder="Ciudad" required/>
                                                    </div>
                                                    <div class="col-md-4">
                                                    <select name="provincia">
                                                        <option value='alava'>Álava</option>
                                                        <option value='albacete'>Albacete</option>
                                                        <option value='alicante'>Alicante</option>
                                                        <option value='almeria'>Almería</option>
                                                        <option value='asturias'>Asturias</option>
                                                        <option value='avila'>Ávila</option>
                                                        <option value='badajoz'>Badajoz</option>
                                                        <option value='barcelona'>Barcelona</option>
                                                        <option value='burgos'>Burgos</option>
                                                        <option value='caceres'>Cáceres</option>
                                                        <option value='cadiz'>Cádiz</option>
                                                        <option value='cantabria'>Cantabria</option>
                                                        <option value='castellon'>Castellón</option>
                                                        <option value='ceuta'>Ceuta</option>
                                                        <option value='ciudadreal'>Ciudad Real</option>
                                                        <option value='cordoba'>Córdoba</option>
                                                        <option value='cuenca'>Cuenca</option>
                                                        <option value='girona'>Girona</option>
                                                        <option value='laspalmas'>Las Palmas</option>
                                                        <option value='granada'>Granada</option>
                                                        <option value='guadalajara'>Guadalajara</option>
                                                        <option value='guipuzcoa'>Guipúzcoa</option>
                                                        <option value='huelva'>Huelva</option>
                                                        <option value='huesca'>Huesca</option>
                                                        <option value='illesbalears'>Islas Baleares</option>
                                                        <option value='jaen'>Jaén</option>
                                                        <option value='acoruña'>La Coruña</option>
                                                        <option value='larioja'>La Rioja</option>
                                                        <option value='leon'>León</option>
                                                        <option value='lleida'>Lleida</option>
                                                        <option value='lugo'>Lugo</option>
                                                        <option value='madrid'>Madrid</option>
                                                        <option value='malaga'>Málaga</option>
                                                        <option value='melilla'>Melilla</option>
                                                        <option value='murcia'>Murcia</option>
                                                        <option value='navarra'>Navarra</option>
                                                        <option value='ourense'>Ourense</option>
                                                        <option value='palencia'>Palencia</option>
                                                        <option value='pontevedra'>Pontevedra</option>
                                                        <option value='salamanca'>Salamanca</option>
                                                        <option value='segovia'>Segovia</option>
                                                        <option value='sevilla'>Sevilla</option>
                                                        <option value='soria'>Soria</option>
                                                        <option value='tarragona'>Tarragona</option>
                                                        <option value='santacruztenerife'>Santa Cruz de Tenerife</option>
                                                        <option value='teruel'>Teruel</option>
                                                        <option value='toledo'>Toledo</option>
                                                        <option value='valencia'>Valencia</option>
                                                        <option value='valladolid'>Valladolid</option>
                                                        <option value='vizcaya'>Vizcaya</option>
                                                        <option value='zamora'>Zamora</option>
                                                        <option value='zaragoza'>Zaragoza</option>
                                                    </select>
                                                    </div>
                                                    </div>
                                                    <div class="row">
                                                    <div class="col-sm-4">
                                                        <input type="text" name="telefono" placeholder="Telefono" required/>
                                                    </div>
                                                    </div>
                                                    <div class="row">
                                                    <div class="col-sm-6">
                                                        <input type="text" name="facebook" placeholder="Página de facebook"/>
                                                    </div>
                                                    <div class="col-sm-6">
                                                        <input type="text" name="twitter" placeholder="Id de Twitter"/>
                                                    </div>
                                                    </div>
                                                    <div class="row">
                                                    <div class="col-sm-6">
                                                        <input type="text" id = "email" name="email" placeholder="email" required/>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <input type="password" id="password" name="password" placeholder="Contraseña" required/>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <input type="password" id="repite_password" name="repite_password" placeholder="Repite la contraseña" required/>
                                                    </div>
                                                    </div>
                                                    <br>
							<div class="col-md-4" style="padding-left: 0px;">
                                                            <input class="submit login_submit" type="submit" value="Registrarse">
                                                        </div>
						</form>
					</div><!--/sign up form-->
				</div>
			</div>
		</div>
	</section><!--/form-->
	
	
	<%@include file="WEB-INF/jspf/footer.jspf" %>
	

  
    <script src="./public/js/jquery.js"></script>
	<script src="./public/js/price-range.js"></script>
    <script src="./public/js/jquery.scrollUp.min.js"></script>
	<script src="./public/js/bootstrap.min.js"></script>
    <script src="./public/js/jquery.prettyPhoto.js"></script>
    <script src="./public/js/main.js"></script>
    <script src="./public/js/jquery.validate.js"></script>
    <script src="./public/js/additional-methods.js"></script>
    <script src="./public/js/bootstrap-dialog.js"></script>
    <script src="./public/js/main.js"></script>
    
    <script type="text/javascript">
        
		$(document).ready(function() {
                    
                    jQuery("#registerForm").submit(function(event) {
                        var valido = validarEmailDB();
                        if(!valido) {
                            event.preventDefault();
                            BootstrapDialog.alert({
                                        title: 'Error',
                                        message: 'Esta dirección de Email no esta disponible.',
                                        type: BootstrapDialog.TYPE_WARNING, // <-- Default value is BootstrapDialog.TYPE_PRIMARY
                                        closable: true, // <-- Default value is false
                                        draggable: true, // <-- Default value is false
                                        buttonLabel: 'De acuerdo.', // <-- Default value is 'OK',
                                    });	
                        }
                      });
                    
                    $("#loginForm").validate({
                        errorClass: "my-error-class",
                 });
                     
                    $("#registerForm").validate({
                        errorClass: "my-error-class",
                        rules: {
                            password: {
                                required: true,
                                minlength: 5
                            },
                            repite_password: {
                                required: true,
                                minlength: 5,
                                equalTo: "#password"
                            },
                        },
                        messages: {
                            password: {
                                required: "Este campo es obligatorio.",
                                minlength: "La contraseña debe tener mínimo 5 caracteres."
                            },
                            repite_password: {
                                required: "Este campo es obligatorio.",
                                minlength: "La contraseña debe tener mínimo 5 caracteres.",
                                equalTo: "Las contraseñas deben coincidir."
                            },
                     }
                     });
		    
		} );


       
   </script>
</body>
</html>