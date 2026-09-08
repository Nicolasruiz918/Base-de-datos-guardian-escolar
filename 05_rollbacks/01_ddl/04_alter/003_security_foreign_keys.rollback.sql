ALTER TABLE security_settings DROP CONSTRAINT IF EXISTS fk_security_settings_updated_by;
ALTER TABLE password_policies DROP CONSTRAINT IF EXISTS fk_password_policies_updated_by;
ALTER TABLE user_sessions DROP CONSTRAINT IF EXISTS fk_user_sessions_user;
ALTER TABLE role_permissions DROP CONSTRAINT IF EXISTS fk_role_permissions_permission;
ALTER TABLE role_permissions DROP CONSTRAINT IF EXISTS fk_role_permissions_role;
ALTER TABLE user_roles DROP CONSTRAINT IF EXISTS fk_user_roles_role;
ALTER TABLE user_roles DROP CONSTRAINT IF EXISTS fk_user_roles_user;
