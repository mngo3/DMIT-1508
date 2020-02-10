/* **********
* SchoolTranscript_Data.sql
* Minh Ngo
********** */
USE SchoolTranscript
Go

INSERT INTO Students(GivenName, SurName, DateofBirth) -- notice no Enrolled column
VALUES ('Dan', 'Gilleland','19720514 10:34:09 PM'),
		('Charles','Kuhn','19990806 00:00:00 AM'),
		('Michele','Lewis','19810610 00:00:00 AM'),
		('Penny','Harrison','19961104 00:00:00 AM'),
		('Arthur','Watson','19980907 00:00:00 AM'),
		('Jackson','Hudson','20020702 00:00:00 AM')


SELECT * FROM Students

INSERT INTO Courses(Number,[Name],Credits,[Hours],Cost)
VALUES ('DMIT-1508','Database Fundamentals',3.0,60,750),
	   ('CPSC-1012','Programming Fundamentals',3.0,60,750),
	   ('DMIT-1720','OOP Fundamentals',4.5,90,850),
	   ('DMIT-2210','Agile Development',4.5,90,850),
	   ('DMIT-1718','Software Testing',4.5,90,850)

SELECT * FROM Courses
/*
-- The following should fail,because of a check constraint
INSERT INTO Students(GivenName, SurName, DateofBirth) -- notice no Enrolled column
VALUES ('Minh', 'Ngo','19720514 10:34:09 PM'),
*/

SELECT	Number,[Name],Credits,[Hours]
FROM	Courses
WHERE	[Name] LIKE '%Fundamentals%'

-- Write a query to get the first/last name of all students
-- whose last name starts with a "G"

SELECT	GivenName,SurName
FROM	Students
WHERE	GivenName LIKE '%G%' OR Surname LIKE '%G%'

-- Removing all the data from the Students table
DELETE FROM Students