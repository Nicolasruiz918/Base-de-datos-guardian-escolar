-- =============================================
-- DOMINIO: TRAYECTOS Y TRACKING
-- =============================================

-- TABLA: trips (antes Viaje)
CREATE TABLE trips (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    student_id UUID NOT NULL,
    route_id UUID NOT NULL,
    trip_started_at TIMESTAMPTZ NOT NULL,
    trip_ended_at TIMESTAMPTZ,
    status trip_status_enum DEFAULT 'PENDING',
    had_route_deviation BOOLEAN DEFAULT false,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW(),
    deleted_at TIMESTAMPTZ,
    created_by UUID,
    updated_by UUID
);


-- TABLA: coordinates
CREATE TABLE coordinates (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    trip_id UUID NOT NULL,
    latitude DECIMAL(9,6) NOT NULL,
    longitude DECIMAL(9,6) NOT NULL,
    recorded_at TIMESTAMPTZ NOT NULL,
    speed_kmh DECIMAL(5,1),
    stopped_seconds INTEGER DEFAULT 0 CHECK (stopped_seconds >= 0),
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);
