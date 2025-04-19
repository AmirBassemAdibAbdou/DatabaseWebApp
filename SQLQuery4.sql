GO
CREATE PROC Viewscore
@LearnerID INT,
@AssessmentID INT,
@score INT OUTPUT
AS
BEGIN
SELECT @score = scoredPoint
FROM TakenAssessment
WHERE LearnerID = @LearnerID AND AssessmentID = @AssessmentID;
END;
