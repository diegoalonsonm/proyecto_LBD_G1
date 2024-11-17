<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <center>
            <div>
                <h3>Usuarios</h3>
                <form action="UsuarioController" method="post">
                    <input type="submit" name="accion" value="Listar">
                    <input type="submit" name="accion" value="Nuevo">
                </form>
            </div>
            <div>
                <table>
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Nombre</th>
                            <th>Apellido</th>
                            <th>Correo</th>
                            <th>Telefono</th>
                            <th>cedula</th>                           
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="dato" items="${datos}">
                            <tr>
                                <td>${dato.getId_usuario()}</td>
                                <td>${dato.getNombre()}</td>
                                <td>${dato.getApellidos()}</td>
                                <td>${dato.getCorreo()}</td>
                                <td>${dato.getTelefono()}</td>
                                <td>${dato.getCedula()}</td>                                
                                <td>
                                    <form action="UsuarioControlador" method="post">
                                        <input type="hidden" name="accion" value="${dato.getId_usuario()}" />
                                        <input type="submit" value="Editar" />
                                        <input type="submit" value="Eliminar" />
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </center>
    </body>
</html>
