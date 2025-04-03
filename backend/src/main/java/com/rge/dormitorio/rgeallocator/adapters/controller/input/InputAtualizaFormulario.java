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
public class InputAtualizaFormulario {
    private String dataHoraReserva;
    private String nomeIrmao;
    private String ministerio;
    private String cidade;
    private String dataNascimento;
    private String dataOrdenacao;
    private String possuiEnfermidade;
    private String participaReuniaoMinisterio;
    private String presideRegional;
    private String dataCheckin;
    private String dataCheckout;
    private String hospedouRgePassada;
    private String celular;
}