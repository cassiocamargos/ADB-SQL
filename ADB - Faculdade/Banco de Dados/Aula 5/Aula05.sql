
CREATE DATABASE dbuniversidade;

USE dbuniversidade;


-------------------------------------------------
-- EXEMPLO 01 - PK e FK
-------------------------------------------------

CREATE TABLE tblestados(
	estid	 int        not null,
	estsigla varchar(2) not null,
	primary key (estid)	
);

CREATE TABLE tblcursos(
	curid			int				not null,
	curnome			varchar(50)		not null,
	PRIMARY KEY (curid)
);

-- DROP TABLE tblalunos;
CREATE TABLE tblalunos(
	aluid			int				not null,
	alunome			varchar(50)		not null,
	alunomesocial	varchar(50)		null,
	alucpf			decimal(11,0)   not null unique,
	alurg			varchar(9)		not null unique,
	curid			int				not null,
	estid			int				not null,
	primary key(aluid),
	foreign key(curid)	references tblcursos(curid),
	foreign key (estid) references tblestados(estid)
);

SELECT * FROM tblcursos;
SELECT * FROM tblestados;
SELECT * FROM tblalunos;

INSERT INTO tblcursos VALUES (10, 'TEATRO');
INSERT INTO tblcursos VALUES (11, 'ANALISE E DESENV. SIST.');
INSERT INTO tblcursos VALUES (12, 'MAQUIAGEM ARTISTICA');

INSERT INTO tblestados VALUES (100, 'SP');
INSERT INTO tblestados VALUES (101, 'MG');

INSERT INTO tblalunos VALUES (1, 'RITA CADILAC', 'RITAC', 1, '1C', 10, 100);
INSERT INTO tblalunos VALUES (2, 'PAULO B', 'PAULOB', 1111111, '2222CCC', 11, 101);

DELETE FROM tblcursos
WHERE curid = 12;


-------------------------------------------------
-- EXEMPLO 02 - PK COMPOSTA e FKs
-------------------------------------------------

CREATE TABLE tblfaculdades(
	facid		int			 not null,
	facnome		varchar(25)	 not null,
	primary key (facid)
);


-- tabela de cursos ja esta criada


CREATE TABLE tblcursosfaculdades(
	curid		int		not null,
	facid		int		not null,
	primary key (curid, facid),
	foreign key (curid) references tblcursos(curid),
	foreign key (facid) references tblfaculdades(facid)
);



-------------------------------------------------
-- EXEMPLO 03 - PK COMPOSTA e FKs
-------------------------------------------------

CREATE TABLE tbldisciplinas(
	disid		int				not null,
	disnome		varchar(25)		not null,
	primary key (disid)
);

DROP TABLE tbldisciplinascurso;

CREATE TABLE tbldisciplinascurso(
	disid		int				not null,
	curid		int				not null,
	foreign key (disid) references tbldisciplinas(disid),
	primary key (disid, curid),
	foreign key (curid) references tblcursos(curid)
);
