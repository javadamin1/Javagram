package com.javagram.user.api;

public class CreateUserRequest {

    private Long externalUserId;

    private String username;
    private String provider;

    public Long getExternalUserId() {
        return externalUserId;
    }


    public String getUsername() {
        return username;
    }

    public String getProvider() {
        return provider;
    }

    @Override
    public String toString() {
        return "CreateUserRequest{" + "externalUserId=" + externalUserId + ", username='" + username + '\'' + ", provider='" + provider + '\'' + '}';
    }
}
