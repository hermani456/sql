-- Crear una base de datos con nombre “Posts”.
CREATE DATABASE post_bd;

\c post
-- Crear una tabla “post”, con los atributos id, nombre de usuario, fecha de creación,
-- contenido y descripción.

CREATE TABLE post(
   id SERIAL NOT NULL PRIMARY KEY,
   nombre_usuario varchar(50) NOT NULL,
   fecha_creacion DATE NOT NULL,
   contenido varchar(150) NOT NULL,
   descripcion varchar(150) NOT NULL
);

-- Insertar 3 post, 2 para el usuario "Pamela" y uno para "Carlos".

INSERT INTO post (nombre_usuario, fecha_creacion, contenido, descripcion)
VALUES ('Pamela', '2020-12-31', 'hola', 'hola');
INSERT INTO post (nombre_usuario, fecha_creacion, contenido, descripcion)
VALUES ('Pamela', '2020-12-31', 'chao', 'chao');
INSERT INTO post (nombre_usuario, fecha_creacion, contenido, descripcion)
VALUES ('Carlos', '2020-12-31', 'hola', 'hola');

-- Modificar la tabla post, agregando la columna título.
ALTER TABLE post
ADD titulo VARCHAR(25);

-- Agregar título a las publicaciones ya ingresadas.

UPDATE post SET titulo = 'saludo' WHERE id = '1';
UPDATE post SET titulo = 'saludo2' WHERE id = '2';
UPDATE post SET titulo = 'despedida' WHERE id = '3';

-- Insertar 2 post para el usuario "Pedro".

INSERT INTO post (nombre_usuario, fecha_creacion, contenido, descripcion, titulo)
VALUES ('Pedro', '2021-12-30', 'hola', 'hola', 'saludo');
INSERT INTO post (nombre_usuario, fecha_creacion, contenido, descripcion, titulo)
VALUES ('Pedro', '2021-12-31', 'chao', 'chao', 'despedida');

-- Eliminar el post de Carlos.

DELETE FROM post WHERE id = '3';

-- Ingresar un nuevo post para el usuario "Carlos".

INSERT INTO post (nombre_usuario, fecha_creacion, contenido, descripcion, titulo)
VALUES ('Carlos', '2022-03-01', 'hola', 'hola', 'saludo');

-- Crear una nueva tabla llamada “comentarios”, con los atributos id, fecha, hora de
-- creación y contenido, que se relacione con la tabla posts.

CREATE TABLE comentarios(
   id SERIAL NOT NULL PRIMARY KEY,
   post_id BIGINT NOT NULL,
   fecha DATE NOT NULL,
   hora_creacion TIME NOT NULL,
   contenido varchar(150) NOT NULL,
   FOREIGN KEY (post_id) REFERENCES post(id)
);

-- Crear 2 comentarios para el post de "Pamela" y 4 para "Carlos"

INSERT INTO comentarios (post_id, fecha, hora_creacion, contenido)
VALUES ('1', '2022-03-01', TIME '12:00:00', 'hola comentario');

INSERT INTO comentarios (post_id, fecha, hora_creacion, contenido)
VALUES ('1', '2022-03-01', TIME '12:30:00', 'hola comentario 2');

INSERT INTO comentarios (post_id, fecha, hora_creacion, contenido)
VALUES ('6', '2022-03-01', TIME '13:30:00', 'hola comentario carlos');

INSERT INTO comentarios (post_id, fecha, hora_creacion, contenido)
VALUES ('6', '2022-03-01', TIME '14:30:00', 'hola comentario carlos 2');

-- Crear un nuevo post para "Margarita".

INSERT INTO post (nombre_usuario, fecha_creacion, contenido, descripcion, titulo)
VALUES ('Margarita', '2022-04-01', 'hola', 'hola', 'saludo');

-- Ingresar 5 comentarios para el post de Margarita.

INSERT INTO comentarios (post_id, fecha, hora_creacion, contenido)
VALUES ('7', '2022-04-01', TIME '15:30:00', 'hola comentario Margarita');

INSERT INTO comentarios (post_id, fecha, hora_creacion, contenido)
VALUES ('7', '2022-05-01', TIME '16:30:00', 'hola comentario Margarita 2');
