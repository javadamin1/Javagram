CREATE TABLE permissions
(
    id          BIGSERIAL PRIMARY KEY,
    name        VARCHAR(50) NOT NULL UNIQUE, -- permission name: send_message, delete_message, add_member, ...
    description VARCHAR(6000),               -- optional description of the permission
    created_at  TIMESTAMP DEFAULT NOW(),
    updated_at  TIMESTAMP DEFAULT NOW()
);
