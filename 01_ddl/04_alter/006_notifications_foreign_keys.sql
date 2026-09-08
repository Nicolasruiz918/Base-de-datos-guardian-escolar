-- =============================================
-- DOMAIN: NOTIFICATIONS AND PREFERENCES
-- =============================================

ALTER TABLE notification_settings
ADD CONSTRAINT fk_notification_settings_user
FOREIGN KEY (user_id)
REFERENCES users(id)
ON DELETE CASCADE;

ALTER TABLE notifications
ADD CONSTRAINT fk_notifications_trip
FOREIGN KEY (trip_id)
REFERENCES trips(id)
ON DELETE SET NULL;

ALTER TABLE notifications
ADD CONSTRAINT fk_notifications_safe_zone
FOREIGN KEY (safe_zone_id)
REFERENCES safe_zones(id)
ON DELETE SET NULL;

ALTER TABLE notification_receipts
ADD CONSTRAINT fk_notification_receipts_notification
FOREIGN KEY (notification_id)
REFERENCES notifications(id)
ON DELETE CASCADE;

ALTER TABLE notification_receipts
ADD CONSTRAINT fk_notification_receipts_user
FOREIGN KEY (user_id)
REFERENCES users(id)
ON DELETE CASCADE;
