-- =============================================
-- DOMINIO: GEOLOCALIZACION Y ZONAS SEGURAS
-- =============================================

-- TABLA: safe_zones
CREATE TABLE safe_zones (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    student_id UUID NOT NULL,
    zone_name VARCHAR(100) NOT NULL,
    latitude DECIMAL(9,6) NOT NULL,
    longitude DECIMAL(9,6) NOT NULL,
    radius_meters INTEGER NOT NULL CHECK (radius_meters > 0),
    inactivity_alert_seconds INTEGER NOT NULL DEFAULT 300 CHECK (inactivity_alert_seconds > 0),
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW(),
    deleted_at TIMESTAMPTZ,
    created_by UUID,
    updated_by UUID
);
