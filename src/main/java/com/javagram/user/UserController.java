package com.javagram.user;


import com.javagram.user.api.CreateUserRequest;
import org.springframework.web.bind.annotation.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@RestController
@RequestMapping("/api/users")
public class UserController {
    private static final Logger log = LoggerFactory.getLogger(UserController.class);
    private final UserService service;

    public UserController(UserService service) {
        this.service = service;
    }

    @PostMapping
    public UserEntity create(@RequestBody CreateUserRequest request) {

        log.info("REQUEST RECEIVED: {}", request);
        return null;

    }

}
