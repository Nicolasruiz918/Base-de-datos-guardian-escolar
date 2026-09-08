ALTER TABLE safe_zones DROP CONSTRAINT IF EXISTS fk_safe_zones_updated_by;
ALTER TABLE safe_zones DROP CONSTRAINT IF EXISTS fk_safe_zones_created_by;
ALTER TABLE safe_zones DROP CONSTRAINT IF EXISTS fk_safe_zones_student;
