DROP DATABASE IF EXISTS techstore;
CREATE DATABASE techstore;
USE techstore;
CREATE TABLE clientes (
id_cliente INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(100) NOT NULL,
email VARCHAR(100) NOT NULL UNIQUE,
ciudad VARCHAR(60),
telefono VARCHAR(20) 
);
CREATE TABLE productos (
    id_producto INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(60) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL CHECK (stock >= 0)
);
CREATE TABLE ventas (
    id_venta INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL CHECK (cantidad > 0),
    fecha_venta DATE DEFAULT (CURRENT_DATE),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);
ALTER TABLE productos MODIFY COLUMN nombre VARCHAR(150);
ALTER TABLE clientes ADD COLUMN fecha_nacimiento DATE;
-- Insertar productos
INSERT INTO productos (nombre, categoria, precio, stock) VALUES
('Teclado Mecánico RGB', 'Periféricos', 180000.00, 15),
('Mouse Inalámbrico Pro', 'Periféricos', 120000.00, 25),
('Monitor Gamer 24 FHD', 'Monitores', 650000.00, 10),
('Disco Duro SSD 1TB', 'Almacenamiento', 320000.00, 30),
('Diadema Bluetooth GT', 'Audio', 150000.00, 18),
('Memoria RAM 16GB DDR4', 'Componentes', 210000.00, 40),
('Silla Ergonómica Desk', 'Mobiliario', 480000.00, 8),
('Camara Web 1080p HD', 'Periféricos', 95000.00, 12);

-- Insertar clientes
INSERT INTO clientes (nombre, email, ciudad, telefono, fecha_nacimiento) VALUES
('Carlos Mendoza', 'carlos.m@mail.com', 'Cúcuta', '3001234567', '1998-05-12'),
('Laura Gómez', 'laura.g@mail.com', 'Bogotá', '3109876543', '2001-11-23'),
('Andrés Rodríguez', 'andres.r@mail.com', 'Medellín', '3204567890', '1995-03-30'),
('Mariana Silva', 'mariana.s@mail.com', 'Cali', '3156549870', '2000-08-15'),
('David Morales', 'david.m@mail.com', 'Cúcuta', '3017894561', '1997-01-08'),
('Sofia Vargas', 'sofia.v@mail.com', 'Bucaramanga', '3183216549', '2002-09-19');
-- Insertar registro de ventas
INSERT INTO ventas (id_cliente, id_producto, cantidad, fecha_venta) VALUES
(1, 3, 1, '2026-09-01'), -- Carlos compra Monitor
(2, 1, 2, '2026-09-02'), -- Laura compra 2 Teclados
(1, 4, 1, '2026-09-03'), -- Carlos compra SSD
(3, 2, 1, '2026-09-04'), -- Andrés compra Mouse
(5, 5, 3, '2026-09-05'), -- David compra 3 Diademas (Cúcuta)
(4, 6, 2, '2026-09-06'), -- Mariana compra RAMs
(6, 7, 1, '2026-09-07'), -- Sofia compra Silla
(2, 8, 1, '2026-09-08'), -- Laura compra WebCam
(5, 1, 1, CURRENT_DATE), -- David compra Teclado
(3, 4, 2, CURRENT_DATE); -- Andrés compra SSDs
SELECT * FROM productos 
WHERE categoria = 'Periféricos' AND precio > 100000;
SELECT c.nombre AS cliente, p.nombre AS producto, v.cantidad, v.fecha_venta
FROM ventas v
JOIN clientes c ON v.id_cliente = c.id_cliente
JOIN productos p ON v.id_producto = p.id_producto;
SELECT c.nombre, SUM(v.cantidad * p.precio) AS total_gastado
FROM ventas v
JOIN clientes c ON v.id_cliente = c.id_cliente
JOIN productos p ON v.id_producto = p.id_producto
GROUP BY c.id_cliente, c.nombre;
SELECT c.nombre, SUM(v.cantidad * p.precio) AS total_gastado
FROM ventas v
JOIN clientes c ON v.id_cliente = c.id_cliente
JOIN productos p ON v.id_producto = p.id_producto
GROUP BY c.id_cliente, c.nombre
HAVING total_gastado > 300000;