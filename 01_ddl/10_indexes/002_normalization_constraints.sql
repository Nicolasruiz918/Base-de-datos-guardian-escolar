-- =============================================
-- 3NF INTEGRITY CONSTRAINTS
-- =============================================

-- Each notification settings row belongs to one user.
CREATE UNIQUE INDEX ux_notification_settings_user
ON notification_settings(user_id);

-- User emails are unique regardless of uppercase/lowercase input.
CREATE UNIQUE INDEX ux_users_email_lower
ON users(LOWER(email))
WHERE deleted_at IS NULL;

-- A user must not have duplicate receipts for the same notification.
CREATE UNIQUE INDEX ux_notification_receipts_notification_user
ON notification_receipts(notification_id, user_id);

-- A route must not repeat the same stop order.
CREATE UNIQUE INDEX ux_stops_route_order
ON stops(route_id, stop_order);

-- A student can only have one active phone linked by QR.
CREATE UNIQUE INDEX ux_student_devices_single_active
ON student_devices(student_id)
WHERE is_active IS TRUE AND deleted_at IS NULL;

-- Frequent lookups for guardians who can track a student.
CREATE INDEX idx_student_guardians_user_status
ON student_guardians(user_id, status)
WHERE deleted_at IS NULL;

CREATE INDEX idx_student_guardians_student_status
ON student_guardians(student_id, status)
WHERE deleted_at IS NULL;
