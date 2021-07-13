MARCAL, J.
14.05.2019

------------------------------------------------
CONTEÚDO
------------------------------------------------

------------------------------------------------
Instruções básicas para criação de Stored 
Procedure

CREATE PROCEDURE [NOME]
	[PARAMETROS ENTRA 1]
	[PARAMETROS ENTRA 2]
	[PARAMETROS ENTRA 3]
AS
	[DECLARACAO VARIAVEL LOCAL 1]
	[DECLARACAO VARIAVEL LOCAL 2]
	
	[CARREGAR VARIAVEL LOCAL 1]
	[CARREGAR VARIAVEL LOCAL 1]	
BEGIN
	[INSTRUCOES SQL]
END


------------------------------------------------
Instrução básica para deleção de Stored 
Procedure

DROP PROCEDURE [NOME DA PROCEDURE]


------------------------------------------------
Exemplos de utilização de Stored Procedures

create table estados (
	est_id int not null primary key, 
	est_nome varchar(50) not null, 
	est_num_hab decimal(5, 2) -- em milhoes
)

create table cidades(
	cid_id int not null primary key,
	cid_nome varchar(50) not null,
	cid_est_id int not null,
	foreign key (cid_est_id) references estados(est_id)
)

-- EX01 - Criando procedure insercao tabela ESTADOS
CREATE PROCEDURE proc_in_estados -- criando procedure
	@in_nome varchar(50),        -- param 1 de entrada
	@in_num_hab decimal(5,2)     -- param 2 de entrada
AS
	DECLARE @ID INT              -- declaracao variavel local 
	SET @ID = (SELECT (MAX(EST_ID) + 1) ID FROM ESTADOS) -- carregando a variavel
BEGIN
	INSERT INTO ESTADOS          -- insercao simples
		(EST_ID, EST_NOME, EST_NUM_HAB)
	VALUES
		(@ID, @in_nome, @in_num_hab)
END

EXECUTE proc_in_estados 'PIAUI', 60.00 -- executando procedure


-- EX02 - Excluindo a SP
DROP PROCEDURE proc_del_estados


-- EX03 - Criando uma SP para esclusão de um registro da tabela CIDADES
CREATE PROCEDURE proc_del_estados
	@in_est_id int
AS
	DECLARE @CONTCID INT
	SET @CONTCID = (SELECT COUNT(CID_ID) FROM CIDADES 
	                 WHERE CID_EST_ID = @in_est_id)
BEGIN
	IF @CONTCID <= 0
	BEGIN
		DELETE FROM estados
		      WHERE est_id = @in_est_id
	END
	ELSE
	BEGIN
		PRINT 'EXISTEM REGISTROS FILHOS, DELECAO NAO EXECUTADA'
	END
END

EXECUTE proc_del_estados 6

-- EX04 - Criando procedure atualizacao tabela ESTADOS
DROP PROCEDURE proc_upd_estados

CREATE PROCEDURE proc_upd_estados
	@in_est_id int, 	
	@in_est_nome varchar(50), 	
	@in_est_num_hab decimal(5,2)
AS
	DECLARE @CONTEST INT
	SET @CONTEST= (SELECT COUNT(EST_ID) 
	                 FROM ESTADOS 
	                WHERE EST_ID = @in_est_id)
BEGIN
	IF @CONTEST > 0
	BEGIN
		UPDATE ESTADOS
		   SET EST_NOME = @in_est_nome,
		       EST_NUM_HAB = @in_est_num_hab
		 WHERE EST_ID = @in_est_id
	END
	ELSE
	BEGIN
		PRINT 'ESTADO NAO LOCALIZADO, ATUALIZACAO CANCELADA'
	END
END

EXECUTE proc_upd_estados 9, 'ACRE', 95.00


-- EX05 - Criando procedure para SELECAO na tabela ESTADOS
DROP PROCEDURE proc_sel_estados_01

CREATE PROCEDURE proc_sel_estados_01
	@in_est_id int
AS
BEGIN
	SELECT EST_ID, EST_NOME
	  FROM ESTADOS
	 WHERE EST_ID = @in_est_id
END

EXECUTE proc_sel_estados_01 9


DROP PROCEDURE proc_sel_estados_02

CREATE PROCEDURE proc_sel_estados_02
	@in_est_nome varchar(10)
AS
BEGIN
	SELECT EST_ID, EST_NOME
	  FROM ESTADOS
	 WHERE EST_NOME LIKE @in_est_nome + '%'
END

EXECUTE proc_sel_estados_02 'P'


CREATE PROCEDURE proc_sel_estados_03
AS
BEGIN
	SELECT EST_ID, EST_NOME
	  FROM ESTADOS
	 ORDER BY EST_NOME ASC
END

EXECUTE proc_sel_estados_03



 