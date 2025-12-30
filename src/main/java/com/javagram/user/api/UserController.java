package com.javagram.user.api;


import com.javagram.user.Provider;
import com.javagram.user.UserEntity;
import com.javagram.user.UserService;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/users")
public class UserController {

    private final UserService service;

    public UserController(UserService service) {
        this.service = service;
    }

    @PostMapping
    public UserResponse create(@RequestBody CreateUserRequest request) {

        UserEntity user = service.createOrGet(
                request.getExternalUserId(),
                Provider.from(request.getProvider()),
                request.getUsername()
        );

        return UserResponse.from(user);

    }

}
