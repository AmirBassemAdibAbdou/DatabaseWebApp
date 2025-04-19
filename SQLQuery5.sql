Alter PROCEDURE JoinQuestFinal
    @LearnerID INT, 
    @QuestID INT
AS
BEGIN
    -- Check if the quest exists and has available space for more participants
    IF EXISTS (
        SELECT *
        FROM Collaborative C
        INNER JOIN LearnersCollaboration LC ON C.QuestID = LC.QuestID
        WHERE C.QuestID = @QuestID
        GROUP BY C.QuestID, C.max_num_participants
        HAVING COUNT(LC.LearnerID) < C.max_num_participants
    )
    BEGIN
        -- Check if the learner is not already in the quest
        IF NOT EXISTS (
            SELECT *
            FROM LearnersCollaboration LC
            WHERE LC.LearnerID = @LearnerID AND LC.QuestID = @QuestID
        )
        BEGIN
            -- Insert the learner into the LearnersCollaboration table
            INSERT INTO LearnersCollaboration (LearnerID, QuestID, completion_)
            VALUES (@LearnerID, @QuestID, 'COMPLETED');
end
	END	
           SELECT * FROM Collaborative
END;
