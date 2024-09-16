--Left Join:

-- Show all customers along with their orders. Include customers who haven't placed any orders.
Select c.Name as customer,
o.OrderID
From dbo.Customers_table as c
Left Join Orders_table as o on c.CustomerID = o.CustomerID

-- Display the names of customers and the total amount spent on orders. Include customers who haven't placed any orders, showing "0" as the total amount for them.
Select c.Name as customer,
Coalesce(o.TotalAmount,'0')
From dbo.Customers_table as c
Left join Orders_table as o on c.CustomerID = o.CustomerID

-- List all orders and their associated products. Include orders without products.
Select od.OrderID, 
p.ProductName
From dbo.Products_table as p
Left join OrderDetails_table as od on p.ProductID = od.ProductID

-- Show the product names and quantities ordered. Include products without orders, displaying "0" as the quantity for them.
Select p. ProductName,
isnull(od.Quantity,'0')as quantity
From dbo.Products_table as p 
Left join OrderDetails_table as od on p.ProductID = od.ProductID