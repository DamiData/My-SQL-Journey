Create Database Sub

Use Sub

Select *
From Subquery_data

-- Which date(s) had the highest total sales and which product(s) contributed to those sales?

Select Order_Date,
Category,
Sum(Sales) As Total_Sales 
From Subquery_data
Where Order_Date = (Select Top 1 Order_Date
From Subquery_data
Group by Order_Date
Order By Sum(Sales) Desc
) 
Group By Order_Date , Category

-- Which product(s) had the highest average unit price among all products sold
--Adding a new Column UnitPrice

Alter Table Subquery_data
Add Unit_Price As (Sales/Quantity) 

Select Category,Avg(Unit_Price) As Unit_Price
From Subquery_data
Group By Category
Having Avg (Unit_Price)=(Select Max(Average_price)
From(Select Category,Avg(Unit_Price) As Average_Price
From Subquery_data
Group by Category) As Products)

  ----OR

Select Top  1 Category, Avg(Unit_Price) As Average_Price
From Subquery_Data
Group By Category
Order By Avg (Unit_Price) Desc



-- What were the total sales for each product on dates where the quantity sold exceeded the average quantity sold for that product?

Select Category,
Order_Date,
Sum(Quantity * Unit_Price) As Total_Sales
From Subquery_data
Where Quantity >(Select Avg(Quantity)
From Subquery_data As S2
Where S2.Category = Subquery_data.Category)
Group By Category, Order_Date


-- What were the top 3 dates with the highest total sales, and which product(s) contributed to those sales on each date?

Select Order_Date,
Category,
Sum(Quantity*Unit_Price) As Total_Sales
From Subquery_data
Where Order_Date in (Select Top 3 Order_Date
From Subquery_Data
Group By Order_Date
Order By Sum(Quantity*Unit_Price)  Desc
)
Group By Order_Date , Category
Order By Category Desc


-- What percentage of the total sales on April 15th, 2024, did each product contribute?

Select Category,
Order_Date,
Sum(Sales)/ (Select Sum(Sales )
From Subquery_data
Where Order_Date = '2014-04-15') * 100 As Percentage_sales
From Subquery_data
Where Order_Date = '2014-04-15'
Group By Category,Order_Date

-- Which product(s) had the highest total sales over any consecutive 3-day period?

-- On which date(s) did product C's total sales exceed the combined total sales of all other products?
Select Sub_Category,
Order_Date 
From Subquery_data As O
Where Sub_Category like 'C%' And Sales >(Select Sum(Sales)
From Subquery_data
Where Order_Date = O.Order_Date And Sub_Category !='Copiers' And Sub_Category != 'Chairs')
Group By Sub_Category,Order_Date

--- What were the cumulative total sales for each product over the entire period covered by the dataset, ordered by date?
Select Sub_Category,
Order_Date,
Sum(Sales) As Total_Sales
From Subquery_data
Group By Sub_Category,Order_Date
Order By Order_Date 

