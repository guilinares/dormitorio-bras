package com.rge.dormitorio.rgeallocator.domain;

import com.rge.dormitorio.rgeallocator.adapters.database.entity.LeitosEntity;
import lombok.Builder;
import lombok.Data;

@Data
public class Leito {
    private String codigoLeito;
    private String dormitorio;
    private boolean ocupado;

    public Leito(LeitosEntity leitosEntity) {
        this.codigoLeito = leitosEntity.getNumeroLeito();
        this.dormitorio = leitosEntity.getDormitorio().getNome();
        this.ocupado = leitosEntity.isOcupado();
    }
}
