package com.rge.dormitorio.rgeallocator.domain;

import com.rge.dormitorio.rgeallocator.adapters.controller.input.CadastrarHospedeRequestBody;
import lombok.AllArgsConstructor;

@AllArgsConstructor
public class Hospede {
    private String nome;
    private String cpf;
    private String email;
    private String telefone;
    private String dataNascimento;
    private String idade;
    private String sexo;
    private String comumCongregacao;

    public Hospede from(CadastrarHospedeRequestBody requestBody) {
        this.nome = requestBody.getNome();
        this.cpf = requestBody.getCpf();
        this.email = requestBody.getEmail();
        this.telefone = requestBody.getTelefone();
        this.dataNascimento = requestBody.getDataNascimento();
        this.sexo = requestBody.getSexo();
        this.comumCongregacao = requestBody.getComumCongregacao();
        return this;
    }
}
