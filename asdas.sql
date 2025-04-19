CREATE PROC ViewCurrentPath
@LearnerID INT
AS
BEGIN
SELECT *
FROM Learning_path
WHERE LearnerID = @LearnerID;
END;
EXEC ViewCurrentPath @LearnerID = 6;