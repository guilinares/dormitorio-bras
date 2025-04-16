package com.rge.dormitorio.rgeallocator.adapters.database.repository;

import com.rge.dormitorio.rgeallocator.adapters.database.entity.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<UserEntity, String> {
    Optional<UserEntity> findByFirebaseUid(String firebaseUid);
}
