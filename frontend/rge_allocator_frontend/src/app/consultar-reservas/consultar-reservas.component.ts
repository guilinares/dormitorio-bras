import { Component } from '@angular/core';
import { RouterModule } from '@angular/router';
import { CabecalhoComponent } from '../cabecalho/cabecalho.component';
import { ReservaService } from '../services/reserva.service';
import { Reserva } from '../models/reserva.model';

@Component({
  selector: 'app-consultar-reservas',
  imports: [RouterModule, CabecalhoComponent],
  templateUrl: './consultar-reservas.component.html',
  styleUrl: './consultar-reservas.component.css'
})
export class ConsultarReservasComponent {

  reservasRaw: Reserva[] = [];
  reservas: Reserva[] = [];

  constructor(private reservaService: ReservaService) {}

  ngOnInit(): void {
    this.carregarReservasAlocadas();
  }

  carregarReservasAlocadas() {
    this.reservaService.getReservas().subscribe(
      data => {
        console.log("Reservas recebidas:", data);
        this.reservasRaw = data.data
        this.reservasRaw = this.reservasRaw.filter(reserva => reserva.alocado == true);
        this.reservas = this.reservasRaw.sort((a, b) => a.nomeIrmao.localeCompare(b.nomeIrmao));
        console.log(this.reservasRaw[0]);
      },
      error => {
        console.error("Erro ao buscar reservas:", error);
    });
  }
}
