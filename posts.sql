-- Crear una base de datos con nombre “Posts”.
CREATE DATABASE Post;

\c post
-- Crear una tabla “post”, con los atributos id, nombre de usuario, fecha de creación,
-- contenido y descripción.

CREATE TABLE post(
   id bigserial NOT NULL,
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

UPDATE post SET titulo = 'saludo' WHERE nombre_de_usuario = 'Pamela';
UPDATE post SET titulo = 'despedida' WHERE nombre_de_usuario = 'Carlos';

-- Insertar 2 post para el usuario "Pedro".

INSERT INTO post (nombre_de_usuario, fecha_de_creacion, contenido, descripcion, titulo)
VALUES ('Pedro', date '2021-12-30', 'hola', 'hola', 'saludo');
INSERT INTO post (nombre_de_usuario, fecha_de_creacion, contenido, descripcion, titulo)
VALUES ('Pedro', date '2021-12-31', 'chao', 'chao', 'despedida');

-- Eliminar el post de Carlos.

DELETE FROM post WHERE nombre_de_usuario = 'Carlos';

-- Ingresar un nuevo post para el usuario "Carlos".

INSERT INTO post (nombre_de_usuario, fecha_de_creacion, contenido, descripcion, titulo)
VALUES ('Carlos', date '2022-03-01', 'hola', 'hola', 'saludo');

-- Crear una nueva tabla llamada “comentarios”, con los atributos id, fecha, hora de
-- creación y contenido, que se relacione con la tabla posts.

CREATE TABLE comentarios(
   id bigserial NOT NULL,
   fecha DATE NOT NULL,
   hora_de_creacion TIME NOT NULL,
   contenido varchar(150) NOT NULL
);





