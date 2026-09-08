DELETE FROM role_permissions
WHERE role_id IN (SELECT id FROM roles WHERE role_name IN ('ADMIN', 'PARENT'));

DELETE FROM security_settings
WHERE setting_name IN (
    'SESSION_TIMEOUT_MINUTES',
    'MAX_LOGIN_ATTEMPTS',
    'LOCKOUT_TIME_MINUTES',
    'GPS_FREQUENCY_SECONDS',
    'INACTIVITY_ALERT_TIME_MINUTES'
);

DELETE FROM password_policies
WHERE min_length = 10
  AND max_length = 128
  AND expiration_days = 90;

DELETE FROM permissions
WHERE permission_name IN (
    'USER_CREATE',
    'USER_READ',
    'USER_UPDATE',
    'USER_DELETE',
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
    'REPORT_VIEW',
    'AUDIT_VIEW'
);

DELETE FROM roles
WHERE role_name IN ('ADMIN', 'PARENT');
