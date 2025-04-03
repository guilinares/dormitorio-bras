package com.rge.dormitorio.rgeallocator.usecases;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import com.rge.dormitorio.rgeallocator.adapters.controller.input.InputAtualizaFormulario;
import com.rge.dormitorio.rgeallocator.adapters.database.entity.ReservasEntity;
import com.rge.dormitorio.rgeallocator.adapters.database.repository.ReservasRepository;
import lombok.Data;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.util.UUID;

@Component
@RequiredArgsConstructor
public class AtualizaRespostaFormulario {

    private final DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
            .withZone(ZoneOffset.UTC);
    private final DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
    private final ReservasRepository reservasRepository;

    public void execute(InputAtualizaFormulario input) {
        ReservasEntity reservasEntity = new ReservasEntity();
        reservasEntity.setIdReserva(UUID.randomUUID().toString());
        reservasEntity.setHoraReserva(LocalDateTime.parse(input.getDataHoraReserva(), dateTimeFormatter));
        reservasEntity.setNomeIrmao(input.getNomeIrmao());
        reservasEntity.setMinisterio(input.getMinisterio());
        reservasEntity.setCidade(input.getCidade());
        reservasEntity.setDataNascimento(LocalDate.parse(input.getDataNascimento(), dateFormatter));
        reservasEntity.setDataOrdenacao(LocalDate.parse(input.getDataOrdenacao(), dateFormatter));
        reservasEntity.setEnfermidade(input.getPossuiEnfermidade());
        reservasEntity.setParticipaReuniaoMinisterio(input.getParticipaReuniaoMinisterio().charAt(0) == 'S' ? true : false);
        reservasEntity.setPresideRegional(input.getPresideRegional().charAt(0) == 'S' ? true : false);
        reservasEntity.setDataCheckin(LocalDateTime.parse(input.getDataCheckin(), dateTimeFormatter).toLocalDate());
        reservasEntity.setDataCheckout(LocalDateTime.parse(input.getDataCheckout(), dateTimeFormatter).toLocalDate());
        reservasEntity.setHospedouRgePassada(input.getHospedouRgePassada().charAt(0) == 'S' ? true : false);
        reservasEntity.setCelular(input.getCelular());
        reservasRepository.save(reservasEntity);
    }
}
