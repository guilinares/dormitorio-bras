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
public class LeitosResponseData {

    private List<LeitoResponse> data;

    @Data
    @Builder
    @NoArgsConstructor
    @AllArgsConstructor
    public static class LeitoResponse {
        private String codigoLeito;
        private String dormitorio;
        private Boolean ocupado;
    }
}
