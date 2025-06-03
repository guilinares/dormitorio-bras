package com.rge.dormitorio.rgeallocator.domain;

import com.rge.dormitorio.rgeallocator.adapters.database.entity.HospedeEntity;
import lombok.AllArgsConstructor;
import lombok.Data;

import java.time.LocalDate;
import java.time.Period;

@Data
@AllArgsConstructor
public class Hospede {
    private String nome;
    private String email;
    private String cargoMinisterio;
    private String dataOrdenacao;
    private Boolean presideRegional;
    private String tempoOrdenacao;
    private String telefone;
    private String dataNascimento;
    private String idade;
    private String sexo;
    private String cidade;
    private String uf;
    private String comumCongregacao;


    public Hospede(HospedeEntity hospedeEntity) {
        this.nome = hospedeEntity.getNome();
        this.email = hospedeEntity.getEmail();
        this.cargoMinisterio = hospedeEntity.getCargoMinisterio();
        this.dataOrdenacao = hospedeEntity.getDataOrdenacao();
        this.presideRegional = hospedeEntity.getPresideRegional();
        this.telefone = hospedeEntity.getTelefone();
        this.dataNascimento = hospedeEntity.getDataNascimento();
        this.idade = this.calculaIdade(hospedeEntity.getDataNascimento());
        this.tempoOrdenacao = this.calculaIdade(hospedeEntity.getDataOrdenacao());
        this.comumCongregacao = hospedeEntity.getComumCongregacao();
        this.cidade = hospedeEntity.getCidade();
        this.uf = hospedeEntity.getUf();
        this.sexo = hospedeEntity.getSexo();
    }

    private String calculaIdade(String dataNascimentoStr) {
        if (dataNascimentoStr == null) return null;
        LocalDate dataNascimento = LocalDate.parse(dataNascimentoStr);
        LocalDate hoje = LocalDate.now();
        Period idade = Period.between(dataNascimento, hoje);
        return String.valueOf(idade.getYears());
    }
}
