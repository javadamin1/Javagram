package com.javagram.user;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserService {
    private final UserRepository repository;

    public UserService(UserRepository repository) {
        this.repository = repository;
    }
    private static final Logger log = LoggerFactory.getLogger(UserService.class);

    @Transactional
    public UserEntity createOrGet(
            Long externalUserId,
            Provider provider,
            String username
    ) {
        System.out.println("SERVICE METHOD ENTERED");
        Provider finalProvider =
                provider != null ? provider : Provider.LARAVEL;
        log.info( "start - provider={}, externalUserId={}, username={}", finalProvider,externalUserId,username);
        return repository
                .findByExternalUserIdAndProvider(externalUserId, finalProvider)
                .orElseGet(() -> {
                    UserEntity user = new UserEntity(
                            externalUserId,
                            finalProvider,
                            username
                    );
                    return repository.save(user);
                });
    }
}
