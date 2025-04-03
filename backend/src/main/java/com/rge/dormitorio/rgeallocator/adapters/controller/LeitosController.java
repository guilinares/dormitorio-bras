package com.rge.dormitorio.rgeallocator.adapters.controller;

import com.rge.dormitorio.rgeallocator.usecases.ListarLeitosDisponiveis;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/leitos")
@RequiredArgsConstructor
public class LeitosController {

    private final ListarLeitosDisponiveis listarLeitosDisponiveis;

    @CrossOrigin("*")
    @GetMapping("/disponiveis")
    public ResponseEntity<Object> buscaLeitosDisponiveis() {
        var response = listarLeitosDisponiveis.execute();
        if (response == null) return ResponseEntity.noContent().build();
        return ResponseEntity.ok().body(response);
    }

}
