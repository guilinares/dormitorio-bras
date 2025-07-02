package com.rge.dormitorio.rgeallocator.adapters.controller.output;

import lombok.Data;
import lombok.experimental.SuperBuilder;

@Data
@SuperBuilder
public class ConsultaHospedeAlocadoResponse extends ConsultaHospedeResponse {
    private String leitoId;
    private String dormitorio;
}
