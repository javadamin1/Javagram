package com.javagram.user;


import jakarta.persistence.*;

@Entity
@Table(name = "users",
    uniqueConstraints = @UniqueConstraint(
            columnNames = {"external_user_id", "provider"}
))
public class UserEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "external_user_id", nullable = false)
    private Long externalUserId;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false, length = 50)
    private Provider provider = Provider.LARAVEL;

    @Column(length = 100)
    private String username;

    @Column(nullable = false)
    private String name;

    protected UserEntity() {}

    public UserEntity(Long externalUserId, String name, Provider provider, String username) {
        this.externalUserId = externalUserId;
        this.name = name;
        this.provider = provider != null ? provider : Provider.LARAVEL;
        this.username = username;
    }



}
