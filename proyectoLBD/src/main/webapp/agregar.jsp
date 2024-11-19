<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <center>
            <div>
                <h3>agregar usuarios</h3>
            </div>
            <div>
                <form action="UsuarioControlador" method="post">
                    <div>
                        <label for="id">Id:</label>
                        <input type="nummber" min="1" id="id">
                    </div>
                    <div>
                        <label for="nombre">Nombre:</label>
                        <input type="text" id="nombre">
                    </div>
                    <div>
                        <label for="apellidos">Apellidos:</label>
                        <input type="text" id="apellidos">
                    </div>
                    <div>
                        <label for="correo">Correo:</label>
                        <input type="email" id="correo">
                    </div>
                    <div>
                        <label for="contraseña">Contraseña:</label>
                        <input type="text" id="contraseña">
                    </div>
                    <div>
                        <label for="telefono">Telefono:</label>
                        <input type="text" id="telefono">
                    </div>
                    <div>
                        <label for="cedula">Cedula:</label>
                        <input type="text" id="cedula">
                    </div>
                    <div>
                        <input type="submit" name="accion" value="Guardar">
                    </div>
                </form>
            </div>
        </center>
    </body>
</html>
