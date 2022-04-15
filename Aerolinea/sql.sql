-- Una línea aérea quiere implementar un sistema para la venta de boletos de avión
-- Cada boleto de avión cuesta 100 mil pesos
-- Cada vuelo de avión tiene:
-- 200 asientos
-- Nombre de Ruta
-- Horario de despegue y aterrizaje
-- Los pasajeros se registran con su RUT, nombre y apellido
-- Cada Boleto registra:
-- El vuelo del avión y el pasajero
-- Agregar 5 vuelos
-- Agregar 5 pasajeros
-- - Cada compra de vuelo debe restar 1 a los asientos disponibles en el avión
-- - Con transacción comprar un boleto (vuelo 1) a su nombre (pasajero 1)
-- - luego cambiar de vuelo (vuelo 3)
-- - mostrar que el vuelo inicial vuelva a quedar con la cantidad de asientos disponibles
-- - comprar 5 vuelos más y mostrar el total que ha ganado la aerolínea
-- - mostrar que vuelo tiene más asientos disponibles
-- - mostrar que vuelo tiene menos asientos disponibles
CREATE DATABASE aerolinea_db;

CREATE TABLE vuelos (
   id SERIAL NOT NULL PRIMARY KEY,
   nombre_ruta VARCHAR(50) NOT NULL,
   horario_despegue TIME NOT NULL,
   horario_aterrizaje TIME NOT NULL,
   asientos_disponibles SMALLINT NOT NULL,
   precio INTEGER NOT NULL
   CONSTRAINT asientos_disponibles_validos CHECK ((asientos_disponibles >= 0))
);

CREATE TABLE pasajeros (
   rut VARCHAR(15) NOT NULL PRIMARY KEY,
   nombre VARCHAR(50) NOT NULL,
   apellido VARCHAR(50) NOT NULL
);

CREATE TABLE boletos (
   id SERIAL NOT NULL PRIMARY KEY,
   pasajeros_rut_fk VARCHAR(15) NOT NULL REFERENCES pasajeros(rut),
   vuelos_fk INTEGER NOT NULL REFERENCES vuelos(id)
);

BEGIN TRANSACTION;
INSERT INTO vuelos (nombre_ruta, horario_despegue, horario_aterrizaje, asientos_disponibles, precio)
VALUES ('Ruta 1', '10:00', '12:00', 200, 100000);
INSERT INTO vuelos (nombre_ruta, horario_despegue, horario_aterrizaje, asientos_disponibles, precio)
VALUES ('Ruta 2', '10:00', '12:00', 200, 100000);
INSERT INTO vuelos (nombre_ruta, horario_despegue, horario_aterrizaje, asientos_disponibles, precio)
VALUES ('Ruta 3', '10:00', '12:00', 200, 100000);
INSERT INTO vuelos (nombre_ruta, horario_despegue, horario_aterrizaje, asientos_disponibles, precio)
VALUES ('Ruta 4', '10:00', '12:00', 200, 100000);
INSERT INTO vuelos (nombre_ruta, horario_despegue, horario_aterrizaje, asientos_disponibles, precio)
VALUES ('Ruta 5', '10:00', '12:00', 200, 100000);
COMMIT;

-- INSERT INTO
--    pasajeros (rut, nombre, apellido)
-- VALUES
--    ('12345678-9', 'Juan', 'Perez'),
--    ('12345678-0', 'Pedro', 'Perez'),
--    ('12345678-1', 'Maria', 'Perez'),
--    ('12345678-2', 'Jose', 'Perez'),
--    ('12345678-3', 'Pepito', 'Perez');

INSERT INTO pasajeros (rut, nombre, apellido)
VALUES ('12345678-4', 'Juan', 'Perez');
UPDATE vuelos SET asientos_disponibles = asientos_disponibles - 1 WHERE id = 1;
INSERT INTO pasajeros (rut, nombre, apellido)
VALUES('12345678-5', 'Pedro', 'Perez');
UPDATE vuelos SET asientos_disponibles = asientos_disponibles - 1 WHERE id = 2;
INSERT INTO pasajeros (rut, nombre, apellido)
VALUES('12345678-6', 'Maria', 'Perez');
UPDATE vuelos SET asientos_disponibles = asientos_disponibles - 1 WHERE id = 3;
INSERT INTO pasajeros (rut, nombre, apellido)
VALUES('12345678-7', 'Jose', 'Perez');
UPDATE vuelos SET asientos_disponibles = asientos_disponibles - 1 WHERE id = 4;
INSERT INTO pasajeros (rut, nombre, apellido)
VALUES('12345678-8', 'Pepito', 'Perez');
UPDATE vuelos SET asientos_disponibles = asientos_disponibles - 1 WHERE id = 5;

-- Con transacción comprar un boleto (vuelo 1) a su nombre (pasajero 1)
-- - luego cambiar de vuelo (vuelo 3)

BEGIN TRANSACTION;
INSERT INTO boletos (id, pasajeros_rut_fk, vuelos_fk) VALUES (1, '12345678-4', 1);
UPDATE vuelos SET asientos_disponibles = asientos_disponibles - 1 WHERE id = 1;
UPDATE boletos SET vuelos_fk = 3 WHERE id = 1;
UPDATE vuelos SET asientos_disponibles = asientos_disponibles + 1 WHERE id = 1;
UPDATE vuelos SET asientos_disponibles = asientos_disponibles - 1 WHERE id = 3;
COMMIT;






ALTER SEQUENCE vuelos_id_seq RESTART WITH 1;
ALTER SEQUENCE boletos_id_seq RESTART WITH 1;

-- truncate table vuelos with cascade;
truncate table vuelos cascade;


-- mostrar que el vuelo inicial vuelva a quedar con la cantidad de asientos disponibles


-- comprar 5 boletos más y mostrar el total que ha ganado la aerolínea
-- - mostrar que vuelo tiene más asientos disponibles
-- - mostrar que vuelo tiene menos asientos disponibles

INSERT INTO pasajeros (rut, nombre, apellido)
VALUES ('12345678-9', 'Juan', 'Perez');
UPDATE vuelos SET asientos_disponibles = asientos_disponibles - 1 WHERE id = 1;

BEGIN TRANSACTION;
INSERT INTO boletos (id, pasajeros_rut_fk, vuelos_fk) VALUES (2, '12345678-4', 1);
UPDATE vuelos SET asientos_disponibles = asientos_disponibles - 1 WHERE id = 1;
INSERT INTO boletos (id, pasajeros_rut_fk, vuelos_fk) VALUES (3,'12345678-5', 2);
UPDATE vuelos SET asientos_disponibles = asientos_disponibles - 1 WHERE id = 2;
INSERT INTO boletos (id, pasajeros_rut_fk, vuelos_fk) VALUES (4,'12345678-6', 3);
UPDATE vuelos SET asientos_disponibles = asientos_disponibles - 1 WHERE id = 3;
INSERT INTO boletos (id, pasajeros_rut_fk, vuelos_fk) VALUES (5,'12345678-7', 4);
UPDATE vuelos SET asientos_disponibles = asientos_disponibles - 1 WHERE id = 4;
INSERT INTO boletos (id, pasajeros_rut_fk, vuelos_fk) VALUES (6,'12345678-8', 4);
UPDATE vuelos SET asientos_disponibles = asientos_disponibles - 1 WHERE id = 4;
COMMIT;


