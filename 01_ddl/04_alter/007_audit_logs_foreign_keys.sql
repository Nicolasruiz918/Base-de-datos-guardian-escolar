-- =============================================
-- DOMAIN: AUDIT AND LOGS
-- =============================================

ALTER TABLE activity_logs
ADD CONSTRAINT fk_activity_logs_user
FOREIGN KEY (user_id)
REFERENCES users(id);

ALTER TABLE audit_logs
ADD CONSTRAINT fk_audit_logs_user
FOREIGN KEY (user_id)
REFERENCES users(id);

ALTER TABLE error_logs
ADD CONSTRAINT fk_error_logs_user
FOREIGN KEY (user_id)
REFERENCES users(id);
