
CREATE DATABASE dbClientes;

USE dbclientes;

--DROP TABLE tblestados;
CREATE TABLE tblestados(
	estcodigo	int			not null,
	estnome     varchar(25) not null,
	estapelido	varchar(25)		null,
	primary key (estcodigo)
);

ALTER TABLE tblestados ADD estnumerohab		decimal(4,1)	null;
ALTER TABLE tblestados DROP COLUMN estnumerohab;

--DROP TABLE tblcidades;
CREATE TABLE tblcidades(
	cidcodigo		int			not null  primary key,
	cidnome			varchar(50) not null,
	estcodigo		int			not null
);

-- DROP TABLE tblbairros;
CREATE TABLE tblbairros(
	baicodigo		int			not null, 
	bainome			varchar(50) not null,
	cidcodigo		int			not null 
);

ALTER TABLE tblbairros
  ADD PRIMARY KEY (baicodigo);


-- DROP TABLE tblclientes;
CREATE TABLE tblclientes(
	clicodigo		  int			not null,
	clinome			  varchar(50)   not null,
	clicpf            decimal(11,0) not null UNIQUE,
	clirg             varchar(9)    not null UNIQUE,
	clinumerotitelei  decimal(12,0)     null, 
	clidatanascimento datetime      not null,
	clicep            int           not null,
	cliendereco		  varchar(100)  not null,
	clinumero         varchar(10)   not null,
	clicomplemento    varchar(50)       null,
	estcodigo		  int			not null,
	cidcodigo		  int			not null,
	baicodigo		  int	        not null,
	primary key (clicodigo)
);

                         











