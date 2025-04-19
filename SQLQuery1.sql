ALTER PROC ProfileUpdate 
    @learnerID INT, 
    @ProfileID INT, 
    @PreferedContentType VARCHAR(50), 
    @emotional_state VARCHAR(50), 
    @PersonalityType VARCHAR(50)
AS
BEGIN
    -- Avoid recursion or loops by limiting the rows affected
    UPDATE PersonalizationProfiles
    SET
        Preferred_content_type = @PreferedContentType,
        emotional_state = @emotional_state,
        personality_type = @PersonalityType
    WHERE 
        LearnerID = @learnerID AND ProfileID = @ProfileID;
END;


DISABLE TRIGGER ALL ON PersonalizationProfiles;
ENABLE TRIGGER ALL ON PersonalizationProfiles;


EXEC ProfileUpdate 1, 101, 'NETWORKING', 'SATISFIED', 'INTROVERT';

