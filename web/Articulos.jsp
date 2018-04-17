<%-- 
    Document   : Articulos
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
                    <form action="filtro" id="commentForm" method="POST">
			<div class="col-sm-4">
				<div class="well text-center">
					<div class="row">
						<div class="col-sm-12">
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
					</div>
				</div>
			</div
			</div>
			<div class="col-sm-3">
				<div class="well text-center">
							
								 <label for="nombre">Precio</label>
                                                                <input class="form-control" id="pmenor" type="text" name="menor" size="4" /> -
                                                                <input class="form-control" id="pmayor" type="text" name="mayor" size="4" /> 
							</div>
			</div
			</div>
			<div class="col-sm-3">
				<div class="well text-center">
								 <label for="nombre">C. Postal</label>
                                                                <input class="form-control" id="cp" type="text" name="cp" placeholder="Ej: 21500"/>
								 
							</div>
			</div
			</div>
			<div class="col-sm-2">
				<div class="well text-center">
															 <center><input class="submit" type="submit" value="Enviar"></center>

							</div>
                        </div>
        </form>
			</div>
                        <%
                        List<Articulos> lr = (List<Articulos>) request.getAttribute("articulos");
                        HttpSession session_user;
                        session_user = request.getSession(true);
                        Usuarios u = (Usuarios) session_user.getAttribute("userlogin");
                        %>
			<div class="row">
				<div class="col-sm-12 padding-right">
                                    <div class="features_items" id="productos_tienda"><!--features_items-->
						<h2 class="title text-center">Productos</h2>
                                                <%
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
                                                    else {%>
                                                        <h3 style="text-align: center; margin-bottom: 35px;">No hay Artículos Disponibles</h3>
                                                    <%}%>
                                                </c:choose>
						<!--<ul class="pagination">
							<li class="active"><a href="">1</a></li>
							<li><a href="">2</a></li>
							<li><a href="">3</a></li>
							<li><a href="">&raquo;</a></li>
						</ul>-->
					</div><!--features_items-->
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
