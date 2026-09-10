CREATE TABLE Producto (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(100) NOT NULL,
  precio DECIMAL(10,2) NOT NULL,
  categoria VARCHAR(60)
);

CREATE TABLE Venta (
  id INT PRIMARY KEY AUTO_INCREMENT,
  id_producto INT,
  cantidad INT NOT NULL,
  fecha DATE,
  FOREIGN KEY (id_producto) REFERENCES Producto(id)
);

INSERT INTO Producto (nombre, precio, categoria) VALUES
('Nevera Smart Inverter', 2450000, 'Electrodomesticos'),
('Ventilador de Torre', 149900, 'Electrodomesticos'),
('TV Smart 55 pulgadas', 1899000, 'Tecnologia'),
('Parlante Bluetooth', 250000, 'Tecnologia'),
('Licuadora Pro 900W', 549000, 'Hogar');

INSERT INTO Venta (id_producto, cantidad, fecha) VALUES
(1, 2, '2024-05-10'),
(2, 5, '2024-06-02'),
(3, 3, '2024-06-15'),
(4, 10, '2024-07-01'),
(5, 4, '2024-07-20');

CREATE TABLE productos_caros AS
SELECT * FROM Producto WHERE precio > 100000;

DESCRIBE productos_caros;

SELECT p.nombre, p.precio, v.cantidad, v.fecha
FROM Producto p
JOIN Venta v ON p.id = v.id_producto;

SELECT
  UPPER(p.nombre) AS nombre_mayuscula,
  ROUND(p.precio, 0) AS precio_redondeado,
  CONCAT(p.nombre, ' - ', p.categoria) AS producto_categoria
FROM Producto p;

SELECT
  nombre,
  precio,
  IF(precio > 500000, 'Premium', 'Estandar') AS clasificacion
FROM Producto;

SELECT
  UPPER(p.nombre) AS nombre_producto,
  CONCAT(p.categoria, ' - ', ROUND(p.precio, 0)) AS detalle,
  IF(p.precio > 500000, 'Premium', 'Estandar') AS clasificacion,
  v.cantidad,
  v.fecha
FROM Producto p
JOIN Venta v ON p.id = v.id_producto;
