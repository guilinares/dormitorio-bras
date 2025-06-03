package com.rge.dormitorio.rgeallocator.usecases;

import com.rge.dormitorio.rgeallocator.adapters.controller.output.ConsultaTodosHospedesData;
import com.rge.dormitorio.rgeallocator.adapters.database.entity.HospedeEntity;
import com.rge.dormitorio.rgeallocator.adapters.database.repository.HospedesRepository;
import com.rge.dormitorio.rgeallocator.domain.Hospede;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
@RequiredArgsConstructor
public class ConsultarTodosHospedes {

    private final HospedesRepository hospedesRepository;

    public ConsultaTodosHospedesData execute() {
        try {
            List<HospedeEntity> hospedeEntityList = hospedesRepository.findAll();
            if (hospedeEntityList.isEmpty()) return null;
            List<ConsultaTodosHospedesData.ConsultaHospedeSimplificadoResponse> hospedes = new ArrayList<>();
            for (var hospedeEntity : hospedeEntityList) {
                Hospede hospede = new Hospede(hospedeEntity);
                hospedes.add(ConsultaTodosHospedesData.ConsultaHospedeSimplificadoResponse.builder()
                        .hospedeId(hospedeEntity.getHospedeId())
                        .nome(hospede.getNome())
                        .idade(hospede.getIdade())
                        .cidade(hospede.getCidade())
                        .uf(hospede.getUf())
                        .cargoMinisterio(hospede.getCargoMinisterio())
                        .tempoOrdenacao(hospede.getTempoOrdenacao())
                        .build());
            }
            return ConsultaTodosHospedesData.builder()
                    .data(hospedes)
                    .build();
        } catch (Exception e) {
            System.out.println(e);
            throw e;
        }
    }
}
