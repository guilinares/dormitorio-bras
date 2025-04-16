package com.rge.dormitorio.rgeallocator.adapters.database.entity;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity(name = "users")
public class UserEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String firebaseUid;

    private String email;

    @Enumerated(EnumType.STRING)
    private Role role;
}
