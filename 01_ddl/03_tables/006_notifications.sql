-- =============================================
-- DOMINIO: NOTIFICACIONES Y PREFERENCIAS
-- =============================================

-- TABLA: notification_settings
CREATE TABLE notification_settings (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL,
    delay_alert BOOLEAN DEFAULT true,
    route_change_alert BOOLEAN DEFAULT true,
    arrival_alert BOOLEAN DEFAULT true,
    inactivity_alert BOOLEAN DEFAULT true,
    push_channel BOOLEAN DEFAULT true,
    email_channel BOOLEAN DEFAULT true,
    sms_channel BOOLEAN DEFAULT false,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);


-- TABLA: notifications
CREATE TABLE notifications (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    trip_id UUID,
    safe_zone_id UUID,
    event_type VARCHAR(50) NOT NULL,
    message TEXT NOT NULL,
    event_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    was_sent BOOLEAN DEFAULT false
);


-- TABLA: notification_receipts
CREATE TABLE notification_receipts (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    notification_id UUID NOT NULL,
    user_id UUID NOT NULL,
    was_read BOOLEAN DEFAULT false,
    received_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    read_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);
