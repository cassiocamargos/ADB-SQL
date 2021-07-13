CREATE DATABASE dbfaculdades;

USE dbfaculdades;


CREATE TABLE tblfaculdades(
	facid		int				not null,
	facnome		varchar(50)		not null, 
	facsigla    varchar(10)			null,
	primary key (facid)
);

-- MODELO 1 - tradicional
CREATE TABLE tblcursos(
	curid int not null,
	curnome varchar(50) not null, 
	cursigla varchar(10) null,
	curarea varchar(25) null,
	facid int not null, 
	PRIMARY KEY (curid),
	FOREIGN KEY (facid) REFERENCES tblfaculdades(facid)
);

-- MODELO 2 - com tabela associativa ou tabela ternária
CREATE TABLE tblcursos(
	curid int not null,
	curnome varchar(50) not null, 
	cursigla varchar(10) null,
	curarea varchar(25) null,
	PRIMARY KEY (curid)
);

CREATE TABLE tblcursosfaculdades(
	curid int not null,
	facid int not null,
	primary key (curid, facid),  -- pk composta
	foreign key (curid) references tblcursos (curid),
	foreign key (facid) references tblfaculdades(facid)
);


create table tblprofissoes(
	profid int not null, 
	profnome varchar(50) not null,
	primary key (profid)	
);


CREATE TABLE tblalunos(
	aluid int not null, 
	alura			  varchar(10)       not null unique,
	alunome			  varchar(50)       not null, 
	alucpf			  decimal(11,0)     not null unique,
	aludatanascimento datetime          not null,
	alupeso           decimal(6,3)      null,
	profid            int               null,
	curid             int               not null,
	primary key(aluid),
	foreign key (profid) references tblprofissoes(profid),
	foreign key (curid) references tblcursos(curid)
);


