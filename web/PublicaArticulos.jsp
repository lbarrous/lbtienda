<%-- 
    Document   : publicaArticulos
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
	
	<section>
		<div class="container">
			<div class="row">
				<div class="tab-content">

							
								<div class="col-sm-12">
									
									<form action="creaArticulo" id="commentForm" method="POST">
									
									<h2 class="title text-center">Añadir un nuevo producto</h2>
									<input hidden value="">
									<div class="form-group col-md-4">
										<label>Nombre:</label>
										<input type="text" name="nombre" class="form-control" required placeholder="Nombre">
									</div>
									<div class="form-group col-md-4 col-md-offset-4">
										<label>Categoría:</label>
										<select name="categoria">
											  <option value="1">Electrónica</option>
											  <option value="2">Cine, TV y Música</option>
											  <option value="3">Deportes</option>
											  <option value="4">Ocio</option>
											  <option value="5">Motor</option>
											  <option value="6">Moda</option>
											  <option value="7">Casa y Jardin</option>
											  <option value="8">Libros</option>
											</select>
									</div>
									
									<div class="form-group col-md-12">
										<textarea name="descripcion" required class="form-control" rows="8" placeholder="Escribe aquí tu mensaje"></textarea>
									</div> 
                                                                        
                                                                        <div class="form-group col-md-12">
                                                                            <label for="file">Subir Foto</label>
                                                                            <input type="file" id="file" name="file">
                                                                        </div>
									
									<div class="form-group col-md-4">
										<label>Estado:</label>
										<select name="estado">
											  <option value="1">Nuevo</option>
											  <option value="2">Seminuevo</option>
											  <option value="3">Deteriorado</option>
											  <option value="4">Antiguo</option>
											</select>
									</div>
									
									<div class="form-group col-md-3 col-md-offset-1">
										<label>Año de adquisición:</label>
										<input type="number" name="adquisicion" class="form-control" required placeholder="Año de adquisición">
									</div>
									
									<div class="form-group col-md-3 col-md-offset-1">
										<label>Precio (€):</label>
										<input type="number" name="precio" class="form-control" required placeholder="Precio">
									</div>
									<div class="form-group col-md-12">
										<input class="submit" type="submit" value="Enviar">
									</div> 

										
									</form>
								</div>
								
			</div>
		</div>
	</section>
	
	<%@include file="WEB-INF/jspf/footer.jspf" %>
  
    <script src="./public/js/jquery.js"></script>
	<script src="./public/js/price-range.js"></script>
    <script src="./public/js/jquery.scrollUp.min.js"></script>
	<script src="./public/js/bootstrap.min.js"></script>
    <script src="./public/js/jquery.prettyPhoto.js"></script>
    <script src="./public/js/main.js"></script>
    <script src="./public/js/jquery.validate.js"></script>
    <script src="./public/js/additional-methods.js"></script>
    
    <script type="text/javascript">
        
		$(document).ready(function() {
                    
                    $("#commentForm").validate({
                        errorClass: "my-error-class",
                     });
		    
		} );


       
   </script>
</body>
</html>