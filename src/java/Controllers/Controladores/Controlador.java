/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Controladores;

import Controllers.Entidades.Articulos;
import Controllers.Entidades.Comentarios;
import Controllers.Entidades.Contacto;
import Controllers.Entidades.Usuarios;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Alvaro
 */

@WebServlet(name = "Controlador", urlPatterns = {"/home", "/articulos",
    "/nuevoArticulo",
    "/mandaContacto",
    "/contacto",
    "/publicar",
    "/alta",
    "/favoritos",
    "/detalles",
    "/creaUsuario",
    "/creaArticulo",
    "/detalle",
    "/creaComentario",
    "/inicioSesion",
    "/filtro",
    "/addFavorito",
    "/delFavorito",
    "/invalidar",
    "/cierraSesion",
    "/emailValido"})
public class Controlador extends HttpServlet {

    @PersistenceContext(unitName = "LBTiendaPU")
    private EntityManager em;
    @Resource
    private javax.transaction.UserTransaction utx;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            String accion;
        accion = request.getServletPath();
        String vista;
        
        HttpSession session;
        HttpSession session_user;
        List<Articulos> lr;
        List<Comentarios> lc;
        List<Usuarios> lu;
        TypedQuery<Articulos> query;
        TypedQuery<Comentarios> queryComentarios;
        TypedQuery<Usuarios> queryUsuarios;
        String nick, clave, msg;
        
        switch (accion) {
            case "/creaUsuario":
                
                String nombre = request.getParameter("nombre");
                String apellido1 = request.getParameter("primer_apellido");
                String apellido2 = request.getParameter("segundo_apellido");
                String direccion = request.getParameter("direccion");
                String codigo_postal = request.getParameter("cp");
                int cp = Integer.parseInt(codigo_postal);
                String ciudad = request.getParameter("ciudad");
                String provincia = request.getParameter("provincia");
                String telefono = request.getParameter("telefono");
                String facebook = request.getParameter("facebook");
                String twitter = request.getParameter("twitter");
                String msg_r = null;
                
                String password = request.getParameter("password");
                String email = request.getParameter("email");

                if (nombre != null && apellido1 != null && apellido2 != null && direccion != null && codigo_postal != null && ciudad != null && provincia != null && telefono != null && password != null && email != null) {
                    Usuarios user = new Usuarios();
                    user.setNombre(nombre);
                    user.setApellido1(apellido1);
                    user.setApellido2(apellido2);
                    user.setDireccion(direccion);
                    user.setCp(cp);
                    user.setCiudad(ciudad);
                    user.setProvincia(provincia);
                    user.setTelefono(telefono);
                    user.setPagFacebook(facebook);
                    user.setIdTwitter(twitter);
                    
                    Random ran = new SecureRandom();
                    byte [] huella = new byte[32];
                    ran.nextBytes(huella);
                    String str = new String(huella);
                    
                    String saltedPassword = str + password;
                    String hashedPassword = generateHash(saltedPassword);
                    
                    user.setHuellaPassword(str);
                    user.setPassword(hashedPassword);
                    user.setEmail(email);

                    try {
                        persist(user);
                        System.out.println("USUARIO REGISTRADO CON EXITO");
                        msg_r = "USUARIO REGISTRADO CORRECTAMENTE";
                    } catch (Exception e) {
                        System.out.println("ERROR AL PERSISTIR EL USUARIO");
                    }
                } else {
                    System.out.println("DATOS VACIOS");
                }

                request.setAttribute("msg", msg_r);
                vista = "/Home.jsp";
                break;
                
            case "/creaArticulo":

                String nombre_articulo = request.getParameter("nombre");
                String descripcion_articulo = request.getParameter("descripcion");
                String categoria_articulo = request.getParameter("categoria");
                String estado = request.getParameter("estado");
                String adquisicion = request.getParameter("adquisicion");
                String precio = request.getParameter("precio");

                if (nombre_articulo != null && descripcion_articulo != null && categoria_articulo != null && estado != null && adquisicion != null && precio != null) {

                    Articulos a = new Articulos();
                    a.setIdCategoria(Integer.parseInt(categoria_articulo));
                    a.setAdquisicion(Integer.parseInt(adquisicion));
                    a.setDescripcion(descripcion_articulo);
                    a.setIdEstado(Integer.parseInt(estado));
                    a.setNombre(nombre_articulo);
                    a.setPrecio(Double.parseDouble(precio));

                    session_user = request.getSession(true);
                    Usuarios u = (Usuarios) session_user.getAttribute("userlogin"); //Recupera la variable de sesion del usuario logueado
                    int id = u.getIdUsuario();
                    u = em.find(Usuarios.class, id);

                    if (u != null) {
                        a.setIdUsuario(u);

                        try {
                            persist(a);
                            System.out.println(" *** Artículo: " + nombre_articulo + " creado");
                            //msg = "<p class='ok'>Artículo: " + name + " creado adecuadamente</p>";

                            query = em.createNamedQuery("Articulos.findAll", Articulos.class);
                            lr = query.getResultList();
                            id = lr.get(lr.size() - 1).getIdArticulo(); //Obtengo el id del ultimo articulo añadido para usarlo como nombre de su imagen

                            final Part filePart = request.getPart("file");
                            if (filePart != null) {

                                String n = filePart.getName();
                                Long tamano = filePart.getSize();
                                String file = filePart.getSubmittedFileName();

                                String relativePathFolder = "./public/images/articulos";
                                String absolutePathFolder = getServletContext().getRealPath(relativePathFolder);

                                File folder = new File(absolutePathFolder);
                                if (folder.exists()) {
                                    System.err.println("*** Error : " + absolutePathFolder + " existe");
                                } else {
                                    folder.mkdir();
                                }

                                System.out.println(absolutePathFolder + File.separator + id + ".jpg");
                                File f = new File(absolutePathFolder + File.separator + id + ".jpg");
                                //String nfp = f.getAbsolutePath();
                                OutputStream p = new FileOutputStream(f);
                                InputStream filecontent;
                                filecontent = filePart.getInputStream();
                                System.out.println("*** Tam: " + filePart.getSize());

                                int read = 0;
                                final byte[] bytes = new byte[1024];
                                while ((read = filecontent.read(bytes)) != -1) {
                                    p.write(bytes, 0, read);
                                }

                                p.close();
                                filecontent.close();
                            }

                        } catch (Exception ex) {
                            System.out.println(ex);
                            System.out.println("*** Error: Imposible persistir  articulo: " + nombre_articulo);
                            //msg = "<p class='error'>Error: Artículo " + name + " no creado</p>";
                        }
                    }

                } else {
                    System.out.println("ERROR. DATOS VACIOS");
                }

                query = em.createNamedQuery("Articulos.findAll", Articulos.class);
                lr = query.getResultList();
                request.setAttribute("articulos", lr);

                vista = "/articulos";
                break;
                
            case "/mandaContacto":
                
                String nombre_contacto = request.getParameter("name");
                String email_contacto = request.getParameter("email");
                String asunto = request.getParameter("subject");
                String mensaje = request.getParameter("message");

                if (nombre_contacto != null && email_contacto != null && asunto != null && mensaje != null) {
                    Contacto c = new Contacto();
                    
                    c.setAsunto(asunto);
                    c.setEmail(email_contacto);
                    c.setMensaje(mensaje);
                    c.setNombre(nombre_contacto);

                    try {
                        persist(c);
                        System.out.println("CONTACTO REGISTRADO CON EXITO");
                    } catch (Exception e) {
                        System.out.println("ERROR AL PERSISTIR EL CONTACTO");
                    }
                } else {
                    System.out.println("DATOS VACIOS");
                }

                vista = "/Home.jsp";
                break;
                
            case "/articulos":
                query = em.createNamedQuery("Articulos.findAll", Articulos.class);
                lr = query.getResultList();
                request.setAttribute("articulos", lr);

                vista = "/Articulos.jsp";
                break;
                
            case "/inicioSesion":
                nick = request.getParameter("correo");
                clave = request.getParameter("password");
                msg = null;

                /*Inicio de sesion desde el form de la página de detalles para insert comentarios*/
                String opcion_comentarios = request.getParameter("inicioSesionComentarios");
                String art = request.getParameter("idarticulo");//Recojo el valor del idarticulo, para que cuando se loguee el usuario, persita el articulo detallado.

                /*Inicio de sesion desde el form de la página de detalles para publicar articulos*/
                String opcion_publicar = request.getParameter("inicioSesionPublicar");

                if (nick != null && clave != null) {
                    try {
                        Usuarios user_login = new Usuarios();
                        queryUsuarios = em.createNamedQuery("Usuarios.findByEmail", Usuarios.class);
                        queryUsuarios.setParameter("email", nick);
                        user_login = queryUsuarios.getSingleResult();

                        if (user_login != null) {
                            
                            String huella_db = user_login.getHuellaPassword();
                            String pass_db = user_login.getPassword();
                            
                            String saltedPassword_login = huella_db + clave;
                            String hashedPassword_login = generateHash(saltedPassword_login);
                            
                            if (pass_db.equals(hashedPassword_login)) {
                                System.out.println("USUARIO IDENTIFICADO CORRECTAMENTE");
                                msg = "USUARIO IDENTIFICADO CORRECTAMENTE";
                                /*Creo la sesion*/
                                session_user = request.getSession(true);
                                session_user.setAttribute("userlogin", user_login);

                            } else {
                                System.out.println("USUARIO INCORRECTO");
                                msg = "Email o contraseñas incorrectos";
                            }
                        }
                    } catch (Exception e) {
                        msg = "No existe usuario con ese Email";
                    }

                    request.setAttribute("msg", msg);
                }
                
                vista = "/Home.jsp";

                break;
                
            
            case "/cierraSesion":
                session_user = request.getSession();
                session_user.invalidate();
                msg = "Sesion finalizada";
                
                request.setAttribute("msg_cierra", msg);

                vista = "/home";
                break;
                
            case "/emailValido":
                String email_valido = request.getParameter("email");
                queryUsuarios = em.createNamedQuery("Usuarios.findByEmail", Usuarios.class);
                queryUsuarios.setParameter("email", email_valido);
                lu = queryUsuarios.getResultList();
                if (lu.size() > 1) {
                    vista = "WEB-INF/jspf/emailInvalido.jsp";
                } else {
                    vista = "WEB-INF/jspf/emailValido.jsp";
                }

                break;
                
            case "/addFavorito":
                String idf = request.getParameter("id");

                if (idf != null) {
                    query = em.createNamedQuery("Articulos.findByIdArticulo", Articulos.class);
                    query.setParameter("idArticulo", Integer.parseInt(idf));
                    lr = query.getResultList();

                    if (lr != null) { // Esta el artículo
                        session = request.getSession();
                        List<Articulos> lid = (List<Articulos>) session.getAttribute("lart");
                        if (lid == null) {
                            lid = new ArrayList<>();
                        }
                        Articulos a = lr.get(0);
                        lid.add(a);
                        msg = "ARTICULO AÑADIDO A FAVORITOS";
                        session.setAttribute("lart", lid);
                    } else { //No está el art
                        msg = "ARTICULO NO EXISTE";
                    }
                } else { // Id no enviado
                    msg = "<p class=\"error\">Artículo No registrado en favoritos. Falta Id.<p>";
                }

                request.setAttribute("msg", msg);

                vista = "/articulos";
                break;
            
            case "/favoritos":

                vista = "/Favoritos.jsp";
                break;    

            case "/detalles":
                
                int id_detalle = Integer.parseInt(request.getParameter("id"));
                
                Articulos articulo = new Articulos();
                query = em.createNamedQuery("Articulos.findByIdArticulo", Articulos.class);
                query.setParameter("idArticulo", id_detalle);
                articulo = query.getSingleResult();
                request.setAttribute("articulo", articulo);
                
                Usuarios ud = new Usuarios();
                int id = articulo.getIdUsuario().getIdUsuario();
                ud = em.find(Usuarios.class, id);

                request.setAttribute("vendedor", ud);
                
                HashMap<Comentarios, Usuarios> map = new HashMap<Comentarios, Usuarios>();
                
                Comentarios c = new Comentarios();
                queryComentarios = em.createNamedQuery("Comentarios.findByIdArticulo", Comentarios.class);
                queryComentarios.setParameter("idArticulo", em.find(Articulos.class, id_detalle));
                lc = queryComentarios.getResultList();
                for(Comentarios comentario : lc) {
                    Usuarios user_comentario = new Usuarios();
                    queryUsuarios = em.createNamedQuery("Usuarios.findByIdUsuario", Usuarios.class);
                    queryUsuarios.setParameter("idUsuario", comentario.getIdUsuario().getIdUsuario());
                    user_comentario = queryUsuarios.getSingleResult();
                    map.put(comentario, user_comentario);
                }

                request.setAttribute("comentarios", map);

                vista = "/DetalleArticulo.jsp";
                break;
                
            case "/creaComentario":
                String mensaje_comentario = request.getParameter("mensaje");
                String privacidad_comentario = request.getParameter("privacidad");
                Date fecha = new Date();
                String idusuario = request.getParameter("idusuario");
                String idarticulo = request.getParameter("idarticulo");

                Usuarios uc = new Usuarios();
                int idc = Integer.parseInt(idusuario);
                uc = em.find(Usuarios.class, idc);
                System.out.println(uc.getIdUsuario());

                Articulos ac = new Articulos();
                idc = Integer.parseInt(idarticulo);
                ac = em.find(Articulos.class, idc);
                System.out.println(ac.getIdArticulo());

                if (mensaje_comentario != null && privacidad_comentario != null && fecha != null) {
                    Comentarios cc = new Comentarios();
                    cc.setFecha(fecha);
                    cc.setMensaje(mensaje_comentario);
                    cc.setTipoPrivacidad(Integer.parseInt(privacidad_comentario));
                    cc.setIdUsuario(uc);
                    cc.setIdArticulo(ac);
                    try {
                        persist(cc);
                        System.out.println("COMENTARIO INSERTADO CORRECTAMENTE");
                    } catch (Exception e) {
                        System.out.println(e);
                        System.out.println("ERROR. NO SE HA INSERTADO EL COMENTARIO");
                    }
                } else {
                    System.out.println("ERROR EN LOS DATOS");
                }

                queryComentarios = em.createNamedQuery("Comentarios.findByIdarticulo", Comentarios.class);
                queryComentarios.setParameter("idarticulo", ac);
                lc = queryComentarios.getResultList();

                request.setAttribute("comentarios", lc);

                vista = "/detalle?id=" + idarticulo;
                break;
                
            case "/filtro":
                String where = null;
                boolean bn = false,
                 bn1 = false,
                 bn2 = false;
                String cat = request.getParameter("categoria");
                String codp = request.getParameter("cp");
                String n1 = request.getParameter("menor");
                String n2 = request.getParameter("mayor");
                
                where = "WHERE a.idCategoria = '" + cat + "'";
                bn = true;

                if (!"".equals(n1)) {
                    if (bn) {
                        where += " AND a.precio > " + n1;
                    } else {
                        where = "WHERE a.precio > " + n1;
                    }
                    bn1 = true;
                }

                if (!"".equals(n2)) {
                    if (bn || bn1) {
                        where += " AND a.precio < " + n2;
                    } else {
                        where = "WHERE a.precio < " + n2;
                    }
                    bn2 = true;
                }

                TypedQuery<Articulos> q1 = em.createQuery("SELECT a FROM Articulos a " + (where != null ? where : ""), Articulos.class);

                List<Articulos> la = (List<Articulos>) q1.getResultList();
                for (int i = 0; i < la.size(); i++) {
                    System.out.println(la.get(i).getIdCategoria());
                }
                request.setAttribute("articulos", la);
                
                vista = "/Articulos.jsp";
                break;
                
            case "/delFavorito":
                idf = request.getParameter("id");
                int i = Integer.parseInt(idf);
                session = request.getSession();
                List<Articulos> lid = (List<Articulos>) session.getAttribute("lart");
                lid.remove(i);
                session.setAttribute("lart", lid);

                vista = "/favoritos";
                break;
                
            case "/invalidar":
                session = request.getSession();
                session.removeAttribute("lart");

                vista = "/favoritos";
                break;
                
            case "/alta":

                vista = "/AltaUsuarios.jsp";
                break;
                
            case "/nuevoArticulo":

                vista = "/PublicaArticulos.jsp";
                break;
                        
            case "/contacto":
                vista = "/Contacto.jsp";
                break;
                
            case "/home":
                query = em.createNamedQuery("Articulos.findAllLimit", Articulos.class);
                lr = query.getResultList();
                request.setAttribute("articulos", lr);
                
                vista = "/Home.jsp";
                break;
                
            default:
                vista="/Home.jsp";
                break;
        }
        RequestDispatcher rd = request.getRequestDispatcher(vista);
        rd.forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    public void persist(Object object) {
        try {
            utx.begin();
            em.persist(object);
            utx.commit();
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            throw new RuntimeException(e);
        }
    }
    
    private String generateHash(String input) {
		StringBuilder hash = new StringBuilder();

		try {
			MessageDigest sha = MessageDigest.getInstance("SHA-1");
			byte[] hashedBytes = sha.digest(input.getBytes());
			char[] digits = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
					'a', 'b', 'c', 'd', 'e', 'f' };
			for (int idx = 0; idx < hashedBytes.length; ++idx) {
				byte b = hashedBytes[idx];
				hash.append(digits[(b & 0xf0) >> 4]);
				hash.append(digits[b & 0x0f]);
			}
		} catch (NoSuchAlgorithmException e) {
			// handle error here.
		}

		return hash.toString();
	}

}
