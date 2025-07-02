package com.rge.dormitorio.rgeallocator.usecases;

import com.rge.dormitorio.rgeallocator.adapters.controller.input.AlocarLeitoRequestBody;
import com.rge.dormitorio.rgeallocator.adapters.database.entity.LeitoEntity;
import com.rge.dormitorio.rgeallocator.adapters.database.entity.ReservaEntity;
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
        Optional<ReservaEntity> reservaOpt = reservasRepository.findById(codigoReserva);
        Optional<LeitoEntity> leitoOpt = leitosRepository.findById(input.getCodigoLeito());

        if (reservaOpt.isEmpty() || leitoOpt.isEmpty()) return;

        ReservaEntity reservaEntity = reservaOpt.get();
        LeitoEntity leitoEntity = leitoOpt.get();

        leitoEntity.setOcupado(true);
        reservaEntity.setLeito(leitoEntity);

        leitosRepository.save(leitoEntity);
        reservasRepository.save(reservaEntity);
    }

}
