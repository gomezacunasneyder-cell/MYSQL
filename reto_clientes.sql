-- =========================================================
-- RETO: Tabla CLIENTES - ElectroHogar
-- RR. HH. y Marketing necesitan la tabla clientes
-- para el nuevo programa de fidelización.
-- =========================================================

CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,     -- identificador único
    nombre VARCHAR(100) NOT NULL,                  -- texto: nombre del cliente
    email VARCHAR(150) NOT NULL UNIQUE,             -- texto largo: el correo puede exceder lo esperado
    ciudad VARCHAR(100),                            -- texto: ciudad de residencia
    fecha_registro DATE NOT NULL,                   -- fecha en que se registró el cliente
    acepta_promociones BOOLEAN NOT NULL DEFAULT FALSE  -- sí/no (en MySQL, BOOLEAN es alias de TINYINT(1))
);

-- =========================================================
-- Datos de prueba
-- =========================================================
INSERT INTO clientes (nombre, email, ciudad, fecha_registro, acepta_promociones)
VALUES
('Ana Torres', 'ana.torres@correo.com', 'Bucaramanga', '2024-01-10', TRUE),
('Luis Ramírez', 'luis.ramirez@correo.com', 'Bogotá', '2024-02-05', FALSE),
('Marta Gómez', 'marta.gomez@correo.com', 'Medellín', '2024-03-20', TRUE);

-- =========================================================
-- Consulta de verificación
-- =========================================================
SELECT * FROM clientes;
