DROP INDEX IF EXISTS ux_users_email_lower;

ALTER TABLE users
DROP CONSTRAINT IF EXISTS ck_users_phone_digits;

ALTER TABLE users
DROP CONSTRAINT IF EXISTS ck_users_email_format;
