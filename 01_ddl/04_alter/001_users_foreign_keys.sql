-- =============================================
-- DOMAIN: USERS AND STUDENTS
-- =============================================

ALTER TABLE users
ADD CONSTRAINT fk_users_created_by
FOREIGN KEY (created_by)
REFERENCES users(id);

ALTER TABLE users
ADD CONSTRAINT fk_users_updated_by
FOREIGN KEY (updated_by)
REFERENCES users(id);

ALTER TABLE students
ADD CONSTRAINT fk_students_user
FOREIGN KEY (user_id)
REFERENCES users(id)
ON DELETE RESTRICT;

ALTER TABLE students
ADD CONSTRAINT fk_students_created_by
FOREIGN KEY (created_by)
REFERENCES users(id);

ALTER TABLE students
ADD CONSTRAINT fk_students_updated_by
FOREIGN KEY (updated_by)
REFERENCES users(id);

ALTER TABLE student_guardians
ADD CONSTRAINT fk_student_guardians_student
FOREIGN KEY (student_id)
REFERENCES students(id)
ON DELETE CASCADE;

ALTER TABLE student_guardians
ADD CONSTRAINT fk_student_guardians_user
FOREIGN KEY (user_id)
REFERENCES users(id)
ON DELETE CASCADE;

ALTER TABLE emergency_contacts
ADD CONSTRAINT fk_emergency_contacts_student
FOREIGN KEY (student_id)
REFERENCES students(id)
ON DELETE CASCADE;

ALTER TABLE emergency_contacts
ADD CONSTRAINT fk_emergency_contacts_created_by
FOREIGN KEY (created_by)
REFERENCES users(id);

ALTER TABLE emergency_contacts
ADD CONSTRAINT fk_emergency_contacts_updated_by
FOREIGN KEY (updated_by)
REFERENCES users(id);
