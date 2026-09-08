ALTER TABLE users
ADD CONSTRAINT ck_users_email_format
CHECK (email ~* '^[a-z0-9](?:[a-z0-9._%+-]{0,62}[a-z0-9])?@(?:[a-z0-9](?:[a-z0-9-]{0,61}[a-z0-9])?\.)+(com|co|edu|org|net|gov|mil|info|io|app|dev|es)$');

ALTER TABLE users
ADD CONSTRAINT ck_users_phone_digits
CHECK (phone IS NULL OR regexp_replace(phone, '\D', '', 'g') ~ '^[0-9]{10,15}$');

CREATE UNIQUE INDEX IF NOT EXISTS ux_users_email_lower
ON users(LOWER(email))
WHERE deleted_at IS NULL;
