-- =========================================================
-- RETO: DDL - ElectroHogar
-- 1) Eliminar por completo la tabla productos_prueba (creada por error)
-- 2) Agregar la columna telefono a la tabla clientes
-- =========================================================

-- ---------------------------------------------------------
-- (SOLO PARA SIMULAR EL ESCENARIO EN TU PROPIA BASE)
-- El reto dice que esta tabla YA existe por error.
-- Si en tu base de práctica no la tienes, créala primero
-- para poder probar el DROP. Esto NO es parte de la
-- respuesta del reto, es solo preparación.
-- ---------------------------------------------------------
CREATE TABLE IF NOT EXISTS productos_prueba (
    id_producto INT PRIMARY KEY AUTO_INCREMENT,
    nombre_producto VARCHAR(100)
);

-- =========================================================
-- SOLUCIÓN DEL RETO (esto es lo que realmente te piden)
-- =========================================================

-- 1) Eliminar la tabla productos_prueba
DROP TABLE productos_prueba;

-- 2) Agregar columna telefono (texto, máximo 20 caracteres) a clientes
ALTER TABLE clientes
ADD COLUMN telefono VARCHAR(20);

-- =========================================================
-- Verificación
-- =========================================================
DESCRIBE clientes;
