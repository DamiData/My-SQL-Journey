---Database Creation

Create Database Sales ;
Use Sales;

---Import a CSV Files

--Write a query to select all columns from the `Sales` table.
Select *
From dbo.[Sales Data CSV]

--Write a query to find all sales where the `Quantity` is greater than 10.
Select *
From dbo.[Sales Data CSV]
Where Quantity > 10

--. Write a query to find all sales where the `Quantity` is greater than 10 
--and the `UnitPrice` is greater than 20.
Select *
From dbo.[Sales Data CSV]
Where Quantity > 10 AND UnitPrice > 20

--Write a query to find all sales where the `Quantity` is
--greater than 10 or the `UnitPrice` is greater than 20.

SELECT * 
From dbo.[Sales Data CSV]
Where Quantity > 10 OR UnitPrice > 20

--Write a query to select all columns from the `Sales` table and 
--order the results by `SaleDate` in ascending order.
Select * 
From dbo.[Sales Data CSV]
Order by SaleDate asc

--Write a query to select all columns from the `Sales` table 
--and order the results by `UnitPrice` in descending order.
Select * 
From dbo.[Sales Data CSV]
Order by UnitPrice desc

--Write a query to group the sales by `ProductID` and 
--calculate the total quantity sold for each product.
Select ProductID,
SUM(Quantity) as TotalQuantity
From dbo.[Sales Data CSV]
Group by ProductID

--. Write a query to group the sales by `ProductID` and
--find products that have sold more than 100 units in total.
Select ProductID,
Sum(Quantity) as Total_Unit_solds
From dbo.[Sales Data CSV]
Group by ProductID
Having Sum (Quantity) > 100

--Write a query to count the number of 
--sales that occurred for each product.
Select ProductID,
Count (*) as Number_of_Sales
From  dbo.[Sales Data CSV]
Group by ProductID

-- Write a query to calculate the total revenue
--(Quantity  UnitPrice) for each product.
Select ProductID,
Sum(Quantity * UnitPrice) as Total_Revenue
From dbo.[Sales Data CSV]
Group by ProductID

--Write a query to calculate the average `UnitPrice` 
--for each product.
Select ProductID,
Avg(UnitPrice) as AvgPrice
From dbo.[Sales Data CSV]
Group by ProductID

--. Write a query to find the minimum `UnitPrice`
--for each product.
Select ProductID,
Min (UnitPrice) as Min_Price
From dbo.[Sales Data CSV]
Group by ProductID

--Write a query to find the maximum `UnitPrice` 
--for each product.
Select ProductID,
Max (UnitPrice) as Max_Price
From dbo.[Sales Data CSV]
Group by ProductID

--. Write a query to find all sales where the `Quantity` is
--greater than 5 and the `SaleDate` is in the year 2023.
Select * 
From dbo.[Sales Data CSV]
Where Quantity > 5
AND Year (SaleDate) = 2023

--Write a query to select all columns from the `Sales` table and 
--order the results by `ProductID` and then by `SaleDate` in ascending order.
Select * 
From dbo.[Sales Data CSV]
Order by ProductID,
SaleDate  asc

--Write a query to group the sales by `CustomerID` and
--find customers who have made purchases worth more than $500 in total.
Select CustomerID,
Sum(Quantity * UnitPrice) as Total_Spent
From dbo.[Sales Data CSV]
Group by CustomerID
Having Sum ( Quantity * UnitPrice ) > 500

--Write a query to group the sales by `ProductID` and 
--count the number of sales for each product where the total number of sales is more than 50.
Select ProductID,
Count(*) as number_of_sales
From dbo.[Sales Data CSV]
Group by ProductID
Having Count(*)  > 50

--Write a query to calculate the total revenue for sales 
--where the `UnitPrice` is greater than 15.
Select 
Sum(Quantity * UnitPrice) as Total_Revenue
From dbo.[Sales Data CSV]
where  UnitPrice > 15

--Write a query to group the sales by `ProductID` and
--calculate the average `Quantity` sold for each product.
Select ProductID,
Avg (Quantity) as Avg_quant
From dbo.[Sales Data CSV]
Group by ProductID

--Write a query to select `ProductID`, count the number of sales,
--and calculate the total revenue for each product. 
--Only include products that have more than 20 sales and
--order the results by total revenue in descending order.

Select ProductID,
Count (*) as Number_of_Sales,
Sum(Quantity * UnitPrice) as Total_Revenue
From dbo.[Sales Data CSV]
Group by ProductID
Having Count (*) > 20
Order by Total_Revenue Desc


