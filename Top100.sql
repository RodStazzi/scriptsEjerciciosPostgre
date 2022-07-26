--1. Crear base de datos llamada películas.
create database peliculas;
--2. Cargar ambos archivos a su tabla correspondiente.
create table peliculas(id int, pelicula varchar(100), año_estreno int, director varchar(50), primary key (id));
select * from peliculas;
copy peliculas from 'C:\Desafio\peliculas.csv' delimiter ',' csv header;

create table reparto(id int, actor varchar(50), foreign key (id) references peliculas(id));
copy reparto from 'C:\Desafio\reparto.csv' delimiter ',' csv header;
select * from reparto;

--3. Obtener el ID de la película “Titanic”.
select id from peliculas where pelicula = 'Titanic';

--4. Listar a todos los actores que aparecen en la película "Titanic".
select actor from reparto where id = 2;

--5. Consultar en cuántas películas del top 100 participa Harrison Ford.
select count(*) from peliculas where id in (select id from reparto where actor = 'Harrison Ford'); 
   
--6. Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título de manera ascendente.
select pelicula from peliculas where año_estreno between '1990' and '1999' order by pelicula;

--7. Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe ser nombrado para la consulta como “longitud_titulo”.
select pelicula, length(pelicula) as longitud_titulo from peliculas;

--8. Consultar cual es la longitud más grande entre todos los títulos de las películas.
select max(length(pelicula)) from peliculas;