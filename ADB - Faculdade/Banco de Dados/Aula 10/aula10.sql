use NORTHWND;

select * FROM products;

select * from categories;

select * from [Products by Category];
    --where CategoryName= 'QUEIJOS BRANQUINHO';

insert into Categories(CategoryName, [Description])
    values ('QUEIJOS', 'QUEIJOS BRANQUINHO');

DELETE from Categories
    WHERE CategoryName = 'QUEIJOS';

SELECT *
    FROM products INNER JOIN categories ON  products.categoryid = categories.categoryid
order by categoryname asc
 
SELECT *
    FROM products LEFT JOIN categories ON  products.categoryid = categories.categoryid
order by categoryname asc
 
SELECT *
    FROM products RIGHT JOIN categories ON  products.categoryid = categories.categoryid
order by categoryname asc