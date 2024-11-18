CREATE TABLE FIDE_ESTADOS_TB (
    id_estado INT PRIMARY KEY,
    nombre_estado VARCHAR2(100) NOT NULL,
    descripcion VARCHAR2(1000) NOT NULL,
    notas VARCHAR2(1000)
);

CREATE TABLE FIDE_PAIS_TB (
    id_pais INT PRIMARY KEY,
    nombre_pais VARCHAR2(50) NOT NULL
);

CREATE TABLE FIDE_PROVINCIA_TB (
    id_provincia INT PRIMARY KEY,
    id_pais INT NOT NULL,
    nombre_provincia VARCHAR2(50) NOT NULL,
    CONSTRAINT fk_provincia_pais FOREIGN KEY (id_pais) 
    REFERENCES FIDE_PAIS_TB(id_pais)
);

CREATE TABLE FIDE_CANTON_TB (
    id_canton INT PRIMARY KEY,
    id_provincia INT NOT NULL,
    nombre_canton VARCHAR2(100) NOT NULL,
    CONSTRAINT fk_canton_provincia FOREIGN KEY (id_provincia) 
    REFERENCES FIDE_PROVINCIA_TB(id_provincia)
);

CREATE TABLE FIDE_DISTRITO_TB (
    id_distrito INT PRIMARY KEY,
    id_canton INT NOT NULL,
    nombre_distrito VARCHAR2(100) NOT NULL,
    CONSTRAINT fk_distrito_canton FOREIGN KEY (id_canton) 
    REFERENCES FIDE_CANTON_TB(id_canton)
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
    REFERENCES FIDE_PAIS_TB(id_pais)
);

CREATE TABLE FIDE_NACIONALIDAD_TB (
    ID_Nacionalidad INT PRIMARY KEY,
    Descripcion VARCHAR2(50) NOT NULL
);


CREATE TABLE FIDE_ROLES_TB (
    id_rol INT PRIMARY KEY,
    id_estado INT NOT NULL,
    nombre_rol VARCHAR2(50) NOT NULL,
    descripcion VARCHAR2(500) NOT NULL,
    CONSTRAINT fk_roles_estado FOREIGN KEY (id_estado) 
    REFERENCES FIDE_ESTADOS_TB(id_estado)
);

CREATE TABLE FIDE_MONEDA_TB (
    id_moneda INT PRIMARY KEY,
    codigo_moneda VARCHAR2(3) UNIQUE NOT NULL,
    nombre_moneda VARCHAR2(50) NOT NULL
);

CREATE TABLE FIDE_TIPO_MANTENIMIENTO_TB (
    id_tipo_mantenimiento INT PRIMARY KEY,
    tipo_mantenimiento VARCHAR2(100) NOT NULL
);

CREATE TABLE FIDE_TIPO_PROMOCION_TB (
    id_tipo_promocion INT PRIMARY KEY,
    nombre VARCHAR2(50) NOT NULL,
    descripcion VARCHAR2(255) NOT NULL
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
    contrasena VARCHAR2(100) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
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
    REFERENCES FIDE_ESTADOS_TB(id_estado)
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
    REFERENCES FIDE_ESTADOS_TB(id_estado)
);

CREATE TABLE FIDE_VALORACION_TB (
    id_valoracion INT PRIMARY KEY,
    id_estado INT NOT NULL,
    comentario CLOB NOT NULL,
    valoracion INT NOT NULL,
    timestamp TIMESTAMP NOT NULL,
    CONSTRAINT fk_valoracion_estado FOREIGN KEY (id_estado) 
    REFERENCES FIDE_ESTADOS_TB(id_estado)
);

CREATE TABLE FIDE_CATEGORIA_RESERVAS_TB (
    id_categoria INT PRIMARY KEY,
    id_estado INT NOT NULL,
    nombre_categoria VARCHAR2(100) NOT NULL,
    comentarios VARCHAR2(250) NOT NULL,
    CONSTRAINT fk_categoria_estado FOREIGN KEY (id_estado) 
    REFERENCES FIDE_ESTADOS_TB(id_estado)
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
    REFERENCES FIDE_ESTADOS_TB(id_estado)
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
    REFERENCES FIDE_ESTADOS_TB(id_estado)
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
    REFERENCES FIDE_ESTADOS_TB(id_estado)
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
    REFERENCES FIDE_ESTADOS_TB(id_estado)
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
    REFERENCES FIDE_ESTADOS_TB(id_estado)
);

CREATE TABLE FIDE_RESERVAS_FACTURA_TB (
    id_factura INT NOT NULL,
    id_reservacion INT NOT NULL,
    PRIMARY KEY (id_factura, id_reservacion),
    CONSTRAINT fk_res_fact_factura FOREIGN KEY (id_factura) 
    REFERENCES FIDE_FACTURAS_TB(id_factura),
    CONSTRAINT fk_res_fact_reservacion FOREIGN KEY (id_reservacion) 
    REFERENCES FIDE_RESERVAS_TB(id_reservacion)
);

CREATE TABLE FIDE_TIPO_CAMBIO_TB (
    id_tipo_cambio INT PRIMARY KEY,
    id_moneda INT NOT NULL,
    fecha DATE NOT NULL,
    tasa_cambio DECIMAL(20,2) NOT NULL,
    CONSTRAINT fk_tipo_cambio_moneda FOREIGN KEY (id_moneda) 
    REFERENCES FIDE_MONEDA_TB(id_moneda)
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
    REFERENCES FIDE_TIPO_MANTENIMIENTO_TB(id_tipo_mantenimiento)
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
    REFERENCES FIDE_ESTADOS_TB(id_estado)
);

ALTER TABLE FIDE_CANTON_TB
ADD (
    NOMBRE VARCHAR2(100),
    CREADO_POR VARCHAR2(100),
    FECHA_CREACION TIMESTAMP,
    MODIFICADO_POR VARCHAR2(100),
    FECHA_MODIFICACION TIMESTAMP,
    ACCION VARCHAR2(100),
    ESTADO VARCHAR2(1)
);

ALTER TABLE FIDE_CATEGORIA_RESERVAS_TB
ADD (
    NOMBRE VARCHAR2(100),
    CREADO_POR VARCHAR2(100),
    FECHA_CREACION TIMESTAMP,
    MODIFICADO_POR VARCHAR2(100),
    FECHA_MODIFICACION TIMESTAMP,
    ACCION VARCHAR2(100),
    ESTADO VARCHAR2(1)
);

ALTER TABLE FIDE_DETALLE_FACTURA_TB
ADD (
    NOMBRE VARCHAR2(100),
    CREADO_POR VARCHAR2(100),
    FECHA_CREACION TIMESTAMP,
    MODIFICADO_POR VARCHAR2(100),
    FECHA_MODIFICACION TIMESTAMP,
    ACCION VARCHAR2(100),
    ESTADO VARCHAR2(1)
);

ALTER TABLE FIDE_DIRECCION_TB
ADD (
    NOMBRE VARCHAR2(100),
    CREADO_POR VARCHAR2(100),
    FECHA_CREACION TIMESTAMP,
    MODIFICADO_POR VARCHAR2(100),
    FECHA_MODIFICACION TIMESTAMP,
    ACCION VARCHAR2(100),
    ESTADO VARCHAR2(1)
);
------
ALTER TABLE FIDE_ESTADOS_TB
ADD (
    NOMBRE VARCHAR2(100),
    CREADO_POR VARCHAR2(100),
    FECHA_CREACION TIMESTAMP,
    MODIFICADO_POR VARCHAR2(100),
    FECHA_MODIFICACION TIMESTAMP,
    ACCION VARCHAR2(100),
    ESTADO VARCHAR2(1)
);



ALTER TABLE FIDE_FACTURAS_TB
ADD (
    NOMBRE VARCHAR2(100),
    CREADO_POR VARCHAR2(100),
    FECHA_CREACION TIMESTAMP,
    MODIFICADO_POR VARCHAR2(100),
    FECHA_MODIFICACION TIMESTAMP,
    ACCION VARCHAR2(100),
    ESTADO VARCHAR2(1)
);


ALTER TABLE FIDE_HABITACIONES_TB
ADD (
    NOMBRE VARCHAR2(100),
    CREADO_POR VARCHAR2(100),
    FECHA_CREACION TIMESTAMP,
    MODIFICADO_POR VARCHAR2(100),
    FECHA_MODIFICACION TIMESTAMP,
    ACCION VARCHAR2(100)
    
);


ALTER TABLE FIDE_HOTELES_TB
ADD (
    NOMBRE VARCHAR2(100),
    CREADO_POR VARCHAR2(100),
    FECHA_CREACION TIMESTAMP,
    MODIFICADO_POR VARCHAR2(100),
    FECHA_MODIFICACION TIMESTAMP,
    ACCION VARCHAR2(100),
    ESTADO VARCHAR2(1)
);


ALTER TABLE FIDE_IMPUESTOS_TB
ADD (
    NOMBRE VARCHAR2(100),
    CREADO_POR VARCHAR2(100),
    FECHA_CREACION TIMESTAMP,
    MODIFICADO_POR VARCHAR2(100),
    FECHA_MODIFICACION TIMESTAMP,
    ACCION VARCHAR2(100),
    ESTADO VARCHAR2(1)
);


ALTER TABLE FIDE_LIMPIEZA_HABITACIONES_TB
ADD (
    NOMBRE VARCHAR2(100),
    CREADO_POR VARCHAR2(100),
    FECHA_CREACION TIMESTAMP,
    MODIFICADO_POR VARCHAR2(100),
    FECHA_MODIFICACION TIMESTAMP,
    ACCION VARCHAR2(100),
    ESTADO VARCHAR2(1)
);


ALTER TABLE FIDE_MANTENIMIENTO_TB
ADD (
    NOMBRE VARCHAR2(100),
    CREADO_POR VARCHAR2(100),
    FECHA_CREACION TIMESTAMP,
    MODIFICADO_POR VARCHAR2(100),
    FECHA_MODIFICACION TIMESTAMP,
    ACCION VARCHAR2(100),
    ESTADO VARCHAR2(1)
);


ALTER TABLE FIDE_MONEDA_TB
ADD (
    NOMBRE VARCHAR2(100),
    CREADO_POR VARCHAR2(100),
    FECHA_CREACION TIMESTAMP,
    MODIFICADO_POR VARCHAR2(100),
    FECHA_MODIFICACION TIMESTAMP,
    ACCION VARCHAR2(100),
    ESTADO VARCHAR2(1)
);


ALTER TABLE FIDE_NACIONALIDAD_TB
ADD (
    NOMBRE VARCHAR2(100),
    CREADO_POR VARCHAR2(100),
    FECHA_CREACION TIMESTAMP,
    MODIFICADO_POR VARCHAR2(100),
    FECHA_MODIFICACION TIMESTAMP,
    ACCION VARCHAR2(100),
    ESTADO VARCHAR2(1)
);


ALTER TABLE FIDE_PAIS_TB
ADD (
    NOMBRE VARCHAR2(100),
    CREADO_POR VARCHAR2(100),
    FECHA_CREACION TIMESTAMP,
    MODIFICADO_POR VARCHAR2(100),
    FECHA_MODIFICACION TIMESTAMP,
    ACCION VARCHAR2(100),
    ESTADO VARCHAR2(1)
);


ALTER TABLE FIDE_PROMOCIONES_TB
ADD (
    NOMBRE VARCHAR2(100),
    CREADO_POR VARCHAR2(100),
    FECHA_CREACION TIMESTAMP,
    MODIFICADO_POR VARCHAR2(100),
    FECHA_MODIFICACION TIMESTAMP,
    ACCION VARCHAR2(100),
    ESTADO VARCHAR2(1)
);


ALTER TABLE FIDE_PROVINCIA_TB
ADD (
    NOMBRE VARCHAR2(100),
    CREADO_POR VARCHAR2(100),
    FECHA_CREACION TIMESTAMP,
    MODIFICADO_POR VARCHAR2(100),
    FECHA_MODIFICACION TIMESTAMP,
    ACCION VARCHAR2(100),
    ESTADO VARCHAR2(1)
);


ALTER TABLE FIDE_RESERVAS_FACTURA_TB
ADD (
    NOMBRE VARCHAR2(100),
    CREADO_POR VARCHAR2(100),
    FECHA_CREACION TIMESTAMP,
    MODIFICADO_POR VARCHAR2(100),
    FECHA_MODIFICACION TIMESTAMP,
    ACCION VARCHAR2(100),
    ESTADO VARCHAR2(1)
);


ALTER TABLE FIDE_RESERVAS_TB
ADD (
    NOMBRE VARCHAR2(100),
    CREADO_POR VARCHAR2(100),
    FECHA_CREACION TIMESTAMP,
    MODIFICADO_POR VARCHAR2(100),
    FECHA_MODIFICACION TIMESTAMP,
    ACCION VARCHAR2(100),
    ESTADO VARCHAR2(1)
);


ALTER TABLE FIDE_ROLES_TB
ADD (
    NOMBRE VARCHAR2(100),
    CREADO_POR VARCHAR2(100),
    FECHA_CREACION TIMESTAMP,
    MODIFICADO_POR VARCHAR2(100),
    FECHA_MODIFICACION TIMESTAMP,
    ACCION VARCHAR2(100),
    ESTADO VARCHAR2(1)
);


ALTER TABLE FIDE_TIPO_CAMBIO_TB
ADD (
    NOMBRE VARCHAR2(100),
    CREADO_POR VARCHAR2(100),
    FECHA_CREACION TIMESTAMP,
    MODIFICADO_POR VARCHAR2(100),
    FECHA_MODIFICACION TIMESTAMP,
    ACCION VARCHAR2(100),
    ESTADO VARCHAR2(1)
);


ALTER TABLE FIDE_TIPO_MANTENIMIENTO_TB
ADD (
    NOMBRE VARCHAR2(100),
    CREADO_POR VARCHAR2(100),
    FECHA_CREACION TIMESTAMP,
    MODIFICADO_POR VARCHAR2(100),
    FECHA_MODIFICACION TIMESTAMP,
    ACCION VARCHAR2(100),
    ESTADO VARCHAR2(1)
);


ALTER TABLE FIDE_TIPO_PROMOCION_TB
ADD (
    NOMBRE VARCHAR2(100),
    CREADO_POR VARCHAR2(100),
    FECHA_CREACION TIMESTAMP,
    MODIFICADO_POR VARCHAR2(100),
    FECHA_MODIFICACION TIMESTAMP,
    ACCION VARCHAR2(100),
    ESTADO VARCHAR2(1)
);


ALTER TABLE FIDE_USUARIOS_TB
ADD (
    NOMBRE VARCHAR2(100),
    CREADO_POR VARCHAR2(100),
    FECHA_CREACION TIMESTAMP,
    MODIFICADO_POR VARCHAR2(100),
    FECHA_MODIFICACION TIMESTAMP,
    ACCION VARCHAR2(100),
    ESTADO VARCHAR2(1)
);

ALTER TABLE FIDE_VALORACION_TB
ADD (
    NOMBRE VARCHAR2(100),
    CREADO_POR VARCHAR2(100),
    FECHA_CREACION TIMESTAMP,
    MODIFICADO_POR VARCHAR2(100),
    FECHA_MODIFICACION TIMESTAMP,
    ACCION VARCHAR2(100),
    ESTADO VARCHAR2(1)
);






--creacion de paquete de usuarios y body


create sequence seq_id_usuario
start with 1
increment by 1
nocache
nocycle;

-- Secuencia para generar ID de reservaciones
CREATE SEQUENCE seq_id_reservacion
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

-- Secuencia para generar ID de facturas
CREATE SEQUENCE seq_id_factura
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

-- Secuencia para generar ID de roles
CREATE SEQUENCE seq_id_rol
START WITH 6
INCREMENT BY 1
NOCACHE;

-- Secuencia para generar ID de hoteles

CREATE SEQUENCE seq_id_hotel
START WITH 6
INCREMENT BY 1
NOCACHE;



-- Secuencia para generar ID de direcciones

CREATE SEQUENCE seq_id_direccion
START WITH 6
INCREMENT BY 1
NOCACHE;

-- Secuencia para generar ID de pais
CREATE SEQUENCE seq_id_pais
START WITH 6
INCREMENT BY 1
NOCACHE;





--FUNCIONES Y PAQUETES

create or replace package usuarios_pkg as

    function crear_usuario (
        p_nombre varchar2,
        p_apellidos varchar2,
        p_cedula varchar2,
        p_telefono varchar2,
        p_correo varchar2,
        p_contrasena varchar2,
        p_fecha_nacimiento date,
        p_id_rol int,
        p_id_nacionalidad int,
        p_id_direccion int
    ) return varchar2;

end usuarios_pkg;
/

create or replace package body usuarios_pkg as

function crear_usuario(
    p_nombre varchar2,
    p_apellidos varchar2,
    p_cedula varchar2,
    p_telefono varchar2,
    p_correo varchar2,
    p_contrasena varchar2,
    p_fecha_nacimiento date,
    p_id_rol int,
    p_id_nacionalidad int,
    p_id_direccion int
) return varchar2 is
begin
    insert into fide_usuarios_tb (id_usuario, nombre, apellidos, cedula, telefono, correo, contrasena, fecha_nacimiento, id_rol, id_nacionalidad, id_direccion, id_estado)
    values (seq_id_usuario.nextval, p_nombre, p_apellidos, p_cedula, p_telefono, p_correo, p_contrasena, p_fecha_nacimiento, p_id_rol, p_id_nacionalidad, p_id_direccion, 1);

    return 'usuario creado exitosamente';
exception
    when dup_val_on_index then
        return 'error: el correo ya existe';
    when others then
        return 'error al crear el usuario: ' || sqlerrm;
end;

end usuarios_pkg;
/

CREATE OR REPLACE PACKAGE reservas_pkg AS
    FUNCTION crear_reserva (
        p_id_usuario INT,
        p_id_hotel INT,
        p_id_categoria INT,
        p_id_habitacion INT,
        p_id_moneda INT,
        p_fecha_inicio DATE,
        p_fecha_cierre DATE,
        p_precio_unitario NUMBER,
        p_hora TIMESTAMP 
    ) RETURN VARCHAR2;

    FUNCTION cancelar_reserva (
        p_id_reservacion INT
    ) RETURN VARCHAR2;
END reservas_pkg;
/

CREATE OR REPLACE PACKAGE BODY reservas_pkg AS
    FUNCTION crear_reserva (
        p_id_usuario INT,
        p_id_hotel INT,
        p_id_categoria INT,
        p_id_habitacion INT,
        p_id_moneda INT,
        p_fecha_inicio DATE,
        p_fecha_cierre DATE,
        p_precio_unitario NUMBER,
        p_hora TIMESTAMP 
    ) RETURN VARCHAR2 IS
    BEGIN
        INSERT INTO fide_reservas_tb (id_reservacion, id_usuario, id_hotel, id_categoria, id_habitacion, id_moneda, id_estado, fecha_inicio, fecha_cierre, precio_unitario, nombre, descripcion, hora)
        VALUES (seq_id_reservacion.NEXTVAL, p_id_usuario, p_id_hotel, p_id_categoria, p_id_habitacion, p_id_moneda, 1, p_fecha_inicio, p_fecha_cierre, p_precio_unitario, 'Reservación nueva', 'Descripción de la reservación', p_hora);
        
        RETURN 'Reserva creada exitosamente';
    EXCEPTION
        WHEN OTHERS THEN
            RETURN 'Error al crear la reserva: ' || SQLERRM;
    END;

    FUNCTION cancelar_reserva (
        p_id_reservacion INT
    ) RETURN VARCHAR2 IS
    BEGIN
        UPDATE fide_reservas_tb
        SET id_estado = 2 
        WHERE id_reservacion = p_id_reservacion;

        RETURN 'Reserva cancelada exitosamente';
    EXCEPTION
        WHEN OTHERS THEN
            RETURN 'Error al cancelar la reserva: ' || SQLERRM;
    END;
END reservas_pkg;
/


CREATE OR REPLACE PACKAGE facturacion_pkg AS
    FUNCTION crear_factura (
        p_id_usuario INT,
        p_id_moneda INT,
        p_id_impuesto INT,
        p_subtotal NUMBER
    ) RETURN VARCHAR2;

    FUNCTION calcular_total (
        p_subtotal NUMBER,
        p_descuento NUMBER,
        p_impuesto NUMBER
    ) RETURN NUMBER;
END facturacion_pkg;
/


CREATE OR REPLACE PACKAGE BODY facturacion_pkg AS
    FUNCTION crear_factura (
        p_id_usuario INT,
        p_id_moneda INT,
        p_id_impuesto INT, 
        p_subtotal NUMBER
    ) RETURN VARCHAR2 IS
        v_total NUMBER;
    BEGIN
       
        v_total := calcular_total(p_subtotal, 0, 13);
      
        INSERT INTO fide_facturas_tb (id_factura, id_usuario, id_moneda, id_impuesto, id_estado, subtotal, total)
        VALUES (seq_id_factura.NEXTVAL, p_id_usuario, p_id_moneda, p_id_impuesto, 1, p_subtotal, v_total);

        RETURN 'Factura creada exitosamente';
    EXCEPTION
        WHEN OTHERS THEN
            RETURN 'Error al crear la factura: ' || SQLERRM;
    END;

    FUNCTION calcular_total (
        p_subtotal NUMBER,
        p_descuento NUMBER,
        p_impuesto NUMBER
    ) RETURN NUMBER IS
    BEGIN
        RETURN (p_subtotal - p_descuento) * (1 + p_impuesto / 100);
    END;
END facturacion_pkg;
/



CREATE OR REPLACE PACKAGE habitaciones_pkg AS
    FUNCTION asignar_habitacion (
        p_id_reservacion INT,
        p_id_habitacion INT
    ) RETURN VARCHAR2;

    FUNCTION verificar_disponibilidad (
        p_id_habitacion INT,
        p_fecha_inicio DATE,
        p_fecha_fin DATE
    ) RETURN VARCHAR2;
END habitaciones_pkg;
/

CREATE OR REPLACE PACKAGE BODY habitaciones_pkg AS
    FUNCTION asignar_habitacion (
        p_id_reservacion INT,
        p_id_habitacion INT
    ) RETURN VARCHAR2 IS
    BEGIN
        UPDATE fide_reservas_tb
        SET id_habitacion = p_id_habitacion
        WHERE id_reservacion = p_id_reservacion;

        RETURN 'Habitación asignada exitosamente';
    EXCEPTION
        WHEN OTHERS THEN
            RETURN 'Error al asignar habitación: ' || SQLERRM;
    END;

    FUNCTION verificar_disponibilidad (
        p_id_habitacion INT,
        p_fecha_inicio DATE,
        p_fecha_fin DATE
    ) RETURN VARCHAR2 IS
        v_count INT;
    BEGIN
        SELECT COUNT(*)
        INTO v_count
        FROM fide_reservas_tb
        WHERE id_habitacion = p_id_habitacion
        AND (fecha_inicio <= p_fecha_fin AND fecha_cierre >= p_fecha_inicio);

        IF v_count > 0 THEN
            RETURN 'Habitación no disponible';
        ELSE
            RETURN 'Habitación disponible';
        END IF;
    EXCEPTION
        WHEN OTHERS THEN
            RETURN 'Error al verificar disponibilidad: ' || SQLERRM;
    END;
END habitaciones_pkg;
/

CREATE OR REPLACE PACKAGE roles_crear_pkg AS
    FUNCTION crear_rol (
        p_nombre_rol VARCHAR2,
        p_descripcion VARCHAR2,
        p_id_estado INT,
        p_creado_por VARCHAR2
    ) RETURN VARCHAR2;
END roles_crear_pkg;
/

CREATE OR REPLACE PACKAGE BODY roles_crear_pkg AS
    FUNCTION crear_rol (
        p_nombre_rol VARCHAR2,
        p_descripcion VARCHAR2,
        p_id_estado INT,
        p_creado_por VARCHAR2
    ) RETURN VARCHAR2 IS
    BEGIN
        INSERT INTO fide_roles_tb (id_rol, id_estado, nombre_rol, descripcion, creado_por, fecha_creacion)
        VALUES (seq_id_rol.NEXTVAL, p_id_estado, p_nombre_rol, p_descripcion, p_creado_por, SYSTIMESTAMP);
        RETURN 'Rol creado exitosamente';
    EXCEPTION
        WHEN OTHERS THEN
            RETURN 'Error al crear rol: ' || SQLERRM;
    END;
END roles_crear_pkg;
/

CREATE OR REPLACE PACKAGE hoteles_crear_pkg AS
    FUNCTION crear_hotel (
        p_nombre_hotel VARCHAR2,
        p_ubicacion VARCHAR2,
        p_telefono VARCHAR2,
        p_id_estado INT,
        p_creado_por VARCHAR2
    ) RETURN VARCHAR2;
END hoteles_crear_pkg;
/

CREATE OR REPLACE PACKAGE BODY hoteles_crear_pkg AS
    FUNCTION crear_hotel (
        p_nombre_hotel VARCHAR2,
        p_ubicacion VARCHAR2,
        p_telefono VARCHAR2,
        p_id_estado INT,
        p_creado_por VARCHAR2
    ) RETURN VARCHAR2 IS
    BEGIN
        INSERT INTO fide_hoteles_tb (id_hotel, id_estado, nombre_hotel, ubicacion, telefono, creado_por, fecha_creacion)
        VALUES (seq_id_hotel.NEXTVAL, p_id_estado, p_nombre_hotel, p_ubicacion, p_telefono, p_creado_por, SYSTIMESTAMP);
        RETURN 'Hotel creado exitosamente';
    EXCEPTION
        WHEN OTHERS THEN
            RETURN 'Error al crear hotel: ' || SQLERRM;
    END;
END hoteles_crear_pkg;
/

CREATE OR REPLACE PACKAGE direccion_crear_pkg AS
    FUNCTION crear_direccion (
        p_id_distrito INT,
        p_id_canton INT,
        p_id_provincia INT,
        p_id_pais INT,
        p_descripcion VARCHAR2,
        p_creado_por VARCHAR2
    ) RETURN VARCHAR2;
END direccion_crear_pkg;
/

CREATE OR REPLACE PACKAGE BODY direccion_crear_pkg AS
    FUNCTION crear_direccion (
        p_id_distrito INT,
        p_id_canton INT,
        p_id_provincia INT,
        p_id_pais INT,
        p_descripcion VARCHAR2,
        p_creado_por VARCHAR2
    ) RETURN VARCHAR2 IS
    BEGIN
        INSERT INTO fide_direccion_tb (id_direccion, id_distrito, id_canton, id_provincia, id_pais, descripcion, creado_por, fecha_creacion)
        VALUES (seq_id_direccion.NEXTVAL, p_id_distrito, p_id_canton, p_id_provincia, p_id_pais, p_descripcion, p_creado_por, SYSTIMESTAMP);
        RETURN 'Dirección creada exitosamente';
    EXCEPTION
        WHEN OTHERS THEN
            RETURN 'Error al crear dirección: ' || SQLERRM;
    END;
END direccion_crear_pkg;
/


CREATE OR REPLACE PACKAGE pais_crear_pkg AS
    FUNCTION crear_pais (
        p_nombre_pais VARCHAR2,
        p_creado_por VARCHAR2
    ) RETURN VARCHAR2;
END pais_crear_pkg;
/

CREATE OR REPLACE PACKAGE BODY pais_crear_pkg AS
    FUNCTION crear_pais (
        p_nombre_pais VARCHAR2,
        p_creado_por VARCHAR2
    ) RETURN VARCHAR2 IS
    BEGIN
        INSERT INTO fide_pais_tb (id_pais, nombre_pais, nombre, creado_por, fecha_creacion, estado)
        VALUES (seq_id_pais.NEXTVAL, p_nombre_pais, p_nombre_pais, p_creado_por, SYSTIMESTAMP, 'A');
        
        RETURN 'País creado exitosamente';
    EXCEPTION
        WHEN OTHERS THEN
            RETURN 'Error al crear país: ' || SQLERRM;
    END;
END pais_crear_pkg;
/





-- PROBANDO CADA FUNCION

set serveroutput on;
declare
    v_resultado varchar2(400);
begin
    v_resultado := usuarios_pkg.crear_usuario(
        p_nombre => 'richie',
        p_apellidos => 'ulate',
        p_cedula => '123456789',
        p_telefono => '8881234',
        p_correo => 'richie.ulate@gmail.com',
        p_contrasena => '123',
        p_fecha_nacimiento => to_date('1990-01-01', 'yyyy-mm-dd'),
        p_id_rol => 1,
        p_id_nacionalidad => 1,
        p_id_direccion => 1
    );
    dbms_output.put_line(v_resultado);
end;

DECLARE
    v_resultado VARCHAR2(400);
BEGIN
    v_resultado := facturacion_pkg.crear_factura(
        p_id_usuario => 1,
        p_id_moneda => 1,
        p_id_impuesto => 1, 
        p_subtotal => 100.00
    );
    DBMS_OUTPUT.PUT_LINE(v_resultado);
END;
/



DECLARE
    v_resultado VARCHAR2(400);
BEGIN

    v_resultado := reservas_pkg.crear_reserva(
        p_id_usuario => 3,
        p_id_hotel => 1,
        p_id_categoria => 1,
        p_id_habitacion => 1,
        p_id_moneda => 1,
        p_fecha_inicio => TO_DATE('2024-12-01', 'YYYY-MM-DD'),
        p_fecha_cierre => TO_DATE('2024-12-10', 'YYYY-MM-DD'),
        p_precio_unitario => 150.00,
        p_hora => SYSTIMESTAMP
    );
    DBMS_OUTPUT.PUT_LINE('Resultado de crear reserva: ' || v_resultado);
END;
/

DECLARE
    v_resultado VARCHAR2(400);
BEGIN

    v_resultado := reservas_pkg.cancelar_reserva(10);
    DBMS_OUTPUT.PUT_LINE('Resultado de cancelar reserva: ' || v_resultado);
END;
/


DECLARE
    v_resultado VARCHAR2(400);
BEGIN

    v_resultado := habitaciones_pkg.verificar_disponibilidad(
        p_id_habitacion => 5,
        p_fecha_inicio => TO_DATE('2024-11-05', 'YYYY-MM-DD'),
        p_fecha_fin => TO_DATE('2024-11-10', 'YYYY-MM-DD')
    );
    DBMS_OUTPUT.PUT_LINE('Disponibilidad de la habitación: ' || v_resultado);


    v_resultado := habitaciones_pkg.asignar_habitacion(
        p_id_reservacion => 5,
        p_id_habitacion => 5
    );
    DBMS_OUTPUT.PUT_LINE('Resultado de asignación de habitación: ' || v_resultado);
END;
/

DECLARE
    v_resultado VARCHAR2(400);
BEGIN
    v_resultado := roles_crear_pkg.crear_rol(
        p_nombre_rol => 'Administrador',
        p_descripcion => 'Rol con todos los permisos',
        p_id_estado => 1,
        p_creado_por => user
    );
    DBMS_OUTPUT.PUT_LINE('Resultado de crear rol: ' || v_resultado);
END;
/


DECLARE
    v_resultado VARCHAR2(400);
BEGIN
    v_resultado := hoteles_crear_pkg.crear_hotel(
        p_nombre_hotel => 'Hotel Central',
        p_ubicacion => 'Av. Principal 123',
        p_telefono => '123456789',
        p_id_estado => 1,
        p_creado_por => user
    );
    DBMS_OUTPUT.PUT_LINE('Resultado de crear hotel: ' || v_resultado);
END;
/

DECLARE
    v_resultado VARCHAR2(400);
BEGIN
    v_resultado := direccion_crear_pkg.crear_direccion(
        p_id_distrito => 1,
        p_id_canton => 2,
        p_id_provincia => 3,
        p_id_pais => 4,
        p_descripcion => 'Descripción de la dirección',
        p_creado_por => user
    );
    DBMS_OUTPUT.PUT_LINE('Resultado de crear dirección: ' || v_resultado);
END;
/

DECLARE
    v_resultado VARCHAR2(400);
BEGIN
    v_resultado := pais_crear_pkg.crear_pais(
        p_nombre_pais => 'Honduras',
        p_creado_por => user
    );
    DBMS_OUTPUT.PUT_LINE('Resultado de crear país: ' || v_resultado);
END;
/










