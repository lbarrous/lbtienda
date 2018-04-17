<%-- 
    Document   : Home
    Author     : Alvaro
--%>

<%@page import="Controllers.Entidades.Usuarios"%>
<%@page import="java.util.List"%>
<%@page import="Controllers.Entidades.Articulos"%>
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
    <link rel="shortcut icon" href="./public/images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="./public/images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="./public/images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="./public/images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="./public/images/ico/apple-touch-icon-57-precomposed.png">
</head><!--/head-->

<body>
    <%@include file="WEB-INF/jspf/menu.jspf" %>
    <%
                     if(request.getAttribute("msg") != null) {
                             %>
                              <div class="msg alert-success col-md-4 col-md-offset-4"><kbd><%out.print(request.getAttribute("msg"));%></kbd></div>
                              <br><br><br>
                              <%}
                    else if(request.getAttribute("msg_cierra") != null) {%>
                                <div class="msg alert-danger col-md-4 col-md-offset-4"><kbd><%out.print(request.getAttribute("msg_cierra"));%></kbd></div>
                                <br><br><br>
                    <%}%>
	
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div id="slider-carousel" class="carousel slide" data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#slider-carousel" data-slide-to="0" class="active"></li>
							<li data-target="#slider-carousel" data-slide-to="1"></li>
						</ol>
						
						<div class="carousel-inner">
							<div class="item active">
								<div class="col-sm-6">
									<h1><span>LB</span>-Tienda</h1>
									<h2>Tu tienda de confianza</h2>
									<p>¿Tienes algo que ya no uses y quieres vender? Este es tu sitio, registrate y vende lo que quieras!</p>
                                                                        <button type="button" class="btn btn-default get"><a href="alta">Regístrate</a></button>
								</div>
								<div class="col-sm-6">
									<img src="./public/images/home/girl1.jpg" class="girl img-responsive" alt="" />
								</div>
							</div>
							
							<div class="item">
								<div class="col-sm-6">
									<h1><span>LB</span>-Tienda</h1>
									<h2>Tu tienda de confianza</h2>
									<p>¿Tienes un dinerillo extra y quieres darte un capricho? Echa un vistazo a nuestro catálogo</p>
                                                                        <button type="button" class="btn btn-default get"><a href="articulos">Productos</a></button>
								</div>
								<div class="col-sm-6">
									<img src="./public/images/home/girl3.jpg" class="girl img-responsive" alt="" />
								</div>
							</div>
							
						</div>
						
						<a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
							<i class="fa fa-angle-left"></i>
						</a>
						<a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
							<i class="fa fa-angle-right"></i>
						</a>
					</div>
					
				</div>
			</div>
		</div>
	
	<section>
            
		<div class="container">
                    
			<div class="row">
				<div class="col-sm-3">
					<div class="left-sidebar">
						<h2>Filtros</h2>
                                                <form action="filtro" id="commentForm" method="POST">
						<div class="panel-group category-products" id="accordian"><!--category-productsr-->
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
						</div><!--/category-products-->
						
						<div class="price-range"><!--price-range-->
							<div class="well text-center">
							
								  <label for="nombre">Precio</label>
                                                                <input class="form-control" id="pmenor" type="text" name="menor" size="4" /> -
                                                                <input class="form-control" id="pmayor" type="text" name="mayor" size="4" /> 
							</div>
							<div class="well text-center">
								<label for="nombre">C. Postal</label>
                                                                <input class="form-control" id="cp" type="text" name="cp" placeholder="Ej: 21500"/>
								 
								 
							</div>
							 
                                                    <input class="submit btn btn-default btn-lg get" type="submit" value="Filtrar" style="float: inherit;">
						</div><!--/price-range-->
						<br>
                                                </form>
					</div>
				</div>
				
				<div class="col-sm-9 padding-right">
				<br>
                                    <%
                                    List<Articulos> lr = (List<Articulos>) request.getAttribute("articulos");
                                    HttpSession session_user;
                                    session_user = request.getSession(true);
                                    Usuarios u = (Usuarios) session_user.getAttribute("userlogin");
                                    %>
					<div class="features_items"><!--features_items-->
						<h2 class="title text-center">Últimos artículos</h2>
                                                <%
                                                if(lr != null){
                                                    if(!lr.isEmpty()) {
                                                        for(Articulos articulo : lr) {
                                                %> 
						<div class="col-sm-4">
                                                                <div class="product-image-wrapper">
                                                                                <div class="single-products">
                                                                                        <div class="productinfo text-center">
                                                                                                <!--<img src="./public/images/shop/product12.jpg" alt="" />-->
                                                                                                <h2><%out.print(articulo.getPrecio());%>€</h2>
                                                                                                <p><%out.print(articulo.getNombre());%></p>
                                                                                                <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-eye"></i>Ver detalles</a>
                                                                                        </div>
                                                                                        <div class="product-overlay">
                                                                                                <div class="overlay-content">
                                                                                                <h2><%out.print(articulo.getPrecio());%>€</h2>
                                                                                                <p><%out.print(articulo.getNombre());%></p>
                                                                                                        <a href="detalles?id=<%out.print(articulo.getIdArticulo());%>" class="btn btn-default add-to-cart"><i class="fa fa-eye"></i>Ver detalles</a>
                                                                                                </div>
                                                                                        </div>
                                                                                </div>
                                                                                <%if(u != null) {%>
                                                                                <div class="choose">
                                                                                        <ul class="nav nav-pills nav-justified">
                                                                                                <li><a href="addFavorito?id=<%out.print(articulo.getIdArticulo());%>"><i class="fa fa-plus-square"></i>Añadir a la lista de deseos</a></li>
                                                                                        </ul>
                                                                                </div>
                                                                                <%}%>
                                                                        </div>
                                                                </div>
						<%}
                                                    }
                                                    }
                                                    else {%>
                                                        <h3 style="text-align: center; margin-bottom: 35px;">No hay Artículos Disponibles</h3>
                                                    <%}%>
						
					</div><!--features_items-->
					
					
						
					</div><!--/category-tab-->
					
					
				</div>
			</div>
		</div>
	</section>
	
        <%@include file="WEB-INF/jspf/footer.jspf" %>
  
    <script src="./public/js/jquery.js"></script>
	<script src="./public/js/bootstrap.min.js"></script>
	<script src="./public/js/jquery.scrollUp.min.js"></script>
	<script src="./public/js/price-range.js"></script>
    <script src="./public/js/jquery.prettyPhoto.js"></script>
    <script src="./public/js/main.js"></script>
</body>
</html>