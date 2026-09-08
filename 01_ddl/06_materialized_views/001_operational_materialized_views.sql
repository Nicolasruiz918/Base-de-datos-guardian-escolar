-- =============================================
-- OPERATIONAL MATERIALIZED VIEWS
-- =============================================

-- Student summary for monitoring screens and reports.
CREATE MATERIALIZED VIEW IF NOT EXISTS mv_student_operations AS
SELECT
    e.id AS student_id,
    e.full_name AS student_name,
    e.school_grade,
    e.is_active AS student_active,
    u.id AS user_id,
    u.full_name AS guardian_name,
    u.email AS guardian_email,
    COUNT(DISTINCT er.route_id) FILTER (WHERE er.is_active IS TRUE) AS active_routes_total,
    COUNT(DISTINCT t.id) AS trips_total,
    COUNT(DISTINCT t.id) FILTER (WHERE t.status = 'IN_PROGRESS') AS active_trips_total,
    COUNT(DISTINCT t.id) FILTER (WHERE t.had_route_deviation IS TRUE) AS deviations_total,
    MAX(c.recorded_at) AS last_coordinate_at
FROM students e
JOIN users u ON u.id = e.user_id
LEFT JOIN student_routes er ON er.student_id = e.id
LEFT JOIN trips t ON t.student_id = e.id AND t.deleted_at IS NULL
LEFT JOIN coordinates c ON c.trip_id = t.id
WHERE e.deleted_at IS NULL
GROUP BY
    e.id,
    e.full_name,
    e.school_grade,
    e.is_active,
    u.id,
    u.full_name,
    u.email
WITH NO DATA;

CREATE UNIQUE INDEX IF NOT EXISTS idx_mv_student_operations_student
    ON mv_student_operations(student_id);

-- Route summary for operational reports.
CREATE MATERIALIZED VIEW IF NOT EXISTS mv_route_operations AS
SELECT
    r.id AS route_id,
    r.route_name,
    r.description,
    COUNT(DISTINCT p.id) AS stops_total,
    COUNT(DISTINCT er.student_id) FILTER (WHERE er.is_active IS TRUE) AS active_students_total,
    COUNT(DISTINCT t.id) AS trips_total,
    COUNT(DISTINCT t.id) FILTER (WHERE t.status = 'IN_PROGRESS') AS active_trips_total,
    COUNT(DISTINCT t.id) FILTER (WHERE t.had_route_deviation IS TRUE) AS deviations_total,
    MAX(t.trip_started_at) AS last_trip_started_at
FROM routes r
LEFT JOIN stops p ON p.route_id = r.id
LEFT JOIN student_routes er ON er.route_id = r.id
LEFT JOIN trips t ON t.route_id = r.id AND t.deleted_at IS NULL
WHERE r.deleted_at IS NULL
GROUP BY
    r.id,
    r.route_name,
    r.description
WITH NO DATA;

CREATE UNIQUE INDEX IF NOT EXISTS idx_mv_route_operations_route
    ON mv_route_operations(route_id);

-- Notification summary by receiving user.
CREATE MATERIALIZED VIEW IF NOT EXISTS mv_user_notification_summary AS
SELECT
    u.id AS user_id,
    u.full_name,
    u.email,
    COUNT(rn.id) AS received_total,
    COUNT(rn.id) FILTER (WHERE rn.was_read IS FALSE) AS unread_total,
    COUNT(n.id) FILTER (WHERE n.was_sent IS TRUE) AS sent_total,
    MAX(n.event_at) AS last_event_at,
    MAX(rn.read_at) AS last_read_at
FROM users u
LEFT JOIN notification_receipts rn ON rn.user_id = u.id
LEFT JOIN notifications n ON n.id = rn.notification_id
WHERE u.deleted_at IS NULL
GROUP BY
    u.id,
    u.full_name,
    u.email
WITH NO DATA;

CREATE UNIQUE INDEX IF NOT EXISTS idx_mv_user_notification_summary_user
    ON mv_user_notification_summary(user_id);
