CREATE TABLE messages
(
    id              BIGSERIAL PRIMARY KEY,
    conversation_id BIGINT NOT NULL REFERENCES conversations (id) ON DELETE CASCADE,
    sender_id       BIGINT NOT NULL REFERENCES users (id) ON DELETE NO ACTION,
    recipient_id    BIGINT NULL REFERENCES users(id), -- if set, private message
    content         TEXT   NOT NULL,                  -- text
    status          VARCHAR(20) DEFAULT 'active',     -- edited, system, deleted
    reply_to_id     BIGINT NULL REFERENCES messages(id) ON DELETE SET NULL,
    metadata        JSONB,                            -- optional: reactions, edit history, etc.
    created_at      TIMESTAMP   DEFAULT NOW(),
    updated_at      TIMESTAMP   DEFAULT NOW()
);
