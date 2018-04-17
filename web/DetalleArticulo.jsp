<%-- 
    Document   : DetalleArticulo
    Created on : 19-sep-2016, 0:11:37
    Author     : Alvaro
--%>

<%@page import="java.util.HashMap"%>
<%@page import="Controllers.Entidades.Usuarios"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="Controllers.Entidades.Comentarios"%>
<%@page import="Controllers.Entidades.Comentarios"%>
<%@page import="Controllers.Entidades.Articulos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Product Details | E-Shopper</title>
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
				
				<div class="col-sm-12 padding-right">
					<div class="product-details"><!--product-details-->
						<!--<div class="col-sm-4">
							<div class="view-product">
								<img src="./public/images/product-details/1.jpg" alt="" />
							</div>
							<div id="similar-product" class="carousel slide" data-ride="carousel">
								  <a class="left item-control" href="#similar-product" data-slide="prev">
									<i class="fa fa-angle-left"></i>
								  </a>
								  <a class="right item-control" href="#similar-product" data-slide="next">
									<i class="fa fa-angle-right"></i>
								  </a>
							</div>

						</div>-->
                                                <%
                                                Articulos art = (Articulos) request.getAttribute("articulo");
                                                HashMap<Comentarios, Usuarios> lc = (HashMap<Comentarios, Usuarios>) request.getAttribute("comentarios");
                                                Usuarios vendedor = (Usuarios) request.getAttribute("vendedor");
                                                
                                                HttpSession session_user;
                                                session_user = request.getSession(true);
                                                Usuarios u = (Usuarios) session_user.getAttribute("userlogin");
                                                
                                                String estado = art.getIdEstado().toString();
                                                String categoria = art.getIdCategoria().toString();
                                                
                                                        if(estado.equals("1")) 
                                                            estado = "Nuevo"; 
                                                        else if(estado.equals("2")) 
                                                            estado = "Seminuevo"; 
                                                        else if(estado.equals("3")) 
                                                            estado = "Deteriorado"; 
                                                        else if(estado.equals("4")) 
                                                            estado = "Antiguo"; 

                                                        if(categoria.equals("1")) 
                                                            categoria = "Electrónica"; 
                                                        else if(categoria.equals("2")) 
                                                            categoria = "Cine, TV y Música"; 
                                                        else if(categoria.equals("3")) 
                                                            categoria = "Deportes"; 
                                                        else if(categoria.equals("4")) 
                                                            categoria = "Ocio"; 
                                                        else if(categoria.equals("5")) 
                                                            categoria = "Motor"; 
                                                        else if(categoria.equals("6")) 
                                                            categoria = "Moda"; 
                                                        else if(categoria.equals("7")) 
                                                            categoria = "Casa y Jardin"; 
                                                        else if(categoria.equals("8")) 
                                                            categoria = "Libros";
                                                %>
						<div class="col-sm-7">
							<div class="product-information"><!--/product-information-->
								<h2><%out.print(art.getNombre());%></h2>
								<span>
								<span>
									<span>Precio: <%out.print(art.getPrecio());%> €</span>
								</span>
								</span>
								<p><b>Categoría</b><%out.print(categoria);%></p>
								<p><b>Estado del producto:</b><%out.print(estado);%></p>
								<p><b>Año de adquisición:</b> New</p>
								<p><b>Descripción:</b><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,sed do eiusmod tempor</p></p>
							</div><!--/product-information-->
						</div>
					</div><!--/product-details-->
					
					<div class="category-tab shop-details-tab"><!--category-tab-->
						<div class="col-sm-1">
							<ul class="nav nav-tabs">
								<li class="active"><a href="#reviews" data-toggle="tab">Comentarios</a></li>
							</ul>
						</div>
						<div class="tab-content">

							<div class="tab-pane fade active in" id="reviews" >
								<div class="col-sm-12">
                                                                        <%
                                                                            if(!lc.isEmpty()) {
                                                                                for (HashMap.Entry<Comentarios, Usuarios> entry : lc.entrySet())
                                                                                {
                                                                                    if(entry.getKey().getTipoPrivacidad()==1) {
                                                                        %>    
									<div class="comentario">
									<ul>
										<li><a href="#"><i class="fa fa-user"></i><%out.print(entry.getValue().getNombre());%></a></li>
										<li><a href="#"><i class="fa fa-clock-o"></i><%out.print(entry.getKey().getFecha());%></a></li>
                                                                                <li><a href="#"><i class="fa fa-keyboard-o"></i>Público</a></li>
									</ul>

									<p><%out.print(entry.getKey().getMensaje());%></p>
									</div>
                                                                                <%  }
                                                                                    else if(entry.getKey().getTipoPrivacidad()==2 && u != null && u.getIdUsuario().equals(entry.getValue().getIdUsuario())) {%>
                                                                        <div class="comentario">
									<ul>
										<li><a href="#"><i class="fa fa-user"></i><%out.print(entry.getValue().getNombre());%></a></li>
										<li><a href="#"><i class="fa fa-clock-o"></i><%out.print(entry.getKey().getFecha());%></a></li>
                                                                                <li><a href="#"><i class="fa fa-keyboard-o"></i>Privado</a></li>
									</ul>

									<p><p><%out.print(entry.getKey().getMensaje());%></p></p>
									</div>
                                                                                    <%}
                                                                                    else if(entry.getKey().getTipoPrivacidad()==3 && vendedor != null && vendedor.getIdUsuario().equals(entry.getValue().getIdUsuario())) {%>
                                                                        <div class="comentario">
									<ul>
										<li><a href="#"><i class="fa fa-user"></i><%out.print(entry.getValue().getNombre());%></a></li>
										<li><a href="#"><i class="fa fa-clock-o"></i><%out.print(entry.getKey().getFecha());%></a></li>
                                                                                <li><a href="#"><i class="fa fa-keyboard-o"></i>Para el vendedor</a></li>
									</ul>

									<p><p><%out.print(entry.getKey().getMensaje());%></p></p>
									</div>
                                                                                    <%}
                                                                                }
                                                                            }%>
									
                                                                        <% if(u != null) {%>
									<p><b>Escribe tu comentario:</b></p>
									
									<form action="creaComentario" method="POST">
                                                                            <input type="hidden" class="form-control" id="idarticulo" name="idarticulo" value="<%out.print(art.getIdArticulo());%>">
                                                                            <input type="hidden" class="form-control" id="idusuario" name="idusuario" value="<%out.print(u.getIdUsuario());%>">
										<span>
											<select name="privacidad" placeholder="Nombre">
											  <option value="1">Público</option>
											  <option value="3">Para el vendedor</option>
											  <option value="2">Privado</option>
											</select>
										</span>
										<textarea name="mensaje" ></textarea>
										<button type="button" class="btn btn-default pull-right">
											Enviar
										</button>
									</form>
                                                                        <% }
                                                                            else {%>
                                                                            <div class="text-danger"><h4><a href="alta">¡Debes de iniciar sesión para poder publicar un comentario!</a></h4></div>
                                                                            <%}%>
								</div>
							</div>
							
						</div>
					</div><!--/category-tab-->
					
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
</body>
</html>