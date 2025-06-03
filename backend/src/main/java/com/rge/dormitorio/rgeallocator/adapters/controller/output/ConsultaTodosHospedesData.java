package com.rge.dormitorio.rgeallocator.adapters.controller.output;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@JsonNaming(PropertyNamingStrategies.SnakeCaseStrategy.class)
public class ConsultaTodosHospedesData {

    private List<ConsultaHospedeSimplificadoResponse> data;

    @Data
    @Builder
    @NoArgsConstructor
    @AllArgsConstructor
    public static class ConsultaHospedeSimplificadoResponse {
        private String hospedeId;
        private String nome;
        private String idade;
        private String cidade;
        private String uf;
        private String cargoMinisterio;
        private String tempoOrdenacao;
    }
}
