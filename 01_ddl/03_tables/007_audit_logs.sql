-- =============================================
-- DOMINIO: AUDITORIA Y LOGS
-- =============================================

-- TABLA: activity_logs
CREATE TABLE activity_logs (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID,
    action_type VARCHAR(50) NOT NULL,
    description TEXT,
    source_ip INET,
    metadata JSONB,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- TABLA: audit_logs
CREATE TABLE audit_logs (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID,
    action VARCHAR(255) NOT NULL,
    description TEXT,
    source_ip INET,
    application VARCHAR(100) DEFAULT 'GPS_Guardian',
    metadata JSONB,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- TABLA: error_logs
CREATE TABLE error_logs (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID,
    error_type VARCHAR(100) NOT NULL,
    description TEXT,
    stack_trace TEXT,
    source_ip INET,
    metadata JSONB,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
