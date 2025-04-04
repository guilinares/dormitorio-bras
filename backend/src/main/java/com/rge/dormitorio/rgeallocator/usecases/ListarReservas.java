package com.rge.dormitorio.rgeallocator.usecases;

import com.rge.dormitorio.rgeallocator.adapters.controller.output.ReservasResponseData;
import com.rge.dormitorio.rgeallocator.adapters.controller.output.ReservasResponseData.LeitoResponse;
import com.rge.dormitorio.rgeallocator.adapters.controller.output.ReservasResponseData.ReservaResponse;
import com.rge.dormitorio.rgeallocator.adapters.database.repository.ReservasRepository;
import com.rge.dormitorio.rgeallocator.domain.IrmaoMinisterio;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
@RequiredArgsConstructor
public class ListarReservas {

    private final ReservasRepository reservasRepository;

    public ReservasResponseData execute() {
        List<ReservaResponse> reservaResponseList = new ArrayList<>();
        var reservasEntity = reservasRepository.findAll();
        for (var reserva : reservasEntity) {
            IrmaoMinisterio irmaoMinisterio = new IrmaoMinisterio(reserva);
            ReservaResponse reservaResponse = ReservaResponse.builder()
                    .codigoReserva(reserva.getIdReserva().toString())
                    .nomeIrmao(irmaoMinisterio.getNome())
                    .ministerio(irmaoMinisterio.getMinisterio())
                    .idade(irmaoMinisterio.getIdade().toString())
                    .enfermidade(irmaoMinisterio.isEnfermo())
                    .tempoDeMinisterio(irmaoMinisterio.getTempoDeMinisterio().toString())
                    .alocado(reserva.getLeito() != null)
                    .leito(reserva.getLeito() != null ? LeitoResponse.builder()
                            .numeroLeito(reserva.getLeito().getNumeroLeito())
                            .dormitorio(reserva.getLeito().getDormitorio().getNome())
                            .build() : null)
                    .build();
            reservaResponseList.add(reservaResponse);
        }

        return new ReservasResponseData(reservaResponseList);
    }

    
}
