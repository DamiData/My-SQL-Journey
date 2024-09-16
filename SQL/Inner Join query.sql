--Inner Join:
--	List the titles of books along with their authors.
Select b.Title,
a.AuthorName
From dbo.Books_table as b
Inner join Authors_table as a on b.AuthorID = a.AuthorID

--	Show the titles and prices of all fantasy books.
 select Title,
 Price
 From dbo.Books_table
 Where Genre = 'Fantasy'

--Display the authors who have written books and the titles of their books.
Select a.AuthorID,
a. AuthorName,
Title
From dbo.Authors_table as a
Inner Join Books_table as b on a.AuthorID = b.AuthorID

--	Find the titles and genres of books priced less than $15.
Select Title,
Genre
From dbo.Books_table
Where Price < 15
