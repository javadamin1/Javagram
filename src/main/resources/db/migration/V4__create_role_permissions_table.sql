CREATE TABLE role_permissions
(
    role_id       BIGINT NOT NULL,          -- reference to roles
    permission_id BIGINT NOT NULL,          -- reference to permissions

    PRIMARY KEY(role_id, permission_id),    -- composite primary key ensures uniqueness

    CONSTRAINT fk_role
        FOREIGN KEY (role_id) REFERENCES roles(id)
            ON DELETE CASCADE,                  -- if role is deleted, remove mappings

    CONSTRAINT fk_permission
        FOREIGN KEY (permission_id) REFERENCES permissions(id)
            ON DELETE CASCADE                   -- if permission is deleted, remove mappings
);
