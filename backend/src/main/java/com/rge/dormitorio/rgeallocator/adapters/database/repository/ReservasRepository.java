package com.rge.dormitorio.rgeallocator.adapters.database.repository;

import com.rge.dormitorio.rgeallocator.adapters.database.entity.ReservaEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ReservasRepository extends JpaRepository<ReservaEntity, String> {
}
