/* **********
* SchoolTranscript_Data.sql
* Minh Ngo
********** */
USE SchoolTranscript
Go

INSERT INTO Students(GivenName, SurName, DateofBirth) -- notice no Enrolled column
VALUES ('Minh', 'Ngo','19720514 10:34:09 PM')

SELECT * FROM Students