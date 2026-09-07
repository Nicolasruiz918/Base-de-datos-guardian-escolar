-- =============================================
-- DOMAIN: GEOLOCATION AND SAFE ZONES
-- =============================================

ALTER TABLE safe_zones
ADD CONSTRAINT fk_safe_zones_student
FOREIGN KEY (student_id)
REFERENCES students(id)
ON DELETE CASCADE;

ALTER TABLE safe_zones
ADD CONSTRAINT fk_safe_zones_created_by
FOREIGN KEY (created_by)
REFERENCES users(id);

ALTER TABLE safe_zones
ADD CONSTRAINT fk_safe_zones_updated_by
FOREIGN KEY (updated_by)
REFERENCES users(id);
