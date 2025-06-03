package com.rge.dormitorio.rgeallocator.usecases;

import com.rge.dormitorio.rgeallocator.adapters.controller.input.CadastrarHospedeRequestBody;
import com.rge.dormitorio.rgeallocator.adapters.database.entity.HospedeEntity;
import com.rge.dormitorio.rgeallocator.adapters.database.repository.HospedesRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.UUID;

@Component
@RequiredArgsConstructor
public class CadastrarHospede {

    private final HospedesRepository hospedesRepository;

    public void execute(CadastrarHospedeRequestBody input) {
        try {
            HospedeEntity hospedeEntity = new HospedeEntity();
            hospedeEntity.setHospedeId(UUID.randomUUID().toString());
            hospedeEntity.setNome(input.getNome());
            hospedeEntity.setEmail(input.getEmail());
            hospedeEntity.setTelefone(input.getTelefone());
            hospedeEntity.setDataNascimento(input.getDataNascimento());
            hospedeEntity.setCargoMinisterio(input.getCargoMinisterio());
            hospedeEntity.setDataOrdenacao(input.getDataOrdenacao());
            hospedeEntity.setPresideRegional(Boolean.valueOf(input.getPresideRegional()));
            hospedeEntity.setCidade(input.getCidade());
            hospedeEntity.setUf(input.getUf());
            hospedeEntity.setComumCongregacao(input.getComumCongregacao());
            hospedeEntity.setSexo(input.getSexo());
            hospedesRepository.save(hospedeEntity);
        } catch (Exception e) {
            throw e;
        }
    }
}
