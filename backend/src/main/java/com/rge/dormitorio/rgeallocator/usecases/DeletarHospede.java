package com.rge.dormitorio.rgeallocator.usecases;

import com.rge.dormitorio.rgeallocator.adapters.database.repository.HospedesRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class DeletarHospede {

    private final HospedesRepository hospedesRepository;

    public void execute(String hospedeId) {
        try {
            hospedesRepository.deleteById(hospedeId);
        } catch (Exception e) {
            throw e;
        }
    }
}
