-- =============================================
-- FUNCIONES DE SOPORTE
-- =============================================

-- Mantiene updated_at en tablas que tienen ese campo.
CREATE OR REPLACE FUNCTION fn_set_updated_at()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    NEW.updated_at := NOW();
    RETURN NEW;
END;
$$;

-- Calcula distancia aproximada entre dos coordenadas usando Haversine.
CREATE OR REPLACE FUNCTION fn_distance_meters(
    p_latitud_origen DOUBLE PRECISION,
    p_longitud_origen DOUBLE PRECISION,
    p_latitud_destino DOUBLE PRECISION,
    p_longitud_destino DOUBLE PRECISION
)
RETURNS DOUBLE PRECISION
LANGUAGE sql
IMMUTABLE
AS $$
    SELECT CASE
        WHEN p_latitud_origen IS NULL
          OR p_longitud_origen IS NULL
          OR p_latitud_destino IS NULL
          OR p_longitud_destino IS NULL
        THEN NULL
        ELSE 2 * 6371000 * ASIN(SQRT(
            POWER(SIN(RADIANS(p_latitud_destino - p_latitud_origen) / 2), 2)
            + COS(RADIANS(p_latitud_origen))
            * COS(RADIANS(p_latitud_destino))
            * POWER(SIN(RADIANS(p_longitud_destino - p_longitud_origen) / 2), 2)
        ))
    END;
$$;
