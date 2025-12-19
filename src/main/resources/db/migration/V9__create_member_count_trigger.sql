-- Function to update member_count in conversations
CREATE OR REPLACE FUNCTION update_member_count()
RETURNS TRIGGER AS $$
BEGIN
UPDATE conversations
SET member_count = (
    SELECT COUNT(*) FROM conversation_members WHERE conversation_id = NEW.conversation_id
)
WHERE id = NEW.conversation_id;

RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger for INSERT
CREATE TRIGGER conversation_members_insert
    AFTER INSERT ON conversation_members
    FOR EACH ROW
    EXECUTE FUNCTION update_member_count();

-- Trigger for DELETE
CREATE TRIGGER conversation_members_delete
    AFTER DELETE ON conversation_members
    FOR EACH ROW
    EXECUTE FUNCTION update_member_count();
