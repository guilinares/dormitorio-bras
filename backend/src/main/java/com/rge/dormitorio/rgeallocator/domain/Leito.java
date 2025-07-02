package com.rge.dormitorio.rgeallocator.domain;

import com.rge.dormitorio.rgeallocator.adapters.database.entity.LeitoEntity;
import lombok.Data;

@Data
public class Leito {
    private String codigoLeito;
    private String dormitorio;
    private boolean ocupado;

    public Leito(LeitoEntity leitoEntity) {
        this.codigoLeito = leitoEntity.getNumeroLeito();
        this.dormitorio = leitoEntity.getDormitorio().getNome();
        this.ocupado = leitoEntity.getOcupado() == null ? false : leitoEntity.getOcupado();
    }
}
