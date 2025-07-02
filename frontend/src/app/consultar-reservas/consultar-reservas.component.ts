import { Component } from '@angular/core';
import { RouterModule } from '@angular/router';
import { CabecalhoComponent } from '../cabecalho/cabecalho.component';
import { HospedesService } from '../services/hospedes.service';
import { HospedeSimplificado } from '../models/hospede.model';

@Component({
  selector: 'app-consultar-reservas',
  imports: [RouterModule, CabecalhoComponent],
  templateUrl: './consultar-reservas.component.html',
  styleUrl: './consultar-reservas.component.css'
})
export class ConsultarReservasComponent {

  hospedesRaw: HospedeSimplificado[] = [];
  hospedes: HospedeSimplificado[] = [];

  constructor(private hospedesService: HospedesService) {}

  ngOnInit(): void {
    this.carregarReservasAlocadas();
  }

  carregarReservasAlocadas() {
    this.hospedesService.getHospedesAlocado().subscribe(
      data => {
        console.log("Reservas recebidas:", data);
        this.hospedesRaw = data.data
        this.hospedes = this.hospedesRaw.sort((a, b) => a.nome.localeCompare(b.nome));
        console.log(this.hospedesRaw[0]);
      },
      error => {
        console.error("Erro ao buscar reservas:", error);
    });
  }
}
