package com.rge.dormitorio.rgeallocator.usecases;

import com.rge.dormitorio.rgeallocator.adapters.controller.input.AlocarLeitoRequestBody;
import com.rge.dormitorio.rgeallocator.adapters.database.entity.LeitosEntity;
import com.rge.dormitorio.rgeallocator.adapters.database.entity.ReservasEntity;
import com.rge.dormitorio.rgeallocator.adapters.database.repository.LeitosRepository;
import com.rge.dormitorio.rgeallocator.adapters.database.repository.ReservasRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.Optional;

@Component
@RequiredArgsConstructor
public class AlocarLeito {

    private final ReservasRepository reservasRepository;
    private final LeitosRepository leitosRepository;

    public void execute(AlocarLeitoRequestBody input, String codigoReserva) {
        Optional<ReservasEntity> reservaOpt = reservasRepository.findById(codigoReserva);
        Optional<LeitosEntity> leitoOpt = leitosRepository.findById(input.getCodigoLeito());

        if (reservaOpt.isEmpty() || leitoOpt.isEmpty()) return;

        ReservasEntity reservasEntity = reservaOpt.get();
        LeitosEntity leitosEntity = leitoOpt.get();

        leitosEntity.setOcupado(true);
        reservasEntity.setLeito(leitosEntity);

        leitosRepository.save(leitosEntity);
        reservasRepository.save(reservasEntity);
    }

}
