import { Component } from '@angular/core';
import { CabecalhoComponent } from '../cabecalho/cabecalho.component';
import { LeitosService } from '../services/leitos.service';
import { Leito } from '../models/leito.model';
import { HospedesService } from '../services/hospedes.service';
import { HospedeSimplificado } from '../models/hospede.model';

@Component({
  selector: 'app-leitos-landingpage',
  imports: [CabecalhoComponent],
  templateUrl: './leitos-landingpage.component.html',
  styleUrl: './leitos-landingpage.component.css'
})
export class LeitosLandingpageComponent {

  leitos: Leito[] = []
  hospedesAlocados: HospedeSimplificado[] = [];
  // hospedesAlocados: 

  constructor(private leitoService: LeitosService, private hospedeService: HospedesService) {}

  ngOnInit() {
    this.carregarLeitos();
    this.carregarHospedesAlocados();
  }

  carregarLeitos() {
    this.leitoService.getAllLeitos().subscribe(
      data => {
        this.leitos = data.data;
        this.leitos = this.leitos.sort((a, b) => parseInt(a.codigoLeito) - parseInt(b.codigoLeito));
      },
      error => {
        console.error("Erro ao buscar reservas:", error);
    });
  }

  carregarHospedesAlocados() {
    this.hospedeService.getHospedesAlocado().subscribe(
      data => {
        this.hospedesAlocados = data.data
        this.hospedesAlocados = this.hospedesAlocados.sort((a, b) => parseInt(a.leitoId) - parseInt(b.leitoId))
      },
      error => {
        console.error("Erro ao buscar hospedes alocados:", error);
      }
    ) 
  }
}
