-- =============================================
-- DML - SECURITY CATALOG
-- Required system roles, permissions and security defaults.
-- =============================================

INSERT INTO roles (role_name, description) VALUES
('ADMIN', 'System administrator - full access'),
('PARENT', 'Parent/guardian - access to children location')
ON CONFLICT (role_name) DO UPDATE SET
    description = EXCLUDED.description,
    updated_at = NOW();

INSERT INTO permissions (permission_name, description) VALUES
('USER_CREATE', 'Create new users'),
('USER_READ', 'Read user information'),
('USER_UPDATE', 'Update users'),
('USER_DELETE', 'Delete users'),
('STUDENT_CREATE', 'Register new students'),
('STUDENT_READ', 'View student information'),
('STUDENT_UPDATE', 'Update students'),
('STUDENT_DELETE', 'Delete students'),
('ROUTE_CREATE', 'Create school routes'),
('ROUTE_READ', 'View routes'),
('ROUTE_UPDATE', 'Update routes'),
('ROUTE_DELETE', 'Delete routes'),
('LOCATION_VIEW', 'View real-time location'),
('SAFE_ZONE_CREATE', 'Create safe zones'),
('SAFE_ZONE_READ', 'View safe zones'),
('SAFE_ZONE_UPDATE', 'Update safe zones'),
('SAFE_ZONE_DELETE', 'Delete safe zones'),
('NOTIFICATION_SEND', 'Send notifications'),
('REPORT_VIEW', 'View reports and statistics'),
('AUDIT_VIEW', 'View audit logs')
ON CONFLICT (permission_name) DO UPDATE SET
    description = EXCLUDED.description,
    updated_at = NOW();

INSERT INTO role_permissions (role_id, permission_id)
SELECT r.id, p.id
FROM roles r
CROSS JOIN permissions p
WHERE r.role_name = 'ADMIN'
ON CONFLICT DO NOTHING;

INSERT INTO role_permissions (role_id, permission_id)
SELECT r.id, p.id
FROM roles r
CROSS JOIN permissions p
WHERE r.role_name = 'PARENT'
  AND p.permission_name IN (
    'STUDENT_CREATE',
    'STUDENT_READ',
    'STUDENT_UPDATE',
    'STUDENT_DELETE',
    'ROUTE_CREATE',
    'ROUTE_READ',
    'ROUTE_UPDATE',
    'ROUTE_DELETE',
    'LOCATION_VIEW',
    'SAFE_ZONE_CREATE',
    'SAFE_ZONE_READ',
    'SAFE_ZONE_UPDATE',
    'SAFE_ZONE_DELETE',
    'NOTIFICATION_SEND',
    'REPORT_VIEW'
  )
ON CONFLICT DO NOTHING;

INSERT INTO password_policies (
    min_length,
    max_length,
    requires_uppercase,
    requires_numbers,
    requires_symbols,
    expiration_days
)
SELECT 10, 128, true, true, true, 90
WHERE NOT EXISTS (SELECT 1 FROM password_policies);

INSERT INTO security_settings (setting_name, setting_value, description) VALUES
('SESSION_TIMEOUT_MINUTES', '30', 'Maximum session inactivity time in minutes'),
('MAX_LOGIN_ATTEMPTS', '5', 'Maximum number of failed login attempts'),
('LOCKOUT_TIME_MINUTES', '15', 'Lockout time after failed attempts are exceeded'),
('GPS_FREQUENCY_SECONDS', '30', 'GPS update frequency in seconds'),
('INACTIVITY_ALERT_TIME_MINUTES', '10', 'Inactivity time before alert in minutes')
ON CONFLICT (setting_name) DO UPDATE SET
    setting_value = EXCLUDED.setting_value,
    description = EXCLUDED.description,
    updated_at = NOW();
