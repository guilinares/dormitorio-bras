package com.rge.dormitorio.rgeallocator.adapters.controller.output;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

@Data
@SuperBuilder
@NoArgsConstructor
@AllArgsConstructor
public class ConsultaHospedeResponse {
    private String hospedeId;
    private String nome;
    private String idade;
    private String cidade;
    private String uf;
    private String cargoMinisterio;
    private String tempoOrdenacao;
}