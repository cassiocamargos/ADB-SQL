-- REVISAO DE AGRUPAMENTO -- 

USE NORTHWIND;

1) Crie uma instrucao SQL que permita exibir o número, valor do frete e valor pedido.

select * from orders
select * from [order details]

select orderid, freight
  from orders
 where orderid = 10248;
 
select * 
  from [order details] 
 where orderid = 10248;
 
select o.orderid, o.freight,
       (d.unitprice * d.quantity) vltotalitem
  from orders o inner join [order details] d on o.orderid = d.orderid
 where o.orderid = 10248; 

select o.orderid, o.freight, sum(d.unitprice * d.quantity) as vlorder
  from orders o inner join [order details] d on o.orderid = d.orderid
 where o.orderid = 10250
 group by o.orderid, o.freight 
 

2) Crie uma instrucao SQL que permita exibir do pedido: número, nome cliente, valor do frete 
   e valor total pedido, deverá existir um filtro por período.

select o.orderid, c.companyname, o.freight, (d.unitprice * d.quantity) as vlitem       
  from orders o inner join [order details] d on o.orderid = d.orderid
                inner join customers c       on o.customerid = c.customerid   
 where o.orderdate between '1996-07-01 00:00:00' and '1996-07-30 23:59:59'


select o.orderid, c.companyname, o.orderdate, o.freight, sum(d.unitprice * d.quantity) as vlpedido       
  from orders o inner join [order details] d on o.orderid = d.orderid
                inner join customers c       on o.customerid = c.customerid   
 where o.orderdate between '1996-07-01 00:00:00' and '1996-07-10 23:59:59'
 group by o.orderid, c.companyname, o.orderdate, o.freight
 
 
3) Crie um relatorio que permita filtrar por periodo e exiba o valor vendido por cada
   vendedor dentro deste período. 
   
select e.*
  from employees e

select * from orders  
select * from [order details]

select e.employeeid, e.firstname,
       o.orderid, o.freight, o.orderdate,
       d.unitprice, d.quantity
  from employees e inner join orders o          on e.employeeid = o.employeeid
                   inner join [order details] d on o.orderid = d.orderid
 where o.orderdate between '1996-07-01 00:00:00' and '1996-07-05 23:59:59'


select e.employeeid, e.firstname,
       o.orderid, o.freight, o.orderdate,
       sum(d.unitprice * d.quantity)
  from employees e inner join orders o          on e.employeeid = o.employeeid
                   inner join [order details] d on o.orderid = d.orderid
 where o.orderdate between '1996-07-01 00:00:00' and '1996-07-05 23:59:59'
 group by e.employeeid, e.firstname, o.orderid, o.freight, o.orderdate   
 

select e.firstname,       
       sum(d.unitprice * d.quantity) vlttvendas
  from employees e inner join orders o          on e.employeeid = o.employeeid
                   inner join [order details] d on o.orderid = d.orderid
 where o.orderdate between '1996-07-01 00:00:00' and '1996-07-30 23:59:59'
 group by e.firstname   
 order by e.firstname asc
 
 
-- STORED PROCEDURES  --

A) Crie uma procedure para realizar insercao de registros na tabela de categorias. 

DROP PROCEDURE SP_IN_CATEGORIES

CREATE PROCEDURE SP_IN_CATEGORIES
	@NOME VARCHAR(15),
	@DESCRICAO VARCHAR(30)
AS
	
BEGIN
	INSERT INTO CATEGORIES (CATEGORYNAME, DESCRIPTION, PICTURE)
	                 VALUES(@NOME, @DESCRICAO, NULL)
END


CREATE PROCEDURE SP_IN_CATEGORIES
	@NOME VARCHAR(15),
	@DESCRICAO VARCHAR(30)
AS
	DECLARE @CODIGO INT	
BEGIN
	IF LEN(@NOME) <= 0
	BEGIN
		PRINT 'O campo nome deve ser preenchido.'
	END
	ELSE 
	BEGIN
		IF LEN(@DESCRICAO) <= 0
		BEGIN
			PRINT 'O campo descricao deve ser preenchido.'
		END
		ELSE 
		BEGIN
			INSERT INTO CATEGORIES (CATEGORYNAME, DESCRIPTION, PICTURE)
			                 VALUES(@NOME, @DESCRICAO, NULL);
			                 
			SELECT MAX(CATEGORYID)
			  FROM CATEGORIES;
		END
	END
END

EXEC SP_IN_CATEGORIES 'Sucos', 'Todos os tipos de sucos'


B) Crie uma procedure que realize a exclusao de uma categoria.

DROP PROCEDURE SP_DE_CATEGORIES

CREATE PROCEDURE SP_DE_CATEGORIES
	@CODIGO INT
AS

BEGIN
	DELETE FROM CATEGORIES
	      WHERE CATEGORYID = @CODIGO;
END


CREATE PROCEDURE SP_DE_CATEGORIES
	@CODIGO INT
AS
	DECLARE @REGFILHOS INT
	DECLARE @REGCODIGO INT
BEGIN
	SET @REGCODIGO = (SELECT COUNT(CATEGORYID)
	                   FROM CATEGORIES
	                  WHERE CATEGORYID = @CODIGO);

	SET @REGFILHOS = (SELECT COUNT(CATEGORYID)
	                   FROM PRODUCTS
	                  WHERE CATEGORYID = @CODIGO);

	IF @REGCODIGO = 0 
	BEGIN 
		PRINT 'O codigo informado não existe!'
	END
	ELSE 
	BEGIN
		IF @REGFILHOS > 0
		BEGIN
			PRINT 'A categoria contém registros filhos!'
		END
		ELSE 
		BEGIN 
			DELETE FROM CATEGORIES
				  WHERE CATEGORYID = @CODIGO;
				  
			PRINT 'Categoria removida com sucesso!'		
		END
	END
END

EXEC SP_DE_CATEGORIES 11


C) Crie uma PROCEDURE SQL que permita exibir o número, valor do frete e valor pedido.

DROP PROCEDURE SP_SE_ORDER_VALORPEDIDO

CREATE PROCEDURE SP_SE_ORDER_VALORPEDIDO
	@CODIGO INT
AS
	DECLARE @PEDIDO INT
BEGIN
	SET @PEDIDO = (SELECT COUNT(ORDERID)
	                 FROM ORDERS
	                WHERE ORDERID = @CODIGO)

	IF @CODIGO <= 0
	BEGIN
		PRINT 'O código do pedido deve ser um numero acima de 0!'
	END
	ELSE 
	BEGIN
		IF @PEDIDO <= 0
		BEGIN
			PRINT 'Não existe pedido para o código informado!'
		END
		ELSE 
		BEGIN
			select o.orderid as codigo, o.freight as vlfrete, sum(d.unitprice * d.quantity) as vlpedido
			  from orders o inner join [order details] d on o.orderid = d.orderid
	 		 where o.orderid = @CODIGO
			 group by o.orderid, o.freight;			
		END	
	END
END

EXEC SP_SE_ORDER_VALORPEDIDO 10250;


D) Crie uma PROCEDURE SQL que permita exibir do pedido: número, nome cliente, valor do frete 
   e valor total pedido, deverá existir um filtro por período.


CREATE PROCEDURE SP_SE_ORDER_PEDIDOSPORDATA
	@DATAINICIAL DATETIME,
	@DATAFINAL DATETIME
AS 	
BEGIN
	select o.orderid                     as codigo, 
	       c.companyname                 as nmempresa, 
	       o.orderdate                   as dataemissao, 
	       o.freight                     as vlfrete, 
	       sum(d.unitprice * d.quantity) as vlpedido       
	  from orders o inner join [order details] d on o.orderid = d.orderid
	                inner join customers c       on o.customerid = c.customerid   
     where o.orderdate between @DATAINICIAL and @DATAFINAL
     group by o.orderid, 
              c.companyname, 
              o.orderdate, 
              o.freight
END

EXEC SP_SE_ORDER_PEDIDOSPORDATA '1996-07-01 00:00:00', '1996-07-10 23:59:59'

SELECT * FROM SYSSTOREDPROCEDURES 


