select * from Employees
	
--CASE Questions:
	
-- Create a query to categorize orders based on the `Profit` column:
- 'Loss'for profits less than 0
- 'Low Profit' for profits between 0 and 100
- 'High Profit' for profits greater than 100

Select  Profit,
	Case 
	when Profit < 0 then 'Loss'
	When Profit between 0 and 100 then 'Low  Profit'
	When Profit > 100 then 'High Profit'
	End as Categorized
	From Employees
		
--Write a query to display the `Customer Name` along with a flag indicating if their order quantity is 'High'
--(Quantity > 10) or 'Low' (Quantity <= 10)
	
Select customername,
	Case
	When quantity <=10 then 'Low'
	When quantity >10 then 'High'
	End as flag
	From Employees
	
3. Create a query to classify orders based on the `Ship Mode`:
- 'Fast' for  'First Class'
- 'Standard' for 'Standard Class'

Select shipmode,
	Case 
	When shipmode = 'First Class' then 'Fast'
	When shipmode = 'Standard Class' then 'Standard'
	Else 'Second Class'
	End as ShipClass
	From Employees
	
--Write a query to show the `Sales` along with a message indicating if the sales are 'Above Average' or 'Below Average', 
--considering the average sales of all orders.

	Select Sales,
	Case 
	When Sales >(Select Avg(Sales) From Employees) Then 'Above Average'
	Else 'Below Average'
	End as Status 
	From Employees

--VIEWS Questions
	
-- Create a view named ‘sales_summary’ that shows the total sales quantity, and profit for each region.
	
Create View Sales_summary as 
	Select
	Region,
	Sum(sales) as totalsales,
	Sum(quantity) as totalquantity,
	Sum(Profit) as totalprofit
	From employees
	Group by region
	
-- Modify the ‘sales_summary’ view to include the category and subcategory columns.
	
	Create  View sales_summary as
    Select
    Region,
    Category,
    Sub_category,
    Sum (Sales) as Total_Sales,
    Sum (Quantity) as Total_Quantity,
    Sum (Profit) as Total_Profit
From  employees
Group  by  Region, Category, Sub_categor
	
--	Drop the ‘sales_summary’ view.
	
	 Drop View sales_summary
	
---	Create a view named ‘customer sales’ that shows the total sales and profit for each customer.
	
	Create  View  customer_sales as
    Select 
    Customerid,
    Sum(Sales) as Total_Sales,
    Sum (Profit) as Total_Profit
From employees
Group by  Customerid;

--Drop view

Drop View customer_sales

--- Modify the ‘customer sales’ view to include the city and state columns.
	
	Create  View customer_sales as
    Select  
    Customerid,
	City,
	State,
    Sum (Sales) as Total_Sales,
    Sum (Profit) as Total_Profit
From  employees
Group  by  1,2,3
	
-- Create a view named ‘product_sales’ that shows the total sales and profit for each product category and subcategory.
	
Create  View Product_sales as 
    Select 
    Category,
	Sub_Category,
    Sum (Sales) as  Total_Sales,
    Sum (Profit) as  Total_Profit
From employees
Group  by  1,2
	
--Advanced SQL queries
	
-- Write a query to find the top 3 customers with the highest total sales

	Select  
    CustomerID, 
  Sum (Sales) as  Total_Sales
From employees
Group  by  CustomerID
Order  by  Total_Sales desc
Limit 3
	
-- Write a query to find the total sales and profit for each region
-- including only orders with a specific ship mode
	
    Select Region,
	Sum(sales) as TotalSales,
	Sum (Profit) as TotalProfit
	From employees
	Where shipmode = 'Standard Class'
	Group by Region

--	Write a query to find the average sales and profit for each category and subcategory

    Select 
	category,
	sub_category,
	Avg(sales) as Averagesales,
	Avg(profit)as Averageprofit 
	From employees
	Group by 1,2
		
-- Write a query to find the top 3 products with the highest total sales and profit.
	
Select sub_category,
Sum(sales) as Totalsales,
Sum(profit)	 as Totalprofit
From employees	
Group by 1
Order by sub_category desc
limit 3	
	
-- Window functions
	
-- Write a query to find the running total of sales for each order
	
   Select orderid,
   orderdate,
   sales,
   sum(sales) over(order by orderdate,orderid) as Runningtotal
   From employees
   Order by orderdate,orderid
		
-- Write a query to find the average sales and profit  for each region including a running total.
	
 Select region,
	orderdate,
	sales,
	Avg(sales) as Averagesales,
	Avg (profit) as Averageprofit,
	Sum(sales) over(partition by region order by orderdate) as Runningtotal
	From employees
	Group by 1,2,3
	Order by region,orderdate,sales
	
--Write a query to find the total sales and profit for each product category and sub category including a running total.
	
	Select category,
    sub_category,
	orderdate,
	sales,
	profit,
	Sum(sales) as totalsales,
	Sum(profit) as totalprofit,
	Sum(sales) over(partition by category,sub_category order by orderdate )as Runningtotalsales,
	Sum(Profit)over(partition by category,sub_category order by orderdate )as Runningtotalprofit
	From employees
	Group by 1,2,3,4,5
	Order by category,sub_category,orderdate
	
-- Common Table Expressions (CTEs) Question? 
	
--Write a query to find the total sales and profit for each region using a CTE to calculate the running total.

	With RegCte 
	as (
	Select region,
	orderdate,
	Sales,
	profit,
	Sum(sales) over(partition by region order by orderdate )as Running_total_sales,
	Sum(profit) over (partition by region order by orderdate)as Running_total_profit
	From employees
	)
	Select
	Region,
	Sum(sales) as totalsales,
	Sum(profit) as totalprofit,
	Max(Running_total_sales) as Runningtotalsales,
    MAX(Running_total_profit) as Runningtotalprofit
	From RegCte
	Group by Region

	
-- Write a query to find the top 3 customers with the highest total sales, using a CTE to calculate the ranking.
	
	With SalesCte 
    as(
	Select
	customerid, 
    Sum (Sales) as  Total_Sales,
	Row_Number() OVER (Order by sum (Sales) desc) as SalesRank
    From employees
   Group  by 1
	)
	Select 
	customerid,
	Total_Sales
	From SalesCte
	Where SalesRank <=3
	Order by SalesRank
	
-- Write a query to find the average sales for each category and subcategory using a CTE to calculate the running average.

	With SalesCte
	as(	
	Select category,
    sub_category,
	orderdate,
	sales,
	Avg(sales) as Average_Sales,
	Avg(sales) over(partition by category,sub_category order by orderdate )as Running_Average
	From employees
	Group by 1,2,3,4
	)
	Select category,
	sub_category,
	Running_Average
	From SalesCte
	Order by Category
	
-- Write a query to find the total sales and profit for each customer using a CTE to calculate the running total

	With RegCte 
	as (
	Select customerid,
	orderdate,
	Sales,
	profit,
	Sum(sales) over(partition by customerid order by orderdate )as Running_total_sales,
	Sum(profit) over (partition by customerid order by orderdate)as Running_total_profit
	From employees
	)
	Select
	customerid,
	Sum(sales) as totalsales,
	Sum(profit) as totalprofit,
	Max(Running_total_sales) as Runningtotalsales,
    MAX(Running_total_profit) as Runningtotalprofit
	From RegCte
	Group by customerid
	
-- Write a query to find the total sales and profit for each region using a CTE to calculate the running total
--and including only orders within a specific year and month.

    With RegCte 
	as (
	Select region,
	orderdate,
	Sales,
    orderid,
	profit,
	Sum(sales) over(partition by region order by orderdate,orderid )as Running_total_sales,
	Sum(profit) over (partition by region order by orderdate,orderid)as Running_total_profit
	From employees e
    Where extract (year from e.orderdate) = 2013 AND extract (month from e.orderdate) = 11
	)
	Select
	Region,
    orderdate,
	Sum(sales) as totalsales,
	Sum(profit) as totalprofit,
	Max(Running_total_sales) as Runningtotalsales,
    MAX(Running_total_profit) as Runningtotalprofit
	From RegCte
	Group by 1,2



