<%-- 
    Document   : Contacto
    Created on : 18-sep-2016, 20:03:04
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
	 
	 <div id="contact-page" class="container">
    	<div class="bg">
	    	<div class="row">    		
	    		<!--<div class="col-sm-12">    			   			
					<h2 class="title text-center">Contact <strong>Us</strong></h2>    			    				    				
					<div id="gmap" class="contact-map">
					</div>
				</div>			--> 		
			</div>    	
    		<div class="row">  	
	    		<div class="col-sm-8">
	    			<div class="contact-form">
	    				<h2 class="title text-center">Contacta con nosotros</h2>
	    				<div class="status alert alert-success" style="display: none"></div>
				    	<form id="main-contact-form" class="contact-form row" name="contact-form" action="mandaContacto" method="POST">
				            <div class="form-group col-md-6">
				                <input type="text" name="name" class="form-control" required="required" placeholder="Nombre">
				            </div>
				            <div class="form-group col-md-6">
				                <input type="email" name="email" class="form-control" required="required" placeholder="Email">
				            </div>
				            <div class="form-group col-md-12">
				                <input type="text" name="subject" class="form-control" required="required" placeholder="Asunto">
				            </div>
				            <div class="form-group col-md-12">
				                <textarea name="message" id="message" required="required" class="form-control" rows="8" placeholder="Escribe aquí tu mensaje"></textarea>
				            </div>                        
				            <div class="form-group col-md-12">
				                <input class="submit" type="submit" value="Enviar">
				            </div>
				        </form>
	    			</div>
	    		</div>
	    		<div class="col-sm-4">
	    			<div class="contact-info">
	    				<h2 class="title text-center">Información de contacto</h2>
	    				<address>
	    					<p>LBTienda.</p>
							<p>Calle Falsa 123</p>
							<p>Huelva</p>
							<p>Móvil: +34 699880913</p>
							<p>Email: alvarop.garcia@alu.uhu.es</p>
	    				</address>
	    				<div class="social-networks">
	    					<h2 class="title text-center">Redes sociales</h2>
							<ul>
								<li>
									<a href="#"><i class="fa fa-facebook"></i></a>
								</li>
								<li>
									<a href="#"><i class="fa fa-twitter"></i></a>
								</li>
								<li>
									<a href="#"><i class="fa fa-google-plus"></i></a>
								</li>
								<li>
									<a href="#"><i class="fa fa-youtube"></i></a>
								</li>
							</ul>
	    				</div>
	    			</div>
    			</div>    			
	    	</div>  
    	</div>	
    </div><!--/#contact-page-->
	
	<%@include file="WEB-INF/jspf/footer.jspf" %>
	

  
    <script src="./public/js/jquery.js"></script>
	<script src="./public/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"></script>
    <script type="text/javascript" src="js/gmaps.js"></script>
	<script src="./public/js/contact.js"></script>
	<script src="./public/js/price-range.js"></script>
    <script src="./public/js/jquery.scrollUp.min.js"></script>
    <script src="./public/js/jquery.prettyPhoto.js"></script>
    <script src="./public/js/main.js"></script>
    
    <script src="./public/js/jquery.validate.js"></script>
    <script src="./public/js/additional-methods.js"></script>
    
    <script type="text/javascript">
        
		$(document).ready(function() {
                    
                    $("#main-contact-form").validate({
                        errorClass: "my-error-class",
                     });
		    
		} );


       
   </script>
</body>
</html>