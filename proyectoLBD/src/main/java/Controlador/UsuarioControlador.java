package Controlador;

import Modelo.Usuario;
import Modelo.UsuarioDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UsuarioControlador extends HttpServlet {

    UsuarioDao usuarioDao = new UsuarioDao();
    Usuario usuario = new Usuario();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UsuarioControlador</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UsuarioControlador at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accoin = request.getParameter("accion");
        switch (accoin) {
            case "Listar":
                List<Usuario> datos = usuarioDao.listar();
                request.setAttribute("datos", datos);
                request.getRequestDispatcher("index.jsp").forward(request, response);
                break;
            case "Nuevo":
                request.getRequestDispatcher("agregar.jsp").forward(request, response);
                break;
            case "Guardar":
                String id = request.getParameter("id");
                String nombre = request.getParameter("nombre");
                String apellidos = request.getParameter("apellidos");
                String correo = request.getParameter("correo");
                String contraseña = request.getParameter("contraseña");
                String telefono = request.getParameter("telefono");
                String cedula = request.getParameter("cedula");
                
                usuario.setId_usuario(id);
                usuario.setNombre(nombre);
                usuario.setApellidos(apellidos);
                usuario.setCorreo(correo);
                usuario.setContraseña(contraseña);
                usuario.setTelefono(telefono);
                usuario.setCedula(cedula);
                
                usuarioDao.agregar(usuario);
                
                request.getRequestDispatcher("UsuarioControlador?accion=Listar").forward(request, response);
                break;
                
            case "Editar":
                String ide = request.getParameter("id");
                Usuario usuarioo = usuarioDao.listarId(ide);               
                request.setAttribute("usuario", usuarioo);                
                request.getRequestDispatcher("editar.jsp").forward(request, response);
                break;
                
            case "Actualizar":
                String idd = request.getParameter("id");
                String nombree = request.getParameter("nombre");
                String apellidoss = request.getParameter("apellidos");
                String correoo = request.getParameter("correo");
                String contraseñaa = request.getParameter("contraseña");
                String telefonoo = request.getParameter("telefono");
                String cedulaa = request.getParameter("cedula");
                
                usuario.setId_usuario(idd);
                usuario.setNombre(nombree);
                usuario.setApellidos(apellidoss);
                usuario.setCorreo(correoo);
                usuario.setContraseña(contraseñaa);
                usuario.setTelefono(telefonoo);
                usuario.setCedula(cedulaa);
                
                usuarioDao.actualizar(usuario);
                
                request.getRequestDispatcher("UsuarioControlador?accion=Listar").forward(request, response);
                
                break;

            default:
                throw new AssertionError();
        }
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}