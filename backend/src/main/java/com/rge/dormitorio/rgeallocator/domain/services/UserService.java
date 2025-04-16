package com.rge.dormitorio.rgeallocator.domain.services;

import com.rge.dormitorio.rgeallocator.adapters.database.entity.Role;
import com.rge.dormitorio.rgeallocator.adapters.database.entity.UserEntity;
import com.rge.dormitorio.rgeallocator.adapters.database.repository.UserRepository;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class UserService {

    private final UserRepository repository;

    public UserService(UserRepository repository) {
        this.repository = repository;
    }

    public UserEntity saveIfNotExists(String uid, String email) {
        return repository.findByFirebaseUid(uid).orElseGet(() -> {
            UserEntity newUser = new UserEntity();
            newUser.setFirebaseUid(uid);
            newUser.setEmail(email);
            newUser.setRole(Role.USER); // padrão
            return repository.save(newUser);
        });
    }

    public Optional<UserEntity> findByFirebaseUid(String uid) {
        return repository.findByFirebaseUid(uid);
    }
}
