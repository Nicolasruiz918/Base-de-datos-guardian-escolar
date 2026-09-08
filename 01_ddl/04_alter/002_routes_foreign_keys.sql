-- =============================================
-- DOMAIN: ROUTES AND STOPS
-- =============================================

ALTER TABLE routes
ADD CONSTRAINT fk_routes_created_by
FOREIGN KEY (created_by)
REFERENCES users(id);

ALTER TABLE routes
ADD CONSTRAINT fk_routes_updated_by
FOREIGN KEY (updated_by)
REFERENCES users(id);

ALTER TABLE student_routes
ADD CONSTRAINT fk_student_routes_student
FOREIGN KEY (student_id)
REFERENCES students(id)
ON DELETE CASCADE;

ALTER TABLE student_routes
ADD CONSTRAINT fk_student_routes_route
FOREIGN KEY (route_id)
REFERENCES routes(id)
ON DELETE CASCADE;

ALTER TABLE stops
ADD CONSTRAINT fk_stops_route
FOREIGN KEY (route_id)
REFERENCES routes(id)
ON DELETE CASCADE;
