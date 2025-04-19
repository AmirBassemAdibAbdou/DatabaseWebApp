ALTER PROCEDURE UpdateLearner
    @LearnerID INT,
    @first_name VARCHAR(100),
    @last_name VARCHAR(100),
    @gender BIT,
    @birth_date DATETIME,
    @country VARCHAR(100),
    @cultural_background VARCHAR(100)
   
AS
BEGIN
    UPDATE Learner
    SET 
       first_name = @first_name,
        last_name = @last_name,
        gender = @gender,
        birth_date = @birth_date,
        country = @country,
        cultural_background = @cultural_background
    WHERE LearnerID = @LearnerID;

END;
