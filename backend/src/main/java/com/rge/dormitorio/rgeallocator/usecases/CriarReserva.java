package com.rge.dormitorio.rgeallocator.usecases;

import com.rge.dormitorio.rgeallocator.adapters.database.entity.HospedeEntity;
import com.rge.dormitorio.rgeallocator.adapters.database.entity.LeitoEntity;
import com.rge.dormitorio.rgeallocator.adapters.database.entity.ReservaEntity;
import com.rge.dormitorio.rgeallocator.adapters.database.repository.HospedesRepository;
import com.rge.dormitorio.rgeallocator.adapters.database.repository.LeitosRepository;
import com.rge.dormitorio.rgeallocator.adapters.database.repository.ReservasRepository;
import lombok.*;
import org.springframework.stereotype.Component;

import java.util.UUID;

@Component
@RequiredArgsConstructor
public class CriarReserva {

    private final ReservasRepository reservasRepository;
    private final LeitosRepository leitosRepository;
    private final HospedesRepository hospedesRepository;

    public void execute(CriarRerservaInput input) {
        try {
            LeitoEntity leitoEntity = leitosRepository.findById(input.getLeitoId())
                    .orElseThrow(() -> new RuntimeException("Leito não encontrado"));
            HospedeEntity hospedeEntity = hospedesRepository.findById(input.getHospedeId())
                    .orElseThrow(() -> new RuntimeException("Hospede não encontrado"));
            reservasRepository.save(new ReservaEntity(
                    UUID.randomUUID().toString(),
                    input.getDataHoraReserva(),
                    input.getDataCheckin(),
                    input.getDataCheckout(),
                    leitoEntity, hospedeEntity
            ));
            leitoEntity.setOcupado(true);
            leitosRepository.save(leitoEntity);
        } catch (Exception e) {
            throw new RuntimeException("Erro ao criar reserva: " + e.getMessage(), e);
        }
    }

    @Data
    @Builder
    @AllArgsConstructor
    @NoArgsConstructor
    public static class CriarRerservaInput {
        private String hospedeId;
        private String leitoId;
        private String dataHoraReserva;
        private String dataCheckin;
        private String dataCheckout;
    }
}
