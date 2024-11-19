
--INSERTS

INSERT INTO FIDE_ESTADOS_TB (id_estado, nombre_estado, descripcion, notas) 
VALUES (1, 'Activo', 'Estado activo del registro', 'Estado utilizado para usuarios activos');
INSERT INTO FIDE_ESTADOS_TB (id_estado, nombre_estado, descripcion, notas) 
VALUES (2, 'Inactivo', 'Estado inactivo del registro', 'Estado utilizado para usuarios inactivos');
INSERT INTO FIDE_ESTADOS_TB (id_estado, nombre_estado, descripcion, notas) 
VALUES (3, 'Suspendido', 'Estado suspendido del registro', 'Estado utilizado para usuarios suspendidos');
INSERT INTO FIDE_ESTADOS_TB (id_estado, nombre_estado, descripcion, notas) 
VALUES (4, 'Borrado', 'Estado borrado del registro', 'Estado utilizado para usuarios eliminados');
INSERT INTO FIDE_ESTADOS_TB (id_estado, nombre_estado, descripcion, notas) 
VALUES (5, 'Pendiente', 'Estado pendiente de confirmación', 'Estado utilizado para procesos pendientes');


INSERT INTO FIDE_PAIS_TB (id_pais, nombre_pais) 
VALUES (1, 'Costa Rica');
INSERT INTO FIDE_PAIS_TB (id_pais, nombre_pais) 
VALUES (2, 'Panamá');
INSERT INTO FIDE_PAIS_TB (id_pais, nombre_pais) 
VALUES (3, 'Colombia');
INSERT INTO FIDE_PAIS_TB (id_pais, nombre_pais) 
VALUES (4, 'México');
INSERT INTO FIDE_PAIS_TB (id_pais, nombre_pais) 
VALUES (5, 'Argentina');

delete from FIDE_PROVINCIA_TB;

INSERT INTO FIDE_PROVINCIA_TB (id_provincia, id_pais, nombre_provincia) 
VALUES (1, 1, 'San José');
INSERT INTO FIDE_PROVINCIA_TB (id_provincia, id_pais, nombre_provincia) 
VALUES (2, 1, 'Alajuela');
INSERT INTO FIDE_PROVINCIA_TB (id_provincia, id_pais, nombre_provincia) 
VALUES (3, 1, 'Heredia');
INSERT INTO FIDE_PROVINCIA_TB (id_provincia, id_pais, nombre_provincia) 
VALUES (4, 1, 'Limon');
INSERT INTO FIDE_PROVINCIA_TB (id_provincia, id_pais, nombre_provincia) 
VALUES (5, 1, 'Guanacaste');
INSERT INTO FIDE_PROVINCIA_TB (id_provincia, id_pais, nombre_provincia) 
VALUES (6, 1, 'Puntarenas');
INSERT INTO FIDE_PROVINCIA_TB (id_provincia, id_pais, nombre_provincia) 
VALUES (7, 1, 'Cartago');


INSERT INTO FIDE_CANTON_TB (id_canton, id_provincia, nombre_canton) 
VALUES (1, 1, 'Tibas');
INSERT INTO FIDE_CANTON_TB (id_canton, id_provincia, nombre_canton) 
VALUES (2, 1, 'Escazú');
INSERT INTO FIDE_CANTON_TB (id_canton, id_provincia, nombre_canton) 
VALUES (3, 1, 'San Jose');
INSERT INTO FIDE_CANTON_TB (id_canton, id_provincia, nombre_canton) 
VALUES (4, 1, 'Desamparados');
INSERT INTO FIDE_CANTON_TB (id_canton, id_provincia, nombre_canton) 
VALUES (5, 1, 'Sabanilla');


INSERT INTO FIDE_DISTRITO_TB (id_distrito, id_canton, nombre_distrito) 
VALUES (1, 1, 'San Juan');
INSERT INTO FIDE_DISTRITO_TB (id_distrito, id_canton, nombre_distrito) 
VALUES (2, 2, 'San Rafael');
INSERT INTO FIDE_DISTRITO_TB (id_distrito, id_canton, nombre_distrito) 
VALUES (3, 3, 'Catedral');
INSERT INTO FIDE_DISTRITO_TB (id_distrito, id_canton, nombre_distrito) 
VALUES (4, 4, 'San Rafael Arriba');
INSERT INTO FIDE_DISTRITO_TB (id_distrito, id_canton, nombre_distrito) 
VALUES (5, 5, 'Sabanilla ');


INSERT INTO FIDE_DIRECCION_TB (id_direccion, id_distrito, id_canton, id_provincia, id_pais, descripcion) 
VALUES (1, 1, 1, 1, 1, 'Av. Central, 100 metros al norte del Banco Nacional');
INSERT INTO FIDE_DIRECCION_TB (id_direccion, id_distrito, id_canton, id_provincia, id_pais, descripcion) 
VALUES (2, 2, 1, 1, 1, 'Calle 10, contiguo al Parque de Escazú');
INSERT INTO FIDE_DIRECCION_TB (id_direccion, id_distrito, id_canton, id_provincia, id_pais, descripcion) 
VALUES (3, 3, 2, 2, 1, 'Barrio A, 50 metros oeste de la Iglesia');
INSERT INTO FIDE_DIRECCION_TB (id_direccion, id_distrito, id_canton, id_provincia, id_pais, descripcion) 
VALUES (4, 4, 3, 3, 2, 'Calle Principal, frente al Parque de David');
INSERT INTO FIDE_DIRECCION_TB (id_direccion, id_distrito, id_canton, id_provincia, id_pais, descripcion) 
VALUES (5, 5, 4, 4, 3, 'Avenida Guadalajara, cerca de la Plaza de Armas');

INSERT INTO FIDE_NACIONALIDAD_TB (ID_Nacionalidad, Descripcion) 
VALUES (1, 'Costarricense');
INSERT INTO FIDE_NACIONALIDAD_TB (ID_Nacionalidad, Descripcion) 
VALUES (2, 'Panameña');
INSERT INTO FIDE_NACIONALIDAD_TB (ID_Nacionalidad, Descripcion) 
VALUES (3, 'Colombiana');
INSERT INTO FIDE_NACIONALIDAD_TB (ID_Nacionalidad, Descripcion) 
VALUES (4, 'Mexicana');
INSERT INTO FIDE_NACIONALIDAD_TB (ID_Nacionalidad, Descripcion) 
VALUES (5, 'Argentina');


INSERT INTO FIDE_ROLES_TB (id_rol, id_estado, nombre_rol, descripcion) 
VALUES (1, 1, 'Administrador', 'Rol de administrador con acceso completo');
INSERT INTO FIDE_ROLES_TB (id_rol, id_estado, nombre_rol, descripcion) 
VALUES (2, 1, 'Recepcionista', 'Rol de recepcionista con acceso limitado');
INSERT INTO FIDE_ROLES_TB (id_rol, id_estado, nombre_rol, descripcion) 
VALUES (3, 1, 'Huésped', 'Rol de usuario con acceso a reservas y pagos');
INSERT INTO FIDE_ROLES_TB (id_rol, id_estado, nombre_rol, descripcion) 
VALUES (4, 1, 'Mantenimiento', 'Rol de encargado de mantenimiento');
INSERT INTO FIDE_ROLES_TB (id_rol, id_estado, nombre_rol, descripcion) 
VALUES (5, 1, 'Limpiador', 'Rol de encargado de la limpieza de habitaciones');



INSERT INTO FIDE_MONEDA_TB (id_moneda, codigo_moneda, nombre_moneda) 
VALUES (1, 'CRC', 'Colón Costarricense');
INSERT INTO FIDE_MONEDA_TB (id_moneda, codigo_moneda, nombre_moneda) 
VALUES (2, 'USD', 'Dólar Estadounidense');
INSERT INTO FIDE_MONEDA_TB (id_moneda, codigo_moneda, nombre_moneda) 
VALUES (3, 'CAD', 'Dólar Canadiense');
INSERT INTO FIDE_MONEDA_TB (id_moneda, codigo_moneda, nombre_moneda) 
VALUES (4, 'MXN', 'Peso Mexicano');
INSERT INTO FIDE_MONEDA_TB (id_moneda, codigo_moneda, nombre_moneda) 
VALUES (5, 'PAB', 'Balboa');




INSERT INTO FIDE_TIPO_MANTENIMIENTO_TB (id_tipo_mantenimiento, tipo_mantenimiento) 
VALUES (1, 'Reparación');
INSERT INTO FIDE_TIPO_MANTENIMIENTO_TB (id_tipo_mantenimiento, tipo_mantenimiento) 
VALUES (2, 'Limpieza profunda');
INSERT INTO FIDE_TIPO_MANTENIMIENTO_TB (id_tipo_mantenimiento, tipo_mantenimiento) 
VALUES (3, 'Pintura');
INSERT INTO FIDE_TIPO_MANTENIMIENTO_TB (id_tipo_mantenimiento, tipo_mantenimiento) 
VALUES (4, 'Instalación eléctrica');
INSERT INTO FIDE_TIPO_MANTENIMIENTO_TB (id_tipo_mantenimiento, tipo_mantenimiento) 
VALUES (5, 'Aire acondicionado');




INSERT INTO FIDE_TIPO_PROMOCION_TB (id_tipo_promocion, nombre, descripcion) 
VALUES (1, 'Descuento', 'Descuento sobre el precio total');
INSERT INTO FIDE_TIPO_PROMOCION_TB (id_tipo_promocion, nombre, descripcion) 
VALUES (2, 'Oferta Especial', 'Oferta con precio reducido por tiempo limitado');
INSERT INTO FIDE_TIPO_PROMOCION_TB (id_tipo_promocion, nombre, descripcion) 
VALUES (3, 'Paquete', 'Promoción por compra de paquete de servicios');
INSERT INTO FIDE_TIPO_PROMOCION_TB (id_tipo_promocion, nombre, descripcion) 
VALUES (4, '2x1', 'Promoción 2x1 en reservas de habitaciones');
INSERT INTO FIDE_TIPO_PROMOCION_TB (id_tipo_promocion, nombre, descripcion) 
VALUES (5, 'Gratis', 'Promoción con servicios gratuitos al reservar habitación');



INSERT INTO FIDE_USUARIOS_TB (id_usuario, id_rol, id_estado, id_nacionalidad, id_direccion, nombre, apellidos, cedula, telefono, correo, contrasena, fecha_nacimiento) 
VALUES (1, 1, 1, 1, 1, 'Carlos', 'Pérez', '123456789', '8881234', 'carlos.perez@gmail.com', 'password1', TO_DATE('1985-05-15', 'yyyy-mm-dd'));
INSERT INTO FIDE_USUARIOS_TB (id_usuario, id_rol, id_estado, id_nacionalidad, id_direccion, nombre, apellidos, cedula, telefono, correo, contrasena, fecha_nacimiento) 
VALUES (2, 2, 1, 2, 2, 'Laura', 'González', '987654321', '7774567', 'laura.gonzalez@gmail.com', 'password2', TO_DATE('1990-06-20', 'yyyy-mm-dd'));
INSERT INTO FIDE_USUARIOS_TB (id_usuario, id_rol, id_estado, id_nacionalidad, id_direccion, nombre, apellidos, cedula, telefono, correo, contrasena, fecha_nacimiento) 
VALUES (3, 3, 1, 3, 3, 'Andrés', 'Martínez', '555123456', '9112233', 'andres.martinez@hotmail.com', 'password3', TO_DATE('1992-07-10', 'yyyy-mm-dd'));
INSERT INTO FIDE_USUARIOS_TB (id_usuario, id_rol, id_estado, id_nacionalidad, id_direccion, nombre, apellidos, cedula, telefono, correo, contrasena, fecha_nacimiento) 
VALUES (4, 4, 1, 4, 4, 'Susana', 'Fernández', '444654321', '9001122', 'susana.fernandez@gmail.com', 'password4', TO_DATE('1987-03-18', 'yyyy-mm-dd'));
INSERT INTO FIDE_USUARIOS_TB (id_usuario, id_rol, id_estado, id_nacionalidad, id_direccion, nombre, apellidos, cedula, telefono, correo, contrasena, fecha_nacimiento) 
VALUES (5, 5, 1, 5, 5, 'Ricardo', 'Sánchez', '333789654', '9222334', 'ricardo.sanchez@yahoo.com', 'password5', TO_DATE('1995-08-25', 'yyyy-mm-dd'));


INSERT INTO FIDE_HOTELES_TB (id_hotel, id_estado, nombre_hotel, ubicacion, telefono) 
VALUES (1, 1, 'Hotel Costa Rica', 'San José, Costa Rica', '25896245');
INSERT INTO FIDE_HOTELES_TB (id_hotel, id_estado, nombre_hotel, ubicacion, telefono) 
VALUES (2, 1, 'Hotel Panamá', 'Panamá Ciudad, Panamá', '30347211');
INSERT INTO FIDE_HOTELES_TB (id_hotel, id_estado, nombre_hotel, ubicacion, telefono) 
VALUES (3, 1, 'Hotel Bogotá', 'Bogotá, Colombia', '12390876');
INSERT INTO FIDE_HOTELES_TB (id_hotel, id_estado, nombre_hotel, ubicacion, telefono) 
VALUES (4, 1, 'Hotel Guadalajara', 'Guadalajara, México', '33454567');
INSERT INTO FIDE_HOTELES_TB (id_hotel, id_estado, nombre_hotel, ubicacion, telefono) 
VALUES (5, 1, 'Hotel Buenos Aires', 'Buenos Aires, Argentina', '43123456');


INSERT INTO FIDE_HABITACIONES_TB (id_habitacion, id_hotel, id_moneda, id_estado, numero_habitacion, tipo_habitacion, precio_por_noche, capacidad_personas, estado) 
VALUES (1, 1, 1, 1, '101', 'Sencilla', '50.00', 1, 'Disponible');
INSERT INTO FIDE_HABITACIONES_TB (id_habitacion, id_hotel, id_moneda, id_estado, numero_habitacion, tipo_habitacion, precio_por_noche, capacidad_personas, estado) 
VALUES (2, 1, 2, 1, '102', 'Doble', '100.00', 2, 'Disponible');
INSERT INTO FIDE_HABITACIONES_TB (id_habitacion, id_hotel, id_moneda, id_estado, numero_habitacion, tipo_habitacion, precio_por_noche, capacidad_personas, estado) 
VALUES (3, 2, 3, 1, '201', 'Suite', '150.00', 3, 'Ocupada');
INSERT INTO FIDE_HABITACIONES_TB (id_habitacion, id_hotel, id_moneda, id_estado, numero_habitacion, tipo_habitacion, precio_por_noche, capacidad_personas, estado) 
VALUES (4, 3, 1, 1, '301', 'Presidencial', '300.00', 4, 'Disponible');
INSERT INTO FIDE_HABITACIONES_TB (id_habitacion, id_hotel, id_moneda, id_estado, numero_habitacion, tipo_habitacion, precio_por_noche, capacidad_personas, estado) 
VALUES (5, 4, 2, 1, '401', 'Doble', '120.00', 2, 'Ocupada');


INSERT INTO FIDE_VALORACION_TB (id_valoracion, id_estado, comentario, valoracion, timestamp) 
VALUES (1, 1, 'Excelente servicio, la habitación estuvo perfecta.', 5, SYSTIMESTAMP);
INSERT INTO FIDE_VALORACION_TB (id_valoracion, id_estado, comentario, valoracion, timestamp) 
VALUES (2, 1, 'La comida fue buena, pero la habitación estaba un poco sucia.', 3, SYSTIMESTAMP);
INSERT INTO FIDE_VALORACION_TB (id_valoracion, id_estado, comentario, valoracion, timestamp) 
VALUES (3, 1, 'Muy cómodo y limpio, volvería sin duda.', 5, SYSTIMESTAMP);
INSERT INTO FIDE_VALORACION_TB (id_valoracion, id_estado, comentario, valoracion, timestamp) 
VALUES (4, 1, 'El personal fue amable, pero la habitación necesitaba mantenimiento.', 2, SYSTIMESTAMP);
INSERT INTO FIDE_VALORACION_TB (id_valoracion, id_estado, comentario, valoracion, timestamp) 
VALUES (5, 1, 'Excelente ubicación, pero las instalaciones podrían mejorar.', 4, SYSTIMESTAMP);



INSERT INTO FIDE_CATEGORIA_RESERVAS_TB (id_categoria, id_estado, nombre_categoria, comentarios) 
VALUES (1, 1, 'Estandar', 'Categoría básica con servicios estándar');
INSERT INTO FIDE_CATEGORIA_RESERVAS_TB (id_categoria, id_estado, nombre_categoria, comentarios) 
VALUES (2, 1, 'Ejecutiva', 'Categoría con servicios mejorados');
INSERT INTO FIDE_CATEGORIA_RESERVAS_TB (id_categoria, id_estado, nombre_categoria, comentarios) 
VALUES (3, 1, 'Premium', 'Categoría con todos los servicios de lujo');
INSERT INTO FIDE_CATEGORIA_RESERVAS_TB (id_categoria, id_estado, nombre_categoria, comentarios) 
VALUES (4, 1, 'Suites', 'Categoría exclusiva para suites de lujo');
INSERT INTO FIDE_CATEGORIA_RESERVAS_TB (id_categoria, id_estado, nombre_categoria, comentarios) 
VALUES (5, 1, 'Larga Estancia', 'Categoría para clientes que reservan por períodos largos');



INSERT INTO FIDE_RESERVAS_TB (id_reservacion, id_usuario, id_hotel, id_categoria, id_habitacion, id_valoracion, id_moneda, id_estado, fecha_inicio, fecha_cierre, hora, precio_unitario, nombre, descripcion)
VALUES (1, 1, 1, 2, 1, 1, 1, 1, TO_DATE('2024-11-01', 'yyyy-mm-dd'), TO_DATE('2024-11-05', 'yyyy-mm-dd'), SYSTIMESTAMP, 50.00, 'Reserva de habitación doble', 'Reserva para 2 noches en habitación doble.');
INSERT INTO FIDE_RESERVAS_TB (id_reservacion, id_usuario, id_hotel, id_categoria, id_habitacion, id_valoracion, id_moneda, id_estado, fecha_inicio, fecha_cierre, hora, precio_unitario, nombre, descripcion)
VALUES (2, 2, 2, 3, 2, 3, 2, 1, TO_DATE('2024-11-02', 'yyyy-mm-dd'), TO_DATE('2024-11-06', 'yyyy-mm-dd'), SYSTIMESTAMP, 100.00, 'Reserva en suite', 'Reserva para 4 noches en una suite.');
INSERT INTO FIDE_RESERVAS_TB (id_reservacion, id_usuario, id_hotel, id_categoria, id_habitacion, id_valoracion, id_moneda, id_estado, fecha_inicio, fecha_cierre, hora, precio_unitario, nombre, descripcion)
VALUES (3, 3, 3, 4, 3, 2, 3, 1, TO_DATE('2024-11-10', 'yyyy-mm-dd'), TO_DATE('2024-11-15', 'yyyy-mm-dd'), SYSTIMESTAMP, 150.00, 'Reserva presidencial', 'Reserva en habitación presidencial de lujo.');
INSERT INTO FIDE_RESERVAS_TB (id_reservacion, id_usuario, id_hotel, id_categoria, id_habitacion, id_valoracion, id_moneda, id_estado, fecha_inicio, fecha_cierre, hora, precio_unitario, nombre, descripcion)
VALUES (4, 4, 4, 2, 4, 4, 1, 1, TO_DATE('2024-11-12', 'yyyy-mm-dd'), TO_DATE('2024-11-14', 'yyyy-mm-dd'), SYSTIMESTAMP, 120.00, 'Reserva en habitación doble', 'Reserva de 2 noches en habitación doble con vista al mar.');
INSERT INTO FIDE_RESERVAS_TB (id_reservacion, id_usuario, id_hotel, id_categoria, id_habitacion, id_valoracion, id_moneda, id_estado, fecha_inicio, fecha_cierre, hora, precio_unitario, nombre, descripcion)
VALUES (5, 5, 5, 1, 5, 5, 2, 1, TO_DATE('2024-11-05', 'yyyy-mm-dd'), TO_DATE('2024-11-10', 'yyyy-mm-dd'), SYSTIMESTAMP, 80.00, 'Reserva larga estancia', 'Reserva de 5 noches en habitación estándar.');


INSERT INTO FIDE_PROMOCIONES_TB (id_promocion, id_tipo_promocion, id_reservacion, id_moneda, id_estado, descripcion, nombre_promocion, fecha_inicio, fecha_fin, porcentaje_promocion, descuento)
VALUES (1, 1, 1, 1, 1, 'Descuento del 10% por reserva anticipada.', 'Descuento anticipado', TO_DATE('2024-11-01', 'yyyy-mm-dd'), TO_DATE('2024-11-05', 'yyyy-mm-dd'), 10.00, NULL);
INSERT INTO FIDE_PROMOCIONES_TB (id_promocion, id_tipo_promocion, id_reservacion, id_moneda, id_estado, descripcion, nombre_promocion, fecha_inicio, fecha_fin, porcentaje_promocion, descuento)
VALUES (2, 2, 2, 2, 1, 'Oferta especial para reservas de 3 noches o más.', 'Oferta especial 3x2', TO_DATE('2024-11-01', 'yyyy-mm-dd'), TO_DATE('2024-11-10', 'yyyy-mm-dd'), NULL, 150.00);
INSERT INTO FIDE_PROMOCIONES_TB (id_promocion, id_tipo_promocion, id_reservacion, id_moneda, id_estado, descripcion, nombre_promocion, fecha_inicio, fecha_fin, porcentaje_promocion, descuento)
VALUES (3, 3, 3, 3, 1, 'Paquete de luna de miel con todo incluido.', 'Paquete luna de miel', TO_DATE('2024-11-01', 'yyyy-mm-dd'), TO_DATE('2024-11-20', 'yyyy-mm-dd'), NULL, 200.00);
INSERT INTO FIDE_PROMOCIONES_TB (id_promocion, id_tipo_promocion, id_reservacion, id_moneda, id_estado, descripcion, nombre_promocion, fecha_inicio, fecha_fin, porcentaje_promocion, descuento)
VALUES (4, 4, 4, 1, 1, '2x1 en todas las habitaciones durante el mes de noviembre.', 'Promoción 2x1 noviembre', TO_DATE('2024-11-01', 'yyyy-mm-dd'), TO_DATE('2024-11-30', 'yyyy-mm-dd'), NULL, NULL);
INSERT INTO FIDE_PROMOCIONES_TB (id_promocion, id_tipo_promocion, id_reservacion, id_moneda, id_estado, descripcion, nombre_promocion, fecha_inicio, fecha_fin, porcentaje_promocion, descuento)
VALUES (5, 5, 5, 2, 1, 'Descuento de 50% en el servicio de spa para estancias prolongadas.', 'Descuento en spa', TO_DATE('2024-11-05', 'yyyy-mm-dd'), TO_DATE('2024-11-15', 'yyyy-mm-dd'), NULL, 50.00);


INSERT INTO FIDE_IMPUESTOS_TB (id_impuesto, id_pais, id_estado, nombre_impuesto, porcentaje) 
VALUES (1, 1, 1, 'IVA', 13.00);
INSERT INTO FIDE_IMPUESTOS_TB (id_impuesto, id_pais, id_estado, nombre_impuesto, porcentaje) 
VALUES (2, 2, 1, 'IVA', 7.00);
INSERT INTO FIDE_IMPUESTOS_TB (id_impuesto, id_pais, id_estado, nombre_impuesto, porcentaje) 
VALUES (3, 3, 1, 'IVA', 16.00);
INSERT INTO FIDE_IMPUESTOS_TB (id_impuesto, id_pais, id_estado, nombre_impuesto, porcentaje) 
VALUES (4, 4, 1, 'IVA', 18.00);
INSERT INTO FIDE_IMPUESTOS_TB (id_impuesto, id_pais, id_estado, nombre_impuesto, porcentaje) 
VALUES (5, 5, 1, 'IVA', 21.00);



INSERT INTO FIDE_FACTURAS_TB (id_factura, id_moneda, id_usuario, id_impuesto, id_promocion, id_estado, subtotal, total) 
VALUES (1, 1, 1, 1, 1, 1, 180.00, 203.40);
INSERT INTO FIDE_FACTURAS_TB (id_factura, id_moneda, id_usuario, id_impuesto, id_promocion, id_estado, subtotal, total) 
VALUES (2, 2, 2, 2, 2, 1, 400.00, 430.00);
INSERT INTO FIDE_FACTURAS_TB (id_factura, id_moneda, id_usuario, id_impuesto, id_promocion, id_estado, subtotal, total) 
VALUES (3, 3, 3, 3, 3, 1, 600.00, 696.00);
INSERT INTO FIDE_FACTURAS_TB (id_factura, id_moneda, id_usuario, id_impuesto, id_promocion, id_estado, subtotal, total) 
VALUES (4, 1, 4, 4, 4, 1, 240.00, 282.00);
INSERT INTO FIDE_FACTURAS_TB (id_factura, id_moneda, id_usuario, id_impuesto, id_promocion, id_estado, subtotal, total) 
VALUES (5, 2, 5, 5, 5, 1, 400.00, 470.00);


INSERT INTO FIDE_DETALLE_FACTURA_TB (id_detalle_factura, id_factura, id_reservacion, id_promocion, id_moneda, id_estado, cantidad, total_linea) 
VALUES (1, 1, 1, 1, 1, 1, '1 noche', 203.40);
INSERT INTO FIDE_DETALLE_FACTURA_TB (id_detalle_factura, id_factura, id_reservacion, id_promocion, id_moneda, id_estado, cantidad, total_linea) 
VALUES (2, 2, 2, 2, 2, 1, '2 noches', 430.00);
INSERT INTO FIDE_DETALLE_FACTURA_TB (id_detalle_factura, id_factura, id_reservacion, id_promocion, id_moneda, id_estado, cantidad, total_linea) 
VALUES (3, 3, 3, 3, 3, 1, '3 noches', 696.00);
INSERT INTO FIDE_DETALLE_FACTURA_TB (id_detalle_factura, id_factura, id_reservacion, id_promocion, id_moneda, id_estado, cantidad, total_linea) 
VALUES (4, 4, 4, 4, 1, 1, '2 noches', 282.00);
INSERT INTO FIDE_DETALLE_FACTURA_TB (id_detalle_factura, id_factura, id_reservacion, id_promocion, id_moneda, id_estado, cantidad, total_linea) 
VALUES (5, 5, 5, 5, 2, 1, '5 noches', 470.00);


INSERT INTO FIDE_RESERVAS_FACTURA_TB (id_factura, id_reservacion)
VALUES (1, 1);
INSERT INTO FIDE_RESERVAS_FACTURA_TB (id_factura, id_reservacion)
VALUES (2, 2);
INSERT INTO FIDE_RESERVAS_FACTURA_TB (id_factura, id_reservacion)
VALUES (3, 3);
INSERT INTO FIDE_RESERVAS_FACTURA_TB (id_factura, id_reservacion)
VALUES (4, 4);
INSERT INTO FIDE_RESERVAS_FACTURA_TB (id_factura, id_reservacion)
VALUES (5, 5);


INSERT INTO FIDE_TIPO_CAMBIO_TB (id_tipo_cambio, id_moneda, fecha, tasa_cambio)
VALUES (1, 1, TO_DATE('2024-11-01', 'yyyy-mm-dd'), 1.00);
INSERT INTO FIDE_TIPO_CAMBIO_TB (id_tipo_cambio, id_moneda, fecha, tasa_cambio)
VALUES (2, 2, TO_DATE('2024-11-01', 'yyyy-mm-dd'), 0.85);
INSERT INTO FIDE_TIPO_CAMBIO_TB (id_tipo_cambio, id_moneda, fecha, tasa_cambio)
VALUES (3, 3, TO_DATE('2024-11-01', 'yyyy-mm-dd'), 0.90);
INSERT INTO FIDE_TIPO_CAMBIO_TB (id_tipo_cambio, id_moneda, fecha, tasa_cambio)
VALUES (4, 4, TO_DATE('2024-11-01', 'yyyy-mm-dd'), 1.10);
INSERT INTO FIDE_TIPO_CAMBIO_TB (id_tipo_cambio, id_moneda, fecha, tasa_cambio)
VALUES (5, 5, TO_DATE('2024-11-01', 'yyyy-mm-dd'), 1.20);




INSERT INTO FIDE_MANTENIMIENTO_TB (id_mantenimiento, id_habitacion, id_estado, id_tipo_mantenimiento, fecha_mantenimiento)
VALUES (1, 1, 1, 1, TO_DATE('2024-11-01', 'yyyy-mm-dd'));
INSERT INTO FIDE_MANTENIMIENTO_TB (id_mantenimiento, id_habitacion, id_estado, id_tipo_mantenimiento, fecha_mantenimiento)
VALUES (2, 2, 1, 2, TO_DATE('2024-11-02', 'yyyy-mm-dd'));
INSERT INTO FIDE_MANTENIMIENTO_TB (id_mantenimiento, id_habitacion, id_estado, id_tipo_mantenimiento, fecha_mantenimiento)
VALUES (3, 3, 1, 3, TO_DATE('2024-11-05', 'yyyy-mm-dd'));
INSERT INTO FIDE_MANTENIMIENTO_TB (id_mantenimiento, id_habitacion, id_estado, id_tipo_mantenimiento, fecha_mantenimiento)
VALUES (4, 4, 1, 1, TO_DATE('2024-11-10', 'yyyy-mm-dd'));
INSERT INTO FIDE_MANTENIMIENTO_TB (id_mantenimiento, id_habitacion, id_estado, id_tipo_mantenimiento, fecha_mantenimiento)
VALUES (5, 5, 1, 2, TO_DATE('2024-11-12', 'yyyy-mm-dd'));


INSERT INTO FIDE_LIMPIEZA_HABITACIONES_TB (id_limpieza, id_habitacion, id_usuario, id_estado, fecha_limpieza, comentarios)
VALUES (1, 1, 1, 1, TO_DATE('2024-11-01', 'yyyy-mm-dd'), 'Limpieza diaria completa.');
INSERT INTO FIDE_LIMPIEZA_HABITACIONES_TB (id_limpieza, id_habitacion, id_usuario, id_estado, fecha_limpieza, comentarios)
VALUES (2, 2, 2, 1, TO_DATE('2024-11-02', 'yyyy-mm-dd'), 'Limpieza de mantención.');
INSERT INTO FIDE_LIMPIEZA_HABITACIONES_TB (id_limpieza, id_habitacion, id_usuario, id_estado, fecha_limpieza, comentarios)
VALUES (3, 3, 3, 1, TO_DATE('2024-11-03', 'yyyy-mm-dd'), 'Cambio de sábanas y toallas.');
INSERT INTO FIDE_LIMPIEZA_HABITACIONES_TB (id_limpieza, id_habitacion, id_usuario, id_estado, fecha_limpieza, comentarios)
VALUES (4, 4, 4, 1, TO_DATE('2024-11-04', 'yyyy-mm-dd'), 'Limpieza de rutina con desinfección.');
INSERT INTO FIDE_LIMPIEZA_HABITACIONES_TB (id_limpieza, id_habitacion, id_usuario, id_estado, fecha_limpieza, comentarios)
VALUES (5, 5, 5, 1, TO_DATE('2024-11-05', 'yyyy-mm-dd'), 'Limpieza completa después del check-out.');

--/////////////////////////////////////