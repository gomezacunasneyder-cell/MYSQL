CREATE DATABASE IF NOT EXISTS practica_db;
USE practica_db;

DROP TABLE IF EXISTS detalle_venta;
DROP TABLE IF EXISTS venta;
DROP TABLE IF EXISTS producto;
DROP TABLE IF EXISTS cliente;
DROP TABLE IF EXISTS categoria;

CREATE TABLE IF NOT EXISTS categoria (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(200)
);

CREATE TABLE IF NOT EXISTS producto (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10,2) CHECK (precio >= 0),
    existencia INT DEFAULT 0 CHECK (existencia >= 0),
    categoria_id INT,
    FOREIGN KEY (categoria_id) REFERENCES categoria(id)
);

CREATE TABLE IF NOT EXISTS cliente (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) UNIQUE,
    telefono VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS venta (
    id INT PRIMARY KEY AUTO_INCREMENT,
    fecha DATE DEFAULT (CURRENT_DATE),
    cliente_id INT NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES cliente(id)
);

CREATE TABLE IF NOT EXISTS detalle_venta (
    venta_id INT,
    producto_id INT,
    cantidad INT CHECK (cantidad > 0),
    PRIMARY KEY (venta_id, producto_id),
    FOREIGN KEY (venta_id) REFERENCES venta(id),
    FOREIGN KEY (producto_id) REFERENCES producto(id)
);

INSERT INTO categoria (nombre, descripcion) VALUES
('Camisetas', 'Camisetas casuales y deportivas'),
('Pantalones', 'Jeans, sudaderas y formales'),
('Accesorios', 'Gorras, cinturones y bolsos');

INSERT INTO cliente (nombre, correo, telefono) VALUES
('Laura Gómez', 'laura.gomez@mail.com', '3011234567'),
('Andrés Ríos', 'andres.rios@mail.com', '3129876543'),
('Camila Torres', 'camila.torres@mail.com', NULL);

INSERT INTO producto (nombre, precio, existencia, categoria_id) VALUES
('Camiseta blanca básica', 35000, 50, 1),
('Camiseta estampada', 42000, 30, 1),
('Jean slim fit', 89000, 20, 2),
('Sudadera gris', 75000, 15, 2),
('Gorra negra', 25000, 40, 3);

INSERT INTO venta (fecha, cliente_id) VALUES
('2026-09-05', 1),
('2026-09-08', 2),
('2026-09-09', 1);

INSERT INTO detalle_venta (venta_id, producto_id, cantidad) VALUES
(1, 1, 2),
(1, 5, 1),
(2, 3, 1),
(3, 2, 3),
(3, 4, 1);

SELECT p.nombre AS producto, dv.cantidad, p.precio,
       (dv.cantidad * p.precio) AS subtotal
FROM detalle_venta dv
JOIN producto p ON dv.producto_id = p.id
WHERE dv.venta_id = 1;
