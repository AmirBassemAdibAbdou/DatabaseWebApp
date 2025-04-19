CREATE PROCEDURE UpdateDeadlineProc
    @QuestID INT,
    @Deadline DATETIME
AS
BEGIN

    UPDATE Collaborative
    SET Deadline = @Deadline
    WHERE QuestID = @QuestID;
	SELECT * FROM Collaborative WHERE QuestID = @QuestID;
END;