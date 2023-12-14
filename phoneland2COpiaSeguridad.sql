-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-10-2023 a las 08:49:37
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

drop database if exists phonelandCompleta2;
CREATE database phonelandCompleta2;
USE phonelandCompleta2;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";



/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `phoneland1`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `Id_CLIENTES` int(2) NOT NULL,
  `FECHA_DE_ALTA` varchar(9) DEFAULT NULL,
  `CIF_NIF` varchar(9) DEFAULT NULL,
  `NOMBRE` varchar(17) DEFAULT NULL,
  `DIRECCION` varchar(18) DEFAULT NULL,
  `CP` int(5) DEFAULT NULL,
  `CIUDAD` varchar(7) DEFAULT NULL,
  `PROVINCIA` varchar(6) DEFAULT NULL,
  `EMPRESA` varchar(2) DEFAULT NULL,
  `COMO_NOS_CONOCIO` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`Id_CLIENTES`, `FECHA_DE_ALTA`, `CIF_NIF`, `NOMBRE`, `DIRECCION`, `CP`, `CIUDAD`, `PROVINCIA`, `EMPRESA`, `COMO_NOS_CONOCIO`) VALUES
(1, '15-nov-20', '11111111A', 'ANA PEREZ', 'CALLE SOL,12', 29002, 'GRANADA', 'MALAGA', 'NO', 'GOOGLE'),
(2, '16-nov-20', '33241111J', 'EVA RUIZ', 'CALLE LUNA,13', 29003, 'SEVILLA', 'MALAGA', 'NO', 'GOOGLE'),
(3, '19-nov-20', '11111116A', 'ALBERTO GONZALEZ', 'AV.ANDALUCIA,14', 29005, 'MALAGA', 'MALAGA', 'NO', 'GOOGLE'),
(4, '21-nov-20', '33111111A', 'MARIO VARGAS', 'AV. ANDALUCIA, 15', 29005, 'MALAGA', 'MALAGA', 'NO', 'GOOGLE'),
(5, '22-nov-20', '11341111A', 'ALFREDO SANEZ', 'CALLE CUARTELES 1', 29002, 'MALAGA', 'MALAGA', 'NO', 'GOOGLE'),
(6, '23-nov-20', '34113411C', 'BARTOLOME SANCHEZ', 'CALLE SALISTRE ,12', 29002, 'MALAGA', 'MALAGA', 'NO', 'GOOGLE'),
(7, '24-nov-20', '11111111A', 'CARMEN RUIZ perez', 'HUELIN, 23', 29002, 'MALAGA', 'MALAGA', 'NO', 'REDES SOCIALES'),
(8, '26-nov-20', '33111111J', 'MARIA RUIZ', 'CALLE SALISTRE,14', 29002, 'MALAGA', 'MALAGA', 'NO', 'REDES SOCILAES'),
(9, '28-nov-20', '11111111A', 'MARIO SANCHEZ', 'CALLE SALISTRE,22', 29002, 'MALAGA', 'MALAGA', 'NO', 'REDES SOCIALES'),
(10, '03-dic-20', 'B33111111', 'CORSAN', 'CALLE CUARTELES', 29002, 'MALAGA', 'MALAGA', 'SI', 'REDES SOCIALES'),
(11, '05-dic-20', 'A11111111', 'FERROVIAL', 'HUELIN ,34', 29002, 'SEVILLA', 'MALAGA', 'SI', 'REDES SOCIALES'),
(12, '06-dic-20', 'C33111111', 'CORTES INGLES', 'AVD , AMERICAS 12', 29005, 'MALAGA', 'MALAGA', 'SI', 'REDES SOCIALES'),
(13, '10-feb-20', 'C11111111', 'ENDESA', 'AVD, AMERICAS 14', 29005, 'MALAGA', 'MALAGA', 'SI', 'REDES SOCIALES'),
(14, '11-feb-20', 'C11111111', 'MICROSOFT IBERICA', 'AVD,AMERICAS 15', 29005, 'MALAGA', 'MALAGA', 'SI', 'REDES SOCIALES'),
(102, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(121, NULL, NULL, 'Gandalf', NULL, NULL, NULL, NULL, NULL, NULL);

--
-- Disparadores `clientes`
--
DELIMITER $$
CREATE TRIGGER `TRIGGER1` BEFORE INSERT ON `clientes` FOR EACH ROW BEGIN
    INSERT INTO clientes_copia  VALUES (NEW.id_clientes,NEW.nombre);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes_copia`
--

CREATE TABLE `clientes_copia` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes_copia`
--

INSERT INTO `clientes_copia` (`id`, `nombre`) VALUES
(121, 'Gandalf');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_PRODUCTO` int(2) NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `NOMBRE` varchar(58) DEFAULT NULL,
  `FABRICANTE` varchar(7) DEFAULT NULL,
  `PRECIO` varchar(8) DEFAULT NULL,
  `PVP` decimal(10,2) DEFAULT NULL,
  `Descripcion` varchar(50) DEFAULT NULL,
  `Columna 8` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_PRODUCTO`, `id_proveedor`, `NOMBRE`, `FABRICANTE`, `PRECIO`, `PVP`, `Descripcion`, `Columna 8`) VALUES
(1, 1, 'XIAOMI IMI10LITE5G 6GB+128GBAzulBoreal', 'XIAOMI', '220,00 €', NULL, 'Alta gama usando en entornos de empresa', NULL),
(2, 2, 'SAMSUN GALAXYS20-FE-5G 8GB+256 AZUL MARINO MOVIL LIBRE', 'SAMSUNG', '650,00 €', NULL, NULL, NULL),
(3, 3, 'APPLE Iphone 11 128GB BLANCO MOVIL LIBRE', 'APPLE', '650,00 €', NULL, NULL, NULL),
(4, 1, 'XIAOMI MI 10T Pro 8 GB+256 GB Lunar Silver movil libre', 'XIOAMI', '580,00 €', NULL, 'gama baja entorno hogar', NULL),
(5, 2, 'SAMSUN GALAYI S20 FE 5G 8GB + 256 violeta movil libre', 'SAMSUNG', '600,00 €', NULL, NULL, NULL),
(6, 1, 'XIAOMI REDMI NOTE 9,4GB + 128 GB Polar white', 'XIOAMI', '100,00 €', NULL, NULL, NULL),
(7, 1, 'XIOAMI Mi 10 Lite 5G 6GB +128 Gris CoSmico', 'XIOAMI', '189,00 €', NULL, NULL, NULL),
(8, 2, 'SAMNUNG GALAXI A31 AZUL 4 GB + 64 GB Movil Libre', 'SAMSUNG', '100,00 €', NULL, NULL, NULL),
(9, 3, 'APPLE IPHONE 11 128GB Malva movil libre', 'APPLE', '650,00 €', NULL, 'alta gama entorno empresa', NULL),
(10, 2, 'SAMSUN GALAXY A51 4+128GB AZUL MOVIL LIBRE', 'SAMSUNG', '190,00 €', NULL, NULL, NULL),
(11, 4, 'LG K30 NEGRO 2GB + 16 GB MOVIL LIBRE', 'LG', '70,00 €', NULL, NULL, NULL),
(12, 1, 'iaomi Redmi Note 8 Pro Mineral Grey 128 GB + 6 GB Móvil li', 'XIOAMI', '180,00 €', NULL, NULL, NULL),
(13, 2, 'Samsung Galaxy S10 Lite 8 GB + 128 GB Azul móvil libre', 'SAMSUNG', '300,00 €', NULL, 'alta gama entorno hogar', NULL),
(14, 2, 'Samsung Galaxy S10 Lite 8 GB + 128 GB Azul móvil libre', 'APPLE', '600,00 €', NULL, NULL, NULL),
(15, 2, 'amsung Galaxy A21s 4 + 64 GB blanco móvil libre', 'SAMSUNG', '100,00 €', NULL, NULL, NULL),
(16, 2, 'Bronze móvil libre', 'SAMSUNG', '850,00 €', NULL, 'baja gama entorno empresa', NULL),
(17, 1, 'Xiaomi MI 10T Pro 8 GB + 256 GB Cosmic Black móvil libre', 'XIOAMI', '580,00 €', NULL, NULL, NULL),
(18, 5, 'Huawei P40 Lite 6+128 GB Verde móvil libre', 'HUAWEI', '190,00 €', NULL, NULL, NULL),
(19, 1, 'LG K51S 3+64 GB titán móvil libr', 'LG', '100,00 €', NULL, NULL, NULL),
(20, 6, 'LENOVO ONM', 'LENOVO', '200', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id_proveedor` int(11) NOT NULL,
  `nombre_proveedor` varchar(30) NOT NULL,
  `tlf_proveedor` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id_proveedor`, `nombre_proveedor`, `tlf_proveedor`) VALUES
(1, 'Xiaomi', '123456789'),
(2, 'Samsung', '123456789'),
(3, 'Apple', ''),
(4, 'LG', ''),
(5, 'Huawei', ''),
(6, 'LENOVO', ''),
(7, 'HP', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `Id_VENTAS` int(2) NOT NULL,
  `id_PRODUCTOS` int(2) DEFAULT NULL,
  `Id_CLIENTES` int(2) DEFAULT NULL,
  `FECHA_DE_VENTA` varchar(9) DEFAULT NULL,
  `UNIDADES` int(2) DEFAULT NULL,
  `FEMISION` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`Id_VENTAS`, `id_PRODUCTOS`, `Id_CLIENTES`, `FECHA_DE_VENTA`, `UNIDADES`, `FEMISION`) VALUES
(1, 1, 6, '01-oct-20', 10, '2023-03-15'),
(52, 2, 13, '16-sep-20', 1, '2023-03-15'),
(53, 1, 13, '30-nov-20', 1, '2023-03-15'),
(54, 10, 6, '18-dic-20', 1, '2023-03-15'),
(55, 8, 4, '19-dic-20', 1, '2023-03-15'),
(56, 7, 6, '20-dic-20', 1, NULL),
(58, 11, 4, '22-dic-20', 1, NULL),
(60, 5, 14, '24-dic-20', 1, NULL),
(61, 2, 14, '18-nov-20', 1, NULL),
(62, 2, 11, '26-dic-20', 1, NULL),
(64, 4, 2, '28-dic-20', 1, NULL),
(65, 6, 12, '29-dic-20', 1, NULL),
(68, 5, 8, '01-nov-20', 1, NULL),
(69, 9, 1, '02-ene-21', 1, NULL),
(70, 12, 10, '03-ene-21', 1, NULL),
(71, 12, 11, '04-ene-21', 1, NULL),
(72, 8, 7, '05-ene-21', 1, NULL),
(73, 3, 2, '01-oct-20', 1, NULL),
(74, 12, 6, '07-ene-21', 1, NULL),
(75, 9, 14, '08-ene-21', 1, NULL),
(76, 3, 13, '09-ene-21', 1, NULL),
(77, 12, 12, '10-ene-21', 1, NULL),
(78, 10, 2, '11-ene-21', 1, NULL),
(80, 6, 6, '13-ene-21', 1, NULL),
(81, 12, 9, '14-ene-21', 1, NULL),
(82, 3, 3, '15-ene-21', 1, NULL),
(85, 7, 7, '18-ene-21', 1, NULL),
(86, 8, 6, '19-ene-21', 1, NULL),
(87, 10, 14, '20-ene-21', 1, NULL),
(89, 9, 10, '22-ene-21', 1, NULL),
(90, 8, 13, '23-ene-21', 1, NULL),
(91, 1, 6, '11-nov-20', 1, NULL),
(92, 11, 13, '25-ene-21', 1, NULL),
(94, 2, 11, '27-ene-21', 1, NULL),
(95, 14, 4, '28-ene-21', 1, NULL),
(96, 8, 2, '29-ene-21', 1, NULL),
(99, 7, 13, '01-feb-21', 1, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`Id_CLIENTES`);

--
-- Indices de la tabla `clientes_copia`
--
ALTER TABLE `clientes_copia`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_PRODUCTO`),
  ADD KEY `id_proveedor` (`id_proveedor`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id_proveedor`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`Id_VENTAS`),
  ADD KEY `id_PRODUCTOS` (`id_PRODUCTOS`),
  ADD KEY `Id_CLIENTES` (`Id_CLIENTES`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id_proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_PRODUCTOS`) REFERENCES `productos` (`id_PRODUCTO`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`Id_CLIENTES`) REFERENCES `clientes` (`Id_CLIENTES`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;



/* PRIMERA CLASE*/
set @iva:=0.21;
set @descuento:=0.10;
SELECT precio,round(precio*@iva,2) as iva, 
precio+precio*@iva as PrecioFinal, round(precio*@descuento,2) as descuento,
precio - precio*@descuento as PrecioConDescuento,
precio+(precio*@iva) - (precio*@descuento) as Total,
unidades,
(precio+(precio*@iva) - (precio*@descuento))*v.unidades as TotalConUnidades
FROM productos p
JOIN ventas v on v.id_productos=p.id_PRODUCTO;

SELECT CONCAT_WS(" ",clientes.nombre,clientes.ciudad) FROM clientes;
SELECT LOWER(nombre) from clientes;
SELECT SUBSTR(nombre,2,LENGTH(nombre)) as Nombre_cliente FROM clientes;

SELECT ventas.id_productos from ventas;
SELECT distinct(ventas.id_productos) from ventas;

SELECT nombre from clientes where nombre like "A%";
SELECT * from clientes where nombre is null;

SELECT MAX(precio) as PrecioMasAlto,MIN(precio) as PrecioMasBajo, AVG(precio) as PrecioMedio 
from productos;

SELECT count(*), count(descripcion) from productos;
SELECT count(distinct(fabricante)) from productos;

SELECT c.id_CLIENTES, v.Fecha_de_venta from clientes c
Inner join ventas v on v.id_clientes=c.id_clientes;

SELECT c.nombre, c.direccion,substr(p.nombre,length(p.nombre)-10,length(p.nombre)) as nombre_producto,
p.precio, p.precio+round(precio*@iva,2) as Precio_con_iva, 
p.precio+round(precio*@iva,2)-(p.precio*@descuento) as Precio_Final,
v.fecha_de_venta, v.unidades 
from clientes c
inner join ventas v on c.id_clientes = v.id_clientes
inner join productos p on p.id_producto = v.id_productos;

CREATE table prueba(fecha date);
insert into prueba values('2023-07-05'),('2021-12-10');

select year(fecha), month(fecha), day(fecha),
date_format(fecha,'%d-%m-%y') as Formato_de_fecha,
dayname(fecha) from prueba;

SELECT ventas.id_clientes, clientes.nombre from clientes inner join ventas
ON clientes.id_clientes=ventas.id_clientes 
GROUP BY ventas.id_clientes
HAVING COUNT(*) >= 3;



/* CLASE 26/10/2023 */
SELECT COUNT(*) as TotalProductos from productos;

SELECT COUNT(DISTINCT id_proveedor) as TotalProveedores from productos;

SELECT COUNT(*) as TotalXiaomi from productos 
where id_proveedor=1;


SELECT nombre,precio from productos
where precio = (SELECT MAX(precio) from productos);

SELECT COUNT(*) as productosApple from productos
where id_proveedor = (SELECT id_proveedor from proveedores
where nombre_proveedor = "Apple");

SELECT MIN(precio) as productosXiaomiBarato from productos
where id_proveedor = (SELECT id_proveedor from proveedores
where nombre_proveedor = "Xiaomi");

SELECT SUM(precio) as productosXiaomi from productos
where id_proveedor = (SELECT id_proveedor from proveedores
where nombre_proveedor = "Xiaomi");

SELECT MIN(precio) as productoMin,MAX(precio) as productoMax, 
round(AVG(precio),2) as precioMedio, count(*) as totalProductos from productos
where id_proveedor = (SELECT id_proveedor from proveedores
where nombre_proveedor = "Xiaomi");

SELECT nombre from clientes where id_clientes IN (SELECT id_clientes from ventas v 
inner join productos p on v.id_productos=p.id_producto
group by v.id_productos
HAVING avg(p.precio)>(SELECT AVG(precio) from productos));

/*SELECT nombre, round(avg(precio),2) from clientes c 
JOIN ventas v ON v.id_clientes = c.id_clientes
JOIN productos p ON v.id_productos = p.id_producto
WHERE c.id_cliente IN(SELECT v.id_clientes from ventas v
JOIN productos p v.id_productos = p.id_producto
GROUP BY  v.id_clientes HAVING avg(p.precio)>(SELECT AVG(precio) from productos));*/

/*CLASE 2/11 */

SELECT nombre from clientes c WHERE EXISTS 
(SELECT 1 FROM ventas v WHERE v.id_clientes=c.id_clientes);

SELECT nombre from clientes c WHERE NOT EXISTS 
(SELECT 1 FROM ventas v WHERE v.id_clientes=c.id_clientes);

SELECT nombre from clientes WHERE id_clientes NOT IN
(SELECT id_clientes FROM ventas v);

SELECT nombre FROM productos WHERE id_producto IN
(SELECT id_producto FROM ventas WHERE id_producto>10);

DELIMITER $$
DROP PROCEDURE IF EXISTS CalculaPrecioIva2 $$
CREATE PROCEDURE CalculaPrecioIva2 (IN precio DECIMAL(10,2), OUT total DECIMAL(10,2))
BEGIN
	DECLARE iva DECIMAL(10,2);
    SET iva := 0.21;
    SET total := precio + (precio*iva);
END $$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS CalculaEdad $$
CREATE PROCEDURE CalculaEdad (IN edad DECIMAL(3,0), OUT anio DECIMAL(4,0))
BEGIN
	SET anio := 2023 - edad;
END $$
DELIMITER ;


CALL CalculaEdad(15.0,@resultado2);
SELECT concat("Su año de nacimiento es",@resultado2) as añoNacimiento;


CALL CalculaPrecioIva2(100.0,@resultado);
SELECT @resultado;

DELIMITER $$
DROP PROCEDURE IF EXISTS CalcularFactura $$
CREATE PROCEDURE CalcularFactura (IN precio DECIMAL(10,2), OUT ivaS DECIMAL(10,2), OUT total DECIMAL(10,2))
BEGIN
	DECLARE iva DECIMAL(10,2);
    SET iva := 0.21;
    SET ivas := precio*iva;
    SET total := precio + (precio*iva);
END $$
DELIMITER ;

CALL CalcularFactura(100.0,@resIva,@resTotal);
SELECT concat("El iva es: ",@resIva) as Iva,concat("El total es: ",@resTotal) as Total;

DELIMITER $$
DROP PROCEDURE IF EXISTS CalcularFacturaDesc $$
CREATE PROCEDURE CalcularFacturaDesc (IN precio DECIMAL(10,2), OUT ivaS DECIMAL(10,2), 
OUT des DECIMAL(10,2),OUT total DECIMAL(10,2))
BEGIN
	DECLARE iva DECIMAL(10,2);
    IF precio < 1000 then
		SET des := precio*0.10;
	ELSEIF precio <2000 then
		SET des := precio*0.20;
	ELSEIF precio <5000 then
		SET des := precio*0.30;
	ELSEIF precio <10000 then
		SET des := precio*0.40;
    else
		SET des := precio*0.50;
	END IF;
    SET iva := 0.21;
    SET ivas := precio*iva;
    SET total := precio + ivas - des;
END $$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS ImprimirFacturaDesc $$
CREATE PROCEDURE ImprimirFacturaDesc (IN precio DECIMAL(10,2), OUT ivaS DECIMAL(10,2), 
OUT des DECIMAL(10,2),OUT total DECIMAL(10,2))
BEGIN
	CALL CalcularFacturaDesc(100.0,@resIvaDesc,@resDesc,@resTotalDesc);
	SELECT concat("El iva es: ",@resIva2) as Iva,concat("El descuento es: ",@resDesc) as Descuento,
	concat("El total es: ",@resTotalDesc) as Total;
END $$
DELIMITER ;

CALL ImprimirFacturaDesc(100, @I, @Des,@T);


DELIMITER $$
DROP PROCEDURE IF EXISTS CalcularMayoriaEdad $$
CREATE PROCEDURE CalcularMayoriaEdad (IN fecha_nacimiento int, OUT edad int, 
OUT tipo varchar(20))
BEGIN
	DECLARE actual int default 2023;
    SET edad = actual - fecha_nacimiento;
    if edad <10 then
		set tipo = 'Niño';
	ELSEIF edad <18 then
		set tipo = 'Adolescente';
	ELSEIF edad <65 then
		set tipo = 'Adulto';
	ELSE 
		set tipo = 'Jubilado';
	END IF;
    SELECT CONCAT(edad, " ", tipo);
END $$
DELIMITER ;

CALL CalcularMayoriaEdad(2003,@edad,@tipo);

/*clase del 16/11/2023 */

delimiter $$
DROP FUNCTION if EXISTS funcion1 $$
CREATE FUNCTION funcion1(euros decimal(12,2))
RETURNS DECIMAL (10,2) DETERMINISTIC
BEGIN
RETURN euros*68 ;
END $$
delimiter ;

SELECT precio, funcion1(precio) FROM productos;

delimiter $$
	DROP FUNCTION if EXISTS funcionIva $$
	CREATE FUNCTION funcionIva (euros decimal(12,2))
	RETURNS DECIMAL (10,2) DETERMINISTIC
	BEGIN
		RETURN euros+euros*0.21 ;
	END $$
delimiter ;

SELECT precio, funcionIva(precio) as precioConIva FROM productos;

delimiter $$
	DROP FUNCTION if EXISTS funcionDescuento $$
	CREATE FUNCTION funcionDescuento (euros decimal(12,2))
	RETURNS DECIMAL (10,2) DETERMINISTIC
	BEGIN
		if euros > 200 then
			RETURN euros-euros*0.10 ;
        else
			RETURN euros;
        END IF;
	END $$
delimiter ;

SELECT precio, funcionDescuento(precio)  as descuento , 
funcionIva(funcionDescuento(precio)) as descuentoConIva from productos;

delimiter $$
	DROP FUNCTION if EXISTS funcionTotal $$
	CREATE FUNCTION funcionTotal (euros decimal(12,2))
	RETURNS DECIMAL (10,2) DETERMINISTIC
	BEGIN
		RETURN funcionIva(funcionDescuento(euros));
	END $$
delimiter ;

SELECT precio, funcionTotal(precio) as total from productos;



/*CLASE 23/11 */

CREATE TABLE replicaVentas AS 
SELECT * FROM ventas WHERE 1=0;

DELIMITER $$
DROP TRIGGER IF EXISTS TRIGGER1;
CREATE TRIGGER TRIGGER1
BEFORE INSERT ON ventas
FOR EACH ROW
BEGIN
	INSERT INTO replicaVentas (Id_VENTAS, id_PRODUCTOS, Id_CLIENTES, FECHA_DE_VENTA,UNIDADES,FEMISION)
    VALUES (NEW.Id_VENTAS, NEW.id_PRODUCTOS, NEW.Id_CLIENTES,NEW.FECHA_DE_VENTA, NEW.UNIDADES, NEW.FEMISION);
END $$
DELIMITER ;

INSERT INTO ventas(Id_VENTAS, id_PRODUCTOS, Id_CLIENTES, FECHA_DE_VENTA,UNIDADES,FEMISION)
VALUES (7,1,2,'2023-01-01',5,null);

SELECT * FROM replicaVentas;

CREATE TABLE replicaClientes AS 
SELECT * FROM clientes WHERE 1=0;

DELIMITER $$
DROP TRIGGER IF EXISTS TRIGGER2;
CREATE TRIGGER TRIGGER2
BEFORE INSERT ON clientes
FOR EACH ROW
BEGIN
	INSERT INTO replicaClientes (Id_CLIENTES,FECHA_DE_ALTA,CIF_NIF,NOMBRE,DIRECCION,CP,CIUDAD,PROVINCIA,EMPRESA,COMO_NOS_CONOCIO)
    VALUES (NEW.Id_CLIENTES,NEW.FECHA_DE_ALTA,NEW.CIF_NIF,NEW.NOMBRE,NEW.DIRECCION,NEW.CP,NEW.CIUDAD,NEW.PROVINCIA,NEW.EMPRESA,NEW.COMO_NOS_CONOCIO);
END $$
DELIMITER ;

INSERT INTO clientes(Id_CLIENTES,FECHA_DE_ALTA,CIF_NIF,NOMBRE,DIRECCION,CP,CIUDAD,
PROVINCIA,EMPRESA,COMO_NOS_CONOCIO) VALUES (98,'10-dic-03','12345678','Juani',
'direccion1',3456,'MALAGA','MALAGA','SI','GOOGLE');

SELECT * FROM replicaClientes;


CREATE TABLE replicaProductos AS 
SELECT id_PRODUCTO,id_proveedor,NOMBRE,FABRICANTE,PRECIO,PVP,Descripcion 
FROM productos WHERE 1=0;

DELIMITER $$
DROP TRIGGER IF EXISTS TRIGGER3;
CREATE TRIGGER TRIGGER3
BEFORE INSERT ON productos
FOR EACH ROW
BEGIN
	INSERT INTO replicaProductos (id_PRODUCTO,id_proveedor,NOMBRE,FABRICANTE,PRECIO,PVP,Descripcion)
    VALUES (NEW.id_PRODUCTO,NEW.id_proveedor,NEW.NOMBRE,NEW.FABRICANTE,NEW.PRECIO,NEW.PVP,NEW.Descripcion);
END $$
DELIMITER ;

INSERT INTO productos(id_PRODUCTO,id_proveedor,NOMBRE,FABRICANTE,PRECIO,PVP,Descripcion) 
VALUES (105,1,'Manzana','Apple',87,null,'una manzana');

SELECT * FROM replicaProductos;


DELIMITER $$
DROP TRIGGER IF EXISTS TRIGGER4;
CREATE TRIGGER TRIGGER4
AFTER UPDATE ON ventas
FOR EACH ROW
BEGIN
	UPDATE replicaVentas
    SET id_PRODUCTOS = NEW.id_PRODUCTOS,
    Id_CLIENTES = NEW.Id_CLIENTES,
    FECHA_DE_VENTA = NEW.FECHA_DE_VENTA,
    UNIDADES = NEW.UNIDADES,
    FEMISION = NEW.FEMISION
    WHERE id_VENTAS = NEW.id_VENTAS;
END $$
DELIMITER ;

UPDATE ventas SET UNIDADES=9 WHERE id_VENTAS = 7;
SELECT * FROM replicaVentas;


DELIMITER $$
DROP TRIGGER IF EXISTS TRIGGER5;
CREATE TRIGGER TRIGGER5
AFTER UPDATE ON clientes
FOR EACH ROW
BEGIN
	UPDATE replicaClientes
    SET FECHA_DE_ALTA = NEW.FECHA_DE_ALTA,
    CIF_NIF = NEW.CIF_NIF,
    NOMBRE = NEW.NOMBRE,
    DIRECCION = NEW.DIRECCION,
    CP = NEW.CP,
    CIUDAD = NEW.CIUDAD,
    PROVINCIA = NEW.PROVINCIA,
    EMPRESA = NEW.EMPRESA,
    COMO_NOS_CONOCIO = NEW.COMO_NOS_CONOCIO
    WHERE Id_CLIENTES = NEW.Id_CLIENTES;
END $$
DELIMITER ;


UPDATE clientes SET CIUDAD='SEVILLA' WHERE id_CLIENTES = 98;
SELECT * FROM replicaClientes;


DELIMITER $$
DROP TRIGGER IF EXISTS TRIGGER6;
CREATE TRIGGER TRIGGER6
AFTER UPDATE ON productos
FOR EACH ROW
BEGIN
	UPDATE replicaproductos
    SET id_proveedor = NEW.id_proveedor,
    NOMBRE = NEW.NOMBRE,
    FABRICANTE = NEW.FABRICANTE,
    PRECIO = NEW.PRECIO,
    PVP = NEW.PVP,
    Descripcion = NEW.Descripcion
    WHERE id_PRODUCTO = NEW.id_PRODUCTO;
END $$
DELIMITER ;

UPDATE productos SET nombre='Manzanasss' WHERE id_producto = 105;
SELECT * FROM replicaProductos;



CREATE TABLE historial (
    idhistorial INT AUTO_INCREMENT PRIMARY KEY,
    fecha_hora_actual TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    mensaje VARCHAR(255)
);



DELIMITER $$
DROP TRIGGER IF EXISTS TRIGGER7;
CREATE TRIGGER TRIGGER7
BEFORE DELETE ON replicaVentas
FOR EACH ROW
BEGIN
	INSERT INTO historial (fecha_hora_actual, mensaje)
    VALUES (NOW(), CONCAT('Se ha borrado el registro con idventas = ', OLD.id_VENTAS,
                          ', idproductos = ', OLD.id_PRODUCTOS,
                          ', idclientes = ', OLD.id_CLIENTES,
                          ', fecha_Ventas = ', OLD.FECHA_DE_VENTA,
                          ', unidades = ', OLD.UNIDADES,
                          ', femision = ', OLD.FEMISION
								  ));
END $$
DELIMITER ;

DELETE FROM replicaVentas WHERE id_ventas=7;
SELECT * FROM historial;


DELIMITER $$
DROP TRIGGER IF EXISTS TRIGGER8;
CREATE TRIGGER TRIGGER8
BEFORE DELETE ON replicaClientes
FOR EACH ROW
BEGIN
	INSERT INTO historial (fecha_hora_actual, mensaje)
    VALUES (NOW(), CONCAT('Se ha borrado el registro con id_clientes = ', OLD.Id_CLIENTES,
                          ', FECHA_DE_ALTA = ', OLD.FECHA_DE_ALTA,
                          ', CIF_NIF = ', OLD.CIF_NIF,
                          ', NOMBRE = ', OLD.NOMBRE,
                          ', DIRECCION = ', OLD.DIRECCION,
						  ', CP = ', OLD.CP,
                          ', CIUDAD = ', OLD.CIUDAD,
                          ', PROVINCIA = ', OLD.PROVINCIA,
                          ', EMPRESA = ', OLD.EMPRESA,
                          ', COMO_NOS_CONOCIO = ', OLD.COMO_NOS_CONOCIO));
END $$
DELIMITER ;

DELETE FROM replicaClientes WHERE id_clientes=5;
SELECT * FROM historial;


DELIMITER $$
DROP TRIGGER IF EXISTS TRIGGER9;
CREATE TRIGGER TRIGGER9
BEFORE DELETE ON replicaProductos
FOR EACH ROW
BEGIN
	INSERT INTO historial (fecha_hora_actual, mensaje)
    VALUES (NOW(), CONCAT('Se ha borrado el registro con id_producto = ', OLD.id_producto,
                          ', id_proveedor = ', OLD.id_proveedor,
                          ', NOMBRE = ', OLD.NOMBRE,
                          ', FABRICANTE = ', OLD.FABRICANTE,
						  ', PRECIO = ', OLD.PRECIO,
                          ', PVP = ', OLD.PVP,
                          ', Descripcion = ', OLD.Descripcion));
END $$
DELIMITER ;

DELETE FROM replicaProductos WHERE id_producto=4;
SELECT * FROM historial;
