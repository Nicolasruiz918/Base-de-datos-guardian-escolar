-- =============================================
-- 0. ENUMS
-- =============================================

-- Available school grades.
CREATE TYPE school_grade_enum AS ENUM (
    'PRE_KINDER',
    'KINDER',
    'TRANSITION',
    'FIRST',
    'SECOND',
    'THIRD',
    'FOURTH',
    'FIFTH',
    'SIXTH',
    'SEVENTH',
    'EIGHTH',
    'NINTH',
    'TENTH',
    'ELEVENTH'
);

-- Possible trip states.
CREATE TYPE trip_status_enum AS ENUM (
    'PENDING',
    'IN_PROGRESS',
    'COMPLETED',
    'CANCELED'
);

-- User session states.
CREATE TYPE session_status_enum AS ENUM (
    'ACTIVE',
    'EXPIRED',
    'CLOSED'
);

-- System roles.
CREATE TYPE role_name_enum AS ENUM (
    'ADMIN',
    'PARENT'
);


