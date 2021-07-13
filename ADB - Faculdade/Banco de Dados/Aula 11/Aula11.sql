USE NORTHWND;

 -- JOINS INNER
 
 -- A)  Exibir o c�digo e nome do produto e a descricao da categoria.
 
 SELECT * FROM products;
 SELECT * FROM categories;
 
 SELECT products.productid, products.productname,
        categories.categoryname
   FROM products INNER JOIN categories ON  products.categoryid = categories.categoryid
 
  SELECT products.*,
         categories.categoryname
   FROM products INNER JOIN categories ON  products.categoryid = categories.categoryid
 
 
 -- B) Exibir o c�digo, nome, preco e quantidade em estoque dos produtos e tamb�m o nome e cidade do fornecedor do produto.
 select * from products
 select * from suppliers
 
  SELECT *
    FROM products INNER JOIN suppliers ON products.supplierid = suppliers.supplierid 
   WHERE country = 'USA'
   ORDER BY country ASC
  
 SELECT products.productid, products.productname, products.unitprice, products.unitsinstock, products.supplierid, 
        suppliers.companyname, suppliers.city
   FROM products INNER JOIN suppliers ON products.supplierid = suppliers.supplierid
  WHERE products.country = 'USA'  
  ORDER BY country ASC   
   
SELECT productid, productname, unitprice, unitsinstock, suppliers.supplierid, 
       companyname, city, phone
  FROM products INNER JOIN suppliers ON products.supplierid = suppliers.supplierid
 WHERE country = 'USA'
 ORDER BY productname ASC
 
-- C) Exiba o n�mero do pedido e o nome da empresa, exiba somente os pedidos do brasil
select * from orders
select * from customers

SELECT * 
  FROM orders INNER JOIN customers ON orders.customerid = customers.customerid
 WHERE country = 'Brazil'
  
SELECT orderid as NumeroPedido, companyname as NomeEmpresa
  FROM orders INNER JOIN customers ON orders.customerid = customers.customerid  
 WHERE country = 'Brazil'  
 
 
-- D) Exiba o n�mero, data emissao, data envio e valor do frete dos pedidos, e tamb�m o nome e cidade do cliente, e o nome
--    do vendedor

select * from orders
select * from customers
select * from employees

select *
  from orders inner join customers on orders.customerid = customers.customerid
              inner join employees on orders.employeeid = employees.employeeid
  
  
select orderid, orderdate, shippeddate, freight,
       companyname, customers.city,
       firstname
  from orders inner join customers on orders.customerid = customers.customerid
              inner join employees on orders.employeeid = employees.employeeid
 where freight > 50.0              
 order by companyname asc, freight desc
 
 
 select * from categories
 insert into categories (categoryname, description) 
                 values ('QUEIJOS', 'QUEIJOS BRANQUINHO');
 
  SELECT *
   FROM products INNER JOIN categories ON  products.categoryid = categories.categoryid
 order by categoryname asc
 
  SELECT *
   FROM products LEFT JOIN categories ON  products.categoryid = categories.categoryid
 order by categoryname asc
 
  SELECT *
   FROM products RIGHT JOIN categories ON  products.categoryid = categories.categoryid
 order by categoryname asc
 
 
 -- JOINS LEFT, RIGHT
	CREATE TABLE DISCIPLINAS(
	  disid INT NOT NULL PRIMARY KEY, 
	  disnome VARCHAR(25) NOT NULL
	);

	CREATE TABLE ALUNOS(
	  aluid INT NOT NULL PRIMARY KEY, 
	  alunome VARCHAR(50) NOT NULL,
	  disid INT
	);

	INSERT INTO DISCIPLINAS VALUES (1, 'ADS');
	INSERT INTO DISCIPLINAS VALUES (2, 'TI');
	INSERT INTO DISCIPLINAS VALUES (3, 'RD');
	INSERT INTO DISCIPLINAS VALUES (4, 'SI');
	INSERT INTO DISCIPLINAS VALUES (5, 'CC');

	INSERT INTO ALUNOS VALUES(100, 'ANA', 1);
	INSERT INTO ALUNOS VALUES(101, 'JOAO', 1);
	INSERT INTO ALUNOS VALUES(103, 'MARIA', 2);
	INSERT INTO ALUNOS VALUES(104, 'CARMEM', NULL);
	INSERT INTO ALUNOS VALUES(105, 'CARLOS', NULL);

	SELECT *
	  FROM DISCIPLINAS;
	  
	SELECT *
	  FROM ALUNOS;

	SELECT *
	  FROM ALUNOS INNER JOIN DISCIPLINAS ON ALUNOS.DISID = DISCIPLINAS.DISID;
	  
	SELECT *
	  FROM ALUNOS LEFT JOIN DISCIPLINAS ON ALUNOS.DISID = DISCIPLINAS.DISID;
	  
	SELECT *
	  FROM ALUNOS RIGHT JOIN DISCIPLINAS ON ALUNOS.DISID = DISCIPLINAS.DISID;  	  