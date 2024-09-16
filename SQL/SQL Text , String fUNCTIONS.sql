Create database Sales_Data
Use Sales_Data

--TEXT FUNCTIONS

--Convert all customer names to lowercase and display the result, ordering by the lowercase customer name.

SELECT LOWER(Customer_Name) as Lower
FROM Sales_Data
ORDER BY Lower

--Convert all customer names to uppercase and display the total sales for each customer, grouped by the uppercase name.
SELECT UPPER(Customer_Name) AS UPPER,
SUM(Sales) AS Total_Sales
FROM Sales_Data
GROUP BY UPPER(Customer_Name)

--Concatenate the customer name and city with a comma and space between them, and order the results by the combined string.
SELECT CONCAT(Customer_Name,',','',City) AS Combined
FROM Sales_Data
ORDER BY Combined
-- Extract the first three characters of the customer names and display the result, ordering by the substring.
SELECT Customer_Name,SUBSTRING(Customer_Name,1,3) AS First_char
FROM Sales_Data
ORDER BY First_Char

-- Get the first five characters of the customer names and calculate the total sales for these grouped names.
SELECT SUBSTRING(Customer_Name,1,5) AS First_Char,
SUM(Sales) AS Total_Sales
FROM Sales_Data
GROUP BY SUBSTRING(Customer_Name,1,5)

-- Get the last three characters of the customer names and display the result, ordering by the last three characters.
Select Customer_Name,RIGHT(Customer_Name,3) as Last 
FROM Sales_Data
ORDER BY Last

-- Replace all spaces in customer names with underscores and calculate the total quantity of items ordered by each modified name, ordering by the replaced names.
SELECT REPLACE(Customer_Name,' ','_') AS Modified_Name,
SUM(Quantity) AS Total_Quantity
FROM Sales_Data
GROUP BY REPLACE(Customer_Name,' ','_')
ORDER BY Modified_Name

-- Find the length of each customer name and display the result, ordering by the length.
Select LEN(Customer_Name) AS Length
FROM Sales_Data
ORDER BY Length

-- Remove leading and trailing spaces from customer names (if any) and display the result, ordering by the trimmed names.
SELECT TRIM (Customer_Name) as CM
FROM Sales_Data
ORDER BY CM

-- Remove leading spaces from customer names and display the result where the customer name starts with 'A', ordering by the trimmed names.
SELECT TRIM(Customer_Name) AS Trimmed_Names
FROM Sales_Data
Where TRIM(Customer_Name) LIKE 'A%'
ORDER BY Trimmed_Names

-- Remove trailing spaces from customer names and display the result where the length of the customer name is greater than 10, ordering by the trimmed names.
SELECT TRIM(Customer_Name) AS Trimmed_Names
FROM Sales_Data
WHERE LEN(TRIM(Customer_Name)) > 10
ORDER BY Trimmed_Names

-- Display customer names, replacing NULL values with 'Unknown', and order by the coalesced customer names.
Select COALESCE(Customer_Name,'Unknown') AS Coalesce_cm
FROM Sales_Data
ORDER BY Coalesce_cm

