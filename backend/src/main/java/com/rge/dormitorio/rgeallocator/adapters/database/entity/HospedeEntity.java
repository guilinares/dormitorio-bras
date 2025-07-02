package com.rge.dormitorio.rgeallocator.adapters.database.entity;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity(name = "hospedes")
public class HospedeEntity {

    @Id
    @Column(name = "hospede_id")
    private String hospedeId;

    @Column(name = "nome")
    private String nome;

    @Column(name = "email")
    private String email;

    @Column(name = "telefone")
    private String telefone;

    @Column(name = "data_nascimento")
    private String dataNascimento;

    @Column(name = "cargo_ministerio")
    private String cargoMinisterio;

    @Column(name = "data_ordenacao")
    private String dataOrdenacao;

    @Column(name = "preside_regional")
    private Boolean presideRegional;

    @Column(name = "cidade")
    private String cidade;

    @Column(name = "uf")
    private String uf;

    @Column(name = "comum_congregacao")
    private String comumCongregacao;

    @Column(name = "sexo")
    private String sexo;

    @OneToOne(mappedBy = "hospede")
    private ReservaEntity reserva;
}
