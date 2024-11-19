-- Tablas
CREATE TABLE FIDE_ESTADOS_TB (
    id_estado INT PRIMARY KEY,
    nombre_estado VARCHAR2(100) NOT NULL,
    descripcion VARCHAR2(1000) NOT NULL,
    notas VARCHAR2(1000),
    NOMBRE VARCHAR2(100),
    CREADO_POR VARCHAR2(100),
    FECHA_CREACION SYSTIMESTAMP,
    MODIFICADO_POR VARCHAR2(100),
    FECHA_MODIFICACION SYSTIMESTAMP,
    ACCION VARCHAR2(100)
);

CREATE TABLE FIDE_PAIS_TB (
    id_pais INT PRIMARY KEY,
    nombre_pais VARCHAR2(50) NOT NULL,
    NOMBRE VARCHAR2(100),
    CREADO_POR VARCHAR2(100),
    FECHA_CREACION SYSTIMESTAMP,
    MODIFICADO_POR VARCHAR2(100),
    FECHA_MODIFICACION SYSTIMESTAMP,
    ACCION VARCHAR2(100),
    id_estado INT NOT NULL,
    CONSTRAINT fk_pais_estado FOREIGN KEY (id_estado) 
    REFERENCES FIDE_ESTADOS_TB(id_estado)
);

CREATE TABLE FIDE_PROVINCIA_TB (
    id_provincia INT PRIMARY KEY,
    id_pais INT NOT NULL,
    nombre_provincia VARCHAR2(50) NOT NULL,
    CONSTRAINT fk_provincia_pais FOREIGN KEY (id_pais) 
    REFERENCES FIDE_PAIS_TB(id_pais),
    NOMBRE VARCHAR2(100),
    CREADO_POR VARCHAR2(100),
    FECHA_CREACION SYSTIMESTAMP,
    MODIFICADO_POR VARCHAR2(100),
    FECHA_MODIFICACION SYSTIMESTAMP,
    ACCION VARCHAR2(100),
    id_estado INT NOT NULL,
    CONSTRAINT fk_provincia_estado FOREIGN KEY (id_estado) 
    REFERENCES FIDE_ESTADOS_TB(id_estado)
);

CREATE TABLE FIDE_CANTON_TB (
    id_canton INT PRIMARY KEY,
    id_provincia INT NOT NULL,
    nombre_canton VARCHAR2(100) NOT NULL,
    CONSTRAINT fk_canton_provincia FOREIGN KEY (id_provincia) 
    REFERENCES FIDE_PROVINCIA_TB(id_provincia),
    NOMBRE VARCHAR2(100),
    CREADO_POR VARCHAR2(100),
    FECHA_CREACION SYSTIMESTAMP,
    MODIFICADO_POR VARCHAR2(100),
    FECHA_MODIFICACION SYSTIMESTAMP,
    ACCION VARCHAR2(100),
    id_estado INT NOT NULL,
    CONSTRAINT fk_canton_estado FOREIGN KEY (id_estado) 
    REFERENCES FIDE_ESTADOS_TB(id_estado)
);

CREATE TABLE FIDE_DISTRITO_TB (
    id_distrito INT PRIMARY KEY,
    id_canton INT NOT NULL,
    nombre_distrito VARCHAR2(100) NOT NULL,
    CONSTRAINT fk_distrito_canton FOREIGN KEY (id_canton) 
    REFERENCES FIDE_CANTON_TB(id_canton),
    NOMBRE VARCHAR2(100),
    CREADO_POR VARCHAR2(100),
    FECHA_CREACION SYSTIMESTAMP,
    MODIFICADO_POR VARCHAR2(100),
    FECHA_MODIFICACION SYSTIMESTAMP,
    ACCION VARCHAR2(100),
    id_estado INT NOT NULL,
    CONSTRAINT fk_distrito_estado FOREIGN KEY (id_estado) 
    REFERENCES FIDE_ESTADOS_TB(id_estado)
);

CREATE TABLE FIDE_DIRECCION_TB (
    id_direccion INT PRIMARY KEY,
    id_distrito INT NOT NULL,
    id_canton INT NOT NULL,
    id_provincia INT NOT NULL,
    id_pais INT NOT NULL,
    descripcion VARCHAR2(255) NOT NULL,
    CONSTRAINT fk_direccion_distrito FOREIGN KEY (id_distrito) 
    REFERENCES FIDE_DISTRITO_TB(id_distrito),
    CONSTRAINT fk_direccion_canton FOREIGN KEY (id_canton) 
    REFERENCES FIDE_CANTON_TB(id_canton),
    CONSTRAINT fk_direccion_provincia FOREIGN KEY (id_provincia) 
    REFERENCES FIDE_PROVINCIA_TB(id_provincia),
    CONSTRAINT fk_direccion_pais FOREIGN KEY (id_pais) 
    REFERENCES FIDE_PAIS_TB(id_pais),
    NOMBRE VARCHAR2(100),
    CREADO_POR VARCHAR2(100),
    FECHA_CREACION SYSTIMESTAMP,
    MODIFICADO_POR VARCHAR2(100),
    FECHA_MODIFICACION SYSTIMESTAMP,
    ACCION VARCHAR2(100),
    id_estado INT NOT NULL,
    CONSTRAINT fk_direccion_estado FOREIGN KEY (id_estado) 
    REFERENCES FIDE_ESTADOS_TB(id_estado)
);

CREATE TABLE FIDE_NACIONALIDAD_TB (
    ID_Nacionalidad INT PRIMARY KEY,
    Descripcion VARCHAR2(50) NOT NULL,
    NOMBRE VARCHAR2(100),
    CREADO_POR VARCHAR2(100),
    FECHA_CREACION SYSTIMESTAMP,
    MODIFICADO_POR VARCHAR2(100),
    FECHA_MODIFICACION SYSTIMESTAMP,
    ACCION VARCHAR2(100),
    id_estado INT NOT NULL,
    CONSTRAINT fk_nacionalidad_estado FOREIGN KEY (id_estado) 
    REFERENCES FIDE_ESTADOS_TB(id_estado)
);

CREATE TABLE FIDE_ROLES_TB (
    id_rol INT PRIMARY KEY,
    id_estado INT NOT NULL,
    nombre_rol VARCHAR2(50) NOT NULL,
    descripción VARCHAR2(500) NOT NULL,
    CONSTRAINT fk_roles_estado FOREIGN KEY (id_estado) 
    REFERENCES FIDE_ESTADOS_TB(id_estado),
    NOMBRE VARCHAR2(100),
    CREADO_POR VARCHAR2(100),
    FECHA_CREACION SYSTIMESTAMP,
    MODIFICADO_POR VARCHAR2(100),
    FECHA_MODIFICACION SYSTIMESTAMP,
    ACCION VARCHAR2(100)
);

CREATE TABLE FIDE_MONEDA_TB (
    id_moneda INT PRIMARY KEY,
    codigo_moneda VARCHAR2(3) UNIQUE NOT NULL,
    nombre_moneda VARCHAR2(50) NOT NULL,
    NOMBRE VARCHAR2(100),
    CREADO_POR VARCHAR2(100),
    FECHA_CREACION SYSTIMESTAMP,
    MODIFICADO_POR VARCHAR2(100),
    FECHA_MODIFICACION SYSTIMESTAMP,
    ACCION VARCHAR2(100),
    id_estado INT NOT NULL,
    CONSTRAINT fk_moneda_estado FOREIGN KEY (id_estado) 
    REFERENCES FIDE_ESTADOS_TB(id_estado)
);

CREATE TABLE FIDE_TIPO_MANTENIMIENTO_TB (
    id_tipo_mantenimiento INT PRIMARY KEY,
    tipo_mantenimiento VARCHAR2(100) NOT NULL,
    NOMBRE VARCHAR2(100),
    CREADO_POR VARCHAR2(100),
    FECHA_CREACION SYSTIMESTAMP,
    MODIFICADO_POR VARCHAR2(100),
    FECHA_MODIFICACION SYSTIMESTAMP,
    ACCION VARCHAR2(100),
    id_estado INT NOT NULL,
    CONSTRAINT fk_tipo_mantenimiento_estado FOREIGN KEY (id_estado) 
    REFERENCES FIDE_ESTADOS_TB(id_estado)
);

CREATE TABLE FIDE_TIPO_PROMOCION_TB (
    id_tipo_promocion INT PRIMARY KEY,
    nombre VARCHAR2(50) NOT NULL,
    descripcion VARCHAR2(255) NOT NULL,
    NOMBRE VARCHAR2(100),
    CREADO_POR VARCHAR2(100),
    FECHA_CREACION SYSTIMESTAMP,
    MODIFICADO_POR VARCHAR2(100),
    FECHA_MODIFICACION SYSTIMESTAMP,
    ACCION VARCHAR2(100),
    id_estado INT NOT NULL,
    CONSTRAINT fk_tipo_promocion_estado FOREIGN KEY (id_estado) 
    REFERENCES FIDE_ESTADOS_TB(id_estado)
);

CREATE TABLE FIDE_USUARIOS_TB (
    id_usuario INT PRIMARY KEY,
    id_rol INT NOT NULL,
    id_estado INT NOT NULL,
    id_nacionalidad INT NOT NULL,
    id_direccion INT NOT NULL,
    nombre VARCHAR2(50) NOT NULL,
    apellidos VARCHAR2(100),
    cedula VARCHAR2(255) NOT NULL,
    telefono VARCHAR2(20) NOT NULL,
    correo VARCHAR2(100) NOT NULL,
    contraseña VARCHAR2(100) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    CREADO_POR VARCHAR2(100),
    FECHA_CREACION SYSTIMESTAMP,
    MODIFICADO_POR VARCHAR2(100),
    FECHA_MODIFICACION SYSTIMESTAMP,
    ACCION VARCHAR2(100),
    CONSTRAINT fk_usuarios_rol FOREIGN KEY (id_rol) 
    REFERENCES FIDE_ROLES_TB(id_rol),
    CONSTRAINT fk_usuarios_estado FOREIGN KEY (id_estado) 
    REFERENCES FIDE_ESTADOS_TB(id_estado),
    CONSTRAINT fk_usuarios_nacionalidad FOREIGN KEY (id_nacionalidad) 
    REFERENCES FIDE_NACIONALIDAD_TB(ID_Nacionalidad),
    CONSTRAINT fk_usuarios_direccion FOREIGN KEY (id_direccion) 
    REFERENCES FIDE_DIRECCION_TB(id_direccion)
);

CREATE TABLE FIDE_HOTELES_TB (
    id_hotel INT PRIMARY KEY,
    id_estado INT NOT NULL,
    nombre_hotel VARCHAR2(50) NOT NULL,
    ubicacion VARCHAR2(255) NOT NULL,
    telefono VARCHAR2(20) NOT NULL,
    CONSTRAINT fk_hoteles_estado FOREIGN KEY (id_estado) 
    REFERENCES FIDE_ESTADOS_TB(id_estado),
    NOMBRE VARCHAR2(100),
    CREADO_POR VARCHAR2(100),
    FECHA_CREACION SYSTIMESTAMP,
    MODIFICADO_POR VARCHAR2(100),
    FECHA_MODIFICACION SYSTIMESTAMP,
    ACCION VARCHAR2(100)
);

CREATE TABLE FIDE_HABITACIONES_TB (
    id_habitacion INT PRIMARY KEY,
    id_hotel INT NOT NULL,
    id_moneda INT NOT NULL,
    id_estado INT NOT NULL,
    numero_habitacion VARCHAR2(10) NOT NULL,
    tipo_habitacion VARCHAR2(50) NOT NULL,
    precio_por_noche VARCHAR2(50) NOT NULL,
    capacidad_personas INT NOT NULL,
    estado VARCHAR2(50) NOT NULL,
    CONSTRAINT fk_habitaciones_hotel FOREIGN KEY (id_hotel) 
    REFERENCES FIDE_HOTELES_TB(id_hotel),
    CONSTRAINT fk_habitaciones_moneda FOREIGN KEY (id_moneda) 
    REFERENCES FIDE_MONEDA_TB(id_moneda),
    CONSTRAINT fk_habitaciones_estado FOREIGN KEY (id_estado) 
    REFERENCES FIDE_ESTADOS_TB(id_estado),
    NOMBRE VARCHAR2(100),
    CREADO_POR VARCHAR2(100),
    FECHA_CREACION SYSTIMESTAMP,
    MODIFICADO_POR VARCHAR2(100),
    FECHA_MODIFICACION SYSTIMESTAMP,
    ACCION VARCHAR2(100)
);

CREATE TABLE FIDE_VALORACION_TB (
    id_valoracion INT PRIMARY KEY,
    id_estado INT NOT NULL,
    comentario CLOB NOT NULL,
    valoracion INT NOT NULL,
    timestamp TIMESTAMP NOT NULL,
    CONSTRAINT fk_valoracion_estado FOREIGN KEY (id_estado) 
    REFERENCES FIDE_ESTADOS_TB(id_estado),
    NOMBRE VARCHAR2(100),
    CREADO_POR VARCHAR2(100),
    FECHA_CREACION SYSTIMESTAMP,
    MODIFICADO_POR VARCHAR2(100),
    FECHA_MODIFICACION SYSTIMESTAMP,
    ACCION VARCHAR2(100)
);

CREATE TABLE FIDE_CATEGORIA_RESERVAS_TB (
    id_categoria INT PRIMARY KEY,
    id_estado INT NOT NULL,
    nombre_categoria VARCHAR2(100) NOT NULL,
    comentarios VARCHAR2(250) NOT NULL,
    CONSTRAINT fk_categoria_estado FOREIGN KEY (id_estado) 
    REFERENCES FIDE_ESTADOS_TB(id_estado),
    NOMBRE VARCHAR2(100),
    CREADO_POR VARCHAR2(100),
    FECHA_CREACION SYSTIMESTAMP,
    MODIFICADO_POR VARCHAR2(100),
    FECHA_MODIFICACION SYSTIMESTAMP,
    ACCION VARCHAR2(100)
);

CREATE TABLE FIDE_RESERVAS_TB (
    id_reservacion INT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_hotel INT NOT NULL,
    id_categoria INT NOT NULL,
    id_habitacion INT,
    id_valoracion INT,
    id_moneda INT NOT NULL,
    id_estado INT NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_cierre DATE NOT NULL,
    hora TIMESTAMP NOT NULL,
    precio_unitario NUMBER(20,2) NOT NULL,
    nombre VARCHAR2(255) NOT NULL,
    descripcion CLOB NOT NULL,
    CONSTRAINT fk_reservas_usuario FOREIGN KEY (id_usuario) 
    REFERENCES FIDE_USUARIOS_TB(id_usuario),
    CONSTRAINT fk_reservas_hotel FOREIGN KEY (id_hotel) 
    REFERENCES FIDE_HOTELES_TB(id_hotel),
    CONSTRAINT fk_reservas_categoria FOREIGN KEY (id_categoria) 
    REFERENCES FIDE_CATEGORIA_RESERVAS_TB(id_categoria),
    CONSTRAINT fk_reservas_habitacion FOREIGN KEY (id_habitacion) 
    REFERENCES FIDE_HABITACIONES_TB(id_habitacion),
    CONSTRAINT fk_reservas_valoracion FOREIGN KEY (id_valoracion) 
    REFERENCES FIDE_VALORACION_TB(id_valoracion),
    CONSTRAINT fk_reservas_moneda FOREIGN KEY (id_moneda) 
    REFERENCES FIDE_MONEDA_TB(id_moneda),
    CONSTRAINT fk_reservas_estado FOREIGN KEY (id_estado) 
    REFERENCES FIDE_ESTADOS_TB(id_estado),
    NOMBRE VARCHAR2(100),
    CREADO_POR VARCHAR2(100),
    FECHA_CREACION SYSTIMESTAMP,
    MODIFICADO_POR VARCHAR2(100),
    FECHA_MODIFICACION SYSTIMESTAMP,
    ACCION VARCHAR2(100)
);

CREATE TABLE FIDE_PROMOCIONES_TB (
    id_promocion INT PRIMARY KEY,
    id_tipo_promocion INT NOT NULL,
    id_reservacion INT NOT NULL,
    id_moneda INT NOT NULL,
    id_estado INT NOT NULL,
    descripcion VARCHAR2(255) NOT NULL,
    nombre_promocion VARCHAR2(255) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    porcentaje_promocion DECIMAL(5,2),
    descuento DECIMAL(10,2),
    CONSTRAINT fk_promociones_tipo FOREIGN KEY (id_tipo_promocion) 
    REFERENCES FIDE_TIPO_PROMOCION_TB(id_tipo_promocion),
    CONSTRAINT fk_promociones_reservacion FOREIGN KEY (id_reservacion) 
    REFERENCES FIDE_RESERVAS_TB(id_reservacion),
    CONSTRAINT fk_promociones_moneda FOREIGN KEY (id_moneda) 
    REFERENCES FIDE_MONEDA_TB(id_moneda),
    CONSTRAINT fk_promociones_estado FOREIGN KEY (id_estado) 
    REFERENCES FIDE_ESTADOS_TB(id_estado),
    NOMBRE VARCHAR2(100),
    CREADO_POR VARCHAR2(100),
    FECHA_CREACION SYSTIMESTAMP,
    MODIFICADO_POR VARCHAR2(100),
    FECHA_MODIFICACION SYSTIMESTAMP,
    ACCION VARCHAR2(100)
);

CREATE TABLE FIDE_IMPUESTOS_TB (
    id_impuesto INT PRIMARY KEY,
    id_pais INT NOT NULL,
    id_estado INT NOT NULL,
    nombre_impuesto VARCHAR2(100) NOT NULL,
    porcentaje DECIMAL(5,2) NOT NULL,
    CONSTRAINT fk_impuestos_pais FOREIGN KEY (id_pais) 
    REFERENCES FIDE_PAIS_TB(id_pais),
    CONSTRAINT fk_impuestos_estado FOREIGN KEY (id_estado) 
    REFERENCES FIDE_ESTADOS_TB(id_estado),
    NOMBRE VARCHAR2(100),
    CREADO_POR VARCHAR2(100),
    FECHA_CREACION SYSTIMESTAMP,
    MODIFICADO_POR VARCHAR2(100),
    FECHA_MODIFICACION SYSTIMESTAMP,
    ACCION VARCHAR2(100)
);

CREATE TABLE FIDE_FACTURAS_TB (
    id_factura INT PRIMARY KEY,
    id_moneda INT NOT NULL,
    id_usuario INT NOT NULL,
    id_impuesto INT NOT NULL,
    id_promocion INT,
    id_estado INT NOT NULL,
    subtotal DECIMAL(20,2) NOT NULL,
    total DECIMAL(20,2) NOT NULL,
    CONSTRAINT fk_facturas_moneda FOREIGN KEY (id_moneda) 
    REFERENCES FIDE_MONEDA_TB(id_moneda),
    CONSTRAINT fk_facturas_usuario FOREIGN KEY (id_usuario) 
    REFERENCES FIDE_USUARIOS_TB(id_usuario),
    CONSTRAINT fk_facturas_impuesto FOREIGN KEY (id_impuesto) 
    REFERENCES FIDE_IMPUESTOS_TB(id_impuesto),
    CONSTRAINT fk_facturas_promocion FOREIGN KEY (id_promocion) 
    REFERENCES FIDE_PROMOCIONES_TB(id_promocion),
    CONSTRAINT fk_facturas_estado FOREIGN KEY (id_estado) 
    REFERENCES FIDE_ESTADOS_TB(id_estado),
    NOMBRE VARCHAR2(100),
    CREADO_POR VARCHAR2(100),
    FECHA_CREACION SYSTIMESTAMP,
    MODIFICADO_POR VARCHAR2(100),
    FECHA_MODIFICACION SYSTIMESTAMP,
    ACCION VARCHAR2(100)
);

CREATE TABLE FIDE_DETALLE_FACTURA_TB (
    id_detalle_factura INT PRIMARY KEY,
    id_factura INT NOT NULL,
    id_reservacion INT NOT NULL,
    id_promocion INT,
    id_moneda INT NOT NULL,
    id_estado INT NOT NULL,
    cantidad VARCHAR2(100) NOT NULL,
    total_linea DECIMAL(20,2) NOT NULL,
    CONSTRAINT fk_detalle_factura FOREIGN KEY (id_factura) 
    REFERENCES FIDE_FACTURAS_TB(id_factura),
    CONSTRAINT fk_detalle_reservacion FOREIGN KEY (id_reservacion) 
    REFERENCES FIDE_RESERVAS_TB(id_reservacion),
    CONSTRAINT fk_detalle_promocion FOREIGN KEY (id_promocion) 
    REFERENCES FIDE_PROMOCIONES_TB(id_promocion),
    CONSTRAINT fk_detalle_moneda FOREIGN KEY (id_moneda) 
    REFERENCES FIDE_MONEDA_TB(id_moneda),
    CONSTRAINT fk_detalle_estado FOREIGN KEY (id_estado) 
    REFERENCES FIDE_ESTADOS_TB(id_estado),
    NOMBRE VARCHAR2(100),
    CREADO_POR VARCHAR2(100),
    FECHA_CREACION SYSTIMESTAMP,
    MODIFICADO_POR VARCHAR2(100),
    FECHA_MODIFICACION SYSTIMESTAMP,
    ACCION VARCHAR2(100)
);

CREATE TABLE FIDE_RESERVAS_FACTURA_TB (
    id_factura INT NOT NULL,
    id_reservacion INT NOT NULL,
    PRIMARY KEY (id_factura, id_reservacion),
    CONSTRAINT fk_res_fact_factura FOREIGN KEY (id_factura) 
    REFERENCES FIDE_FACTURAS_TB(id_factura),
    CONSTRAINT fk_res_fact_reservacion FOREIGN KEY (id_reservacion) 
    REFERENCES FIDE_RESERVAS_TB(id_reservacion),
    NOMBRE VARCHAR2(100),
    CREADO_POR VARCHAR2(100),
    FECHA_CREACION SYSTIMESTAMP,
    MODIFICADO_POR VARCHAR2(100),
    FECHA_MODIFICACION SYSTIMESTAMP,
    ACCION VARCHAR2(100),
    id_estado INT NOT NULL,
    CONSTRAINT fk_res_fact_estado FOREIGN KEY (id_estado) 
    REFERENCES FIDE_ESTADOS_TB(id_estado)
);

CREATE TABLE FIDE_TIPO_CAMBIO_TB (
    id_tipo_cambio INT PRIMARY KEY,
    id_moneda INT NOT NULL,
    fecha DATE NOT NULL,
    tasa_cambio DECIMAL(20,2) NOT NULL,
    CONSTRAINT fk_tipo_cambio_moneda FOREIGN KEY (id_moneda) 
    REFERENCES FIDE_MONEDA_TB(id_moneda),
    NOMBRE VARCHAR2(100),
    CREADO_POR VARCHAR2(100),
    FECHA_CREACION SYSTIMESTAMP,
    MODIFICADO_POR VARCHAR2(100),
    FECHA_MODIFICACION SYSTIMESTAMP,
    ACCION VARCHAR2(100),
    id_estado INT NOT NULL,
    CONSTRAINT fk_tipo_cambio_estado FOREIGN KEY (id_estado) 
    REFERENCES FIDE_ESTADOS_TB(id_estado)
);

CREATE TABLE FIDE_MANTENIMIENTO_TB (
    id_mantenimiento INT PRIMARY KEY,
    id_habitacion INT NOT NULL,
    id_estado INT NOT NULL,
    id_tipo_mantenimiento INT NOT NULL,
    fecha_mantenimiento DATE NOT NULL,
    CONSTRAINT fk_mantenimiento_habitacion FOREIGN KEY (id_habitacion) 
    REFERENCES FIDE_HABITACIONES_TB(id_habitacion),
    CONSTRAINT fk_mantenimiento_estado FOREIGN KEY (id_estado) 
    REFERENCES FIDE_ESTADOS_TB(id_estado),
    CONSTRAINT fk_mantenimiento_tipo FOREIGN KEY (id_tipo_mantenimiento) 
    REFERENCES FIDE_TIPO_MANTENIMIENTO_TB(id_tipo_mantenimiento),
    NOMBRE VARCHAR2(100),
    CREADO_POR VARCHAR2(100),
    FECHA_CREACION SYSTIMESTAMP,
    MODIFICADO_POR VARCHAR2(100),
    FECHA_MODIFICACION SYSTIMESTAMP,
    ACCION VARCHAR2(100)
);

CREATE TABLE FIDE_LIMPIEZA_HABITACIONES_TB (
    id_limpieza INT PRIMARY KEY,
    id_habitacion INT NOT NULL,
    id_usuario INT NOT NULL,
    id_estado INT NOT NULL,
    fecha_limpieza DATE NOT NULL,
    comentarios VARCHAR2(250) NOT NULL,
    CONSTRAINT fk_limpieza_habitacion FOREIGN KEY (id_habitacion) 
    REFERENCES FIDE_HABITACIONES_TB(id_habitacion),
    CONSTRAINT fk_limpieza_usuario FOREIGN KEY (id_usuario) 
    REFERENCES FIDE_USUARIOS_TB(id_usuario),
    CONSTRAINT fk_limpieza_estado FOREIGN KEY (id_estado) 
    REFERENCES FIDE_ESTADOS_TB(id_estado),
    NOMBRE VARCHAR2(100),
    CREADO_POR VARCHAR2(100),
    FECHA_CREACION SYSTIMESTAMP,
    MODIFICADO_POR VARCHAR2(100),
    FECHA_MODIFICACION SYSTIMESTAMP,
    ACCION VARCHAR2(100)
);

/

-- Procedimientos almacenados

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

/


--Vistas

CREATE OR REPLACE VIEW V_FIDE_ESTADOS AS
SELECT id_estado, nombre_estado, descripcion, notas
FROM FIDE_ESTADOS_TB;

CREATE OR REPLACE VIEW V_FIDE_UBICACION AS
SELECT 
    p.id_pais, p.nombre_pais, 
    pr.id_provincia, pr.nombre_provincia, 
    c.id_canton, c.nombre_canton, 
    d.id_distrito, d.nombre_distrito
FROM FIDE_PAIS_TB p, FIDE_PROVINCIA_TB pr, FIDE_CANTON_TB c, FIDE_DISTRITO_TB d
WHERE p.id_pais = pr.id_pais
  AND pr.id_provincia = c.id_provincia
  AND c.id_canton = d.id_canton;

CREATE OR REPLACE VIEW V_FIDE_USUARIOS AS
SELECT 
    u.id_usuario, u.nombre, u.apellidos, u.cedula, u.telefono, u.correo, u.fecha_nacimiento,
    r.nombre_rol, e.nombre_estado,
    p.nombre_pais, pr.nombre_provincia, c.nombre_canton, d.nombre_distrito
FROM FIDE_USUARIOS_TB u, FIDE_ROLES_TB r, FIDE_ESTADOS_TB e, FIDE_PAIS_TB p, FIDE_PROVINCIA_TB pr, FIDE_CANTON_TB c, FIDE_DISTRITO_TB d
WHERE u.id_rol = r.id_rol
  AND u.id_estado = e.id_estado
  AND u.id_pais = p.id_pais
  AND u.id_provincia = pr.id_provincia
  AND u.id_canton = c.id_canton
  AND u.id_distrito = d.id_distrito;

CREATE OR REPLACE VIEW V_FIDE_HOTELES AS
SELECT 
    h.id_hotel, h.nombre_hotel, h.telefono,
    p.nombre_pais, pr.nombre_provincia, c.nombre_canton, d.nombre_distrito,
    e.nombre_estado
FROM FIDE_HOTELES_TB h, FIDE_PAIS_TB p, FIDE_PROVINCIA_TB pr, FIDE_CANTON_TB c, FIDE_DISTRITO_TB d, FIDE_ESTADOS_TB e
WHERE h.id_pais = p.id_pais
  AND h.id_provincia = pr.id_provincia
  AND h.id_canton = c.id_canton
  AND h.id_distrito = d.id_distrito
  AND h.id_estado = e.id_estado;

CREATE OR REPLACE VIEW V_FIDE_HABITACIONES AS
SELECT 
    hab.id_habitacion, hab.numero_habitacion, hab.tipo_habitacion, hab.precio_por_noche,
    hab.capacidad_personas, hab.estado,
    h.nombre_hotel,
    m.nombre_moneda, e.nombre_estado
FROM FIDE_HABITACIONES_TB hab, FIDE_HOTELES_TB h, FIDE_MONEDA_TB m, FIDE_ESTADOS_TB e
WHERE hab.id_hotel = h.id_hotel
  AND hab.id_moneda = m.id_moneda
  AND hab.id_estado = e.id_estado;

CREATE OR REPLACE VIEW V_FIDE_RESERVAS AS
SELECT 
    r.id_reservacion, r.nombre, r.descripcion, r.fecha_inicio, r.fecha_cierre, r.precio_unitario,
    u.nombre AS nombre_usuario, u.apellidos AS apellidos_usuario, 
    h.nombre_hotel, 
    cat.nombre_categoria, 
    e.nombre_estado
FROM FIDE_RESERVAS_TB r, FIDE_USUARIOS_TB u, FIDE_HOTELES_TB h, FIDE_CATEGORIA_RESERVAS_TB cat, FIDE_ESTADOS_TB e
WHERE r.id_usuario = u.id_usuario
  AND r.id_hotel = h.id_hotel
  AND r.id_categoria = cat.id_categoria
  AND r.id_estado = e.id_estado;

CREATE OR REPLACE VIEW V_FIDE_PROMOCIONES AS
SELECT 
    p.id_promocion, p.nombre_promocion, p.descripcion, p.fecha_inicio, p.fecha_fin,
    r.nombre AS nombre_reserva,
    m.nombre_moneda, e.nombre_estado
FROM FIDE_PROMOCIONES_TB p, FIDE_RESERVAS_TB r, FIDE_MONEDA_TB m, FIDE_ESTADOS_TB e
WHERE p.id_reservacion = r.id_reservacion
  AND p.id_moneda = m.id_moneda
  AND p.id_estado = e.id_estado;

CREATE OR REPLACE VIEW V_FIDE_FACTURAS AS
SELECT 
    f.id_factura, f.subtotal, f.total, f.id_promocion, 
    u.nombre AS nombre_usuario, u.apellidos AS apellidos_usuario, 
    i.nombre_impuesto, 
    e.nombre_estado
FROM FIDE_FACTURAS_TB f, FIDE_USUARIOS_TB u, FIDE_IMPUESTOS_TB i, FIDE_ESTADOS_TB e
WHERE f.id_usuario = u.id_usuario
  AND f.id_impuesto = i.id_impuesto
  AND f.id_estado = e.id_estado;

CREATE OR REPLACE VIEW V_FIDE_LIMPIEZAS_SOLICITADAS AS
SELECT 
    l.id_limpieza, 
    l.id_habitacion, 
    hab.numero_habitacion, 
    l.id_usuario, 
    u.nombre AS nombre_usuario, 
    u.apellidos AS apellidos_usuario, 
    l.fecha_limpieza, 
    l.comentarios
FROM FIDE_LIMPIEZA_HABITACIONES_TB l, 
     FIDE_HABITACIONES_TB hab, 
     FIDE_USUARIOS_TB u
WHERE l.id_habitacion = hab.id_habitacion
  AND l.id_usuario = u.id_usuario
  AND l.id_estado = 3;

CREATE OR REPLACE VIEW V_FIDE_USUARIOS_ACTIVOS AS
SELECT 
    u.id_usuario, 
    u.nombre, 
    u.apellidos, 
    u.cedula, 
    u.telefono, 
    u.correo, 
    u.fecha_nacimiento, 
    r.nombre_rol
FROM FIDE_USUARIOS_TB u, FIDE_ROLES_TB r
WHERE u.id_estado = 1
  AND u.id_rol = r.id_rol;

CREATE OR REPLACE VIEW V_FIDE_RESERVAS_CONFIRMADAS AS
SELECT 
    r.id_reservacion, 
    r.nombre, 
    r.descripcion, 
    r.fecha_inicio, 
    r.fecha_cierre, 
    r.precio_unitario, 
    u.nombre AS nombre_usuario, 
    u.apellidos AS apellidos_usuario, 
    h.nombre_hotel
FROM FIDE_RESERVAS_TB r, FIDE_USUARIOS_TB u, FIDE_HOTELES_TB h
WHERE r.id_estado = 2
  AND r.id_usuario = u.id_usuario
  AND r.id_hotel = h.id_hotel;



-- Secuencias

Create SEQUENCE FIDE_ESTADO_SEQ
START WITH 1
INCREMENT BY 1;

Create SEQUENCE FIDE_PAIS_SEQ
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE FIDE_PROVINCIA_SEQ 
START WITH 1 
INCREMENT BY 1;

CREATE SEQUENCE FIDE_CANTON_SEQ 
START WITH 1 
INCREMENT BY 1;

CREATE SEQUENCE FIDE_DISTRITO_SEQ 
START WITH 1 
INCREMENT BY 1;

CREATE SEQUENCE FIDE_DIRECCION_SEQ 
START WITH 1 
INCREMENT BY 1;

CREATE SEQUENCE FIDE_NACIONALIDAD_SEQ 
START WITH 1 
INCREMENT BY 1;

CREATE SEQUENCE FIDE_ROLES_SEQ 
START WITH 1 
INCREMENT BY 1;

CREATE SEQUENCE FIDE_USUARIOS_SEQ 
START WITH 1 
INCREMENT BY 1;

CREATE SEQUENCE FIDE_ESTADOS_SEQ 
START WITH 1 
INCREMENT BY 1;

CREATE SEQUENCE FIDE_HOTELES_SEQ 
START WITH 1 
INCREMENT BY 1;

CREATE SEQUENCE FIDE_HABITACIONES_SEQ 
START WITH 1 
INCREMENT BY 1;

CREATE SEQUENCE FIDE_MANTENIMIENTO_SEQ 
START WITH 1 
INCREMENT BY 1;

CREATE SEQUENCE FIDE_TIPO_MANTENIMIENTO_SEQ 
START WITH 1 
INCREMENT BY 1;

CREATE SEQUENCE FIDE_LIMPIEZA_SEQ 
START WITH 1 
INCREMENT BY 1;

CREATE SEQUENCE FIDE_MONEDA_SEQ 
START WITH 1 
INCREMENT BY 1;

CREATE SEQUENCE FIDE_TIPO_CAMBIO_SEQ 
START WITH 1 
INCREMENT BY 1;

CREATE SEQUENCE FIDE_CATEGORIA_RESERVAS_SEQ 
START WITH 1 
INCREMENT BY 1;

CREATE SEQUENCE FIDE_RESERVAS_SEQ 
START WITH 1 
INCREMENT BY 1;

CREATE SEQUENCE FIDE_VALORACION_SEQ 
START WITH 1 
INCREMENT BY 1;

CREATE SEQUENCE FIDE_PROMOCIONES_SEQ 
START WITH 1 
INCREMENT BY 1;

CREATE SEQUENCE FIDE_TIPO_PROMOCION_SEQ 
START WITH 1 
INCREMENT BY 1;

CREATE SEQUENCE FIDE_IMPUESTOS_SEQ 
START WITH 1 
INCREMENT BY 1;

CREATE SEQUENCE FIDE_FACTURAS_SEQ 
START WITH 1 
INCREMENT BY 1;

CREATE SEQUENCE FIDE_DETALLE_FACTURA_SEQ 
START WITH 1 
INCREMENT BY 1;
///////////////////////////////////////////////////////


--Triggers

CREATE OR REPLACE TRIGGER FIDE_ESTADO_ID_TRG
BEFORE INSERT ON FIDE_ESTADOS_TB
FOR EACH ROW
BEGIN
:NEW.id_estado:=FIDE_ESTADO_SEQ.NEXTVAL;
END;

/

CREATE OR REPLACE TRIGGER FIDE_PAIS_ID_TRG
BEFORE INSERT ON FIDE_PAIS_TB
FOR EACH ROW
BEGIN
:NEW.id_pais:=FIDE_PAIS_SEQ.NEXTVAL;
END;

/

CREATE OR REPLACE TRIGGER FIDE_PROVINCIA_ID_TRG
BEFORE INSERT ON FIDE_PROVINCIA_TB
FOR EACH ROW
BEGIN
    :NEW.id_provincia := FIDE_PROVINCIA_SEQ.NEXTVAL;
END;

/

CREATE OR REPLACE TRIGGER FIDE_CANTON_ID_TRG
BEFORE INSERT ON FIDE_CANTON_TB
FOR EACH ROW
BEGIN
    :NEW.id_canton := FIDE_CANTON_SEQ.NEXTVAL;
END;

/

CREATE OR REPLACE TRIGGER FIDE_DISTRITO_ID_TRG
BEFORE INSERT ON FIDE_DISTRITO_TB
FOR EACH ROW
BEGIN
    :NEW.id_distrito := FIDE_DISTRITO_SEQ.NEXTVAL;
END;

/

CREATE OR REPLACE TRIGGER FIDE_DIRECCION_ID_TRG
BEFORE INSERT ON FIDE_DIRECCION_TB
FOR EACH ROW
BEGIN
    :NEW.id_direccion := FIDE_DIRECCION_SEQ.NEXTVAL;
END;

/

CREATE OR REPLACE TRIGGER FIDE_NACIONALIDAD_ID_TRG
BEFORE INSERT ON FIDE_NACIONALIDAD_TB
FOR EACH ROW
BEGIN
    :NEW.ID_Nacionalidad := FIDE_NACIONALIDAD_SEQ.NEXTVAL;
END;

/

CREATE OR REPLACE TRIGGER FIDE_ROLES_ID_TRG
BEFORE INSERT ON FIDE_ROLES_TB
FOR EACH ROW
BEGIN
    :NEW.id_rol := FIDE_ROLES_SEQ.NEXTVAL;
END;

/

CREATE OR REPLACE TRIGGER FIDE_USUARIOS_ID_TRG
BEFORE INSERT ON FIDE_USUARIOS_TB
FOR EACH ROW
BEGIN
    :NEW.id_usuario := FIDE_USUARIOS_SEQ.NEXTVAL;
END;

/

CREATE OR REPLACE TRIGGER FIDE_ESTADOS_ID_TRG
BEFORE INSERT ON FIDE_ESTADOS_TB
FOR EACH ROW
BEGIN
    :NEW.id_estado := FIDE_ESTADOS_SEQ.NEXTVAL;
END;

/

CREATE OR REPLACE TRIGGER FIDE_HOTELES_ID_TRG
BEFORE INSERT ON FIDE_HOTELES_TB
FOR EACH ROW
BEGIN
    :NEW.id_hotel := FIDE_HOTELES_SEQ.NEXTVAL;
END;

/

CREATE OR REPLACE TRIGGER FIDE_HABITACIONES_ID_TRG
BEFORE INSERT ON FIDE_HABITACIONES_TB
FOR EACH ROW
BEGIN
    :NEW.id_habitacion := FIDE_HABITACIONES_SEQ.NEXTVAL;
END;

/

CREATE OR REPLACE TRIGGER FIDE_MANTENIMIENTO_ID_TRG
BEFORE INSERT ON FIDE_MANTENIMIENTO_TB
FOR EACH ROW
BEGIN
    :NEW.id_mantenimiento := FIDE_MANTENIMIENTO_SEQ.NEXTVAL;
END;

/

CREATE OR REPLACE TRIGGER FIDE_TIPO_MANT_ID_TRG
BEFORE INSERT ON FIDE_TIPO_MANTENIMIENTO_TB
FOR EACH ROW
BEGIN
    :NEW.id_tipo_mantenimiento := FIDE_TIPO_MANTENIMIENTO_SEQ.NEXTVAL;
END;

/

CREATE OR REPLACE TRIGGER FIDE_LIMPIEZA_ID_TRG
BEFORE INSERT ON FIDE_LIMPIEZA_HABITACIONES_TB
FOR EACH ROW
BEGIN
    :NEW.id_limpieza := FIDE_LIMPIEZA_SEQ.NEXTVAL;
END;

/

CREATE OR REPLACE TRIGGER FIDE_MONEDA_ID_TRG
BEFORE INSERT ON FIDE_MONEDA_TB
FOR EACH ROW
BEGIN
    :NEW.id_moneda := FIDE_MONEDA_SEQ.NEXTVAL;
END;

/

CREATE OR REPLACE TRIGGER FIDE_TIPO_CAMBIO_ID_TRG
BEFORE INSERT ON FIDE_TIPO_CAMBIO_TB
FOR EACH ROW
BEGIN
    :NEW.id_tipo_cambio := FIDE_TIPO_CAMBIO_SEQ.NEXTVAL;
END;

/

CREATE OR REPLACE TRIGGER FIDE_CAT_RESERVAS_ID_TRG
BEFORE INSERT ON FIDE_CATEGORIA_RESERVAS_TB
FOR EACH ROW
BEGIN
    :NEW.id_categoria := FIDE_CATEGORIA_RESERVAS_SEQ.NEXTVAL;
END;

/

CREATE OR REPLACE TRIGGER FIDE_RESERVAS_ID_TRG
BEFORE INSERT ON FIDE_RESERVAS_TB
FOR EACH ROW
BEGIN
    :NEW.id_reservacion := FIDE_RESERVAS_SEQ.NEXTVAL;
END;

/

CREATE OR REPLACE TRIGGER FIDE_VALORACION_ID_TRG
BEFORE INSERT ON FIDE_VALORACION_TB
FOR EACH ROW
BEGIN
    :NEW.id_valoracion := FIDE_VALORACION_SEQ.NEXTVAL;
END;

/

CREATE OR REPLACE TRIGGER FIDE_PROMOCIONES_ID_TRG
BEFORE INSERT ON FIDE_PROMOCIONES_TB
FOR EACH ROW
BEGIN
    :NEW.id_promocion := FIDE_PROMOCIONES_SEQ.NEXTVAL;
END;

/

CREATE OR REPLACE TRIGGER FIDE_TIPO_PROMO_ID_TRG
BEFORE INSERT ON FIDE_TIPO_PROMOCION_TB
FOR EACH ROW
BEGIN
    :NEW.id_tipo_promocion := FIDE_TIPO_PROMOCION_SEQ.NEXTVAL;
END;

/

CREATE OR REPLACE TRIGGER FIDE_IMPUESTOS_ID_TRG
BEFORE INSERT ON FIDE_IMPUESTOS_TB
FOR EACH ROW
BEGIN
    :NEW.id_impuesto := FIDE_IMPUESTOS_SEQ.NEXTVAL;
END;

/

CREATE OR REPLACE TRIGGER FIDE_FACTURAS_ID_TRG
BEFORE INSERT ON FIDE_FACTURAS_TB
FOR EACH ROW
BEGIN
    :NEW.id_factura := FIDE_FACTURAS_SEQ.NEXTVAL;
END;

/

CREATE OR REPLACE TRIGGER FIDE_DET_FACTURA_ID_TRG
BEFORE INSERT ON FIDE_DETALLE_FACTURA_TB
FOR EACH ROW
BEGIN
    :NEW.id_detalle_factura := FIDE_DETALLE_FACTURA_SEQ.NEXTVAL;
END;

/





-- Triggers Auditoria




Create or Replace trigger FIDE_ESTADOS_CREADO_MODIFICADO_POR_TRG
BEFORE INSERT OR UPDATE ON FIDE_ESTADOS_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.CREADO_POR:=USER;
ELSE
:NEW.MODIFICADO_POR:=USER;
END IF;
END;

/

Create or Replace trigger FIDE_ESTADOS_FECHA_CREADO_MODIFICADO_POR_TRG
BEFORE INSERT OR UPDATE ON FIDE_ESTADOS_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.FECHA_CREACION:=SYSTIMESTAMP;
ELSE
:NEW.FECHA_MODIFICACION:=SYSTIMESTAMP;
END IF;
END;

/

Create or Replace TRIGGER FIDE_ESTADOS_ACCION_TRG
BEFORE INSERT OR UPDATE ON FIDE_ESTADOS_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.ACCION:='INSERT';
ELSIF UPDATING THEN
:NEW.ACCION:='UPDATE';
END IF;
END;

/

Create or Replace trigger FIDE_PAIS_CREADO_MODIFICADO_POR_TRG
BEFORE INSERT OR UPDATE ON FIDE_PAIS_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.CREADO_POR:=USER;
ELSE
:NEW.MODIFICADO_POR:=USER;
END IF;
END;

/

Create or Replace trigger FIDE_PAIS_FECHA_CREADO_MODIFICADO_POR_TRG
BEFORE INSERT OR UPDATE ON FIDE_PAIS_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.FECHA_CREACION:=SYSTIMESTAMP;
ELSE
:NEW.FECHA_MODIFICACION:=SYSTIMESTAMP;
END IF;
END;

/

Create or Replace TRIGGER FIDE_PAIS_ACCION_TRG
BEFORE INSERT OR UPDATE ON FIDE_PAIS_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.ACCION:='INSERT';
ELSIF UPDATING THEN
:NEW.ACCION:='UPDATE';
END IF;
END;

/

Create or Replace trigger FIDE_PROVINCIA_CREADO_MODIFICADO_POR_TRG
BEFORE INSERT OR UPDATE ON FIDE_PROVINCIA_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.CREADO_POR:=USER;
ELSE
:NEW.MODIFICADO_POR:=USER;
END IF;
END;

/

Create or Replace trigger FIDE_PROVINCIA_FECHA_CREADO_MODIFICADO_POR_TRG
BEFORE INSERT OR UPDATE ON FIDE_PROVINCIA_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.FECHA_CREACION:=SYSTIMESTAMP;
ELSE
:NEW.FECHA_MODIFICACION:=SYSTIMESTAMP;
END IF;
END;

/

Create or Replace TRIGGER FIDE_PROVINCIA_ACCION_TRG
BEFORE INSERT OR UPDATE ON FIDE_PROVINCIA_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.ACCION:='INSERT';
ELSIF UPDATING THEN
:NEW.ACCION:='UPDATE';
END IF;
END;

/

Create or Replace trigger FIDE_CANTON_CREADO_MODIFICADO_POR_TRG
BEFORE INSERT OR UPDATE ON FIDE_CANTON_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.CREADO_POR:=USER;
ELSE
:NEW.MODIFICADO_POR:=USER;
END IF;
END;

/

Create or Replace trigger FIDE_CANTON_FECHA_CREADO_MODIFICADO_POR_TRG
BEFORE INSERT OR UPDATE ON FIDE_CANTON_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.FECHA_CREACION:=SYSTIMESTAMP;
ELSE
:NEW.FECHA_MODIFICACION:=SYSTIMESTAMP;
END IF;
END;

/

Create or Replace TRIGGER FIDE_CANTON_ACCION_TRG
BEFORE INSERT OR UPDATE ON FIDE_CANTON_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.ACCION:='INSERT';
ELSIF UPDATING THEN
:NEW.ACCION:='UPDATE';
END IF;
END;

/

Create or Replace trigger FIDE_DISTRITO_CREADO_MODIFICADO_POR_TRG
BEFORE INSERT OR UPDATE ON FIDE_DISTRITO_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.CREADO_POR:=USER;
ELSE
:NEW.MODIFICADO_POR:=USER;
END IF;
END;

/

Create or Replace trigger FIDE_DISTRITO_FECHA_CREADO_MODIFICADO_POR_TRG
BEFORE INSERT OR UPDATE ON FIDE_DISTRITO_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.FECHA_CREACION:=SYSTIMESTAMP;
ELSE
:NEW.FECHA_MODIFICACION:=SYSTIMESTAMP;
END IF;
END;

/

Create or Replace TRIGGER FIDE_DISTRITO_ACCION_TRG
BEFORE INSERT OR UPDATE ON FIDE_DISTRITO_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.ACCION:='INSERT';
ELSIF UPDATING THEN
:NEW.ACCION:='UPDATE';
END IF;
END;

/

Create or Replace trigger FIDE_DIRECCION_CREADO_MODIFICADO_POR_TRG
BEFORE INSERT OR UPDATE ON FIDE_DIRECCION_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.CREADO_POR:=USER;
ELSE
:NEW.MODIFICADO_POR:=USER;
END IF;
END;

/

Create or Replace trigger FIDE_DIRECCION_FECHA_CREADO_MODIFICADO_POR_TRG
BEFORE INSERT OR UPDATE ON FIDE_DIRECCION_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.FECHA_CREACION:=SYSTIMESTAMP;
ELSE
:NEW.FECHA_MODIFICACION:=SYSTIMESTAMP;
END IF;
END;

/

Create or Replace TRIGGER FIDE_DIRECCION_ACCION_TRG
BEFORE INSERT OR UPDATE ON FIDE_DIRECCION_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.ACCION:='INSERT';
ELSIF UPDATING THEN
:NEW.ACCION:='UPDATE';
END IF;
END;

/

Create or Replace trigger FIDE_NACIONALIDAD_CREADO_MODIFICADO_POR_TRG
BEFORE INSERT OR UPDATE ON FIDE_NACIONALIDAD_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.CREADO_POR:=USER;
ELSE
:NEW.MODIFICADO_POR:=USER;
END IF;
END;

/

Create or Replace trigger FIDE_NACIONALIDAD_FECHA_CREADO_MODIFICADO_POR_TRG
BEFORE INSERT OR UPDATE ON FIDE_NACIONALIDAD_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.FECHA_CREACION:=SYSTIMESTAMP;
ELSE
:NEW.FECHA_MODIFICACION:=SYSTIMESTAMP;
END IF;
END;

/

Create or Replace TRIGGER FIDE_NACIONALIDAD_ACCION_TRG
BEFORE INSERT OR UPDATE ON FIDE_NACIONALIDAD_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.ACCION:='INSERT';
ELSIF UPDATING THEN
:NEW.ACCION:='UPDATE';
END IF;
END;

/

Create or Replace trigger FIDE_ROLES_CREADO_MODIFICADO_POR_TRG
BEFORE INSERT OR UPDATE ON FIDE_ROLES_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.CREADO_POR:=USER;
ELSE
:NEW.MODIFICADO_POR:=USER;
END IF;
END;

/

Create or Replace trigger FIDE_ROLES_FECHA_CREADO_MODIFICADO_POR_TRG
BEFORE INSERT OR UPDATE ON FIDE_ROLES_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.FECHA_CREACION:=SYSTIMESTAMP;
ELSE
:NEW.FECHA_MODIFICACION:=SYSTIMESTAMP;
END IF;
END;

/

Create or Replace TRIGGER FIDE_ROLES_ACCION_TRG
BEFORE INSERT OR UPDATE ON FIDE_ROLES_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.ACCION:='INSERT';
ELSIF UPDATING THEN
:NEW.ACCION:='UPDATE';
END IF;
END;

/

Create or Replace trigger FIDE_MONEDA_CREADO_MODIFICADO_POR_TRG
BEFORE INSERT OR UPDATE ON FIDE_MONEDA_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.CREADO_POR:=USER;
ELSE
:NEW.MODIFICADO_POR:=USER;
END IF;
END;

/

Create or Replace trigger FIDE_MONEDA_FECHA_CREADO_MODIFICADO_POR_TRG
BEFORE INSERT OR UPDATE ON FIDE_MONEDA_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.FECHA_CREACION:=SYSTIMESTAMP;
ELSE
:NEW.FECHA_MODIFICACION:=SYSTIMESTAMP;
END IF;
END;

/

Create or Replace TRIGGER FIDE_MONEDA_ACCION_TRG
BEFORE INSERT OR UPDATE ON FIDE_MONEDA_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.ACCION:='INSERT';
ELSIF UPDATING THEN
:NEW.ACCION:='UPDATE';
END IF;
END;

/

Create or Replace trigger FIDE_TIPO_MANTENIMIENTO_CREADO_MODIFICADO_POR_TRG
BEFORE INSERT OR UPDATE ON FIDE_TIPO_MANTENIMIENTO_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.CREADO_POR:=USER;
ELSE
:NEW.MODIFICADO_POR:=USER;
END IF;
END;

/

Create or Replace trigger FIDE_TIPO_MANTENIMIENTO_FECHA_CREADO_MODIFICADO_POR_TRG
BEFORE INSERT OR UPDATE ON FIDE_TIPO_MANTENIMIENTO_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.FECHA_CREACION:=SYSTIMESTAMP;
ELSE
:NEW.FECHA_MODIFICACION:=SYSTIMESTAMP;
END IF;
END;

/

Create or Replace TRIGGER FIDE_TIPO_MANTENIMIENTO_ACCION_TRG
BEFORE INSERT OR UPDATE ON FIDE_TIPO_MANTENIMIENTO_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.ACCION:='INSERT';
ELSIF UPDATING THEN
:NEW.ACCION:='UPDATE';
END IF;
END;

/

Create or Replace trigger FIDE_TIPO_PROMOCION_CREADO_MODIFICADO_POR_TRG
BEFORE INSERT OR UPDATE ON FIDE_TIPO_PROMOCION_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.CREADO_POR:=USER;
ELSE
:NEW.MODIFICADO_POR:=USER;
END IF;
END;

/

Create or Replace trigger FIDE_TIPO_PROMOCION_FECHA_CREADO_MODIFICADO_POR_TRG
BEFORE INSERT OR UPDATE ON FIDE_TIPO_PROMOCION_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.FECHA_CREACION:=SYSTIMESTAMP;
ELSE
:NEW.FECHA_MODIFICACION:=SYSTIMESTAMP;
END IF;
END;

/

Create or Replace TRIGGER FIDE_TIPO_PROMOCION_ACCION_TRG
BEFORE INSERT OR UPDATE ON FIDE_TIPO_PROMOCION_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.ACCION:='INSERT';
ELSIF UPDATING THEN
:NEW.ACCION:='UPDATE';
END IF;
END;

/

Create or Replace trigger FIDE_USUARIOS_CREADO_MODIFICADO_POR_TRG
BEFORE INSERT OR UPDATE ON FIDE_USUARIOS_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.CREADO_POR:=USER;
ELSE
:NEW.MODIFICADO_POR:=USER;
END IF;
END;

/

Create or Replace trigger FIDE_USUARIOS_FECHA_CREADO_MODIFICADO_POR_TRG
BEFORE INSERT OR UPDATE ON FIDE_USUARIOS_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.FECHA_CREACION:=SYSTIMESTAMP;
ELSE
:NEW.FECHA_MODIFICACION:=SYSTIMESTAMP;
END IF;
END;

/

Create or Replace TRIGGER FIDE_USUARIOS_ACCION_TRG
BEFORE INSERT OR UPDATE ON FIDE_USUARIOS_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.ACCION:='INSERT';
ELSIF UPDATING THEN
:NEW.ACCION:='UPDATE';
END IF;
END;

/

Create or Replace trigger FIDE_HOTELES_CREADO_MODIFICADO_POR_TRG
BEFORE INSERT OR UPDATE ON FIDE_HOTELES_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.CREADO_POR:=USER;
ELSE
:NEW.MODIFICADO_POR:=USER;
END IF;
END;

/

Create or Replace trigger FIDE_HOTELES_FECHA_CREADO_MODIFICADO_POR_TRG
BEFORE INSERT OR UPDATE ON FIDE_HOTELES_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.FECHA_CREACION:=SYSTIMESTAMP;
ELSE
:NEW.FECHA_MODIFICACION:=SYSTIMESTAMP;
END IF;
END;

/

Create or Replace TRIGGER FIDE_HOTELES_ACCION_TRG
BEFORE INSERT OR UPDATE ON FIDE_HOTELES_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.ACCION:='INSERT';
ELSIF UPDATING THEN
:NEW.ACCION:='UPDATE';
END IF;
END;

/

Create or Replace trigger FIDE_HABITACIONES_CREADO_MODIFICADO_POR_TRG
BEFORE INSERT OR UPDATE ON FIDE_HABITACIONES_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.CREADO_POR:=USER;
ELSE
:NEW.MODIFICADO_POR:=USER;
END IF;
END;

/

Create or Replace trigger FIDE_HABITACIONES_FECHA_CREADO_MODIFICADO_POR_TRG
BEFORE INSERT OR UPDATE ON FIDE_HABITACIONES_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.FECHA_CREACION:=SYSTIMESTAMP;
ELSE
:NEW.FECHA_MODIFICACION:=SYSTIMESTAMP;
END IF;
END;

/

Create or Replace TRIGGER FIDE_HABITACIONES_ACCION_TRG
BEFORE INSERT OR UPDATE ON FIDE_HABITACIONES_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.ACCION:='INSERT';
ELSIF UPDATING THEN
:NEW.ACCION:='UPDATE';
END IF;
END;

/

Create or Replace trigger FIDE_VALORACION_CREADO_MODIFICADO_POR_TRG
BEFORE INSERT OR UPDATE ON FIDE_VALORACION_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.CREADO_POR:=USER;
ELSE
:NEW.MODIFICADO_POR:=USER;
END IF;
END;

/

Create or Replace trigger FIDE_VALORACION_FECHA_CREADO_MODIFICADO_POR_TRG
BEFORE INSERT OR UPDATE ON FIDE_VALORACION_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.FECHA_CREACION:=SYSTIMESTAMP;
ELSE
:NEW.FECHA_MODIFICACION:=SYSTIMESTAMP;
END IF;
END;

/

Create or Replace TRIGGER FIDE_VALORACION_ACCION_TRG
BEFORE INSERT OR UPDATE ON FIDE_VALORACION_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.ACCION:='INSERT';
ELSIF UPDATING THEN
:NEW.ACCION:='UPDATE';
END IF;
END;

/

Create or Replace trigger FIDE_CATEGORIA_CREADO_MODIFICADO_POR_TRG
BEFORE INSERT OR UPDATE ON FIDE_CATEGORIA_RESERVAS_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.CREADO_POR:=USER;
ELSE
:NEW.MODIFICADO_POR:=USER;
END IF;
END;

/

Create or Replace trigger FIDE_CATEGORIA_FECHA_CREADO_MODIFICADO_POR_TRG
BEFORE INSERT OR UPDATE ON FIDE_CATEGORIA_RESERVAS_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.FECHA_CREACION:=SYSTIMESTAMP;
ELSE
:NEW.FECHA_MODIFICACION:=SYSTIMESTAMP;
END IF;
END;

/

Create or Replace TRIGGER FIDE_CATEGORIA_ACCION_TRG
BEFORE INSERT OR UPDATE ON FIDE_CATEGORIA_RESERVAS_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.ACCION:='INSERT';
ELSIF UPDATING THEN
:NEW.ACCION:='UPDATE';
END IF;
END;

/

Create or Replace trigger FIDE_RESERVAS_CREADO_MODIFICADO_POR_TRG
BEFORE INSERT OR UPDATE ON FIDE_RESERVAS_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.CREADO_POR:=USER;
ELSE
:NEW.MODIFICADO_POR:=USER;
END IF;
END;

/

Create or Replace trigger FIDE_RESERVAS_FECHA_CREADO_MODIFICADO_POR_TRG
BEFORE INSERT OR UPDATE ON FIDE_RESERVAS_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.FECHA_CREACION:=SYSTIMESTAMP;
ELSE
:NEW.FECHA_MODIFICACION:=SYSTIMESTAMP;
END IF;
END;

/

Create or Replace TRIGGER FIDE_RESERVAS_ACCION_TRG
BEFORE INSERT OR UPDATE ON FIDE_RESERVAS_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.ACCION:='INSERT';
ELSIF UPDATING THEN
:NEW.ACCION:='UPDATE';
END IF;
END;

/

Create or Replace trigger FIDE_PROMOCIONES_CREADO_MODIFICADO_POR_TRG
BEFORE INSERT OR UPDATE ON FIDE_PROMOCIONES_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.CREADO_POR:=USER;
ELSE
:NEW.MODIFICADO_POR:=USER;
END IF;
END;

/

Create or Replace trigger FIDE_PROMOCIONES_FECHA_CREADO_MODIFICADO_POR_TRG
BEFORE INSERT OR UPDATE ON FIDE_PROMOCIONES_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.FECHA_CREACION:=SYSTIMESTAMP;
ELSE
:NEW.FECHA_MODIFICACION:=SYSTIMESTAMP;
END IF;
END;

/

Create or Replace TRIGGER FIDE_PROMOCIONES_ACCION_TRG
BEFORE INSERT OR UPDATE ON FIDE_PROMOCIONES_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.ACCION:='INSERT';
ELSIF UPDATING THEN
:NEW.ACCION:='UPDATE';
END IF;
END;

/

Create or Replace trigger FIDE_IMPUESTOS_CREADO_MODIFICADO_POR_TRG
BEFORE INSERT OR UPDATE ON FIDE_IMPUESTOS_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.CREADO_POR:=USER;
ELSE
:NEW.MODIFICADO_POR:=USER;
END IF;
END;

/

Create or Replace trigger FIDE_IMPUESTOS_FECHA_CREADO_MODIFICADO_POR_TRG
BEFORE INSERT OR UPDATE ON FIDE_IMPUESTOS_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.FECHA_CREACION:=SYSTIMESTAMP;
ELSE
:NEW.FECHA_MODIFICACION:=SYSTIMESTAMP;
END IF;
END;

/

Create or Replace TRIGGER FIDE_IMPUESTOS_ACCION_TRG
BEFORE INSERT OR UPDATE ON FIDE_IMPUESTOS_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.ACCION:='INSERT';
ELSIF UPDATING THEN
:NEW.ACCION:='UPDATE';
END IF;
END;

/

Create or Replace trigger FIDE_FACTURAS_CREADO_MODIFICADO_POR_TRG
BEFORE INSERT OR UPDATE ON FIDE_FACTURAS_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.CREADO_POR:=USER;
ELSE
:NEW.MODIFICADO_POR:=USER;
END IF;
END;

/

Create or Replace trigger FIDE_FACTURAS_FECHA_CREADO_MODIFICADO_POR_TRG
BEFORE INSERT OR UPDATE ON FIDE_FACTURAS_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.FECHA_CREACION:=SYSTIMESTAMP;
ELSE
:NEW.FECHA_MODIFICACION:=SYSTIMESTAMP;
END IF;
END;

/

Create or Replace TRIGGER FIDE_FACTURAS_ACCION_TRG
BEFORE INSERT OR UPDATE ON FIDE_FACTURAS_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.ACCION:='INSERT';
ELSIF UPDATING THEN
:NEW.ACCION:='UPDATE';
END IF;
END;

/

Create or Replace trigger FIDE_DETALLE_FACTURA_CREADO_MODIFICADO_POR_TRG
BEFORE INSERT OR UPDATE ON FIDE_DETALLE_FACTURA_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.CREADO_POR:=USER;
ELSE
:NEW.MODIFICADO_POR:=USER;
END IF;
END;

/

Create or Replace trigger FIDE_DETALLE_FACTURA_FECHA_CREADO_MODIFICADO_POR_TRG
BEFORE INSERT OR UPDATE ON FIDE_DETALLE_FACTURA_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.FECHA_CREACION:=SYSTIMESTAMP;
ELSE
:NEW.FECHA_MODIFICACION:=SYSTIMESTAMP;
END IF;
END;

/

Create or Replace TRIGGER FIDE_DETALLE_FACTURA_ACCION_TRG
BEFORE INSERT OR UPDATE ON FIDE_DETALLE_FACTURA_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.ACCION:='INSERT';
ELSIF UPDATING THEN
:NEW.ACCION:='UPDATE';
END IF;
END;

/

Create or Replace trigger FIDE_RESERVAS_FACTURA_CREADO_MODIFICADO_POR_TRG
BEFORE INSERT OR UPDATE ON FIDE_RESERVAS_FACTURA_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.CREADO_POR:=USER;
ELSE
:NEW.MODIFICADO_POR:=USER;
END IF;
END;

/

Create or Replace trigger FIDE_RESERVAS_FACTURA_FECHA_CREADO_MODIFICADO_POR_TRG
BEFORE INSERT OR UPDATE ON FIDE_RESERVAS_FACTURA_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.FECHA_CREACION:=SYSTIMESTAMP;
ELSE
:NEW.FECHA_MODIFICACION:=SYSTIMESTAMP;
END IF;
END;

/

Create or Replace TRIGGER FIDE_RESERVAS_FACTURA_ACCION_TRG
BEFORE INSERT OR UPDATE ON FIDE_RESERVAS_FACTURA_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.ACCION:='INSERT';
ELSIF UPDATING THEN
:NEW.ACCION:='UPDATE';
END IF;
END;

/

Create or Replace trigger FIDE_TIPO_CAMBIO_CREADO_MODIFICADO_POR_TRG
BEFORE INSERT OR UPDATE ON FIDE_TIPO_CAMBIO_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.CREADO_POR:=USER;
ELSE
:NEW.MODIFICADO_POR:=USER;
END IF;
END;

/

Create or Replace trigger FIDE_TIPO_CAMBIO_FECHA_CREADO_MODIFICADO_POR_TRG
BEFORE INSERT OR UPDATE ON FIDE_TIPO_CAMBIO_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.FECHA_CREACION:=SYSTIMESTAMP;
ELSE
:NEW.FECHA_MODIFICACION:=SYSTIMESTAMP;
END IF;
END;

/

Create or Replace TRIGGER FIDE_TIPO_CAMBIO_ACCION_TRG
BEFORE INSERT OR UPDATE ON FIDE_TIPO_CAMBIO_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.ACCION:='INSERT';
ELSIF UPDATING THEN
:NEW.ACCION:='UPDATE';
END IF;
END;

/

Create or Replace trigger FIDE_MANTENIMIENTO_CREADO_MODIFICADO_POR_TRG
BEFORE INSERT OR UPDATE ON FIDE_MANTENIMIENTO_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.CREADO_POR:=USER;
ELSE
:NEW.MODIFICADO_POR:=USER;
END IF;
END;

/

Create or Replace trigger FIDE_MANTENIMIENTO_FECHA_CREADO_MODIFICADO_POR_TRG
BEFORE INSERT OR UPDATE ON FIDE_MANTENIMIENTO_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.FECHA_CREACION:=SYSTIMESTAMP;
ELSE
:NEW.FECHA_MODIFICACION:=SYSTIMESTAMP;
END IF;
END;

/

Create or Replace TRIGGER FIDE_MANTENIMIENTO_ACCION_TRG
BEFORE INSERT OR UPDATE ON FIDE_MANTENIMIENTO_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.ACCION:='INSERT';
ELSIF UPDATING THEN
:NEW.ACCION:='UPDATE';
END IF;
END;

/

Create or Replace trigger FIDE_LIMPIEZA_HABITACIONES_CREADO_MODIFICADO_POR_TRG
BEFORE INSERT OR UPDATE ON FIDE_LIMPIEZA_HABITACIONES_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.CREADO_POR:=USER;
ELSE
:NEW.MODIFICADO_POR:=USER;
END IF;
END;

/

Create or Replace trigger FIDE_LIMPIEZA_HABITACIONES_FECHA_CREADO_MODIFICADO_POR_TRG
BEFORE INSERT OR UPDATE ON FIDE_LIMPIEZA_HABITACIONES_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.FECHA_CREACION:=SYSTIMESTAMP;
ELSE
:NEW.FECHA_MODIFICACION:=SYSTIMESTAMP;
END IF;
END;

/

Create or Replace TRIGGER FIDE_LIMPIEZA_HABITACIONES_ACCION_TRG
BEFORE INSERT OR UPDATE ON FIDE_LIMPIEZA_HABITACIONES_TB
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.ACCION:='INSERT';
ELSIF UPDATING THEN
:NEW.ACCION:='UPDATE';
END IF;
END;







