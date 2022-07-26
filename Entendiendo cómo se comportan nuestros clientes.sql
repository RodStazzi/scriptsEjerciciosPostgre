create database desafiounidad2;
--\c desafiounidad2;

--1. Cargar el respaldo de la base de datos unidad2.sql.
--\i 'C:/Desafio/unidad2'

SELECT*FROM cliente;
SELECT*FROM producto;
SELECT*FROM compra;
SELECT*FROM detalle_compra;

--2. El cliente usuario01 ha realizado la siguiente compra:
--● producto: producto9.
--● cantidad: 5.
--● fecha: fecha del sistema.
--Mediante el uso de transacciones, realiza las consultas correspondientes para este
--requerimiento y luego consulta la tabla producto para validar si fue efectivamente
--descontado en el stock.
begin transaction;
insert into compra (id, cliente_id, fecha) values (33,1, now());
insert into detalle_compra (id, producto_id, compra_id, cantidad) values (43, 9, 33, 5);
update producto set stock = stock - 5 where id = 9;
commit;

--3. El cliente usuario02 ha realizado la siguiente compra:
--● producto: producto1, producto 2, producto 8.
--● cantidad: 3 de cada producto.
--● fecha: fecha del sistema.
--Mediante el uso de transacciones, realiza las consultas correspondientes para este
--requerimiento y luego consulta la tabla producto para validar que si alguno de ellos
--se queda sin stock, no se realice la compra. 

begin transaction;
insert into compra (id, cliente_id, fecha) values (34, 2, now());
insert into detalle_compra (id, producto_id, compra_id, cantidad) values (44, 1, 34, 3),
(45, 2, 34, 3),
(46, 8, 34, 3);
update producto set stock = stock -3 where id = 1;
update producto set stock = stock -3 where id = 2;
update producto set stock = stock -3 where id = 8;
rollback;
select*from producto;


--4. Realizar las siguientes consultas (2 Puntos):
--a. Deshabilitar el AUTOCOMMIT .
--set :AUTOCOMMIT off

--b. Insertar un nuevo cliente.
begin transaction;
insert into cliente (id, nombre, email) values (11, 'usuario11', 'usuario11@hotmail.com');

--c. Confirmar que fue agregado en la tabla cliente.
select*from cliente;

--d. Realizar un ROLLBACK.
rollback;
--e. Confirmar que se restauró la información, sin considerar la inserción del
--punto b.
select*from cliente;

--f. Habilitar de nuevo el AUTOCOMMIT.
--set :AUTOCOMMIT on