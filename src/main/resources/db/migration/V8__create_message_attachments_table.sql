CREATE TABLE message_attachments
(
    id            BIGSERIAL PRIMARY KEY,
    message_id    BIGINT       NOT NULL REFERENCES messages (id) ON DELETE CASCADE,
    file_name     VARCHAR(255) NOT NULL,
    file_type     VARCHAR(50),                  -- image, video, pdf, etc.
    file_size     BIGINT,                       -- bytes
    file_url      TEXT         NOT NULL,        -- storage location
    thumbnail_url TEXT,                         -- optional
    metadata      JSONB,                        -- optional extra info
    status        VARCHAR(20) DEFAULT 'active', -- active, deleted, updated, processing
    created_at    TIMESTAMP   DEFAULT NOW(),
    updated_at    TIMESTAMP   DEFAULT NOW()
);
