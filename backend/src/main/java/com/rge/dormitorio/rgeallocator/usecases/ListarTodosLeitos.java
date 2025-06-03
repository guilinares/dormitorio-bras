package com.rge.dormitorio.rgeallocator.usecases;

import com.rge.dormitorio.rgeallocator.adapters.controller.output.LeitosResponseData;
import com.rge.dormitorio.rgeallocator.adapters.controller.output.LeitosResponseData.LeitoResponse;
import com.rge.dormitorio.rgeallocator.adapters.database.entity.LeitosEntity;
import com.rge.dormitorio.rgeallocator.adapters.database.repository.LeitosRepository;
import com.rge.dormitorio.rgeallocator.domain.Leito;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
@RequiredArgsConstructor
public class ListarTodosLeitos {

    private final LeitosRepository leitosRepository;

    public LeitosResponseData execute() {
        List<LeitoResponse> leitosResponse = new ArrayList<>();
        List<LeitosEntity> leitosEntities = leitosRepository.findAll();
        if (leitosEntities.isEmpty()) return null;
        for (var leitoEntity : leitosEntities) {
            Leito leito = new Leito(leitoEntity);
            leitosResponse.add(LeitoResponse.builder()
                    .codigoLeito(leito.getCodigoLeito())
                    .dormitorio(leito.getDormitorio())
                    .ocupado(leito.isOcupado())
                    .build());
        }
        return new LeitosResponseData(leitosResponse);
    }
}
