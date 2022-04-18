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
   CONSTRAINT asientos_disponibles_validos CHECK ((asientos_disponibles > 0 AND asientos_disponibles <= 200))
);

CREATE TABLE pasajeros (
   rut VARCHAR(15) NOT NULL PRIMARY KEY,
   nombre VARCHAR(50) NOT NULL,
   apellido VARCHAR(50) NOT NULL
);

CREATE TABLE boletos (
   id SERIAL NOT NULL PRIMARY KEY,
   pasajeros_rut_fk VARCHAR(15) NOT NULL REFERENCES pasajeros(rut),
   vuelos_fk INTEGER NOT NULL REFERENCES vuelos(id),
   precio INTEGER NOT NULL
);

BEGIN TRANSACTION;
INSERT INTO vuelos (nombre_ruta, horario_despegue, horario_aterrizaje, asientos_disponibles)
VALUES ('Ruta 1', '10:00', '12:00', 200);
INSERT INTO vuelos (nombre_ruta, horario_despegue, horario_aterrizaje, asientos_disponibles)
VALUES ('Ruta 2', '10:00', '12:00', 200);
INSERT INTO vuelos (nombre_ruta, horario_despegue, horario_aterrizaje, asientos_disponibles)
VALUES ('Ruta 3', '10:00', '12:00', 200);
INSERT INTO vuelos (nombre_ruta, horario_despegue, horario_aterrizaje, asientos_disponibles)
VALUES ('Ruta 4', '10:00', '12:00', 200);
INSERT INTO vuelos (nombre_ruta, horario_despegue, horario_aterrizaje, asientos_disponibles)
VALUES ('Ruta 5', '10:00', '12:00', 200);
COMMIT;

-- Agregar 5 pasajeros
INSERT INTO pasajeros (rut, nombre, apellido)
VALUES ('12345678-4', 'Juan', 'Perez');
INSERT INTO pasajeros (rut, nombre, apellido)
VALUES('12345678-5', 'Pedro', 'Perez');
INSERT INTO pasajeros (rut, nombre, apellido)
VALUES('12345678-6', 'Maria', 'Perez');
INSERT INTO pasajeros (rut, nombre, apellido)
VALUES('12345678-7', 'Jose', 'Perez');
INSERT INTO pasajeros (rut, nombre, apellido)
VALUES('12345678-8', 'Pepito', 'Perez');

-- Con transacción comprar un boleto (vuelo 1) a su nombre (pasajero 1)
-- - luego cambiar de vuelo (vuelo 3)

BEGIN TRANSACTION;
INSERT INTO boletos (pasajeros_rut_fk, vuelos_fk, precio) VALUES ('12345678-4', 1, 100000);
UPDATE vuelos SET asientos_disponibles = asientos_disponibles - 1 WHERE id = 1;
UPDATE boletos SET vuelos_fk = 3 WHERE id = 1;
UPDATE vuelos SET asientos_disponibles = asientos_disponibles + 1 WHERE id = 1;
UPDATE vuelos SET asientos_disponibles = asientos_disponibles - 1 WHERE id = 3;
COMMIT;

-- mostrar que el vuelo inicial vuelva a quedar con la cantidad de asientos disponibles
SELECT * FROM vuelos WHERE id = 1;




ALTER SEQUENCE vuelos_id_seq RESTART WITH 1;
ALTER SEQUENCE boletos_id_seq RESTART WITH 1;

-- truncate table vuelos with cascade;
truncate table vuelos cascade;





-- comprar 5 boletos más y mostrar el total que ha ganado la aerolínea
-- - mostrar que vuelo tiene más asientos disponibles
-- - mostrar que vuelo tiene menos asientos disponibles

BEGIN TRANSACTION;
INSERT INTO boletos (pasajeros_rut_fk, vuelos_fk, precio) VALUES ('12345678-4', 1, 100000);
UPDATE vuelos SET asientos_disponibles = asientos_disponibles - 1 WHERE id = 1;
INSERT INTO boletos (pasajeros_rut_fk, vuelos_fk, precio) VALUES ('12345678-5', 2, 100000);
UPDATE vuelos SET asientos_disponibles = asientos_disponibles - 1 WHERE id = 2;
INSERT INTO boletos (pasajeros_rut_fk, vuelos_fk, precio) VALUES ('12345678-6', 3, 100000);
UPDATE vuelos SET asientos_disponibles = asientos_disponibles - 1 WHERE id = 3;
INSERT INTO boletos (pasajeros_rut_fk, vuelos_fk, precio) VALUES ('12345678-7', 4, 100000);
UPDATE vuelos SET asientos_disponibles = asientos_disponibles - 1 WHERE id = 4;
INSERT INTO boletos (pasajeros_rut_fk, vuelos_fk, precio) VALUES ('12345678-8', 5, 100000);
UPDATE vuelos SET asientos_disponibles = asientos_disponibles - 1 WHERE id = 5;
COMMIT;


SELECT sum(boletos.precio) as ganancia_total
FROM boletos 
INNER JOIN vuelos ON boletos.vuelos_fk = vuelos.id;
--Mostrar que vuelo tiene más asientos disponibles
select * from vuelos where stock_asientos = (select max(stock_asientos) from vuelos) ;
-- Mostrar que vuelo tiene menos asientos disponibles
select * from vuelos where stock_asientos = (select min(stock_asientos) from vuelos) ;

