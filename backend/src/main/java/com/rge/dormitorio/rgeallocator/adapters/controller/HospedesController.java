package com.rge.dormitorio.rgeallocator.adapters.controller;

import com.rge.dormitorio.rgeallocator.adapters.controller.input.CadastrarHospedeRequestBody;
import com.rge.dormitorio.rgeallocator.usecases.CadastrarHospede;
import com.rge.dormitorio.rgeallocator.usecases.ConsultarTodosHospedes;
import com.rge.dormitorio.rgeallocator.usecases.DeletarHospede;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/hospedes")
@RequiredArgsConstructor
public class HospedesController {

    private final CadastrarHospede cadastrarHospede;
    private final ConsultarTodosHospedes consultarTodosHospedes;
    private final DeletarHospede deletarHospede;

    @CrossOrigin("*")
    @PostMapping
    private ResponseEntity<Object> cadastrarHospede(
            @RequestBody CadastrarHospedeRequestBody requestBody
    ) {
        try {
            cadastrarHospede.execute(requestBody);
            return ResponseEntity.created(null).body("OK");
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("Erro ao cadastrar hóspede");
        }
    }

    @CrossOrigin("*")
    @GetMapping
    private ResponseEntity<Object> consultarTodosHospedes() {
        try {
            var response = consultarTodosHospedes.execute();
            if (response == null) return ResponseEntity.noContent().build();
            return ResponseEntity.ok().body(response);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("Erro ao consultar hóspedes");
        }
    }

    @CrossOrigin("*")
    @DeleteMapping("/{hospedeId}")
    private ResponseEntity<Object> deletaHospede(
            @PathVariable String hospedeId
    ) {
        try {
            deletarHospede.execute(hospedeId);
            return ResponseEntity.ok().build();
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("Erro ao deletar hóspede");
        }
    }
}
