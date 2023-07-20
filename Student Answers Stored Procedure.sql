--Answers Procedure--
CREATE TYPE AnswerTypes AS TABLE
(
    QuestionID INT,
    Answer VARCHAR(200)
);

Alter PROCEDURE Exams_Answers
    @Exam_ID INT,
    @Sid INT,
    @Answers AnswerTypes READONLY
AS
-- Use the @Answers table-valued parameter to insert into StudAnswer table
INSERT INTO StudAnswer (SID, QID, Answer)
SELECT @Sid, QuestionID, Answer
FROM @Answers;

-- Update the exam table with the SID
UPDATE exam 
SET SID = @Sid
WHERE ExamId = @Exam_ID;

UPDATE Exam
SET ExamFees = 
    CASE 
        WHEN ExamID IN (
            SELECT DISTINCT eq.EID
            FROM ExamQuest eq
            INNER JOIN Questions q ON eq.QID = q.QuestId
            WHERE q.CID = 1
        ) THEN 100
        
        WHEN ExamID IN (
            SELECT DISTINCT eq.EID
            FROM ExamQuest eq
            INNER JOIN Questions q ON eq.QID = q.QuestId
            WHERE q.CID = 2
        ) THEN 200
        
		WHEN ExamID IN (
            SELECT DISTINCT eq.EID
            FROM ExamQuest eq
            INNER JOIN Questions q ON eq.QID = q.QuestId
            WHERE q.CID = 3
        ) THEN 300

		WHEN ExamID IN (
            SELECT DISTINCT eq.EID
            FROM ExamQuest eq
            INNER JOIN Questions q ON eq.QID = q.QuestId
            WHERE q.CID = 4
        ) THEN 400

		WHEN ExamID IN (
            SELECT DISTINCT eq.EID
            FROM ExamQuest eq
            INNER JOIN Questions q ON eq.QID = q.QuestId
            WHERE q.CID = 5
        ) THEN 500

		WHEN ExamID IN (
            SELECT DISTINCT eq.EID
            FROM ExamQuest eq
            INNER JOIN Questions q ON eq.QID = q.QuestId
            WHERE q.CID = 6
        ) THEN 100

		WHEN ExamID IN (
            SELECT DISTINCT eq.EID
            FROM ExamQuest eq
            INNER JOIN Questions q ON eq.QID = q.QuestId
            WHERE q.CID = 7
        ) THEN 200

		WHEN ExamID IN (
            SELECT DISTINCT eq.EID
            FROM ExamQuest eq
            INNER JOIN Questions q ON eq.QID = q.QuestId
            WHERE q.CID = 8
        ) THEN 300

		WHEN ExamID IN (
            SELECT DISTINCT eq.EID
            FROM ExamQuest eq
            INNER JOIN Questions q ON eq.QID = q.QuestId
            WHERE q.CID = 9
        ) THEN 400

		WHEN ExamID IN (
            SELECT DISTINCT eq.EID
            FROM ExamQuest eq
            INNER JOIN Questions q ON eq.QID = q.QuestId
            WHERE q.CID = 10
        ) THEN 500

		WHEN ExamID IN (
            SELECT DISTINCT eq.EID
            FROM ExamQuest eq
            INNER JOIN Questions q ON eq.QID = q.QuestId
            WHERE q.CID = 11
        ) THEN 100

	   WHEN ExamID IN (
            SELECT DISTINCT eq.EID
            FROM ExamQuest eq
            INNER JOIN Questions q ON eq.QID = q.QuestId
            WHERE q.CID = 12
        ) THEN 200

		WHEN ExamID IN (
            SELECT DISTINCT eq.EID
            FROM ExamQuest eq
            INNER JOIN Questions q ON eq.QID = q.QuestId
            WHERE q.CID = 13
        ) THEN 300

	   WHEN ExamID IN (
            SELECT DISTINCT eq.EID
            FROM ExamQuest eq
            INNER JOIN Questions q ON eq.QID = q.QuestId
            WHERE q.CID = 14
        ) THEN 400
       
        ELSE 0  
    END

--Calling--
declare @e int
set @e =IDENT_CURRENT('Exam')
DECLARE @Answers AnswerTypes;
INSERT INTO @Answers (QuestionID, Answer)
VALUES
    (2, 'DML'),
    (3, 'Fixed'),
	(5, 'cc'),
	(9, 'dd'),
	(12, 'ee'),
	(13, 'ff'),
	(21, 'gg'),
	(24, 'tt'),
	(28, 'yy'),
	(30, 'jj')
execute Exams_Answers @e,350, @Answers

