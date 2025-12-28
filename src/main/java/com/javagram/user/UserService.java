package com.javagram.user;

import org.springframework.stereotype.Service;

@Service
public class UserService {
    private final UserRepository repository;

    public UserService(UserRepository repository) {
        this.repository = repository;
    }

    public UserEntity create(Long externalUserId, Provider provider, String username) {
        return repository.save(new UserEntity(externalUserId, provider, username));
    }
}
