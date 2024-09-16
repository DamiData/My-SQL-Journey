-- Full Outer Join:

--	List all books and their authors. If a book doesn't have an author, display "Unknown".
Select b.Title,
coalesce(a.AuthorName,'Unknown') as Authors
From dbo.Books_table as b
Full Outer join Authors_table as a on b.AuthorID = a.AuthorID

--	Show the titles and prices of all books. If a book doesn't have a price, display "Price not available".
 Select Title,
 Coalesce(Price,'Price not avaialable')  as Price 
 From dbo.Books_table

--	Display all authors and the titles of their books. If an author hasn't written any books, display "No books written".
Select b.Title as Book_Titles, 
Coalesce (a.AuthorName,'No books written') as Author
From dbo.Books_table as b
Full Outer join Authors_table as a  on b.AuthorID = a.AuthorID

--List all books and their genres. If a book doesn't have a genre, display "Genre not specified".
Select	Title as Book_Tile,
Isnull(Genre,'Genre not Specified') as Genre
From dbo.Books_table

--List all orders along with the names of the customers who made them. Include orders without customers and customers without orders.
Select o.OrderID,
c.Name
From Customers_table as c
Full Outer Join Orders_table as o on c.CustomerID = o.CustomerID

--Show all products along with the order details. Include products that haven't been ordered and order details without products.
Select p.ProductName,
od.OrderID 
From Products_table as p
Full Outer Join OrderDetails_table as od on p.ProductID = od.ProductID

--	Display the names of customers and the total amount spent on orders. Include customers who haven't placed any orders and 
--the total amount spent for orders without customers.
Select c.Name,
o.TotalAmount
From Customers_table as c
Full Outer Join  Orders_table as o on c.CustomerID = o.CustomerID

--List all orders and their associated products. Include orders without products and products without orders.
Select od.OrderID,
p.ProductName
From Products_table as p
Full Outer Join OrderDetails_table as od on p.ProductID = od.ProductID
