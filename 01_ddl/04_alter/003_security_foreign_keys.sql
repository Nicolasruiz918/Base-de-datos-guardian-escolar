-- =============================================
-- DOMAIN: SECURITY AND ACCESS
-- =============================================

ALTER TABLE user_roles
ADD CONSTRAINT fk_user_roles_user
FOREIGN KEY (user_id)
REFERENCES users(id)
ON DELETE CASCADE;

ALTER TABLE user_roles
ADD CONSTRAINT fk_user_roles_role
FOREIGN KEY (role_id)
REFERENCES roles(id)
ON DELETE CASCADE;

ALTER TABLE role_permissions
ADD CONSTRAINT fk_role_permissions_role
FOREIGN KEY (role_id)
REFERENCES roles(id)
ON DELETE CASCADE;

ALTER TABLE role_permissions
ADD CONSTRAINT fk_role_permissions_permission
FOREIGN KEY (permission_id)
REFERENCES permissions(id)
ON DELETE CASCADE;

ALTER TABLE user_sessions
ADD CONSTRAINT fk_user_sessions_user
FOREIGN KEY (user_id)
REFERENCES users(id)
ON DELETE CASCADE;

ALTER TABLE password_policies
ADD CONSTRAINT fk_password_policies_updated_by
FOREIGN KEY (updated_by)
REFERENCES users(id);

ALTER TABLE security_settings
ADD CONSTRAINT fk_security_settings_updated_by
FOREIGN KEY (updated_by)
REFERENCES users(id);
