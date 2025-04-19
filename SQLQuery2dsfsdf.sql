 CREATE PROCEDURE UpdateDeadlineFinal
    @QuestID INT,
    @Deadline DATETIME
AS
BEGIN

    UPDATE Collaborative
    SET Deadline = @Deadline
    WHERE QuestID = @QuestID;
	SELECT QuestID,Deadline FROM Collaborative WHERE QuestID = @QuestID;
END;
