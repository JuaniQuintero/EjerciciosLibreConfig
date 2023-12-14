DROP DATABASE IF EXISTS supermercado;
CREATE DATABASE supermercado;
USE supermercado;

CREATE table productos(id_producto int auto_increment primary key,
nombre VARCHAR(40),
precio int,
tipoIva int);

CREATE table tickets(id_ticket int auto_increment primary key,
id_producto int,
unidades int,
foreign key (id_producto) references productos(id_producto));

INSERT INTO productos (nombre, precio, tipoIva) VALUES ("tarta",10,2),
("portatil",600,3),("camisas",30,2),("pan",1,1);

INSERT INTO tickets (id_producto, unidades) VALUES (1,2),
(1,1),(2,3),(3,1),(3,2),(4,4),(1,1),(1,5);

delimiter $$
	DROP FUNCTION if EXISTS funcionIva $$
	CREATE FUNCTION funcionIva (precio decimal(12,2), tipoIva int)
	RETURNS DECIMAL (10,2) DETERMINISTIC
	BEGIN
		CASE tipoIva
			when 1 then
				RETURN 0.04;
			when 2 then
				RETURN 0.10;
			when 3 then
				RETURN 0.21;
			ELSE
				RETURN 0;
		END CASE;
	END $$
delimiter ;

delimiter $$
	DROP FUNCTION if EXISTS funcionCalculoIva $$
	CREATE FUNCTION funcionCalculoIva (precio decimal(12,2),tipoIva int, unidades int)
	RETURNS DECIMAL (10,2) DETERMINISTIC
	BEGIN
		SET precio = precio*unidades;
		RETURN precio*funcionIva(precio, tipoIva);
	END $$
delimiter ;



delimiter $$
	DROP FUNCTION if EXISTS funcionTotal $$
	CREATE FUNCTION funcionTotal (precio decimal(12,2), tipoIva int, unidades int)
	RETURNS DECIMAL (10,2) DETERMINISTIC
	BEGIN
        RETURN precio*unidades + funcionCalculoIva(precio,tipoIva, unidades);
	END $$
delimiter ;

SELECT t.id_ticket, p.nombre,p.precio, t.unidades,p.tipoIva, 
CONCAT(funcionIva(p.precio,p.tipoIva)*100,"%") as iva,
CONCAT(funcionCalculoIva(p.precio, p.tipoIva,t.unidades)," €") as ivaProductos,
CONCAT(funcionTotal(p.precio,p.tipoIva, t.unidades)," €") as precioConIva from productos p
INNER JOIN tickets t ON p.id_producto = t.id_producto
ORDER by t.id_ticket;