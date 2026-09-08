-- =============================================
-- 5. ÍNDICES
-- =============================================

-- users
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_active ON users(is_active);
CREATE INDEX idx_users_deleted ON users(deleted_at) WHERE deleted_at IS NULL;

-- students
CREATE INDEX idx_students_user ON students(user_id);
CREATE INDEX idx_students_active ON students(is_active);

-- student_routes
CREATE INDEX idx_student_routes_student ON student_routes(student_id);
CREATE INDEX idx_student_routes_route ON student_routes(route_id);

-- trips
CREATE INDEX idx_trips_student ON trips(student_id);
CREATE INDEX idx_trips_route ON trips(route_id);
CREATE INDEX idx_trips_status ON trips(status);
CREATE INDEX idx_trips_started_at ON trips(trip_started_at);

-- stops
CREATE INDEX idx_stops_route ON stops(route_id);
CREATE INDEX idx_stops_route_order ON stops(route_id, stop_order);

-- safe_zones
CREATE INDEX idx_safe_zones_student ON safe_zones(student_id);

-- coordinates
CREATE INDEX idx_coordinates_trip ON coordinates(trip_id);

-- notifications
CREATE INDEX idx_notifications_trip ON notifications(trip_id);

-- Dispositivos
CREATE INDEX idx_user_devices_user ON user_devices(user_id);
CREATE INDEX idx_user_devices_active ON user_devices(user_id, is_active);
CREATE INDEX idx_student_devices_student ON student_devices(student_id);
CREATE INDEX idx_student_devices_active ON student_devices(student_id, is_active);

-- Seguridad
CREATE INDEX idx_user_roles_user ON user_roles(user_id);
CREATE INDEX idx_user_sessions_user ON user_sessions(user_id);
CREATE INDEX idx_user_sessions_token ON user_sessions(token);
CREATE INDEX idx_user_sessions_device ON user_sessions(user_id, device_identifier);
CREATE INDEX idx_user_sessions_device_confirmation ON user_sessions(device_confirmation_token)
WHERE device_confirmation_token IS NOT NULL;

