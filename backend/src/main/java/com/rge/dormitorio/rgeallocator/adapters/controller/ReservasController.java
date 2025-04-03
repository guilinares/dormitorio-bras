package com.rge.dormitorio.rgeallocator.adapters.controller;

import com.rge.dormitorio.rgeallocator.adapters.controller.input.AlocarLeitoRequestBody;
import com.rge.dormitorio.rgeallocator.adapters.controller.output.ReservasResponseData;
import com.rge.dormitorio.rgeallocator.usecases.AlocarLeito;
import com.rge.dormitorio.rgeallocator.usecases.ListarReservas;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/reservas")
@RequiredArgsConstructor
public class ReservasController {

    private final ListarReservas listaReservas;
    private final AlocarLeito alocarLeito;

    @GetMapping
    @CrossOrigin("*")
    public ResponseEntity<ReservasResponseData> getAllReservas() {
        ReservasResponseData data = listaReservas.execute();
        return ResponseEntity.ok(data);
    }

    @PostMapping("/{codigo_reserva}/alocar-leito")
    @CrossOrigin("*")
    public ResponseEntity<Object> alocarLeito(@RequestBody AlocarLeitoRequestBody requestBody,
                                              @PathVariable("codigo_reserva") String codigoReserva) {
        alocarLeito.execute(requestBody, codigoReserva);
        return ResponseEntity.ok().build();
    }

}
