-- Insert Examples
USE [A01-School]
GO -- Execute the code up to this point as a single batch

/*  Notes:
    The syntax for the INSERT statement is

    INSERT INTO TableName(Comma, Separated, ListOf, ColumnNames)
    VALUES ('A', 'Value', 'Per', 'Column')

    The line above will insert a single row of data. Typically, this
    syntax is used for hard-coded values.
    To insert multiple rows of hard-coded values, follow this pattern:

    INSERT INTO TableName(Comma, Separated, ListOf, ColumnNames)
    VALUES ('A', 'Value', 'Per', 'Column'),
           ('Another', 'Row', 'Of', 'Values')
    
	When inserting values, you can use subqueries for individual values 
	provided that the subquery returns a single value.

	INSERT INTO TableName(Comma, Seperated, ListOf, ColumnNames)
	VALUES ('A', (SELECT SingleValue FROM SomeTable), 'Per', 'Column')

    Another syntax for the INSERT statement is to use a SELECT clause in place
    of the VALUES clause. This is used for zero-to-many possible rows to insert.

    INSERT INTO TableName(Comma, Separated, ListOf, ColumnNames)
    SELECT First, Second, Third, LastColumn
    FROM   SomeTable
*/

-- Insert Examples
-- 1. Let's add a new course called "Expert SQL". It will be a 90 hour course with a cost of $450.00
INSERT INTO Course(CourseId, CourseName, CourseHours, CourseCost)
VALUES ('DMIT777', 'Expert SQL', 90, 450.00)

-- 2. Let's add a new staff member, someone who's really good at SQL
-- SELECT * FROM STAFF
INSERT INTO Staff(FirstName, LastName, DateHired, PositionID)
SELECT 'Dan', 'Gilleland', GETDATE(), PositionID
       --, PositionDescription
FROM   Position
WHERE  PositionDescription = 'Instructor'
-- 2b. Let's get another instructor
INSERT INTO Staff(FirstName, LastName, DateHired, PositionID)
VALUES ('Shane', 'Bell', GETDATE(), 
        (SELECT PositionID
        FROM   Position
        WHERE  PositionDescription = 'Instructor'))
-- 2.c. We have an open position in the staff.
SELECT  PositionDescription
FROM    Position
WHERE   PositionID NOT IN (SELECT PositionID FROM Staff)
--      Add Sheldon Murray as the new Assistant Dean.
-- TODO: Student Answer Here....

INSERT INTO Staff(FirstName,LastName,DateHired,PositionID)
SELECT 'Sheldon','Murray', GETDATE(), PositionID 
FROM	Position
WHERE	PositionDescription = 'Assistant Dean'
-- 3. There are three additional clubs being started at the school:
--      - START - Small Tech And Research Teams
--      - CALM - Coping And Lifestyle Management
--      - RACE - Rapid Acronym Creation Experts
--    SELECT * FROM Club
INSERT INTO Club(ClubId, ClubName)
VALUES ('START', 'Small Tech And Research Teams'),
       ('CALM', 'Coping And Lifestyle Management'),
       ('RACE', 'Rapid Acronym Creation Experts')

-- ======= Practice ========
-- 4. In your web browser, use https://randomuser.me/ to get information on three
--    people to add as new students. Write separate insert statement for each new student.
-- TODO: Student Answer Here....
-- Select * From Student
INSERT INTO Student(FirstName,LastName,Gender,StreetAddress,Birthdate)
VALUES ('Jean','Mitchell','F','5681 Adams St','1959-07-08 00:00:00'),
	   ('Brianna','Wallace','F','7481 Timber Wolf Trail','1987-03-02 00:00:00'),
	   ('Marilyn','Sullivan','F','372 Pockrus Page Rd','1968-06-10 00:00:00')



-- 5. Enroll each of the students you've added into the DMIT777 course.
--    Use 'Dan Gilleland' as the instructor. At this point, their marks should be NULL.
-- TODO: Student Answer Here....
-- Select * from Registration
INSERT INTO Registration(StudentID,Semester,WithdrawYN)
VALUES	('200978401',
	   (SELECT StudentID
	    FROM Registration 
		WHERE CourseId ='DMIT777'),
	   (SELECT StaffID
	    FROM   Staff
		WHERE  FirstName='Dan' AND LastName ='Gilleland'))
	    