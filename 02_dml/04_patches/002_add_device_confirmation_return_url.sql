ALTER TABLE user_sessions
ADD COLUMN IF NOT EXISTS device_confirmation_return_url VARCHAR(500);
