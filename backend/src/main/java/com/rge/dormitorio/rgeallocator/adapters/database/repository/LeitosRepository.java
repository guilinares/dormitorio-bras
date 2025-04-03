package com.rge.dormitorio.rgeallocator.adapters.database.repository;

import com.rge.dormitorio.rgeallocator.adapters.database.entity.LeitosEntity;
import com.rge.dormitorio.rgeallocator.adapters.database.entity.ReservasEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LeitosRepository extends JpaRepository<LeitosEntity, String> {

    @Query("SELECT l FROM leitos l WHERE l.ocupado IS FALSE")
    List<LeitosEntity> findAllDisponiveis();
}
