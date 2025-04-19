CREATE PROCEDURE JoinQuestOmar
    @LearnerID INT, 
    @QuestID INT
AS
BEGIN
    -- Check if the quest exists and has available space for more participants
    IF EXISTS (
        SELECT 1
        FROM Collaborative C
        INNER JOIN LearnersCollaboration LC ON C.QuestID = LC.QuestID
        WHERE C.QuestID = @QuestID
        GROUP BY C.QuestID, C.max_num_participants
        HAVING COUNT(LC.LearnerID) < C.max_num_participants
    )
    BEGIN
        -- Check if the learner is not already in the quest
        IF NOT EXISTS (
            SELECT 1
            FROM LearnersCollaboration LC
            WHERE LC.LearnerID = @LearnerID AND LC.QuestID = @QuestID
        )
        BEGIN
            -- Insert the learner into the LearnersCollaboration table
            INSERT INTO LearnersCollaboration (LearnerID, QuestID, completion_)
            VALUES (@LearnerID, @QuestID, 'COMPLETED');

            PRINT 'Learner successfully joined the quest.';
        END
        ELSE
        BEGIN
            PRINT 'Learner is already a participant in the quest.';
        END
    END
    ELSE
    BEGIN
        PRINT 'No available space in the quest.';
    END
END;


EXEC JoinQuestOmar 12, 2