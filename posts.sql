-- Crear una base de datos con nombre “Posts”.
CREATE DATABASE Post;

\c post
-- Crear una tabla “post”, con los atributos id, nombre de usuario, fecha de creación,
-- contenido y descripción.

CREATE TABLE post(
   id serial NOT NULL primary key,
   nombre_de_usuario varchar(50) NOT NULL,
   fecha_de_creacion DATE NOT NULL,
   contenido varchar(150) NOT NULL,
   descripcion varchar(150) NOT NULL
);

-- Insertar 3 post, 2 para el usuario "Pamela" y uno para "Carlos".

INSERT INTO post (nombre_de_usuario, fecha_de_creacion, contenido, descripcion)
VALUES ('Pamela', date '2020-12-31', 'hola', 'hola');
INSERT INTO post (nombre_de_usuario, fecha_de_creacion, contenido, descripcion)
VALUES ('Pamela', date '2020-12-31', 'chao', 'chao');
INSERT INTO post (nombre_de_usuario, fecha_de_creacion, contenido, descripcion)
VALUES ('Carlos', date '2020-12-31', 'hola', 'hola');

-- Modificar la tabla post, agregando la columna título.
ALTER TABLE post
ADD titulo VARCHAR(25);

-- Agregar título a las publicaciones ya ingresadas.

UPDATE post SET titulo = 'saludo' WHERE id = '1';
UPDATE post SET titulo = 'saludo2' WHERE id = '2';
UPDATE post SET titulo = 'despedida' WHERE id = '3';

-- Insertar 2 post para el usuario "Pedro".

INSERT INTO post (nombre_de_usuario, fecha_de_creacion, contenido, descripcion, titulo)
VALUES ('Pedro', date '2021-12-30', 'hola', 'hola', 'saludo');
INSERT INTO post (nombre_de_usuario, fecha_de_creacion, contenido, descripcion, titulo)
VALUES ('Pedro', date '2021-12-31', 'chao', 'chao', 'despedida');

-- Eliminar el post de Carlos.

DELETE FROM post WHERE id = '3';

-- Ingresar un nuevo post para el usuario "Carlos".

INSERT INTO post (nombre_de_usuario, fecha_de_creacion, contenido, descripcion, titulo)
VALUES ('Carlos', date '2022-03-01', 'hola', 'hola', 'saludo');

-- Crear una nueva tabla llamada “comentarios”, con los atributos id, fecha, hora de
-- creación y contenido, que se relacione con la tabla posts.

CREATE TABLE comentarios(
   id smallint NOT NULL,
   fecha DATE NOT NULL,
   hora_de_creacion TIME NOT NULL,
   contenido varchar(150) NOT NULL,
   FOREIGN KEY (id) REFERENCES post(id)
);

-- Crear 2 comentarios para el post de "Pamela" y 4 para "Carlos"

INSERT INTO comentarios (id, fecha, hora_de_creacion, contenido)
VALUES ('1', date '2022-03-01', time '12:00:00', 'hola comentario');

INSERT INTO comentarios (id, fecha, hora_de_creacion, contenido)
VALUES ('1', date '2022-03-01', time '12:30:00', 'hola comentario 2');

INSERT INTO comentarios (id, fecha, hora_de_creacion, contenido)
VALUES ('6', date '2022-03-01', time '13:30:00', 'hola comentario carlos');

INSERT INTO comentarios (id, fecha, hora_de_creacion, contenido)
VALUES ('6', date '2022-03-01', time '14:30:00', 'hola comentario carlos 2');

-- Crear un nuevo post para "Margarita".

INSERT INTO post (nombre_de_usuario, fecha_de_creacion, contenido, descripcion, titulo)
VALUES ('Margarita', date '2022-04-01', 'hola', 'hola', 'saludo');

-- Ingresar 5 comentarios para el post de Margarita.

INSERT INTO comentarios (id, fecha, hora_de_creacion, contenido)
VALUES ('7', date '2022-04-01', time '15:30:00', 'hola comentario Margarita');

INSERT INTO comentarios (id, fecha, hora_de_creacion, contenido)
VALUES ('7', date '2022-05-01', time '16:30:00', 'hola comentario Margarita 2');
