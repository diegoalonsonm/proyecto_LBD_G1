
CREATE OR REPLACE PROCEDURE sp_agregar_estado(
    p_nombre_estado VARCHAR2,
    p_descripcion VARCHAR2,
    p_notas VARCHAR2
)
IS
BEGIN
    INSERT INTO FIDE_ESTADOS_TB (id_estado, nombre_estado, descripcion, notas)
    VALUES (
        FIDE_ESTADO_SEQ.NEXTVAL,
        p_nombre_estado,
        p_descripcion,
        p_notas
    );
END sp_agregar_estado;

CREATE OR REPLACE PROCEDURE sp_agregar_usuario(
    p_id_rol INT,
    p_id_estado INT,
    p_id_nacionalidad INT,
    p_nombre VARCHAR2,
    p_apellidos VARCHAR2,
    p_cedula VARCHAR2,
    p_telefono VARCHAR2,
    p_correo VARCHAR2,
    p_contraseña VARCHAR2,
    p_fecha_nacimiento DATE,
    p_id_pais INT,
    p_id_provincia INT,
    p_id_canton INT,
    p_id_distrito INT
)
IS
BEGIN
    INSERT INTO FIDE_USUARIOS_TB (
        id_usuario,
        id_rol,
        id_estado,
        id_nacionalidad,
        nombre,
        apellidos,
        cedula,
        telefono,
        correo,
        contraseña,
        fecha_nacimiento,
        id_pais,
        id_provincia,
        id_canton,
        id_distrito
    )
    VALUES (
        FIDE_USUARIOS_SEQ.NEXTVAL,
        p_id_rol,
        p_id_estado,
        p_id_nacionalidad,
        p_nombre,
        p_apellidos,
        p_cedula,
        p_telefono,
        p_correo,
        p_contraseña,
        p_fecha_nacimiento,
        p_id_pais,
        p_id_provincia,
        p_id_canton,
        p_id_distrito
    );
END sp_agregar_usuario;

CREATE OR REPLACE PROCEDURE sp_agregar_valoracion(
    p_id_estado INT,
    p_comentario CLOB,
    p_valoracion INT
)
IS
BEGIN
    INSERT INTO FIDE_VALORACION_TB (
        id_valoracion,
        id_estado,
        comentario,
        valoracion
    )
    VALUES (
        FIDE_VALORACION_SEQ.NEXTVAL,
        p_id_estado,
        p_comentario,
        p_valoracion
    );
END sp_agregar_valoracion;

CREATE OR REPLACE PROCEDURE sp_registrar_reserva(
    p_id_usuario INT,
    p_id_hotel INT,
    p_id_categoria INT,
    p_id_habitacion INT,
    p_id_moneda INT,
    p_fecha_inicio DATE,
    p_fecha_cierre DATE,
    p_precio_unitario NUMBER,
    p_nombre VARCHAR2,
    p_descripcion CLOB
)
IS
BEGIN
    INSERT INTO FIDE_RESERVAS_TB (
        id_reservacion,
        id_usuario,
        id_hotel,
        id_categoria,
        id_habitacion,
        id_moneda,
        fecha_inicio,
        fecha_cierre,
        precio_unitario,
        nombre,
        descripcion
    )
    VALUES (
        FIDE_RESERVAS_SEQ.NEXTVAL,
        p_id_usuario,
        p_id_hotel,
        p_id_categoria,
        p_id_habitacion,
        p_id_moneda,
        p_fecha_inicio,
        p_fecha_cierre,
        p_precio_unitario,
        p_nombre,
        p_descripcion
    );
END sp_registrar_reserva;

CREATE OR REPLACE PROCEDURE sp_registrar_mantenimiento(
    p_id_habitacion INT,
    p_id_tipo_mantenimiento INT,
    p_fecha_mantenimiento DATE
)
IS
BEGIN
    INSERT INTO FIDE_MANTENIMIENTO_TB (
        id_mantenimiento,
        id_habitacion,
        id_tipo_mantenimiento,
        fecha_mantenimiento
    )
    VALUES (
        FIDE_MANTENIMIENTO_SEQ.NEXTVAL,
        p_id_habitacion,
        p_id_tipo_mantenimiento,
        p_fecha_mantenimiento
    );
END sp_registrar_mantenimiento;

CREATE OR REPLACE PROCEDURE sp_registrar_limpieza(
    p_id_habitacion INT,
    p_id_usuario INT,
    p_fecha_limpieza DATE,
    p_comentarios VARCHAR2
)
IS
BEGIN
    INSERT INTO FIDE_LIMPIEZA_HABITACIONES_TB (
        id_limpieza,
        id_habitacion,
        id_usuario,
        id_estado,
        fecha_limpieza,
        comentarios
    )
    VALUES (
        FIDE_LIMPIEZA_SEQ.NEXTVAL,
        p_id_habitacion,
        p_id_usuario,
        1, -- Estado inicial: Activo
        p_fecha_limpieza,
        p_comentarios
    );
END sp_registrar_limpieza;

CREATE OR REPLACE PROCEDURE sp_actualizar_hotel(
    p_id_hotel INT,
    p_nombre_hotel VARCHAR2,
    p_ubicacion VARCHAR2,
    p_id_pais INT,
    p_id_provincia INT,
    p_id_canton INT,
    p_id_distrito INT,
    p_telefono VARCHAR2,
    p_estado INT
)
IS
BEGIN
    UPDATE FIDE_HOTELES_TB
    SET 
        nombre_hotel = p_nombre_hotel,
        id_pais = p_id_pais,
        id_provincia = p_id_provincia,
        id_canton = p_id_canton,
        id_distrito = p_id_distrito,
        telefono = p_telefono,
        id_estado = p_estado
    WHERE id_hotel = p_id_hotel;
END sp_actualizar_hotel;

CREATE OR REPLACE PROCEDURE sp_consultar_promociones_activas
IS
    CURSOR cur_promociones IS
        SELECT * FROM FIDE_PROMOCIONES_TB
        WHERE id_estado = 1; -- 1
BEGIN
    FOR rec IN cur_promociones
    LOOP
        DBMS_OUTPUT.PUT_LINE('ID Promoción: ' || rec.id_promocion || ', Nombre: ' || rec.nombre_promocion || ', Descripción: ' || rec.descripcion);
    END LOOP;
END sp_consultar_promociones_activas;

CREATE OR REPLACE PROCEDURE sp_crear_habitacion(
    p_id_hotel INT,
    p_id_moneda INT,
    p_id_estado INT,
    p_numero_habitacion VARCHAR2,
    p_tipo_habitacion VARCHAR2,
    p_precio_por_noche VARCHAR2,
    p_capacidad_personas INT
)
IS
BEGIN
    INSERT INTO FIDE_HABITACIONES_TB (
        id_habitacion,
        id_hotel,
        id_moneda,
        id_estado,
        numero_habitacion,
        tipo_habitacion,
        precio_por_noche,
        capacidad_personas
    )
    VALUES (
        FIDE_HABITACIONES_SEQ.NEXTVAL,
        p_id_hotel,
        p_id_moneda,
        p_id_estado,
        p_numero_habitacion,
        p_tipo_habitacion,
        p_precio_por_noche,
        p_capacidad_personas
    );
END sp_crear_habitacion;

CREATE OR REPLACE PROCEDURE sp_agregar_nacionalidad(
    p_descripcion VARCHAR2,
    p_creado_por VARCHAR2
)
IS
BEGIN
    INSERT INTO FIDE_NACIONALIDAD_TB (
        ID_Nacionalidad,
        Descripcion
    )
    VALUES (
        FIDE_NACIONALIDAD_SEQ.NEXTVAL,
        p_descripcion
    );
END sp_agregar_nacionalidad;

CREATE OR REPLACE PROCEDURE sp_agregar_promocion(
    p_id_tipo_promocion INT,
    p_id_reservacion INT,
    p_id_moneda INT,
    p_id_estado INT,
    p_descripcion VARCHAR2,
    p_nombre_promocion VARCHAR2,
    p_fecha_inicio DATE,
    p_fecha_fin DATE,
    p_porcentaje_promocion DECIMAL,
    p_descuento DECIMAL
)
IS
BEGIN
    INSERT INTO FIDE_PROMOCIONES_TB (
        id_promocion,
        id_tipo_promocion,
        id_reservacion,
        id_moneda,
        id_estado,
        descripcion,
        nombre_promocion,
        fecha_inicio,
        fecha_fin,
        porcentaje_promocion,
        descuento
    )
    VALUES (
        FIDE_PROMOCIONES_SEQ.NEXTVAL,
        p_id_tipo_promocion,
        p_id_reservacion,
        p_id_moneda,
        p_id_estado,
        p_descripcion,
        p_nombre_promocion,
        p_fecha_inicio,
        p_fecha_fin,
        p_porcentaje_promocion,
        p_descuento
    );
END sp_agregar_promocion;

CREATE OR REPLACE PROCEDURE sp_añadir_tipo_cambio(
    p_id_moneda INT,
    p_fecha DATE,
    p_tasa_cambio DECIMAL
)
IS
BEGIN
    INSERT INTO FIDE_TIPO_CAMBIO_TB (
        id_tipo_cambio,
        id_moneda,
        fecha,
        tasa_cambio
    )
    VALUES (
        FIDE_TIPO_CAMBIO_SEQ.NEXTVAL,
        p_id_moneda,
        p_fecha,
        p_tasa_cambio
    );
END sp_añadir_tipo_cambio;

CREATE OR REPLACE PROCEDURE sp_editar_reserva(
    p_id_reservacion INT,
    p_id_usuario INT,
    p_id_hotel INT,
    p_id_categoria INT,
    p_id_habitacion INT,
    p_id_valoracion INT,
    p_id_moneda INT,
    p_id_estado INT,
    p_fecha_inicio DATE,
    p_fecha_cierre DATE,
    p_precio_unitario NUMBER,
    p_nombre VARCHAR2,
    p_descripcion CLOB
)
IS
BEGIN
    UPDATE FIDE_RESERVAS_TB
    SET 
        id_usuario = p_id_usuario,
        id_hotel = p_id_hotel,
        id_categoria = p_id_categoria,
        id_habitacion = p_id_habitacion,
        id_valoracion = p_id_valoracion,
        id_moneda = p_id_moneda,
        id_estado = p_id_estado,
        fecha_inicio = p_fecha_inicio,
        fecha_cierre = p_fecha_cierre,
        precio_unitario = p_precio_unitario,
        nombre = p_nombre,
        descripcion = p_descripcion
    WHERE id_reservacion = p_id_reservacion;
END sp_editar_reserva;

CREATE OR REPLACE PROCEDURE sp_agregar_categoria_reserva(
    p_id_estado INT,
    p_nombre_categoria VARCHAR2,
    p_comentarios VARCHAR2
)
IS
BEGIN
    INSERT INTO FIDE_CATEGORIA_RESERVAS_TB (
        id_categoria,
        id_estado,
        nombre_categoria,
        comentarios
    )
    VALUES (
        FIDE_CATEGORIA_RESERVAS_SEQ.NEXTVAL,
        p_id_estado,
        p_nombre_categoria,
        p_comentarios
    );
END sp_agregar_categoria_reserva;

CREATE OR REPLACE PROCEDURE sp_cambiar_estado_habitacion(
    p_id_habitacion INT,
    p_id_estado INT
)
IS
BEGIN
    UPDATE FIDE_HABITACIONES_TB
    SET
        id_estado = p_id_estado
    WHERE id_habitacion = p_id_habitacion;
END sp_cambiar_estado_habitacion;
