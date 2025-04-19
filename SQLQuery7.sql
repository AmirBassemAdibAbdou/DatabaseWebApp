CREATE PROCEDURE AssessmentAnalysisFinal
    @LearnerID INT
AS
BEGIN
    -- Select the breakdown of assessment scores for the specified learner
    SELECT 
        A.title AS AssessmentTitle,
        M.Title AS ModuleTitle,
        C.Title AS CourseTitle,
        TA.scoredPoint AS Score,
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

EXEC AssessmentAnalysisFinal 6