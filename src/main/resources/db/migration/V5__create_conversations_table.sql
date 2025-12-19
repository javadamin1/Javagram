CREATE TABLE conversations
(
    id         BIGSERIAL PRIMARY KEY,
    creator_id BIGINT      NOT NULL,         -- owner
    title      VARCHAR(255),                 --  chanel | group
    type       VARCHAR(20) NOT NULL,         -- personal | group | channel
    status     VARCHAR(50) DEFAULT 'active', -- optional: active, archived, inactive
    member_count BIGINT DEFAULT 0,
    created_at TIMESTAMP   DEFAULT NOW(),
    updated_at TIMESTAMP   DEFAULT NOW(),
    CONSTRAINT fk_creator
        FOREIGN KEY (creator_id) REFERENCES users (id)
            ON DELETE NO ACTION -- If the user is deleted, do nothing
);

