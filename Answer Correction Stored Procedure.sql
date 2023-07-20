--Answer Correction--
alter proc Answer_Correction @ExamId INT, @StudentId INT
AS
declare @Grade int

Select @Grade = COUNT(*) 
From StudAnswer SA JOIN ExamQuest Q ON SA.QID = Q.QID
JOIN Questions ON Q.QID = Questions.QuestId
Where Q.EID = @ExamId and SA.SID = @StudentId and SA.Answer = Questions.QestAnsw

select @Grade AS [Your Grade is]

Update Exam
Set Grade = @Grade
Where ExamId = @ExamId

UPDATE Exam
SET Status = 
  CASE
    WHEN Grade > 5 THEN 'Passed'
    ELSE 'Failed'
  END
WHERE ExamId = @ExamId;

--Calling--
declare @ee int
set @ee =IDENT_CURRENT('Exam')
execute Answer_Correction @ee,350


