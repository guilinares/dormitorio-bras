package com.rge.dormitorio.rgeallocator.adapters.controller.output;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import lombok.*;

import java.util.List;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@JsonNaming(PropertyNamingStrategies.SnakeCaseStrategy.class)
public class ReservasResponseData {

    private List<ReservaResponse> data;

    @Data
    @Builder
    @NoArgsConstructor
    @AllArgsConstructor
    public static class ReservaResponse {
        private String codigoReserva;
        private String nomeIrmao;
        private String ministerio;
        private String idade;
        private String tempoDeMinisterio;
        private boolean enfermidade;
    }
}
