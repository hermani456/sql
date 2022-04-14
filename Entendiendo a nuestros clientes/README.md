# Desafio entendiendo cómo se comportan nuestros clientes
### Descripción proyecto
Desafio desarrollado por un grupo de estudiantes dentro del Bootcamp Fullstack Javascript Trainee al año 2022.

### Contenidos aplicados
- Transacciones

#### Paso a paso
1. Se crea una base de datos con el comando `CREATE DATABASE` llamada `unidad2` 
2. Se nos solicita realizar una compra de una cantidad de 5 productos con ID 9. En la siguiente imagen se muestra la tabla de productos en la que es posible corroborar que en el ID 9 tiene en stock 8 productos, y luego de la compra en la segunda tabla quedarán 5 productos. 

![Tabla producto](https://i.ibb.co/G7kxQZD/TABLA-punto2.jpg)

3. Luego el cliente usuario02 realiza la siguiente compra:
+ producto: producto1, producto 2, producto 8.
+ cantidad: 3 de cada producto.
+ fecha: fecha del sistema.

Mediante las transacciones `SAVEPOINTS` y `ROLLBACK TO`, se realizan las consultas correspondientes para este requerimiento para validar que si alguno de los productos se queda sin stock, no se realice la compra. Se aprecia en la siguiente imagen que el producto de ID 8 no tiene stock.

![Tabla producto](https://i.ibb.co/D4XSm2T/punto3.png)

4. Realizar las siguientes consultas:
+ Deshabilitar el `AUTOCOMMIT`.
+ Insertar un nuevo cliente.
+ Confirmar que fue agregado en la tabla cliente.
+ Realizar un `ROLLBACK`.

![Tabla punto4](https://i.ibb.co/dfLBpgW/punto4.jpg)


+ Confirmar que se restauró la información, sin considerar la inserción del nuevo cliente
+ Habilitar de nuevo el `AUTOCOMMIT`.

![Tabla punto4](https://i.ibb.co/cJ3T2Cj/punto4b.jpg)



### Instrucciones

- Para ingresar a ver los archivos del proyecto, dirijase a la carpeta desafio_comportamiento_clientes, y luego a desafio_comportamiento_clientes.sql.
- Usted puede descargar el proyecto o clonarlo.
- Para ver las tablas en SQL SHELL(psql) ingrese `SELECT * FROM nombre_tabla;`

### Quiénes contribuyeron

+ [Diego Campuzano](https://github.com/hermani456)
+ [Melanie Pardo](https://github.com/melaniepardo)
+ [Juan Vega](https://github.com/juanv5)