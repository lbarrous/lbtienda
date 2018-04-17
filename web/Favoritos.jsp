<%-- 
    Document   : Favoritos
    Author     : Alvaro
--%>

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
			<div class="row">
                            <%
                                                    session = request.getSession();
                                                    List<Articulos> lid = (List<Articulos>) session.getAttribute("lart");
                                                    
                                                    %>
				
				<div class="col-sm-12 padding-right">
					<div class="features_items"><!--features_items-->
						<h2 class="title text-center">Articulos favoritos</h2>
                                                <%
                                                    if(lid != null){
                                                    %>
                                                <p>
                                                    <a href="invalidar"><button type="submit" class="btn btn-default">Borrar Todos</button></a>
                                                </p>
                                                
                                                    
                                                    <%
                                                    }

                                                    if(lid != null){
                                                        if(!lid.isEmpty()) {
                                                        int index = 0;
                                                        for(Articulos articulo : lid) {
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
                                                                                <div class="choose">
                                                                                        <ul class="nav nav-pills nav-justified">
                                                                                                <li><a href="delFavorito?id=<%out.print(index);%>"><i class="fa fa-minus-square"></i>Eliminar de lista de deseos</a></li>
                                                                                        </ul>
                                                                                </div>
                                                                        </div>
                                                                </div>
						  <%index++;}
                                                    }
                                                    }
                                                    else {%>
                                                        <h3 style="text-align: center; margin-bottom: 35px;">No hay Artículos en la lista de deseos</h3>
                                                    <%}%>
						
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