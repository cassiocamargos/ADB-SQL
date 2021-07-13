
-- HAVING --
/* Filtro sobre um agrupamento (GROUP BY) */

a) exiba o nome da categoria e a quantidade de produtos de cada categoria, exiba somente as 
   categorias com mais de 10 produtos

SELECT * FROM CATEGORIES
SELECT * FROM PRODUCTS

SELECT *
  FROM CATEGORIES C INNER JOIN PRODUCTS P ON C.CATEGORYID = P.CATEGORYID
 ORDER BY C.CATEGORYNAME ASC

SELECT C.CATEGORYNAME, P.PRODUCTID
  FROM CATEGORIES C INNER JOIN PRODUCTS P ON C.CATEGORYID = P.CATEGORYID
 ORDER BY C.CATEGORYNAME ASC


SELECT C.CATEGORYNAME, COUNT(P.PRODUCTID) AS NUMPROD
  FROM CATEGORIES C INNER JOIN PRODUCTS P ON C.CATEGORYID = P.CATEGORYID
 GROUP BY C.CATEGORYNAME
HAVING COUNT(P.PRODUCTID) > 10
 ORDER BY C.CATEGORYNAME ASC
 
 
B) Exiba o nome do cliente, a soma do valor de frete gasto pelo cliente nos pedidos, considere 
   apenas pedidos de 1997 e a soma total dos valores de frete superior a 100.00
   
4s   
select *
  from customers c inner join orders o on c.customerid = o.customerid
 where year(o.orderdate) = 1997

<1s
select *
  from customers c inner join orders o on c.customerid = o.customerid 
 where o.orderdate >= '1997-01-01 00:00:00'
   and o.orderdate <= '1997-12-31 23:59:59'

<1s
select *
  from customers c inner join orders o on c.customerid = o.customerid     
 where o.orderdate between '1997-01-01 00:00:00' and '1997-12-31 23:59:59'
     
     
select c.companyname, o.freight
  from customers c inner join orders o on c.customerid = o.customerid     
 where o.orderdate between '1997-01-01 00:00:00' and '1997-12-31 23:59:59'     
 
 
select c.companyname, sum(o.freight)
  from customers c inner join orders o on c.customerid = o.customerid     
 where o.orderdate between '1997-01-01 00:00:00' and '1997-12-31 23:59:59'
 group by c.companyname       
 

select c.companyname, sum(o.freight)
  from customers c inner join orders o on c.customerid = o.customerid     
 where o.orderdate between '1997-01-01 00:00:00' and '1997-12-31 23:59:59'
 group by c.companyname     
having sum(o.freight) > 100.00


-- TOP (Limita a quantidade de registros exibidos) --

C) Exiba o nome do cliente, a soma do valor de frete gasto pelo cliente nos pedidos, considere 
   apenas pedidos de 1997 e a soma total dos valores de frete superior a 100.00, Exiba um ranking 
   dos 10 clientes com maior soma de frete acima de 100.00.
   

select c.companyname, sum(o.freight)
  from customers c inner join orders o on c.customerid = o.customerid     
 where o.orderdate between '1997-01-01 00:00:00' and '1997-12-31 23:59:59'
 group by c.companyname     
having sum(o.freight) > 100.00 
 order by sum(o.freight) DESC 
  
 
select top 10
       c.companyname, sum(o.freight)
  from customers c inner join orders o on c.customerid = o.customerid     
 where o.orderdate between '1997-01-01 00:00:00' and '1997-12-31 23:59:59'
 group by c.companyname     
having sum(o.freight) > 100.00 
 order by sum(o.freight) DESC  
 
 
 
-- SUB-SELECT -- 

D) Exiba todos os produtos com a quantidade de estoque acima da quantidade média de estoque.

select *
  from products
 where unitsinstock > 40

select avg(unitsinstock)
  from products
  
--  

select *
  from products
 where unitsinstock > (select avg(unitsinstock)
                         from products)


E) Exibir todos os pedidos de 1997 com o valor de frete abaixo do valor
   máximo dos fretes do primeiro trimestre de 1997.

select *
  from orders 
 where orderdate between '1997-01-01 00:00:00' and '1997-12-31 23:59:59'
   and freight < (select max(freight)
                    from orders 
                   where orderdate between '1997-01-01 00:00:00' and '1997-03-31 23:59:59')
 
 
 
F) Exibir o código e nome do produto e o nome da categoria.

-- solucao 1 
SELECT p.productid, p.productname,
       c.categoryname
  FROM CATEGORIES C INNER JOIN PRODUCTS P ON C.CATEGORYID = P.CATEGORYID
 ORDER BY C.CATEGORYNAME ASC
 
-- solucao 2 com subselect
select p.productid, p.productname, p.categoryid,
       (select c.categoryname
          from categories c
         where c.categoryid = p.categoryid)
  from products p
  


-- CASE -- 
G) Exiba o codigo, nome e situacao (ativo, desativado) dos produtos

select productid, 
       productname, 
       case discontinued
		 when 0 then 'Ativo'
		 when 1 then 'Desativado'
		 else 'Indefinido'
       end
  from products


H) Exiba o codigo, nome e regiao do cliente.

select customerid, companyname, 
       case  
		 when region is null then 'Indefinido'
		 else region
       end  
  from customers
  

select customerid, upper(companyname), 
       case  
		 when region is null then 'Indefinido'
		 else region
       end  
  from customers  
  
  
H) Exiba o codigo, nome e mes de nascimento de cada empregado

select employeeid, firstname + ' ' + lastname, 
       case  month(birthdate)
		  when 1 then 'Janeiro'
		  when 2 then 'Fevereiro'
		  when 3 then 'Marco'
		  else 'Outros'
       end as 'MesNasc'
  from employees
 order by month(birthdate) asc  
