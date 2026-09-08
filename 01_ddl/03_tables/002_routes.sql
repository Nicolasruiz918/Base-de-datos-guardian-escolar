-- =============================================
-- DOMINIO: RUTAS Y PARADAS
-- =============================================

-- TABLA: routes
CREATE TABLE routes (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    route_name VARCHAR(100) NOT NULL,
    description TEXT,
    origin_latitude DECIMAL(9,6),
    origin_longitude DECIMAL(9,6),
    destination_latitude DECIMAL(9,6),
    destination_longitude DECIMAL(9,6),
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW(),
    deleted_at TIMESTAMPTZ,
    created_by UUID,
    updated_by UUID
);


-- TABLA: student_routes
CREATE TABLE student_routes (
    student_id UUID NOT NULL,
    route_id UUID NOT NULL,
    is_active BOOLEAN DEFAULT true,
    assigned_at TIMESTAMPTZ DEFAULT NOW(),
    PRIMARY KEY (student_id, route_id)
);


-- TABLA: stops
CREATE TABLE stops (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    route_id UUID NOT NULL,
    stop_order INTEGER NOT NULL,
    stop_name VARCHAR(100),
    latitude DECIMAL(9,6) NOT NULL,
    longitude DECIMAL(9,6) NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);
