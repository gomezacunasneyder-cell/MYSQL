-- ================= RETO 1 =================
CREATE DATABASE reto1;
USE reto1;

CREATE TABLE clientes (
  id_cliente          INT PRIMARY KEY AUTO_INCREMENT,
  nombre              VARCHAR(100) NOT NULL,
  email               VARCHAR(150) NOT NULL UNIQUE,
  ciudad              VARCHAR(60),
  fecha_registro      DATE,
  acepta_promociones  BOOLEAN
);


-- ================= RETO 2 =================
CREATE DATABASE reto2;
USE reto2;

CREATE TABLE departamentos (
  id_departamento INT PRIMARY KEY AUTO_INCREMENT,
  nombre          VARCHAR(80) NOT NULL
);

CREATE TABLE empleados (
  id_empleado     INT PRIMARY KEY AUTO_INCREMENT,
  nombre          VARCHAR(100) NOT NULL,
  email           VARCHAR(150) NOT NULL UNIQUE,
  salario         DECIMAL(10,2) NOT NULL CHECK (salario >= 0),
  id_departamento INT,
  fecha_contratacion DATE,
  FOREIGN KEY (id_departamento) REFERENCES departamentos(id_departamento)
);


-- ================= RETO 3 =================
CREATE DATABASE reto3;
USE reto3;

CREATE TABLE clientes (
  id_cliente          INT PRIMARY KEY AUTO_INCREMENT,
  nombre              VARCHAR(100) NOT NULL,
  email               VARCHAR(150) NOT NULL UNIQUE,
  ciudad              VARCHAR(60),
  fecha_registro      DATE,
  acepta_promociones  BOOLEAN
);

CREATE TABLE productos_prueba (
  id_producto     INT PRIMARY KEY AUTO_INCREMENT,
  nombre_producto VARCHAR(100)
);

DROP TABLE productos_prueba;

ALTER TABLE clientes
  ADD COLUMN telefono VARCHAR(20);


-- ================= RETO 4 =================
CREATE DATABASE reto4;
USE reto4;

CREATE TABLE productos (
  id_producto    INT PRIMARY KEY AUTO_INCREMENT,
  nombre         VARCHAR(100) NOT NULL UNIQUE,
  precio         DECIMAL(10,2) NOT NULL,
  stock          INT NOT NULL CHECK (stock >= 0),
  id_categoria   INT,
  fecha_registro DATE DEFAULT (CURRENT_DATE)
);

INSERT INTO productos (id_producto, nombre, precio, stock) VALUES
(310, 'Licuadora Pro 900W', 45.90, 20),
(118, 'Ventilador de Torre', 45.90, 5);

UPDATE productos
SET precio = 549.00
WHERE id_producto = 310;

DELETE FROM productos
WHERE id_producto = 118;


-- ================= RETO 5 =================
CREATE DATABASE reto5;
USE reto5;

CREATE TABLE clientes (
  id_cliente          INT PRIMARY KEY AUTO_INCREMENT,
  nombre              VARCHAR(100) NOT NULL,
  email               VARCHAR(150) NOT NULL UNIQUE,
  ciudad              VARCHAR(60),
  fecha_registro      DATE,
  acepta_promociones  BOOLEAN
);

INSERT INTO clientes (nombre, email, ciudad, fecha_registro, acepta_promociones) VALUES
('Ana Torres',    'ana.torres@correo.com',    'Bogotá', '2024-05-10', TRUE),
('Luis Ramírez',  'luis.ramirez@correo.com',  'Bogotá', '2024-06-02', FALSE),
('Carlos Peña',   'carlos.pena@correo.com',   'Bogotá', '2024-07-15', TRUE),
('Diana Ríos',    'diana.rios@correo.com',    'Bogotá', '2024-01-08', FALSE),
('Jorge Salas',   'jorge.salas@correo.com',   'Bogotá', '2024-08-01', TRUE),
('Sofía Muñoz',   'sofia.munoz@correo.com',   'Bogotá', '2024-04-25', FALSE);

SELECT nombre, fecha_registro
FROM clientes
WHERE ciudad = 'Bogotá'
ORDER BY fecha_registro DESC
LIMIT 5;


-- ================= RETO 6 =================
CREATE DATABASE reto6;
USE reto6;

CREATE TABLE productos (
  id_producto INT PRIMARY KEY AUTO_INCREMENT,
  nombre      VARCHAR(100) NOT NULL,
  precio      DECIMAL(10,2) NOT NULL,
  categoria   VARCHAR(60)
);

INSERT INTO productos (nombre, precio, categoria) VALUES
('TV Smart 55 pulgadas',   1899000, 'Tecnología'),
('Nevera Smart Inverter',  2450000, 'Electrodomésticos'),
('Parlante Bluetooth',      250000, 'Tecnología'),
('Lavadora Automática',     350000, 'Electrodomésticos');

SELECT nombre, precio, categoria
FROM productos
WHERE categoria IN ('Electrodomésticos', 'Tecnología')
  AND nombre LIKE '%Smart%';


-- ================= RETO 7 =================
CREATE DATABASE reto7;
USE reto7;

CREATE TABLE productos (
  id_producto  INT PRIMARY KEY AUTO_INCREMENT,
  id_categoria INT,
  precio       DECIMAL(10,2) NOT NULL
);

INSERT INTO productos (id_categoria, precio) VALUES
(1, 1899000),
(1, 250000),
(2, 350000),
(2, 45000);

SELECT
  id_categoria,
  AVG(precio) AS precio_promedio
FROM productos
GROUP BY id_categoria
HAVING AVG(precio) > 300000;
