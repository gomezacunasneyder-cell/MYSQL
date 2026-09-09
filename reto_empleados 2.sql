-- =========================================================
-- RETO: Tabla EMPLEADOS - ElectroHogar
-- Situación: RR. HH. pide que la tabla empleados garantice
-- datos correctos antes de ponerla en producción.
-- =========================================================

-- Tabla de departamentos (referenciada por empleados)
CREATE TABLE departamentos (
    id_departamento SERIAL PRIMARY KEY,
    nombre_departamento VARCHAR(100) NOT NULL
);

-- Tabla de empleados con todas las validaciones pedidas:
--  - id autogenerado          -> SERIAL PRIMARY KEY
--  - nombre obligatorio       -> NOT NULL
--  - correo no se repite      -> UNIQUE
--  - salario no negativo      -> CHECK (salario >= 0)
--  - departamento existente   -> FOREIGN KEY
CREATE TABLE empleados (
    id_empleado SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    salario DECIMAL(10,2) CHECK (salario >= 0),
    id_departamento INT,
    fecha_contratacion DATE,
    CONSTRAINT fk_empleado_departamento
        FOREIGN KEY (id_departamento) REFERENCES departamentos(id_departamento)
);

-- =========================================================
-- PRUEBAS (opcional, para verificar que las reglas funcionan)
-- =========================================================

-- 1) Departamentos válidos
INSERT INTO departamentos (nombre_departamento) VALUES ('Ventas');
INSERT INTO departamentos (nombre_departamento) VALUES ('Sistemas');

-- 2) Empleado válido (debe funcionar)
INSERT INTO empleados (nombre, email, salario, id_departamento, fecha_contratacion)
VALUES ('Juan Pérez', 'juan.perez@electrohogar.com', 1500000, 1, '2024-01-15');

-- 3) Email duplicado (debe fallar por UNIQUE)
-- INSERT INTO empleados (nombre, email, salario, id_departamento, fecha_contratacion)
-- VALUES ('Otro Juan', 'juan.perez@electrohogar.com', 1200000, 2, '2024-02-01');

-- 4) Salario negativo (debe fallar por CHECK)
-- INSERT INTO empleados (nombre, email, salario, id_departamento, fecha_contratacion)
-- VALUES ('Ana Torres', 'ana.torres@electrohogar.com', -500000, 1, '2024-02-01');

-- 5) Departamento inexistente (debe fallar por FOREIGN KEY)
-- INSERT INTO empleados (nombre, email, salario, id_departamento, fecha_contratacion)
-- VALUES ('Carlos Ruiz', 'carlos.ruiz@electrohogar.com', 1300000, 99, '2024-02-01');

-- 6) Nombre nulo (debe fallar por NOT NULL)
-- INSERT INTO empleados (nombre, email, salario, id_departamento, fecha_contratacion)
-- VALUES (NULL, 'sin.nombre@electrohogar.com', 1000000, 1, '2024-02-01');
