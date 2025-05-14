package com.rge.dormitorio.rgeallocator.adapters.database.repository;

import com.rge.dormitorio.rgeallocator.adapters.database.entity.HospedeEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface HospedesRepository extends JpaRepository<HospedeEntity, String> {

    // Define methods for database operations related to "hospedes" (guests)
    // For example:
    // List<HospedeEntity> findAll();
    // Optional<HospedeEntity> findById(Long id);
    // void save(HospedeEntity hospede);
    // void deleteById(Long id);
}
