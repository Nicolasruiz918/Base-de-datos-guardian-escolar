-- =============================================
-- DOMINIO: SEGURIDAD Y ACCESO
-- =============================================

-- TABLA: roles
CREATE TABLE roles (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    role_name role_name_enum UNIQUE NOT NULL,
    description VARCHAR(255),
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);


-- TABLA: permissions
CREATE TABLE permissions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    permission_name VARCHAR(100) UNIQUE NOT NULL,
    description TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);


-- TABLA: user_roles
CREATE TABLE user_roles (
    user_id UUID NOT NULL,
    role_id UUID NOT NULL,
    assigned_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id, role_id)
);


-- TABLA: role_permissions
CREATE TABLE role_permissions (
    role_id UUID NOT NULL,
    permission_id UUID NOT NULL,
    PRIMARY KEY (role_id, permission_id)
);


-- TABLA: user_sessions
CREATE TABLE user_sessions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL,
    token VARCHAR(500) NOT NULL,
    device_identifier VARCHAR(120),
    device_name VARCHAR(120),
    platform VARCHAR(30),
    session_started_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    session_ended_at TIMESTAMPTZ,
    source_ip INET,
    session_status session_status_enum DEFAULT 'ACTIVE',
    email_confirmed BOOLEAN DEFAULT TRUE,
    device_confirmation_token VARCHAR(255) UNIQUE,
    device_confirmation_expires_at TIMESTAMPTZ,
    device_confirmation_return_url VARCHAR(500),
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);


-- TABLA: password_policies
CREATE TABLE password_policies (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    min_length INT DEFAULT 10,
    max_length INT DEFAULT 128,
    requires_uppercase BOOLEAN DEFAULT true,
    requires_numbers BOOLEAN DEFAULT true,
    requires_symbols BOOLEAN DEFAULT true,
    expiration_days INT DEFAULT 90,
    updated_at TIMESTAMPTZ DEFAULT NOW(),
    updated_by UUID
);


-- TABLA: security_settings
CREATE TABLE security_settings (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    setting_name VARCHAR(100) UNIQUE NOT NULL,
    setting_value TEXT,
    description TEXT,
    updated_at TIMESTAMPTZ DEFAULT NOW(),
    updated_by UUID
);
