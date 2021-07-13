use NORTHWND;


select * from categories;
select * from suppliers;
  select * from products;
  
-- exibir os producos que contem quantidade maior ou igual a 100
select * 
  from products
 where unitsinstock >= 100

-- exibir os producos que contem quantidade maior ou igual a 100 e que o preco � maior que 21,00
select * 
  from products
 where unitsinstock >= 100 
   and unitprice > 21.00
   
-- exibir os producos que contem quantidade maior ou igual a 130 e que o preco � igual 25.00
select * 
  from products
 where unitsinstock >= 130
   and unitprice = 25.00  
    

-- exibir os produtos que o estoque nao seja zero
select * 
  from products
 where unitsinstock <> 0
 

-- exibir todos os produtos com preco maior 5.00 que contenha saldo em estoque e que 
-- esteja ativo.
select *
  from products
 where unitprice > 5.00
   and unitsinstock > 0
   and discontinued = 0
   
   
-- selecione todos os produtos com estoque menor que 10 e maior que 100
select *
  from products
 where (unitsinstock < 10)
    or (unitsinstock > 100)
    
-- selecione todos os produtos com estoque menor que 10 ou preco maior que 50
select *
  from products
 where (unitsinstock < 10) or (unitprice > 50)
 


select *                     -- este exemplo nao atende pq o produto nao pode ser menor e maior ao mesmo tempo
  from products
 where (unitsinstock < 10)
   and (unitsinstock > 100) 
   
   
-- selecione todos os produtos com estoque menor que 10 e maior que 100 e que tenha reserva.
select *
  from products
 where ((unitsinstock < 10) or (unitsinstock > 100))
   and unitsonorder > 0
   
-- selecione todos os fornecedores que contenham site   
select * 
  from suppliers 
 where homepage IS NOT NULL 
 
CREATE TABLE aluno(
	aluid int not null primary key, 
	alunome varchar(50) not null, 
	aluapelido varchar(25) null
); 
 

-- selecione todos os protudos da categoria cerveja 1, condimentos 2 e cereis 5
select * 
  from products
 where categoryid in (1, 2, 5)
   and unitsinstock > 0
     

-- selecione todos os produtos com estoque entre 10 e 20 unidades
select *
  from products
 where unitsinstock between 10 and 20


-- selecione todos os produtos com estoque entre 10 e 20 unidades que estejam desativados
select *
  from products
 where unitsinstock between 10 and 20
   and discontinued = 1


-- selecione todos os produtos que iniciam com a letra C
select *
  from products
 where productname like 'C%';

-- selecione todos os produtos que terminam com a letra I
select *
  from products
 where productname like '%I';


-- selecione todos os produtos que contenham a letra F
select *
  from products
 where productname like '%F%';
 
 
   
