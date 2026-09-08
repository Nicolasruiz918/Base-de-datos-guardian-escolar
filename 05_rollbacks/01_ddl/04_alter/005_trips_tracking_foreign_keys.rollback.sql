ALTER TABLE coordinates DROP CONSTRAINT IF EXISTS fk_coordinates_trip;
ALTER TABLE trips DROP CONSTRAINT IF EXISTS fk_trips_updated_by;
ALTER TABLE trips DROP CONSTRAINT IF EXISTS fk_trips_created_by;
ALTER TABLE trips DROP CONSTRAINT IF EXISTS fk_trips_route;
ALTER TABLE trips DROP CONSTRAINT IF EXISTS fk_trips_student;
