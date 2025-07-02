package com.rge.dormitorio.rgeallocator.adapters.controller;

import com.rge.dormitorio.rgeallocator.adapters.controller.input.CriarReservaRequestBody;
import com.rge.dormitorio.rgeallocator.usecases.CriarReserva;
import com.rge.dormitorio.rgeallocator.usecases.CriarReserva.CriarRerservaInput;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;

@RestController
@RequestMapping("/reservas")
@RequiredArgsConstructor
public class ReservasController {

    private final CriarReserva criarReserva;

    @PostMapping
    @CrossOrigin("*")
    private ResponseEntity criarReserva(@RequestBody CriarReservaRequestBody requestBody) {
        try {
            criarReserva.execute(CriarRerservaInput.builder()
                            .leitoId(requestBody.getLeitoId())
                            .hospedeId(requestBody.getHospedeId())
                            .dataCheckin(requestBody.getDataCheckin())
                            .dataCheckout(requestBody.getDataCheckout())
                            .dataHoraReserva(LocalDateTime.now().toString())
                    .build());
            return ResponseEntity.created(null).body("OK");
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("Erro ao criar reserva");
        }
    }
}
