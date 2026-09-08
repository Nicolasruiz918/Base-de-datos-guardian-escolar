-- =============================================
-- OPERATIONAL PROCEDURES
-- =============================================

-- Standard functional activity log entry.
CREATE OR REPLACE PROCEDURE sp_register_activity(
    p_user_id UUID,
    p_action_type VARCHAR,
    p_description TEXT,
    p_source_ip INET DEFAULT NULL,
    p_metadata JSONB DEFAULT NULL
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO activity_logs (
        user_id,
        action_type,
        description,
        source_ip,
        metadata,
        created_at
    )
    VALUES (
        p_user_id,
        p_action_type,
        p_description,
        p_source_ip,
        p_metadata,
        NOW()
    );
END;
$$;

-- Marks a notification as read for a specific user.
CREATE OR REPLACE PROCEDURE sp_mark_notification_read(
    p_receipt_id UUID,
    p_user_id UUID
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE notification_receipts
    SET
        was_read = true,
        read_at = COALESCE(read_at, NOW())
    WHERE id = p_receipt_id
      AND user_id = p_user_id;
END;
$$;
