package com.rge.dormitorio.rgeallocator.adapters.controller;

import com.rge.dormitorio.rgeallocator.adapters.controller.input.CadastrarHospedeRequestBody;
import com.rge.dormitorio.rgeallocator.usecases.CadastrarHospede;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/hospedes")
@RequiredArgsConstructor
public class HospedesController {

    private final CadastrarHospede cadastrarHospede;

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
}
