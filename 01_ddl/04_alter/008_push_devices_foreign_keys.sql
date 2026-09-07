-- =============================================
-- DOMAIN: EXPO PUSH DEVICES
-- =============================================

ALTER TABLE user_devices
ADD CONSTRAINT fk_user_devices_user
FOREIGN KEY (user_id)
REFERENCES users(id)
ON DELETE CASCADE;

ALTER TABLE student_devices
ADD CONSTRAINT fk_student_devices_student
FOREIGN KEY (student_id)
REFERENCES students(id)
ON DELETE CASCADE;
