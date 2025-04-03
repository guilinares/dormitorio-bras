package com.rge.dormitorio.rgeallocator.adapters.database.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.UUID;

@Data
@Entity(name = "reservas_rge_raw")
public class ReservasEntity {

    @Id
    @Column(name = "id_reserva")
    private String idReserva;

    @Column(name = "horario_reserva")
    private LocalDateTime horaReserva;

    @Column(name = "nome_completo")
    private String nomeIrmao;

    @Column(name = "ministerio")
    private String ministerio;

    @Column(name = "cidade")
    private String cidade;

    @Column(name = "data_nascimento")
    private LocalDate dataNascimento;

    @Column(name = "data_ordenacao")
    private LocalDate dataOrdenacao;

    @Column(name = "enfermidade")
    private String enfermidade;

    @Column(name = "participa_reuniao_ministerio")
    private Boolean participaReuniaoMinisterio;

    @Column(name = "preside_regional")
    private Boolean presideRegional;

    @Column(name = "data_checkin")
    private LocalDate dataCheckin;

    @Column(name = "data_checkout")
    private LocalDate dataCheckout;

    @Column(name = "hospedou_rge_passada")
    private Boolean hospedouRgePassada;

    @Column(name = "celular")
    private String celular;

    @OneToOne
    @JoinColumn(name = "numero_leito")
    private LeitosEntity leito;
}
