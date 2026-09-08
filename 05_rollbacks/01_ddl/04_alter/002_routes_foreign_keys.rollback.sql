ALTER TABLE stops DROP CONSTRAINT IF EXISTS fk_stops_route;
ALTER TABLE student_routes DROP CONSTRAINT IF EXISTS fk_student_routes_route;
ALTER TABLE student_routes DROP CONSTRAINT IF EXISTS fk_student_routes_student;
ALTER TABLE routes DROP CONSTRAINT IF EXISTS fk_routes_updated_by;
ALTER TABLE routes DROP CONSTRAINT IF EXISTS fk_routes_created_by;
