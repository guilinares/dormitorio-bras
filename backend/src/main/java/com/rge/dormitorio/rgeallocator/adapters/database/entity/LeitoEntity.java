package com.rge.dormitorio.rgeallocator.adapters.database.entity;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity(name = "leitos")
public class LeitoEntity {

    @Id
    @Column(name = "numero_leito")
    private String numeroLeito;

    @Column(name = "ocupado")
    private Boolean ocupado;

    @ManyToOne
    @JoinColumn(name = "dormitorio_id", nullable = false)
    private DormitoriosEntity dormitorio;

    @OneToOne(mappedBy = "leito", cascade = CascadeType.ALL)
    private ReservaEntity reserva;
}
