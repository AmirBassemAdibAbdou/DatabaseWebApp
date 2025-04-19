CREATE PROC listAssessments
@CourseID INT,
@ModuleID INT , 
@LearnerID INT
AS
BEGIN
SELECT A.*
FROM Assessments A
         INNER JOIN TakenAssessment T ON A.ID = T.AssessmentID
WHERE A.CourseID = @CourseID AND A.ModuleID = @ModuleID AND T.LearnerID = @LearnerID;
END;

EXEC listAssessments @CourseID = 1, @ModuleID = 1 , @LearnerID = 6