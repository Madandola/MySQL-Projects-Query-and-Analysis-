Use Northwind;

/* Write SQL query to return these details from the Employees table.*/
select  firstname, lastname, birthdate
from employees;

/* Write an SQL query to retrieve this information from the Customers table.*/
select customername, address, city
from customers;

/* Write an SQL query to return all unique city names from the Suppliers table.*/
select distinct city
from suppliers;

/* Write an SQL query to count the number of distinct cities in the Customers table.*/
select count(distinct city)
from customers;

/* Write a SQL query to retrieve all columns from the Customers table.*/
Select * From customers;

/*Write a SQL query to retrieve only the CustomerName and City columns from the Customers table.*/
select customerName, city from customers;

/*Write a SQL query to retrieve distinct values from the City column in the Customers table.*/
select dictinct city from  customers;


/* Write a SQL query to retrieve all columns from the Products table where the Price is greater than 50.*/
select *
from products
Where Price <=50;


/*Write a SQL query to retrieve all columns from the Customers table where the Country is either 'USA' or 'UK'.*/
Select * 
from customers
Where country = 'USA' or Country = 'UK';


/*Write a SQL query to retrieve all columns from the Orders table, sorted by OrderDate in descending order.*/
select *
from Orders
order by orderdate desc;


/*Write a SQL query to retrieve all columns from the Products table where the Price is between 20 and 50, ordered by descending Price.*/
Select * 
from Products 
where Price between 20 and 50 
order by Price desc;

/* Write a SQL query to retrieve all columns from the Customers table where the Country is 'UK' or City is 'London', ordered by descending CustomerName.*/
select *
from customers
where country = "UK" or City = "London" order by "Customername" Desc;


/*Write a SQL query to retrieve all columns from the Products table where the CategoryID is 1 or 2, ordered by ascending ProductName.*/
select *
from products
where CategoryID = 1 or CategoryID = 2
order by ProductName Asc;

/*Write SQL query to list the number of customers in each country.*/

SELECT COUNT(*), Country
FROM Customers
GROUP BY Country;

SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country;

/*Write a query to list each product category and the total quantity of products sold in that category.*/
SELECT P.Category, SUM(OD.Quantity) AS TotalQuantitySold
FROM Products  as P
JOIN OrderDetails OD ON P.ProductID = OD.ProductID
GROUP BY P.Category;

select categoryname, sum(quantity) as totalquanity
from categories as c
join products as p
on c.categoryid = p.categoryid
join order_details as od
on od.productid = p.productid
group by categoryname;

 /*Write a query to list each employee and the number of orders they have handled.*/
SELECT E.FirstName || ' ' || E.LastName AS EmployeeName, COUNT(O.OrderID) AS OrdersHandled
FROM Employees E
JOIN Orders O ON E.EmployeeID = O.EmployeeID
GROUP BY E.EmployeeID, E.FirstName, E.LastName;

select firstname, lastname, count(orderid) as totalorders
from employees as e
join orders as o
on e.employeeid = o.employeeid
group by firstname, lastname;


/*Write a SQL query to find the supplier of each product.*/
SELECT p.ProductName, s.SupplierName
FROM Products p
JOIN Suppliers s ON p.SupplierID = s.SupplierID;
 
/*Write a SQL query to find the category of each product.*/

Select productname, CategoryName
from products
join categories on products.CategoryID = categories.CategoryID;

/*Write a SQL query to retrieve all products belonging to the Meat/Poultry category.*/
Select *
from products
join categories 
on products.CategoryID = categories.CategoryID 
where categories.CategoryName = "meat/poultry";

/*Write a SQL query to retrieve the Order ID, Order Date, Customer Name, and Employee Name for all orders.*/
SELECT o.OrderID,o.OrderDate,c.CustomerName,CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Employees e ON o.EmployeeID = e.EmployeeID;

/*Write a SQL query to retrieve the Product Name, Category Name, and Supplier Name for all products.*/

SELECT p.ProductName,c.CategoryName,s.SupplierName 
FROM products p
JOIN categories c ON p.CategoryID = c.CategoryID
JOIN suppliers s ON p.SupplierID = s.SupplierID;

/*Write a SQL query to create a report for all the orders of 1996 and their customers.*/
select o.orderid,o.orderdate,c.customername
from orders o 
join customers c on o.CustomerID = c.customerID  
where year(o.orderdate) =1996;

/*Write a SQL query to retrieve all categories along with the number of products in each category.*/
select c.categoryname,count(p.productID) as productcount
from categories c 
left join products p 
on c.CategoryID = p.CategoryID 
group by c.CategoryName;


