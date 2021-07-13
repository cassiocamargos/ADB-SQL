CREATE DATABASE dbfaculdades;

USE dbfaculdades;

-----------------------------------------------------------
--FACULDADE------------------------------------------------

CREATE TABLE tblfaculdades(
	facid		int			not null,
	facnome		varchar(50)	not null,
	facsigla	varchar(10)	null,
	primary key (facid) 
);

CREATE TABLE tblcursos(
	curid		int			not null,
	curnome		varchar(50)	not null,
	facid		int			not null,
	primary key (curid),
	foreign key (facid) references tblfaculdades (facid)
);

CREATE TABLE tbldisciplinas(
	discid		int			not null,
	discnome	varchar(50)	not null,
	primary key (discid)
);

CREATE TABLE tbldisciplinascursos(
	discid		int		not null,
	curid		int		not null,
	primary key (discid, curid),
	foreign key (discid) references tbldisciplinas (discid),
	foreign key (curid) references tblcursos (curid)
);

-----------------------------------------------------------
--CEPs-----------------------------------------------------

CREATE TABLE tblestados(
	estid		int			not null,
	estnome		varchar(20)	not null,
	estsigla	varchar(2)	not null,
	primary key (estid)
);

CREATE TABLE tblcidades(
	cidid		int			not null,
	cidnome		varchar(35)	not null,
	estid		int			not null,
	primary key (cidid),
	foreign key (estid) references tblestados (estid)
);

CREATE TABLE tblbairros(
	bairroid		int			not null,
	bairronome		varchar(30)	not null,
	cidid			int			not null,
	primary key (bairroid),
	foreign key (cidid) references tblcidades (cidid)
);

CREATE TABLE tblceps(
	cepid		int		not null,
	cepnum		int		not null,
	estid		int		not null,
	cidid		int		not null,
	bairroid	int		not null,
	primary key (cepid),
	foreign key (estid) references tblestados (estid),
	foreign key (cidid) references tblcidades (cidid),
	foreign key (bairroid) references tblbairros (bairroid)
);

-----------------------------------------------------------
--profissoes-----------------------------------------------

CREATE TABLE tblprofissoes(
	profid		int			not null,
	profnome	varchar(30)	not null,
	primary key (profid)
);

-----------------------------------------------------------
--alunos---------------------------------------------------

CREATE TABLE tblalunos(
	aluid		int				not null,
	alura		varchar(10)		not null	unique,
	alunome		varchar(50)		not null,
	alucpf		decimal(11,0)	not null	unique,
	alurg		varchar(9)		not null	unique,
	aludtnasc	datetime		not null,
	alulogr		varchar(50)		not null,
	cepid		int				not null,
	profid		int				null,
	facid		int				not null,
	curid		int				not null,
	primary key (aluid),
	foreign key (cepid) references tblceps (cepid),
	foreign key (profid) references tblprofissoes (profid),
	foreign key (facid) references tblfaculdades (facid),
	foreign key (curid) references tblcursos (curid)
); 

-----------------------------------------------------------
--disciplinasalunos----------------------------------------

CREATE TABLE tbldisciplinasalunos(
	discid	int		not null,
	aluid	int		not null,
	primary key (discid, aluid),
	foreign key (discid) references tbldisciplinas (discid),
	foreign key (aluid) references tblalunos (aluid)
);

-----------------------------------------------------------
--notasdisciplinas-----------------------------------------

CREATE TABLE tblnotasdisciplinas(
	discid		int				not null,
	aluid		int				not null,
	nota1		decimal(3,1)	not null,
	nota2		decimal(3,1)	not null,
	notafinal	decimal(3,1)	not null,
	primary key (discid, aluid),
	foreign key (discid) references tbldisciplinas (discid),
	foreign key (aluid) references tblalunos (aluid)
);

-----------------------------------------------------------
--boletos--------------------------------------------------

CREATE TABLE tblboletos(
	bolid		int				not null,
	bolvalor	decimal(5,2)	not null,
	aluid		int				not null,
	primary key (bolid),
	foreign key (aluid) references tblalunos (aluid)
);


-----------------------------------------------------------
--select---------------------------------------------------

SELECT * 
	FROM tblfaculdades;

SELECT * 
	FROM tblcursos;

SELECT * 
	FROM tbldisciplinas;

SELECT * 
	FROM tbldisciplinascursos;

SELECT * 
	FROM tblestados;

SELECT * 
	FROM tblcidades;

SELECT * 
	FROM tblbairros;

SELECT * 
	FROM tblceps;

SELECT * 
	FROM tblprofissoes;

SELECT * 
	FROM tblalunos;

SELECT * 
	FROM tbldisciplinasalunos;

SELECT * 
	FROM tblnotasdisciplinas;

SELECT * 
	FROM tblboletos;

-----------------------------------------------------------
--insert---------------------------------------------------

INSERT INTO tblfaculdades(facid, facnome, facsigla) 
	VALUES (1,'Universidade Paulista','UNIP');

INSERT INTO tblcursos(curid, curnome, facid)
	VALUES (1, 'Análise e Desenvolvimento de Sistemas', 1)

INSERT INTO tbldisciplinas(discid, discnome)
	VALUES (1, 'Lógica de Programação')

INSERT INTO tbldisciplinascursos(discid, curid)
	VALUES (1, 1)


-----------------------------------------------------------
--update---------------------------------------------------

UPDATE tblfaculdades 
	SET facnome = 'UNIVERSIDADE PAULISTA'
	WHERE facnome = 'Universidade Paulista';


-----------------------------------------------------------
--delete---------------------------------------------------

DELETE FROM tblfaculdades
	WHERE facid = 1;


-----------------------------------------------------------
