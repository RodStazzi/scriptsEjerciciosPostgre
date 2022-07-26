--Parte 1
--1. Crear una base de datos con nombre “Posts”.
create database Posts;

--2. Crear una tabla “post”, con los atributos id, nombre de usuario, fecha de creación,
--contenido y descripción.
create table post (id serial, nombre_de_usuario varchar(25), fecha_de_creacion date, contenido varchar(100), descripcion varchar(200));

--3. Insertar 3 post, 2 para el usuario "Pamela" y uno para "Carlos".
insert into post (nombre_de_usuario, fecha_de_creacion, contenido, descripcion) values ('Pamela 1', '2020/12/03', 'Comida Navideña', 'Comentario de comida salada navideña');
insert into post (nombre_de_usuario, fecha_de_creacion, contenido, descripcion) values ('Pamela 1', '2020/12/05', 'Comida Navideña', 'Comentario de comida dulce y grasosa navideña');
insert into post (nombre_de_usuario, fecha_de_creacion, contenido, descripcion) values ('Carlos 1', '2020/12/05', 'Comida Veraniega', 'Comentario de comida con mariscos');

--4. Modificar la tabla post, agregando la columna título.
alter table post add titulo varchar(25);

--5. Agregar título a las publicaciones ya ingresadas.
update post set titulo = 'Navidad' where id = 1;
update post set titulo = 'Navidad' where id = 2;
update post set titulo = 'Verano' where id = 3;

--6. Insertar 2 post para el usuario "Pedro".
insert into post (nombre_de_usuario, fecha_de_creacion, contenido, descripcion, titulo) values ('Pedro 1', '2021/01/05', 'Comida Veraniega', 'Comentario de comida con pescados', 'Verano');
insert into post (nombre_de_usuario, fecha_de_creacion, contenido, descripcion, titulo) values ('Pedro 1', '2021/03/08', 'Comida Veraniega', 'Comentario de sopas marinas', 'Verano');

--7. Eliminar el post de Carlos.
delete from post where nombre_de_usuario = 'Carlos 1';

--8. Ingresar un nuevo post para el usuario "Carlos".
insert into post (nombre_de_usuario, fecha_de_creacion, contenido, descripcion, titulo) values ('Carlos 1', '2021/03/10', 'Comida Veraniega', 'Comentario de sopas de moluscos', 'Verano');


--Parte 2
--1. Crear una nueva tabla llamada “comentarios”, con los atributos id, fecha, hora de
--creación y contenido, que se relacione con la tabla posts.
alter table post add primary key (id);
create table comentarios (id_comentarios int, fecha date, hora_de_creacion time, contenido varchar(200), foreign key (id_comentarios) references post(id));

--2. Crear 2 comentarios para el post de "Pamela" y 4 para "Carlos".
insert into comentarios (id_comentarios, fecha, hora_de_creacion, contenido) values (2, '2020/12/11', '15:35:45', 'Comentario de comida navideña con toques de Parmessan Cheese');
insert into comentarios (id_comentarios, fecha, hora_de_creacion, contenido) values (2, '2020/12/11', '15:35:45', '2do omentario de comida navideña con toques de Parmessan Cheese y aceitunas del Monte Sinaí');

insert into comentarios (id_comentarios, fecha, hora_de_creacion, contenido) values (8, '2021/03/11', '15:35:45', 'Comentario de comida de verano con mariscos y pescados podridos');
insert into comentarios (id_comentarios, fecha, hora_de_creacion, contenido) values (8, '2021/04/11', '15:35:45', '1er comentario de comida verano de ensaladas frías');
insert into comentarios (id_comentarios, fecha, hora_de_creacion, contenido) values (8, '2021/04/12', '15:35:45', '2do comentario de comida verano de ensaladas frías con frutas del oriente');
insert into comentarios (id_comentarios, fecha, hora_de_creacion, contenido) values (8, '2021/04/13', '15:35:45', '3er comentario de comida verano de ensaladas frías y frutos secos con hongos venenosos');

--3. Crear un nuevo post para "Margarita".
insert into post (nombre_de_usuario, fecha_de_creacion, contenido, descripcion, titulo) values ('Margarita 1', '2021/03/10', 'Comida Invernal', 'Comentario de sopas pal frío', 'Invierno');

--4. Ingresar 5 comentarios para el post de Margarita.
insert into comentarios (id_comentarios, fecha, hora_de_creacion, contenido) values (9, '2021/03/11', '15:35:45', 'Comentario de comida de invierno con mariscos y pescados podridos');
insert into comentarios (id_comentarios, fecha, hora_de_creacion, contenido) values (9, '2021/04/11', '15:35:45', '1er comentario de comida invierno de ensaladas frías');
insert into comentarios (id_comentarios, fecha, hora_de_creacion, contenido) values (9, '2021/04/12', '15:35:45', '2do comentario de comida invierno de ensaladas frías con frutas del oriente');
insert into comentarios (id_comentarios, fecha, hora_de_creacion, contenido) values (9, '2021/04/13', '15:35:45', '3er comentario de comida invierno de ensaladas frías y frutos secos con hongos venenosos');
insert into comentarios (id_comentarios, fecha, hora_de_creacion, contenido) values (9, '2021/04/13', '15:35:45', '3er comentario de comida invierno de ensaladas frías y frutos secos con hongos venenosos');

select*from post;
select*from comentarios;