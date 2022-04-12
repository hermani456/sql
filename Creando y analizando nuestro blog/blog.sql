-- Crear base de datos llamada blog_db.
CREATE DATABASE blog_db;

-- cambiar a la base de datos blog_db.

\c blog_db

CREATE TABLE usuarios (
   id SERIAL PRIMARY KEY,
   email VARCHAR(255) NOT NULL
);

CREATE TABLE posts (
   id SERIAL PRIMARY KEY,
   usuarios_fk INTEGER REFERENCES usuarios(id),
   titulo VARCHAR(255) NOT NULL,
   fecha DATE NOT NULL
);

CREATE TABLE comentarios (
   id SERIAL PRIMARY KEY,
   posts_fk INTEGER REFERENCES posts(id),
   usuarios_fk INTEGER REFERENCES usuarios(id),
   texto VARCHAR(255) NOT NULL,
   fecha DATE NOT NULL
);

-- Insertar los siguientes registros en la tabla usuarios.

INSERT INTO usuarios (email) VALUES ('usuario01@gmail.com');
INSERT INTO usuarios (email) VALUES ('usuario02@gmail.com');
INSERT INTO usuarios (email) VALUES ('usuario03@gmail.com');
INSERT INTO usuarios (email) VALUES ('usuario04@gmail.com');
INSERT INTO usuarios (email) VALUES ('usuario05@gmail.com');
INSERT INTO usuarios (email) VALUES ('usuario06@gmail.com');
INSERT INTO usuarios (email) VALUES ('usuario07@gmail.com');
INSERT INTO usuarios (email) VALUES ('usuario08@gmail.com');
INSERT INTO usuarios (email) VALUES ('usuario09@gmail.com');

-- Insertar los siguientes registros en la tabla posts.

INSERT INTO posts (usuarios_fk, titulo, fecha) VALUES (1, 'Post 1: Esto es malo', '2020-06-29');
INSERT INTO posts (usuarios_fk, titulo, fecha) VALUES (5, 'Post 2: Esto es malo', '2020-06-20');
INSERT INTO posts (usuarios_fk, titulo, fecha) VALUES (1, 'Post 3: Esto es excelente', '2020-05-30');
INSERT INTO posts (usuarios_fk, titulo, fecha) VALUES (9, 'Post 4: Esto es bueno', '2020-05-09');
INSERT INTO posts (usuarios_fk, titulo, fecha) VALUES (7, 'Post 5: Esto es bueno', '2020-07-10');
INSERT INTO posts (usuarios_fk, titulo, fecha) VALUES (5, 'Post 6: Esto es excelente', '2020-07-18');
INSERT INTO posts (usuarios_fk, titulo, fecha) VALUES (8, 'Post 7: Esto es excelente', '2020-07-07');
INSERT INTO posts (usuarios_fk, titulo, fecha) VALUES (5, 'Post 8: Esto es excelente', '2020-05-14');
INSERT INTO posts (usuarios_fk, titulo, fecha) VALUES (2, 'Post 9: Esto es bueno', '2020-05-08');
INSERT INTO posts (usuarios_fk, titulo, fecha) VALUES (6, 'Post 10: Esto es bueno', '2020-06-02');
INSERT INTO posts (usuarios_fk, titulo, fecha) VALUES (4, 'Post 11: Esto es bueno', '2020-05-05');
INSERT INTO posts (usuarios_fk, titulo, fecha) VALUES (9, 'Post 12: Esto es malo', '2020-07-23');
INSERT INTO posts (usuarios_fk, titulo, fecha) VALUES (5, 'Post 13: Esto es excelente', '2020-05-30');
INSERT INTO posts (usuarios_fk, titulo, fecha) VALUES (8, 'Post 14: Esto es excelente', '2020-05-01');
INSERT INTO posts (usuarios_fk, titulo, fecha) VALUES (7, 'Post 15: Esto es malo', '2020-06-17');

-- Insertar los siguientes registros en la tabla comentarios.

INSERT INTO comentarios (posts_fk, usuarios_fk, texto, fecha) VALUES (6, 3, 'Este es el comentario 1', '2020-07-08');
INSERT INTO comentarios (posts_fk, usuarios_fk, texto, fecha) VALUES (2, 4, 'Este es el comentario 2', '2020-06-07');
INSERT INTO comentarios (posts_fk, usuarios_fk, texto, fecha) VALUES (4, 6, 'Este es el comentario 3', '2020-06-16');
INSERT INTO comentarios (posts_fk, usuarios_fk, texto, fecha) VALUES (13, 2, 'Este es el comentario 4', '2020-06-15');
INSERT INTO comentarios (posts_fk, usuarios_fk, texto, fecha) VALUES (6, 6, 'Este es el comentario 5', '2020-05-14');
INSERT INTO comentarios (posts_fk, usuarios_fk, texto, fecha) VALUES (3, 3, 'Este es el comentario 6', '2020-07-08');
INSERT INTO comentarios (posts_fk, usuarios_fk, texto, fecha) VALUES (1, 6, 'Este es el comentario 7', '2020-05-22');
INSERT INTO comentarios (posts_fk, usuarios_fk, texto, fecha) VALUES (7, 6, 'Este es el comentario 8', '2020-07-09');
INSERT INTO comentarios (posts_fk, usuarios_fk, texto, fecha) VALUES (13, 8, 'Este es el comentario 9', '2020-06-30');
INSERT INTO comentarios (posts_fk, usuarios_fk, texto, fecha) VALUES (6, 8, 'Este es el comentario 10', '2020-06-19');
INSERT INTO comentarios (posts_fk, usuarios_fk, texto, fecha) VALUES (1, 5, 'Este es el comentario 11', '2020-05-09');
INSERT INTO comentarios (posts_fk, usuarios_fk, texto, fecha) VALUES (15, 8, 'Este es el comentario 12', '2020-06-17');
INSERT INTO comentarios (posts_fk, usuarios_fk, texto, fecha) VALUES (9, 1, 'Este es el comentario 13', '2020-05-01');
INSERT INTO comentarios (posts_fk, usuarios_fk, texto, fecha) VALUES (5, 2, 'Este es el comentario 14', '2020-05-31');
INSERT INTO comentarios (posts_fk, usuarios_fk, texto, fecha) VALUES (3, 4, 'Este es el comentario 15', '2020-06-28');

-- Seleccionar el correo, id y título de todos los post publicados por el usuario 5.

SELECT email, usuarios_fk, titulo 
FROM usuarios INNER JOIN posts ON usuarios.id = posts.usuarios_fk 
WHERE usuarios.id = 5; 

-- Listar el correo, id y el detalle de todos los comentarios que no hayan sido realizados
-- por el usuario con email usuario06@hotmail.com.

SELECT email, usuarios.id, texto
FROM comentarios
FULL OUTER JOIN usuarios ON comentarios.usuarios_fk = usuarios.id
WHERE usuarios.email != 'usuario06@gmail.com';

-- Listar los usuarios que no han publicado ningún post.

SELECT *
FROM usuarios LEFT JOIN posts ON usuarios.id = posts.usuarios_fk
WHERE posts.usuarios_fk IS NULL;

-- Listar todos los post con sus comentarios (incluyendo aquellos que no poseen
-- comentarios).

SELECT titulo, texto
FROM posts LEFT JOIN comentarios ON posts.id = comentarios.posts_fk;

-- Listar todos los usuarios que hayan publicado un post en Junio.

SELECT usuarios_fk
FROM posts
WHERE fecha BETWEEN '2020-06-01' AND '2020-06-30';
