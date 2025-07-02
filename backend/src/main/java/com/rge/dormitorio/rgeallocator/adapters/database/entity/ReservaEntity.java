package com.rge.dormitorio.rgeallocator.adapters.database.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity(name = "reservas")
public class ReservaEntity {

    @Id
    private String idReserva;

    private String dataHoraReserva;

    private String dataCheckin;

    private String dataCheckout;

    @OneToOne
    @JoinColumn(name = "leito_id")
    private LeitoEntity leito;

    @OneToOne
    @JoinColumn(name = "hospede_id")
    private HospedeEntity hospede;

}
