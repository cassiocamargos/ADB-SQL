USE NORTHWND;

-- AGRUPAMENTO -- 

--a) Quanto o cliente ANTON gastou de frete

select *
  from orders
 where customerid = 'ANTON'
 
select customerid, freight
  from orders
 where customerid = 'ANTON'
 
select customerid, sum(freight) as somafretes
  from orders
 where customerid = 'ANTON'
 group by customerid 


--b) Qual � o maior e menor valor de frete pago pelo cliente ANTON

select customerid, min(freight), max(freight)
  from orders
 where customerid = 'ANTON'
 group by customerid


--c) Baseado no valor de frente, exiba qual � o maior, menor, media, soma e numero de pedidos do cliente ANTON

select customerid, max(freight) as maior, min(freight) as menor, avg(freight) as media, sum(freight) as soma, count(freight) as numero
  from orders
 --where customerid = 'ANTON'
 group by customerid
 ORDER BY customerid asc
 
 
--d) Calcule quanto pedidos foram emitidos para cada um dos clientes VINET, HANAR e VICTE em 1996

select *
  from orders
 where customerid in ('VINET', 'HANAR', 'VICTE')
 --where ((customerid = 'VINET') or (customerid = 'HANAR') or (customerid = 'VICTE'))
 order by customerid asc
 
select *
  from orders
 where customerid in ('VINET', 'HANAR', 'VICTE')
   and orderdate >= '01-01-1996 00:00:00'
   and orderdate <= '31-12-1996 23:59:59'
 order by customerid asc 


select customerid, orderid
  from orders
 where customerid in ('VINET', 'HANAR', 'VICTE')
   and orderdate >= '01-01-1996 00:00:00'
   and orderdate <= '31-12-1996 23:59:59'
 order by customerid asc 
 
 
select customerid, count(orderid)
  from orders
 where customerid in ('VINET', 'HANAR', 'VICTE')
   --and year(orderdate) = 1996
   and orderdate >= '01-01-1996 00:00:00'
   and orderdate <= '31-12-1996 23:59:59'
 group by customerid
 order by customerid asc  
 

 
--e) Calcule o numero total de pedidos emitidos para os clientes VINET, HANAR e VICTE em 1996 

select *
  from orders
 where customerid in ('VINET', 'HANAR', 'VICTE')
   and orderdate >= '1996-01-01 00:00:00'
   and orderdate <= '1996-12-31 23:59:59'

select count(orderid)
  from orders
 where customerid in ('VINET', 'HANAR', 'VICTE')
   and orderdate >= '1996-01-01 00:00:00'
   and orderdate <= '1996-12-31 23:59:59'


--f) Qual � o valor total do pedido 10248?

select * from orders
select * from [order details]

select *,
       (unitprice * quantity) 
  from [order details]
 where orderid = 10248

select orderid, 
       sum(unitprice * quantity) 
  from [order details]
 where orderid = 10248
 group by orderid


--f) Qual � o valor total dos pedidos 10248, 10249, 10253?

select *
  from [order details]
 where orderid in (10248, 10249, 10253)
 
select orderid, (unitprice * quantity)
  from [order details]
 where orderid in (10248, 10249, 10253) 

select orderid as NumeroPedido, sum(unitprice * quantity) as ValorPedido
  from [order details]
 where orderid in (10248, 10249, 10253) 
 group by orderid


--g) Exiba o nome da categoria e a quantidade de produtos de cada categoria.

select * from categories
select * from products

select *
  from categories inner join products on categories.categoryid = products.categoryid

select CategoryName, ProductId
  from categories inner join products on categories.categoryid = products.categoryid

select CategoryName, count(ProductId)
  from categories inner join products on categories.categoryid = products.categoryid
 group by CategoryName


--h) Qual o valor total em estoque de cada categoria, exiba o nome da categoria

select *,
       (unitprice * unitsinstock) valorestoque
  from categories as c inner join products as p on c.categoryid = p.categoryid


select CategoryName,
       (unitprice * unitsinstock) ValorEstoque
  from categories as c inner join products as p on c.categoryid = p.categoryid


select CategoryName,
       sum(unitprice * unitsinstock) as ValorEstoque
  from categories as c inner join products as p on c.categoryid = p.categoryid
 group by CategoryName


select * from products 

select *,
       (unitprice * unitsinstock) valorestoque
  from products 




--Exemplo extra 1) Selecione todos os pedidos de 1996 (use year) 

 select orderid, customerid, orderdate
   from orders
  where year(orderdate) = 1996

--Exemplo extra 2) Selecione todos os pedidos de 1996 dos meses de julho, setembro

--opcao 1
select orderid, customerid, orderdate
   from orders
  where ((orderdate >= '1996-07-01 00:00:00') and (orderdate <= '1996-07-31 23:59:59')) 
     or ((orderdate >= '1996-09-01 00:00:00')  and (orderdate <= '1996-09-30 23:59:59'))
     
--opcao 2
select orderid, customerid, orderdate
   from orders
  where year(orderdate) = 1996
    and month(orderdate) in (7, 9)
    
    
--Exemplo extra 3) Selecione todos os pedidos do dia 01, desconsidere o ano e mes

select orderid, customerid, orderdate
   from orders
  where day(orderdate) = 1