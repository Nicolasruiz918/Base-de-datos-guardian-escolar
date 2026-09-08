ALTER TABLE notification_receipts DROP CONSTRAINT IF EXISTS fk_notification_receipts_user;
ALTER TABLE notification_receipts DROP CONSTRAINT IF EXISTS fk_notification_receipts_notification;
ALTER TABLE notifications DROP CONSTRAINT IF EXISTS fk_notifications_safe_zone;
ALTER TABLE notifications DROP CONSTRAINT IF EXISTS fk_notifications_trip;
ALTER TABLE notification_settings DROP CONSTRAINT IF EXISTS fk_notification_settings_user;
