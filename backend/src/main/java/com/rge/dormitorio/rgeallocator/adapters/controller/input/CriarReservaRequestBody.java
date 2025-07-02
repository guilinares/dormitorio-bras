package com.rge.dormitorio.rgeallocator.adapters.controller.input;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;

@Data
@Getter
@Builder
@JsonNaming(PropertyNamingStrategies.SnakeCaseStrategy.class)
public class CriarReservaRequestBody {

    private String leitoId;
    private String hospedeId;
    private String dataCheckin;
    private String dataCheckout;
}
