DROP DATABASE IF EXISTS tienda;
CREATE DATABASE tienda CHARACTER SET utf8mb4;
USE tienda;
CREATE TABLE fabricante (
codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL
);
CREATE TABLE producto (
codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
precio DOUBLE NOT NULL,
codigo_fabricante INT UNSIGNED NOT NULL,
FOREIGN KEY (codigo_fabricante) REFERENCES fabricante(codigo)
);
INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');
INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);


/*CONSULTAS 30 de Noviembre*/
/*1)*/SELECT nombre FROM producto;
/*2)*/SELECT nombre, precio FROM producto;
/*3)*/SELECT * FROM producto;
/*4)*/SELECT nombre,
CONCAT(precio," ","€"),CONCAT(TRUNCATE(precio*1.11,2)," ","$") FROM producto;
/*5)*/SELECT nombre AS nombreDeProducto,
CONCAT(precio," ","€") AS Euros,CONCAT(TRUNCATE(precio*1.11,2)," ","$") AS Dólares FROM producto;
/*6)*/ SELECT UPPER(nombre),precio FROM producto;
/*7)*/ SELECT LOWER(nombre),precio FROM producto;
/*8)*/ SELECT nombre,CONCAT(UPPER(SUBSTRING(nombre,1,2)),SUBSTRING(nombre,2,LENGTH(nombre))) 
FROM fabricante; /* forma 2: SELECT LEFT(UPPER(nombre),2) from producto*/
/*9)*/SELECT nombre, ROUND(precio,0) FROM producto;
/*10)*/SELECT nombre, TRUNCATE(precio,0) FROM producto;
/*11)*/SELECT fabricante.codigo FROM fabricante  
JOIN producto ON producto.codigo_fabricante = fabricante.codigo;

/*12)*/SELECT fabricante.codigo FROM fabricante  
JOIN producto ON producto.codigo_fabricante = fabricante.codigo
GROUP BY (fabricante.codigo);

/*13)*/SELECT nombre FROM fabricante ORDER BY nombre;
/*14)*/SELECT nombre FROM fabricante ORDER BY nombre DESC;
/*15)*/SELECT nombre,precio FROM producto ORDER BY nombre, precio DESC;
/*16)*/SELECT * FROM fabricante LIMIT 5;
/*17)*/SELECT * FROM fabricante LIMIT 3,2;
/*18)*/SELECT nombre, precio FROM producto ORDER BY precio LIMIT 1;
/*19)*/SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;
/*20)*/SELECT f.codigo AS codigoFabricante, p.nombre,p.precio FROM fabricante f  
JOIN producto p ON p.codigo_fabricante = f.codigo
WHERE f.codigo = 2;

/*21)*/SELECT * FROM producto WHERE precio <= 120;
/*22)*/SELECT * FROM producto WHERE precio >= 400;
/*23)*/SELECT * FROM producto WHERE NOT precio >= 400;
/*24)*/SELECT * FROM producto WHERE precio >= 80 AND precio <= 300;
/*25)*/SELECT * FROM producto WHERE precio BETWEEN 80 AND 300;
/*26)*/SELECT * FROM producto p
JOIN fabricante f ON  f.codigo = p.codigo_fabricante
WHERE precio > 200 AND f.codigo=6;

/*27)*/SELECT * FROM producto p
JOIN fabricante f ON  f.codigo = p.codigo_fabricante
WHERE f.codigo=1 OR f.codigo=3 OR f.codigo=5;

/*28)*/SELECT * FROM producto p
JOIN fabricante f ON  f.codigo = p.codigo_fabricante
WHERE f.codigo IN (1,3,5);

/*29)*/SELECT nombre, precio*100 AS centimos FROM producto;
/*30)*/SELECT nombre FROM fabricante WHERE nombre LIKE 'S%';
/*31)*/SELECT nombre FROM fabricante WHERE nombre LIKE '%e';
/*32)*/SELECT nombre FROM fabricante WHERE nombre LIKE '%w%';
/*33)*/SELECT nombre FROM fabricante WHERE nombre LIKE '____';
/*34)*/SELECT nombre FROM producto WHERE LOWER(nombre) LIKE '%pórtatil%';
/*35)*/SELECT nombre,precio FROM producto WHERE LOWER(nombre) LIKE '%monitor%' AND precio<215;
/*36)*/SELECT nombre,precio FROM producto WHERE precio>=180 ORDER BY precio DESC,nombre;
