package com.rge.dormitorio.rgeallocator.adapters.database.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.util.List;

@Data
@Entity(name = "dormitorios")
public class DormitoriosEntity {

    @Id
    @Column(name = "dormitorio_id")
    private String idDormitorio;

    @Column(name = "nome")
    private String nome;

    @Column(name = "localizacao")
    private String localizacao;

    @Column(name = "descricao")
    private String descricao;

    @Column(name = "capacidade")
    private Integer capacidade;

    @OneToMany(mappedBy = "dormitorio", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<LeitoEntity> leitos;
}
