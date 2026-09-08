ALTER TABLE error_logs DROP CONSTRAINT IF EXISTS fk_error_logs_user;
ALTER TABLE audit_logs DROP CONSTRAINT IF EXISTS fk_audit_logs_user;
ALTER TABLE activity_logs DROP CONSTRAINT IF EXISTS fk_activity_logs_user;
