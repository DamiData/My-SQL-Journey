 CREATE DATABASE TDI;
 USE TDI;


 /*DATABASE CREATION*/


 CREATE TABLE Employees(
EmployeeID Int,
First_Name Varchar (50),
Last_Name Varchar (50),
Hire_Date Date,
Salary Float
);
--DDL-CREATE TABLE

ALTER TABLE dbo.Employees 
ADD Department Varchar (50);

-- DDL Use Alter to add column Department

Alter Table dbo.Employees
Alter Column Salary Decimal(10,2);

--DDL ALTER use to change data type

--DROP -Use to remove entire database object ,
--it also delete a table
--to drop a column you use alter along

Alter Table Employees
Drop Column Department;

--Index -use to improve speed of a query in a data base

Create Index idx_Last_Name
On Employees (Last_Name);


/*DML-Data Manipulation language
used to manipulate data stored in a database*/

--INSERT-Adds rows or informations of data into a table

Insert into Employees(EmployeesID, First_Name,Last_Name,Hire_Date,Salary)
Values (1,'Alice','Johnson','2021-05-15',6000);

--INSERT Multiple rows

Insert into Employees(EmployeesID, First_Name,Last_Name,Hire_Date,Salary)
Values (2,'Bob','Smith','2020-03-22',55000),
        (3,'Charlie','Brown','2019-11-30',70000);

--Select - use to select a set of data information from a table

Select * from Employees;

--INSERT-new Records 

Insert into Employees(EmployeesID, First_Name,Last_Name,Hire_Date,Salary)
Values (4,'David','Smith','2020-03-22',55000);

--UPDATE-use to change data in a table or modify

UPDATE Employees Set 
Salary = 65000
Where EmployeesID = 1


--DELETE-Removes rows of data from  a table
--can be rolled back

Delete From Employees
Where EmployeesID = 3

