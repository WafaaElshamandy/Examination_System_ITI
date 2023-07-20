--1) Report that returns the students information according to Department No parameter.
Create Procedure GetStudentInfo @did int
AS
select * from Student
where DID=@did
--Calling--
GetStudentInfo 1

--2) Report that takes the student ID and returns the grades of the student in all courses. %
Create Procedure GetStudentGrades @sid int
AS
Select CrsName , Grade
from StudCrs, Courses
where StudCrs.CrsId = Courses.Crs_Id and StudCrs.SID = @sid
--Calling--
GetStudentGrades 1

--3) Report that takes the instructor ID and returns the name of the courses that he teaches and the number of student per course.
Create Procedure GetInstructorInfo @insId int
AS
select c.CrsName,count(sc.SID) as [Number Of Students] from Courses c,StudCrs sc
where c.Crs_Id in (select CrsId from InsCrs where InsId= @insId) and c.Crs_Id=sc.CrsId 
group by c.CrsName
--Calling--
GetInstructorInfo 30

--4) Report that takes course ID and returns its topics 
Alter Procedure GetTopicInfo @cid int
AS
select Courses.CrsName , Courses.Credit_Hour , Courses.Duration , Top_Name from Topics,Courses
where Top_Id=TID and Crs_Id=@cid
--Calling--
GetTopicInfo 1

--5) Report that takes exam number and returns the Questions in it and chocies
Create Procedure GetExamInfo @eid int
AS
select Question,ChoiceA,ChoiceB,ChoiceC from Questions,ExamQuest
where QuestId=QID and EID=@eid
--Calling--
GetExamInfo 10

--6) Report that takes exam number and the student ID then returns the Questions in this exam with the student answers.
Create Procedure GetQuestionsInfo @eid int, @sid int
AS
select Questions.Question , StudAnswer.Answer
from StudAnswer Join Questions on StudAnswer.QID = Questions.QuestId
Join Exam on StudAnswer.SID = Exam.SID
Where Exam.ExamId=@eid and Exam.SID = @sid
--Calling--
GetQuestionsInfo 10, 1


--When all data are set--
update StudCrs
set Grade = AssignmentScore + AttendScore

update StudCrs 
set Status  =
  CASE
    WHEN Grade > 50 THEN 'Passed'
    ELSE 'Failed'
  END ;

