
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