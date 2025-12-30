package com.javagram.user.api;

import com.javagram.user.UserEntity;

public record UserResponse(
        Long id,
        Long externalUserId,
        String provider,
        String username
) {
    public static UserResponse from(UserEntity user) {
        return new UserResponse(
                user.getId(),
                user.getExternalUserId(),
                user.getProvider().name(),
                user.getUsername()
        );
    }
}

