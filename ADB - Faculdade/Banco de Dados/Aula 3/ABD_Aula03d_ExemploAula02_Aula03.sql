
-- Criando a base de dados.
CREATE DATABASE dbAlunos;

/* Entra dentro do database */
USE dbAlunos;

CREATE TABLE tblsexos(
	sexcodigo      integer,
	sexdescricao   varchar(1)
);

CREATE TABLE tblfaculdades(
	faccodigo		integer,
	facdescricao    varchar(50),
	facsigla        varchar(10),
);

CREATE TABLE tblcursos(
	curcodigo		integer,
	curdescricao	varchar(50)
);

CREATE TABLE tblprofissoes(
	procodigo		integer,
	prodescricao	varchar(50)
);

...

CREATE TABLE tblcidades(
	cidcogido	  integer,
	ciddescricao  varchar(50)
);

CREATE TABLE tblbairros(
	baicodigo	  integer,
	baidescricao  varchar(50)
);

DROP TABLE tblalunos;

CREATE TABLE tblalunos(
	alura       varchar(7),
	alunome		varchar(50),
	alucpf		decimal(11,0),
	alurg       varchar(9),
	aludatanascimento datetime,
	sexcodigo	integer,
	faccodigo	integer,
	curcodigo	integer,
	procodigo   integer,
	cidcodigo	integer,
	baicodigo	integer
);

ALTER TABLE tblalunos
  ADD aluidade	integer;
  
ALTER TABLE tblalunos
  DROP COLUMN aluidade;  


CREATE TABLE tblboletos(
	bolcodigo	integer,
	bolvalor	decimal(7,2),
	alura		varchar(7)
);


