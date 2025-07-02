package com.rge.dormitorio.rgeallocator.adapters.controller;

import com.rge.dormitorio.rgeallocator.adapters.controller.input.CadastrarHospedeRequestBody;
import com.rge.dormitorio.rgeallocator.adapters.controller.output.ConsultaHospedesData;
import com.rge.dormitorio.rgeallocator.domain.enums.EstadoHospedeEnum;
import com.rge.dormitorio.rgeallocator.usecases.*;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import static com.rge.dormitorio.rgeallocator.domain.enums.EstadoHospedeEnum.ALOCADO;
import static com.rge.dormitorio.rgeallocator.domain.enums.EstadoHospedeEnum.DESALOCADO;

@RestController
@RequestMapping("/hospedes")
@RequiredArgsConstructor
public class HospedesController {

    private final CadastrarHospede cadastrarHospede;
    private final ConsultarTodosHospedes consultarTodosHospedes;
    private final ConsultarHospedesDesalocados consultarHospedesDesalocados;
    private final ConsultarHospedesAlocados consultarHospedesAlocados;
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
    private ResponseEntity<Object> consultarHospedes(
            @RequestParam(required = false, name = "estado") EstadoHospedeEnum estado
    ) {
        try {
            ConsultaHospedesData response;
            if (DESALOCADO.equals(estado)) {
                response = consultarHospedesDesalocados.execute();
            } else if (ALOCADO.equals(estado)) {
                response = consultarHospedesAlocados.execute();
            } else {
                response = consultarTodosHospedes.execute();
            }
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
