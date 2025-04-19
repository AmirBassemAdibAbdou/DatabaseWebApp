CREATE PROCEDURE AnalysisFinal
    @LearnerID INT
AS
BEGIN
    -- Select the breakdown of assessment scores for the specified learner
    SELECT 
        A.title ,
     
        A.total_marks AS TotalMarks,
        (CAST(TA.scoredPoint AS DECIMAL) / A.total_marks) * 100 AS Percentage,
        A.weightage AS AssessmentWeightage,
        (TA.scoredPoint * A.weightage) / 100 AS WeightedScore
    FROM 
        TakenAssessment TA
    INNER JOIN 
        Assessments A ON TA.AssessmentID = A.ID
    INNER JOIN 
        Modules M ON A.ModuleID = M.ModuleID AND A.CourseID = M.CourseID
    INNER JOIN 
        Course C ON A.CourseID = C.CourseID
    WHERE 
        TA.LearnerID = @LearnerID

END;

EXEC AnalysisFinal 6