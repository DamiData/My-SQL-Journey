-- Right Join:
--Show all products along with the order details. Include products that haven't been ordered.
 Select p.ProductID , 
 od.OrderID
 From dbo.Products_table as p
 Right Join  OrderDetails_table as od on p.ProductID = od.ProductID

--Display the names of customers and the total amount spent on orders. Include customers who haven't placed any orders.
Select c. Name,
o.TotalAmount
From dbo.Customers_table as c
Right join Orders_table as o on c.CustomerID = o.CustomerID

--List all orders and their associated products. Include orders without products.
Select od. OrderID,
p.ProductName
From dbo.OrderDetails_table as od 
Right join Products_table as p on od.ProductID = p.ProductID

--Show the product names and quantities ordered. Include products without orders.
Select p.ProductName,
od.Quantity
From dbo.Products_table as p
Right join OrderDetails_table as od on p.ProductID = od.ProductID