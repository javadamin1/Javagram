CREATE TABLE users
(
    id               BIGSERIAL PRIMARY KEY,
    external_user_id BIGINT      NOT NULL,
    provider         VARCHAR(50) NOT NULL DEFAULT 'laravel',
    username         VARCHAR(100),
    created_at       TIMESTAMP     NOT NULL       DEFAULT NOW(),
    CONSTRAINT users_external_identity_unique
        UNIQUE (external_user_id, provider)
);
