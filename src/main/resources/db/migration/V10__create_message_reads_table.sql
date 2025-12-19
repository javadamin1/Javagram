CREATE TABLE message_reads
(
    id         BIGSERIAL PRIMARY KEY,
    message_id BIGINT NOT NULL,
    user_id    BIGINT NOT NULL,
    read_at    TIMESTAMP DEFAULT NOW(), -- when the user read the message like created_at


    CONSTRAINT fk_message_reads_message
        FOREIGN KEY (message_id) REFERENCES messages (id)
            ON DELETE CASCADE,

    CONSTRAINT fk_message_reads_user
        FOREIGN KEY (user_id) REFERENCES users (id)
            ON DELETE NO ACTION,

    CONSTRAINT uq_message_user_read
        UNIQUE (message_id, user_id)    -- one read record per user per message
);
