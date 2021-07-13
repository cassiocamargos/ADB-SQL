use NORTHWND;

select *from Customers
where CustomerID= 'MARC'

insert into customers (customerid, companyname, city) values ('MARC', 'Marcal Ltda', 'Jundiai');


select * from Products

select count(Discontinued), suppliers.CompanyName
---SELECT CompanyName, count(Discontinued)
   FROM products INNER JOIN Suppliers ON  products.SupplierID = Suppliers.SupplierID
   group by CompanyName
   order by CompanyName asc


select *
---SELECT CompanyName, count(Discontinued)
   FROM products INNER JOIN Suppliers ON  products.SupplierID = Suppliers.SupplierID
   order by CompanyName asc

select o.orderid, o.orderdate, c.companyname, e.firstname
  from orders o inner join customers c on o.customerid = c.customerid
                   inner join employees e on o.employeeid = e.employeeid
 where year(o.orderdate) in (1997, 1998)
   and month(o.orderdate) between 1 and 12

SELECT Products.ProductName , SUM(OrdersDetails.Quantity)
FROM   Products WITH(NOLOCK)
INNER  JOIN
       [Order Details] AS OrdersDetails
ON     OrdersDetails.ProductID = Products.ProductID
GROUP  BY
       Products.ProductName
ORDER  BY
       SUM(OrdersDetails.Quantity) 
	   DESC;