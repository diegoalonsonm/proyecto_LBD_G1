CREATE TABLE FIDE_ESTADOS_TB (
    id_estado INT PRIMARY KEY,
    nombre_estado VARCHAR2(100) NOT NULL,
    descripcion VARCHAR2(1000) NOT NULL,
    notas VARCHAR2(1000),
    creado_por VARCHAR2(100),
    fecha_creacion TIMESTAMP,
    modificado_por VARCHAR2(100),
    fecha_modificacion TIMESTAMP,
    accion varchar2(100)
    
);

CREATE TABLE FIDE_PAIS_TB (
    id_pais INT PRIMARY KEY,
    nombre_pais VARCHAR2(50) NOT NULL,
    creado_por VARCHAR2(100),
    fecha_creacion TIMESTAMP,
    modificado_por VARCHAR2(100),
    fecha_modificacion TIMESTAMP,
    accion varchar2(100)
    
);

CREATE TABLE FIDE_PROVINCIA_TB (
    id_provincia INT PRIMARY KEY,
    id_pais INT NOT NULL,
    nombre_provincia VARCHAR2(50) NOT NULL,
    CONSTRAINT fk_provincia_pais FOREIGN KEY (id_pais) 
    REFERENCES FIDE_PAIS_TB(id_pais),
    creado_por VARCHAR2(100),
    fecha_creacion TIMESTAMP,
    modificado_por VARCHAR2(100),
    fecha_modificacion TIMESTAMP,
    accion varchar2(100)
    
);

CREATE TABLE FIDE_CANTON_TB (
    id_canton INT PRIMARY KEY,
    id_provincia INT NOT NULL,
    nombre_canton VARCHAR2(100) NOT NULL,
    CONSTRAINT fk_canton_provincia FOREIGN KEY (id_provincia) 
    REFERENCES FIDE_PROVINCIA_TB(id_provincia),
    creado_por VARCHAR2(100),
    fecha_creacion TIMESTAMP,
    modificado_por VARCHAR2(100),
    fecha_modificacion TIMESTAMP,
    accion varchar2(100)
    
);

CREATE TABLE FIDE_DISTRITO_TB (
    id_distrito INT PRIMARY KEY,
    id_canton INT NOT NULL,
    nombre_distrito VARCHAR2(100) NOT NULL,
    CONSTRAINT fk_distrito_canton FOREIGN KEY (id_canton) 
    REFERENCES FIDE_CANTON_TB(id_canton),
    creado_por VARCHAR2(100),
    fecha_creacion TIMESTAMP,
    modificado_por VARCHAR2(100),
    fecha_modificacion TIMESTAMP,
    accion varchar2(100)
    
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
    creado_por VARCHAR2(100),
    fecha_creacion TIMESTAMP,
    modificado_por VARCHAR2(100),
    fecha_modificacion TIMESTAMP,
    accion varchar2(100)

);

CREATE TABLE FIDE_NACIONALIDAD_TB (
    ID_Nacionalidad INT PRIMARY KEY,
    Descripcion VARCHAR2(50) NOT NULL,
    creado_por VARCHAR2(100),
    fecha_creacion TIMESTAMP,
    modificado_por VARCHAR2(100),
    fecha_modificacion TIMESTAMP,
    accion varchar2(100)
    
);


CREATE TABLE FIDE_ROLES_TB (
    id_rol INT PRIMARY KEY,
    id_estado INT NOT NULL,
    nombre_rol VARCHAR2(50) NOT NULL,
    descripcion VARCHAR2(500) NOT NULL,
    CONSTRAINT fk_roles_estado FOREIGN KEY (id_estado) 
    REFERENCES FIDE_ESTADOS_TB(id_estado),
    creado_por VARCHAR2(100),
    fecha_creacion TIMESTAMP,
    modificado_por VARCHAR2(100),
    fecha_modificacion TIMESTAMP,
    accion varchar2(100)

);

CREATE TABLE FIDE_MONEDA_TB (
    id_moneda INT PRIMARY KEY,
    codigo_moneda VARCHAR2(3) UNIQUE NOT NULL,
    nombre_moneda VARCHAR2(50) NOT NULL,
    creado_por VARCHAR2(100),
    fecha_creacion TIMESTAMP,
    modificado_por VARCHAR2(100),
    fecha_modificacion TIMESTAMP,
    accion varchar2(100)
    
);

CREATE TABLE FIDE_TIPO_MANTENIMIENTO_TB (
    id_tipo_mantenimiento INT PRIMARY KEY,
    tipo_mantenimiento VARCHAR2(100) NOT NULL,
    creado_por VARCHAR2(100),
    fecha_creacion TIMESTAMP,
    modificado_por VARCHAR2(100),
    fecha_modificacion TIMESTAMP,
    accion varchar2(100)
    
);

CREATE TABLE FIDE_TIPO_PROMOCION_TB (
    id_tipo_promocion INT PRIMARY KEY,
    nombre VARCHAR2(50) NOT NULL,
    descripcion VARCHAR2(255) NOT NULL,
    creado_por VARCHAR2(100),
    fecha_creacion TIMESTAMP,
    modificado_por VARCHAR2(100),
    fecha_modificacion TIMESTAMP,
    accion varchar2(100)
    
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
    REFERENCES FIDE_DIRECCION_TB(id_direccion),
    creado_por VARCHAR2(100),
    fecha_creacion TIMESTAMP,
    modificado_por VARCHAR2(100),
    fecha_modificacion TIMESTAMP,
    accion varchar2(100)
    
);

CREATE TABLE FIDE_HOTELES_TB (
    id_hotel INT PRIMARY KEY,
    id_estado INT NOT NULL,
    nombre_hotel VARCHAR2(50) NOT NULL,
    ubicacion VARCHAR2(255) NOT NULL,
    telefono VARCHAR2(20) NOT NULL,
    CONSTRAINT fk_hoteles_estado FOREIGN KEY (id_estado) 
    REFERENCES FIDE_ESTADOS_TB(id_estado),
    creado_por VARCHAR2(100),
    fecha_creacion TIMESTAMP,
    modificado_por VARCHAR2(100),
    fecha_modificacion TIMESTAMP,
    accion varchar2(100)
    
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
    creado_por VARCHAR2(100),
    fecha_creacion TIMESTAMP,
    modificado_por VARCHAR2(100),
    fecha_modificacion TIMESTAMP,
    accion varchar2(100)
    
);

CREATE TABLE FIDE_VALORACION_TB (
    id_valoracion INT PRIMARY KEY,
    id_estado INT NOT NULL,
    comentario CLOB NOT NULL,
    valoracion INT NOT NULL,
    timestamp TIMESTAMP NOT NULL,
    CONSTRAINT fk_valoracion_estado FOREIGN KEY (id_estado) 
    REFERENCES FIDE_ESTADOS_TB(id_estado),
    creado_por VARCHAR2(100),
    fecha_creacion TIMESTAMP,
    modificado_por VARCHAR2(100),
    fecha_modificacion TIMESTAMP,
    accion varchar2(100)
    
);

CREATE TABLE FIDE_CATEGORIA_RESERVAS_TB (
    id_categoria INT PRIMARY KEY,
    id_estado INT NOT NULL,
    nombre_categoria VARCHAR2(100) NOT NULL,
    comentarios VARCHAR2(250) NOT NULL,
    CONSTRAINT fk_categoria_estado FOREIGN KEY (id_estado) 
    REFERENCES FIDE_ESTADOS_TB(id_estado),
    creado_por VARCHAR2(100),
    fecha_creacion TIMESTAMP,
    modificado_por VARCHAR2(100),
    fecha_modificacion TIMESTAMP,
    accion varchar2(100)
    
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
    creado_por VARCHAR2(100),
    fecha_creacion TIMESTAMP,
    modificado_por VARCHAR2(100),
    fecha_modificacion TIMESTAMP,
    accion varchar2(100)
    
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
    creado_por VARCHAR2(100),
    fecha_creacion TIMESTAMP,
    modificado_por VARCHAR2(100),
    fecha_modificacion TIMESTAMP,
    accion varchar2(100)
    
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
    creado_por VARCHAR2(100),
    fecha_creacion TIMESTAMP,
    modificado_por VARCHAR2(100),
    fecha_modificacion TIMESTAMP,
    accion varchar2(100)
    
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
    creado_por VARCHAR2(100),
    fecha_creacion TIMESTAMP,
    modificado_por VARCHAR2(100),
    fecha_modificacion TIMESTAMP,
    accion varchar2(100)
    
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
    creado_por VARCHAR2(100),
    fecha_creacion TIMESTAMP,
    modificado_por VARCHAR2(100),
    fecha_modificacion TIMESTAMP,
    accion varchar2(100)
    
);

CREATE TABLE FIDE_RESERVAS_FACTURA_TB (
    id_factura INT NOT NULL,
    id_reservacion INT NOT NULL,
    PRIMARY KEY (id_factura, id_reservacion),
    CONSTRAINT fk_res_fact_factura FOREIGN KEY (id_factura) 
    REFERENCES FIDE_FACTURAS_TB(id_factura),
    CONSTRAINT fk_res_fact_reservacion FOREIGN KEY (id_reservacion) 
    REFERENCES FIDE_RESERVAS_TB(id_reservacion),
    creado_por VARCHAR2(100),
    fecha_creacion TIMESTAMP,
    modificado_por VARCHAR2(100),
    fecha_modificacion TIMESTAMP,
    accion varchar2(100)
    
);

CREATE TABLE FIDE_TIPO_CAMBIO_TB (
    id_tipo_cambio INT PRIMARY KEY,
    id_moneda INT NOT NULL,
    fecha DATE NOT NULL,
    tasa_cambio DECIMAL(20,2) NOT NULL,
    CONSTRAINT fk_tipo_cambio_moneda FOREIGN KEY (id_moneda) 
    REFERENCES FIDE_MONEDA_TB(id_moneda),
    creado_por VARCHAR2(100),
    fecha_creacion TIMESTAMP,
    modificado_por VARCHAR2(100),
    fecha_modificacion TIMESTAMP,
    accion varchar2(100)
    
    
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
    creado_por VARCHAR2(100),
    fecha_creacion TIMESTAMP,
    modificado_por VARCHAR2(100),
    fecha_modificacion TIMESTAMP,
    accion varchar2(100)
    
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
-- Creación de tablas
CREATE TABLE FIDE_ESTADOS_TB (
    id_estado INT PRIMARY KEY,
    nombre_estado VARCHAR2(100) NOT NULL,
    descripcion VARCHAR2(1000) NOT NULL,
    notas VARCHAR2(1000),
    creado_por VARCHAR2(100),
    fecha_creacion TIMESTAMP,
    modificado_por VARCHAR2(100),
    fecha_modificacion TIMESTAMP,
    accion VARCHAR2(100)
);

CREATE TABLE FIDE_PAIS_TB (
    id_pais INT PRIMARY KEY,
    nombre_pais VARCHAR2(50) NOT NULL,
    creado_por VARCHAR2(100),
    fecha_creacion TIMESTAMP,
    modificado_por VARCHAR2(100),
    fecha_modificacion TIMESTAMP,
    accion VARCHAR2(100)
);

CREATE TABLE FIDE_PROVINCIA_TB (
    id_provincia INT PRIMARY KEY,
    id_pais INT NOT NULL,
    nombre_provincia VARCHAR2(50) NOT NULL,
    CONSTRAINT fk_provincia_pais FOREIGN KEY (id_pais) 
    REFERENCES FIDE_PAIS_TB(id_pais),
    creado_por VARCHAR2(100),
    fecha_creacion TIMESTAMP,
    modificado_por VARCHAR2(100),
    fecha_modificacion TIMESTAMP,
    accion VARCHAR2(100)
);

CREATE TABLE FIDE_CANTON_TB (
    id_canton INT PRIMARY KEY,
    id_provincia INT NOT NULL,
    nombre_canton VARCHAR2(100) NOT NULL,
    CONSTRAINT fk_canton_provincia FOREIGN KEY (id_provincia) 
    REFERENCES FIDE_PROVINCIA_TB(id_provincia),
    creado_por VARCHAR2(100),
    fecha_creacion TIMESTAMP,
    modificado_por VARCHAR2(100),
    fecha_modificacion TIMESTAMP,
    accion VARCHAR2(100)
);

CREATE TABLE FIDE_DISTRITO_TB (
    id_distrito INT PRIMARY KEY,
    id_canton INT NOT NULL,
    nombre_distrito VARCHAR2(100) NOT NULL,
    CONSTRAINT fk_distrito_canton FOREIGN KEY (id_canton) 
    REFERENCES FIDE_CANTON_TB(id_canton),
    creado_por VARCHAR2(100),
    fecha_creacion TIMESTAMP,
    modificado_por VARCHAR2(100),
    fecha_modificacion TIMESTAMP,
    accion VARCHAR2(100)
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
    creado_por VARCHAR2(100),
    fecha_creacion TIMESTAMP,
    modificado_por VARCHAR2(100),
    fecha_modificacion TIMESTAMP,
    accion VARCHAR2(100)
);

CREATE TABLE FIDE_NACIONALIDAD_TB (
    id_nacionalidad INT PRIMARY KEY,
    descripcion VARCHAR2(50) NOT NULL,
    creado_por VARCHAR2(100),
    fecha_creacion TIMESTAMP,
    modificado_por VARCHAR2(100),
    fecha_modificacion TIMESTAMP,
    accion VARCHAR2(100)
);

-- Consolidación de alteraciones
ALTER TABLE FIDE_CANTON_TB ADD estado VARCHAR2(1);
ALTER TABLE FIDE_CATEGORIA_RESERVAS_TB ADD estado VARCHAR2(1);
ALTER TABLE FIDE_DETALLE_FACTURA_TB ADD estado VARCHAR2(1);
ALTER TABLE FIDE_DIRECCION_TB ADD estado VARCHAR2(1);
ALTER TABLE FIDE_ESTADOS_TB ADD estado VARCHAR2(1);
ALTER TABLE FIDE_FACTURAS_TB ADD estado VARCHAR2(1);
ALTER TABLE FIDE_HABITACIONES_TB ADD estado VARCHAR2(1);
ALTER TABLE FIDE_HOTELES_TB ADD estado VARCHAR2(1);
ALTER TABLE FIDE_IMPUESTOS_TB ADD estado VARCHAR2(1);
ALTER TABLE FIDE_LIMPIEZA_HABITACIONES_TB ADD estado VARCHAR2(1);
ALTER TABLE FIDE_MANTENIMIENTO_TB ADD estado VARCHAR2(1);
ALTER TABLE FIDE_MONEDA_TB ADD estado VARCHAR2(1);
ALTER TABLE FIDE_NACIONALIDAD_TB ADD estado VARCHAR2(1);
ALTER TABLE FIDE_PAIS_TB ADD estado VARCHAR2(1);
ALTER TABLE FIDE_PROMOCIONES_TB ADD estado VARCHAR2(1);
ALTER TABLE FIDE_PROVINCIA_TB ADD estado VARCHAR2(1);
ALTER TABLE FIDE_RESERVAS_FACTURA_TB ADD estado VARCHAR2(1);
ALTER TABLE FIDE_RESERVAS_TB ADD estado VARCHAR2(1);
ALTER TABLE FIDE_ROLES_TB ADD estado VARCHAR2(1);
ALTER TABLE FIDE_TIPO_CAMBIO_TB ADD estado VARCHAR2(1);
ALTER TABLE FIDE_TIPO_MANTENIMIENTO_TB ADD estado VARCHAR2(1);
ALTER TABLE FIDE_TIPO_PROMOCION_TB ADD estado VARCHAR2(1);
ALTER TABLE FIDE_USUARIOS_TB ADD estado VARCHAR2(1);
ALTER TABLE FIDE_VALORACION_TB ADD estado VARCHAR2(1);

-- Secuencias necesarias
CREATE SEQUENCE seq_id_usuario START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_id_reservacion START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_id_factura START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_id_rol START WITH 1 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE seq_id_hotel START WITH 1 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE seq_id_direccion START WITH 1 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE seq_id_pais START WITH 1 INCREMENT BY 1 NOCACHE;
