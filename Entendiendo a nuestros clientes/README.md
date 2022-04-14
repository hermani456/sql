### Desafío Entendiendo cómo se comportan nuestros clientes

Cargar el respaldo de la base de datos unidad2.sql.

`psql -U postgres unidad2 < unidad2.sql`

El cliente usuario01 ha realizado la siguiente compra:
- producto: producto9.
- cantidad: 5.
- fecha: fecha del sistema.

`BEGIN TRANSACTION;
INSERT INTO compra (id, cliente_id, fecha) VALUES (33, 1, now());
INSERT INTO detalle_compra (producto_id, compra_id, cantidad) VALUES (9, 33, 5);
UPDATE producto SET stock = stock - 5 WHERE id = 9;
COMMIT;`

output:

![ss](https://i.ibb.co/pjRCVf9/Screenshot-4.png)![ss](https://i.ibb.co/JvfWDyb/Screenshot-5.png)

El cliente usuario02 ha realizado la siguiente compra:
- producto: producto1, producto 2, producto 8.
- cantidad: 3 de cada producto.
- fecha: fecha del sistema.

`BEGIN TRANSACTION;
INSERT INTO compra (id, cliente_id, fecha) VALUES (34, 2, now());
INSERT INTO detalle_compra (producto_id, compra_id, cantidad) VALUES (1, 34, 3);
UPDATE producto SET stock = stock - 3 WHERE id = 1;
INSERT INTO detalle_compra (producto_id, compra_id, cantidad) VALUES (2, 34, 3);
UPDATE producto SET stock = stock - 3 WHERE id = 2;
SAVEPOINT nueva_compra;
INSERT INTO detalle_compra (producto_id, compra_id, cantidad) VALUES (8, 34, 3);
UPDATE producto SET stock = stock - 3 WHERE id = 8;
ROLLBACK TO nueva_compra;`

output:

Tabla producto antes de realizar el query.

![ss](https://i.ibb.co/193jYYc/Screenshot-14.png)

Tabla productos despues de realizar el query, tomando en cuenta el error del item id 8, que no tiene stock, por ende su stock se mantiene.

![ss](https://i.ibb.co/N1D1Y0y/Screenshot-13.png)

Realizar las siguientes consultas:
- Deshabilitar el AUTOCOMMIT.
- Insertar un nuevo cliente.
- Confirmar que fue agregado en la tabla cliente.
- Realizar un ROLLBACK.
- Confirmar que se restauró la información, sin considerar la inserción del punto b.
- Habilitar de nuevo el AUTOCOMMIT.

`\set AUTOCOMMIT off
INSERT INTO cliente(nombre, email) VALUES ('usuario11', 'usuario11@gmail.com');
SELECT * FROM cliente;
ROLLBACK;
SELECT * FROM cliente;
\set AUTOCOMMIT on`

output:

![ss](https://i.ibb.co/DCFc9DT/Screenshot-11.png)
