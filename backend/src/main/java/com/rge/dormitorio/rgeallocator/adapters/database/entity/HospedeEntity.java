package com.rge.dormitorio.rgeallocator.adapters.database.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.Data;

@Data
@Entity(name = "hospedes")
public class HospedeEntity {

    @Id
    @Column(name = "hospede_id")
    private String hospedeId;

    @Column(name = "nome")
    private String nome;

    @Column(name = "cpf")
    private String cpf;

    @Column(name = "email")
    private String email;

    @Column(name = "telefone")
    private String telefone;

    @Column(name = "data_nascimento")
    private String dataNascimento;

    @Column(name = "cargo_ministerio")
    private String cargoMinisterio;

    @Column(name = "comum_congregacao")
    private String comumCongregacao;
}
