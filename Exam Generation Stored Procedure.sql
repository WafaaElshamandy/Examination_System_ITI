Alter proc Generate_Exam @CourseName varchar(20), @NoOfTandF int, @NoOfMCQ int  
as
create table #ExamTemp(QID int,Quest varchar(300), A varchar(200),B varchar(200),C varchar(200))
insert into #ExamTemp(QID,Quest,A,B)
select Top (@NoOfTandF) QuestId ,Question,ChoiceA,ChoiceB from Questions
where Type = 'T/F' and
Questions.CID = (select Crs_Id from Courses where CrsName=@CourseName)
order by NEWID()

insert into #ExamTemp (QID,Quest,A,B,C)
select Top (@NoOfMCQ) QuestId, Question,ChoiceA,ChoiceB,ChoiceC from Questions
where Type = 'MCQ' and Questions.CID = 
(select Crs_Id from Courses where CrsName=@CourseName)
order by NEWID()

update #ExamTemp 
set C = ' '
where C is null

select Quest,A,B,C from #ExamTemp

Insert into Exam (ExamDate)
values(GETDATE())

insert into ExamQuest
select ExamId,QID 
from Exam ,#ExamTemp 
where ExamId=IDENT_CURRENT( 'Exam' )
-- Calling--
Generate_Exam 'SQL',4,6
Generate_Exam 'C++',8,2
Generate_Exam 'Statistics',4,6
Generate_Exam 'Python',5,5
Generate_Exam '.NET',6,4
Generate_Exam 'Java',6,4
Generate_Exam 'Network',3,7
Generate_Exam 'Cyber Security',5,5
Generate_Exam 'Data Warehouse',5,5
Generate_Exam 'Power BI',5,5
Generate_Exam 'Excel',2,8
Generate_Exam 'PHP',6,4
Generate_Exam 'Kotlin',5,5
Generate_Exam 'Flutter',5,5


