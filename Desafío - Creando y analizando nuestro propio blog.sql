create database blog;

create table usuarios (id serial, email varchar, primary key (id));
insert into usuarios (email) values (
'usuario01@hotmail.com'),
('usuario02@gmail.com'),
('usuario03@gmail.com'),
('usuario04@hotmail.com'),
('usuario05@yahoo.com'),
('usuario06@hotmail.com'),
('usuario07@yahoo.com'),
('usuario08@yahoo.com'),
('usuario09@yahoo.com');

select*from usuarios;
drop table usuarios;

create table posts (id serial, usuario_id int, titulo varchar(200), fecha date, primary key (id), foreign key (usuario_id) references usuarios(id));
insert into posts (usuario_id, titulo, fecha) values 
(1, 'Post 1: Esto es malo', '2020-06-29'),
(5, 'Post 2: Esto es malo', '2020-06-20'),
(1, 'Post 3: Esto es excelente', '2020-05-30'),
(9, 'Post 4: Esto es bueno', '2020-05-09'),
(7, 'Post 5: Esto es bueno', '2020-07-10'),
(5, 'Post 6: Esto es excelente', '2020-07-18'),
(8, 'Post 7: Esto es excelente', '2020-07-07'),
(5, 'Post 8: Esto es excelente', '2020-05-14'),
(2, 'Post 9: Esto es bueno', '2020-05-08'),
(6, 'Post 10: Esto es bueno', '2020-06-02'),
(4, 'Post 11: Esto es bueno', '2020-05-05'),
(9, 'Post 12: Esto es malo', '2020-07-23'),
(5, 'Post 13: Esto es excelente', '2020-05-30'),
(8, 'Post 14: Esto es excelente', '2020-05-01'),
(7, 'Post 15: Esto es malo', '2020-06-17');

select*from posts;

create table comentarios (id serial, post_id int, usuario_id int, texto varchar(200), fecha date, primary key (id), foreign key (post_id) references posts(id),foreign key (usuario_id) references usuarios(id));
insert into comentarios (post_id, usuario_id, texto, fecha) values
(6, 3, 'Este es el comentario 1', '2020-07-08'),
(2, 4, 'Este es el comentario 2', '2020-06-07'),
(4, 6, 'Este es el comentario 3', '2020-06-16'),
(13, 2, 'Este es el comentario 4', '2020-06-15'),
(6, 6, 'Este es el comentario 5', '2020-05-14'),
(3, 3, 'Este es el comentario 6', '2020-07-08'),
(1, 6, 'Este es el comentario 7', '2020-05-22'),
(7, 6, 'Este es el comentario 8', '2020-07-09'),
(13, 8, 'Este es el comentario 9', '2020-06-30'),
(6, 8, 'Este es el comentario 10', '2020-06-19'),
(1, 5, 'Este es el comentario 11', '2020-05-09'),
(15, 8, 'Este es el comentario 12', '2020-06-17'),
(9, 1, 'Este es el comentario 13', '2020-05-01'),
(5, 2, 'Este es el comentario 14', '2020-05-31'),
(3, 4, 'Este es el comentario 15', '2020-06-28');

select*from comentarios;

--Seleccionar el correo, id y título de todos los post publicados por el usuario 5.
SELECT * FROM usuarios LEFT JOIN posts on usuarios.id=posts.usuario_id WHERE usuario_id=5;

--Listar el correo, id y el detalle de todos los comentarios que no hayan sido realizados
--por el usuario con email usuario06@hotmail.com.
SELECT * FROM usuarios LEFT JOIN comentarios on usuarios.id=comentarios.usuario_id WHERE email!='usuario06@hotmail.com';

--Listar los usuarios que no han publicado ningún post.
SELECT * FROM usuarios LEFT JOIN posts on usuarios.id=posts.usuario_id WHERE titulo is null;

--Listar todos los post con sus comentarios (incluyendo aquellos que no poseen
--comentarios).
select * from posts full outer join comentarios on posts.id=comentarios.post_id;

--Listar todos los usuarios que hayan publicado un post en Junio. 
select usuarios.id, email FROM usuarios LEFT JOIN posts on usuarios.id=posts.usuario_id WHERE fecha between '2020-06-01' and '2020-06-30';
