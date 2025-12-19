CREATE TABLE conversation_members
(
    id              BIGSERIAL PRIMARY KEY,
    conversation_id BIGINT NOT NULL,
    user_id         BIGINT NOT NULL,
    role_id         BIGINT NOT NULL,
    joined_at       TIMESTAMP   DEFAULT NOW(),
    status          VARCHAR(20) DEFAULT 'active',                     -- optional: active, inactive
    created_at TIMESTAMP   DEFAULT NOW(),
    updated_at TIMESTAMP   DEFAULT NOW(),
    CONSTRAINT fk_conversation
        FOREIGN KEY (conversation_id) REFERENCES conversations (id)
            ON DELETE CASCADE,

    CONSTRAINT fk_user
        FOREIGN KEY (user_id) REFERENCES users (id)
            ON DELETE NO ACTION,

    CONSTRAINT uq_conversation_user UNIQUE (conversation_id, user_id) --
);
