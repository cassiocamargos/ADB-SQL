
CREATE DATABASE dbnotebooks;

USE dbnotebooks;

CREATE TABLE tblmarca(
	codmarca	int			not null primary key,
	nomemarca	varchar(10)	not null
);

CREATE TABLE tbllinha(
	codlinha	int			not null  primary key,
	nomelinha	varchar(25)	not null,
	codmarca	int			not null
);

CREATE TABLE tblprocessador(
	codprocessador	int			not null  primary key,
	nomeprocessador	varchar(20)	not null
);

CREATE TABLE tblram(
	codram	int			not null  primary key,
	nomeram	varchar(4)	not null
);

CREATE TABLE tblarmazenamento(
	codarmazenamento	int			not null  primary key,
	nomearmazenamento	varchar(6)	not null
);

CREATE TABLE tblso(
	codso	int			not null  primary key,
	nomeso	varchar(20)	not null
);

CREATE TABLE tblcores(
	codcor	int			not null  primary key,
	nomecor	varchar(20)	not null
);

CREATE TABLE tblnotebooks(
	codmarca			int				not null,
	nomemodelo			varchar(30)		not null,
	codlinha			int				not null,
	codprocessador		int				not null,
	tamram				varchar(5)		not null,
	codram				int				not null,
	codarmazenamento	int				not null,
	capacidadessd		varchar(5)		null,
	capacidadehd		varchar(5)		null,
	placadedicada		varchar(20)		null,
	tamdedicada			varchar(5)		null,
	tamtela				decimal(2,1)	not null,
	codso				int				not null,
	codcor				int				not null
);