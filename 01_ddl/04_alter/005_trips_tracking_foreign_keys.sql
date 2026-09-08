-- =============================================
-- DOMAIN: TRIPS AND TRACKING
-- =============================================

ALTER TABLE trips
ADD CONSTRAINT fk_trips_student
FOREIGN KEY (student_id)
REFERENCES students(id)
ON DELETE CASCADE;

ALTER TABLE trips
ADD CONSTRAINT fk_trips_route
FOREIGN KEY (route_id)
REFERENCES routes(id)
ON DELETE RESTRICT;

ALTER TABLE trips
ADD CONSTRAINT fk_trips_created_by
FOREIGN KEY (created_by)
REFERENCES users(id);

ALTER TABLE trips
ADD CONSTRAINT fk_trips_updated_by
FOREIGN KEY (updated_by)
REFERENCES users(id);

ALTER TABLE coordinates
ADD CONSTRAINT fk_coordinates_trip
FOREIGN KEY (trip_id)
REFERENCES trips(id)
ON DELETE CASCADE;
