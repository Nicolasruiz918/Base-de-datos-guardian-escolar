-- =============================================
-- DOMAIN READ VIEWS
-- =============================================

-- Students with assigned routes.
CREATE OR REPLACE VIEW vw_student_routes AS
SELECT
    e.id AS student_id,
    e.full_name AS student_name,
    e.school_grade,
    u.id AS user_id,
    u.full_name AS guardian_name,
    u.email AS guardian_email,
    r.id AS route_id,
    r.route_name,
    er.is_active AS assignment_active,
    er.assigned_at
FROM students e
JOIN users u ON u.id = e.user_id
LEFT JOIN student_routes er ON er.student_id = e.id
LEFT JOIN routes r ON r.id = er.route_id
WHERE e.deleted_at IS NULL;

-- Trip summary for history and reports.
CREATE OR REPLACE VIEW vw_trip_summary AS
SELECT
    t.id AS trip_id,
    t.student_id,
    e.full_name AS student_name,
    e.user_id,
    u.email AS guardian_email,
    t.route_id,
    r.route_name,
    t.trip_started_at,
    t.trip_ended_at,
    t.status,
    t.had_route_deviation,
    COUNT(c.id)::INTEGER AS coordinates_total,
    MAX(c.recorded_at) AS last_coordinate_at
FROM trips t
JOIN students e ON e.id = t.student_id
JOIN users u ON u.id = e.user_id
JOIN routes r ON r.id = t.route_id
LEFT JOIN coordinates c ON c.trip_id = t.id
WHERE t.deleted_at IS NULL
GROUP BY
    t.id,
    t.student_id,
    e.full_name,
    e.user_id,
    u.email,
    t.route_id,
    r.route_name,
    t.trip_started_at,
    t.trip_ended_at,
    t.status,
    t.had_route_deviation;

-- Notifications by receiving user.
CREATE OR REPLACE VIEW vw_user_notifications AS
SELECT
    rn.id AS receipt_id,
    rn.user_id,
    u.email,
    n.id AS notification_id,
    n.trip_id,
    n.safe_zone_id,
    n.event_type,
    n.message,
    n.event_at,
    n.was_sent,
    rn.was_read,
    rn.received_at,
    rn.read_at
FROM notification_receipts rn
JOIN users u ON u.id = rn.user_id
JOIN notifications n ON n.id = rn.notification_id;
