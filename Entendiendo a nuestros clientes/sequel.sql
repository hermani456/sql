-- export database
pg_dump -U postgres unidad2 > C:/Users/diego/Desktop/unidad2.sql

CREATE DATABASE unidad2

-- import database
psql -U postgres unidad2 < C:/Users/diego/Desktop/sql_db/unidad2.sql

-- El cliente usuario01 ha realizado la siguiente compra:
-- ● producto: producto9.
-- ● cantidad: 5.
-- ● fecha: fecha del sistema.

BEGIN TRANSACTION;
INSERT INTO compra (id, cliente_id, fecha) VALUES (33, 1, now());
UPDATE producto SET stock = stock - 5 WHERE id = 9;
COMMIT;

-- El cliente usuario02 ha realizado la siguiente compra:
-- ● producto: producto1, producto 2, producto 8.
-- ● cantidad: 3 de cada producto.
-- ● fecha: fecha del sistema.

BEGIN TRANSACTION;
INSERT INTO compra (id, cliente_id, fecha) VALUES (34, 2, now());
INSERT INTO detalle_compra (producto_id, compra_id, cantidad) VALUES (1, 34, 3);
UPDATE producto SET stock = stock - 3 WHERE id = 1;
INSERT INTO detalle_compra (producto_id, compra_id, cantidad) VALUES (2, 34, 3);
UPDATE producto SET stock = stock - 3 WHERE id = 2;
SAVEPOINT nueva_compra;
INSERT INTO detalle_compra (producto_id, compra_id, cantidad) VALUES (8, 34, 3);
UPDATE producto SET stock = stock - 3 WHERE id = 8;
ROLLBACK TO nueva_compra;

-- a. Deshabilitar el AUTOCOMMIT.
\set AUTOCOMMIT off

-- b. Insertar un nuevo cliente.
INSERT INTO cliente(nombre, email) VALUES ('usuario11', 'usuario11@gmail.com');

-- c. Confirmar que fue agregado en la tabla cliente.
SELECT * FROM cliente;

-- d. Realizar un ROLLBACK.
ROLLBACK;

-- e. Confirmar que se restauró la información, sin considerar la inserción del
-- punto b.
SELECT * FROM cliente;

-- f. Habilitar de nuevo el AUTOCOMMIT.
\set AUTOCOMMIT on