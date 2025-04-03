package com.rge.dormitorio.rgeallocator.adapters.database.entity;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity(name = "leitos")
public class LeitosEntity {

    @Id
    @Column(name = "numero_leito")
    private String numeroLeito;

    @ManyToOne
    @JoinColumn(name = "dormitorio_id", nullable = false)
    private DormitoriosEntity dormitorio;

    @OneToOne(mappedBy = "leito", cascade = CascadeType.ALL)
    private ReservasEntity reserva;

    @Column(name = "ocupado")
    private boolean ocupado;
}
