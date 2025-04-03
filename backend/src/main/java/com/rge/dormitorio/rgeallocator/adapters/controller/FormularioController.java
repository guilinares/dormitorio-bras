package com.rge.dormitorio.rgeallocator.adapters.controller;

import com.rge.dormitorio.rgeallocator.adapters.controller.input.InputAtualizaFormulario;
import com.rge.dormitorio.rgeallocator.usecases.AtualizaRespostaFormulario;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/formulario")
public class FormularioController {

    private final AtualizaRespostaFormulario atualizaRespostaFormulario;

    public FormularioController(AtualizaRespostaFormulario atualizaRespostaFormulario) {
        this.atualizaRespostaFormulario = atualizaRespostaFormulario;
    }

    @PostMapping("/incluir-registro")
    public ResponseEntity<Object> incluiRegistroFormulario(@RequestBody InputAtualizaFormulario input) {
        atualizaRespostaFormulario.execute(input);
        return ResponseEntity.ok().body("OK");
    }

}
