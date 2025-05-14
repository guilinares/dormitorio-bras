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
public class CadastrarHospedeRequestBody {

    private String nome;
    private String dataNascimento;
    private String cpf;
    private String cargoMinisterio;
    private String comumCongregacao;
    private String email;
    private String telefone;
    private String sexo;
}
