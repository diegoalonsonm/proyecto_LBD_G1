
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



  CREATE OR REPLACE VIEW FIDE_ESTADOS_V AS
SELECT 
    nombre_estado,
    descripcion,
    notas
FROM 
    FIDE_ESTADOS_TB
WHERE 
    id_estado = 1;

CREATE OR REPLACE VIEW FIDE_PAIS_V AS
SELECT 
    id_pais,
    nombre_pais
FROM 
    FIDE_PAIS_TB;

CREATE OR REPLACE VIEW FIDE_PROVINCIA_V AS
SELECT 
    id_provincia,
    id_pais,
    nombre_provincia
FROM 
    FIDE_PROVINCIA_TB;

CREATE OR REPLACE VIEW FIDE_CANTON_V AS
SELECT 
    id_canton,
    id_provincia,
    nombre_canton
FROM 
    FIDE_CANTON_TB;

CREATE OR REPLACE VIEW FIDE_DISTRITO_V AS
SELECT 
    id_distrito,
    id_canton,
    nombre_distrito
FROM 
    FIDE_DISTRITO_TB;

CREATE OR REPLACE VIEW FIDE_DIRECCION_V AS
SELECT 
    id_direccion,
    id_distrito,
    id_canton,
    id_provincia,
    id_pais,
    descripcion
FROM 
    FIDE_DIRECCION_TB;

CREATE OR REPLACE VIEW FIDE_NACIONALIDAD_V AS
SELECT 
    ID_Nacionalidad,
    Descripcion
FROM 
    FIDE_NACIONALIDAD_TB;

CREATE OR REPLACE VIEW FIDE_ROLES_V AS
SELECT 
    id_rol,
    nombre_rol,
    descripcion
FROM 
    FIDE_ROLES_TB
WHERE 
    id_estado = 1;

CREATE OR REPLACE VIEW FIDE_MONEDA_V AS
SELECT 
    id_moneda,
    codigo_moneda,
    nombre_moneda
FROM 
    FIDE_MONEDA_TB;

CREATE OR REPLACE VIEW FIDE_TIPO_MANTENIMIENTO_V AS
SELECT 
    id_tipo_mantenimiento,
    tipo_mantenimiento
FROM 
    FIDE_TIPO_MANTENIMIENTO_TB;

CREATE OR REPLACE VIEW FIDE_TIPO_PROMOCION_V AS
SELECT 
    id_tipo_promocion,
    nombre,
    descripcion
FROM 
    FIDE_TIPO_PROMOCION_TB;

CREATE OR REPLACE VIEW FIDE_USUARIOS_V AS
SELECT 
    id_usuario,
    id_rol,
    id_nacionalidad,
    id_direccion,
    nombre,
    apellidos,
    cedula,
    telefono,
    correo,
    contrasena,
    fecha_nacimiento
FROM 
    FIDE_USUARIOS_TB
WHERE 
    id_estado = 1;

CREATE OR REPLACE VIEW FIDE_HOTELES_V AS
SELECT 
    id_hotel,
    nombre_hotel,
    ubicacion,
    telefono
FROM 
    FIDE_HOTELES_TB
WHERE 
    id_estado = 1;

CREATE OR REPLACE VIEW FIDE_HABITACIONES_V AS
SELECT 
    id_habitacion,
    id_hotel,
    id_moneda,
    numero_habitacion,
    tipo_habitacion,
    precio_por_noche,
    capacidad_personas,
    estado
FROM 
    FIDE_HABITACIONES_TB
WHERE 
    id_estado = 1;

CREATE OR REPLACE VIEW FIDE_VALORACION_V AS
SELECT 
    id_valoracion,
    comentario,
    valoracion,
    timestamp
FROM 
    FIDE_VALORACION_TB
WHERE 
    id_estado = 1;

CREATE OR REPLACE VIEW FIDE_CATEGORIA_RESERVAS_V AS
SELECT 
    id_categoria,
    nombre_categoria,
    comentarios
FROM 
    FIDE_CATEGORIA_RESERVAS_TB
WHERE 
    id_estado = 1;

CREATE OR REPLACE VIEW FIDE_RESERVAS_V AS
SELECT 
    id_reservacion,
    id_usuario,
    id_hotel,
    id_categoria,
    id_habitacion,
    id_valoracion,
    id_moneda,
    fecha_inicio,
    fecha_cierre,
    hora,
    precio_unitario,
    nombre,
    descripcion
FROM 
    FIDE_RESERVAS_TB
WHERE 
    id_estado = 1;

CREATE OR REPLACE VIEW FIDE_PROMOCIONES_V AS
SELECT 
    id_promocion,
    id_tipo_promocion,
    id_reservacion,
    id_moneda,
    descripcion,
    nombre_promocion,
    fecha_inicio,
    fecha_fin,
    porcentaje_promocion,
    descuento
FROM 
    FIDE_PROMOCIONES_TB
WHERE 
    id_estado = 1;

CREATE OR REPLACE VIEW FIDE_IMPUESTOS_V AS
SELECT 
    id_impuesto,
    id_pais,
    nombre_impuesto,
    porcentaje
FROM 
    FIDE_IMPUESTOS_TB
WHERE 
    id_estado = 1;

CREATE OR REPLACE VIEW FIDE_FACTURAS_V AS
SELECT 
    id_factura,
    id_moneda,
    id_usuario,
    id_impuesto,
    id_promocion,
    subtotal,
    total
FROM 
    FIDE_FACTURAS_TB
WHERE 
    id_estado = 1;

CREATE OR REPLACE VIEW FIDE_DETALLE_FACTURA_V AS
SELECT 
    id_detalle_factura,
    id_factura,
    id_reservacion,
    id_promocion,
    id_moneda,
    cantidad,
    total_linea
FROM 
    FIDE_DETALLE_FACTURA_TB
WHERE 
    id_estado = 1;

CREATE OR REPLACE VIEW FIDE_RESERVAS_FACTURA_V AS
SELECT 
    id_factura,
    id_reservacion
FROM 
    FIDE_RESERVAS_FACTURA_TB;

CREATE OR REPLACE VIEW FIDE_TIPO_CAMBIO_V AS
SELECT 
    id_tipo_cambio,
    id_moneda,
    fecha,
    tasa_cambio
FROM 
    FIDE_TIPO_CAMBIO_TB;

CREATE OR REPLACE VIEW FIDE_MANTENIMIENTO_V AS
SELECT 
    id_mantenimiento,
    id_habitacion,
    id_tipo_mantenimiento,
    fecha_mantenimiento
FROM 
    FIDE_MANTENIMIENTO_TB
WHERE 
    id_estado = 1;
