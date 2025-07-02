package com.rge.dormitorio.rgeallocator.usecases;

import com.rge.dormitorio.rgeallocator.adapters.controller.output.ConsultaHospedeAlocadoResponse;
import com.rge.dormitorio.rgeallocator.adapters.controller.output.ConsultaHospedeResponse;
import com.rge.dormitorio.rgeallocator.adapters.controller.output.ConsultaHospedesData;
import com.rge.dormitorio.rgeallocator.adapters.database.entity.HospedeEntity;
import com.rge.dormitorio.rgeallocator.adapters.database.repository.HospedesRepository;
import com.rge.dormitorio.rgeallocator.domain.Hospede;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
@RequiredArgsConstructor
public class ConsultarHospedesAlocados {

    private final HospedesRepository hospedesRepository;

    public ConsultaHospedesData execute() {
        try {
            List<HospedeEntity> hospedeEntityList = hospedesRepository.findAll();
            List<HospedeEntity> hospedeEntityComReservaList = hospedeEntityList
                    .stream().filter(hospede -> hospede.getReserva() != null).toList();
            if (hospedeEntityComReservaList.isEmpty()) return null;
            List<ConsultaHospedeResponse> hospedes = new ArrayList<>();
            for (var hospedeEntity : hospedeEntityComReservaList) {
                Hospede hospede = new Hospede(hospedeEntity);
                ConsultaHospedeAlocadoResponse hospedeAlocado = ConsultaHospedeAlocadoResponse.builder()
                        .hospedeId(hospedeEntity.getHospedeId())
                        .nome(hospede.getNome())
                        .idade(hospede.getIdade())
                        .cidade(hospede.getCidade())
                        .uf(hospede.getUf())
                        .cargoMinisterio(hospede.getCargoMinisterio())
                        .tempoOrdenacao(hospede.getTempoOrdenacao())
                        .leitoId(hospedeEntity.getReserva().getLeito().getNumeroLeito())
                        .dormitorio(hospedeEntity.getReserva().getLeito().getDormitorio().getNome())
                        .build();
                hospedes.add(hospedeAlocado);
            }
            return ConsultaHospedesData.builder()
                    .data(hospedes)
                    .build();
        } catch (Exception e) {
            System.out.println(e);
            throw e;
        }
    }
}
