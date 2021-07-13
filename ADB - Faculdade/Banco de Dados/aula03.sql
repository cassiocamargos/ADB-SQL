
--criando a base de dados
create database dbalunos;
use dbalunos;
create table tblsexos(
	codsexo integer,
	sexo varchar(1)
);

create table tblfaculdades(
	codfacul integer,
	faculdade varchar (50)
);

create table tblcursos(
	codcurso integer,
	curso varchar(15)
);