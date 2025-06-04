import { Component } from '@angular/core';
import { CabecalhoComponent } from '../cabecalho/cabecalho.component';
import { LeitosService } from '../services/leitos.service';
import { Leito } from '../models/leito.model';

@Component({
  selector: 'app-leitos-landingpage',
  imports: [CabecalhoComponent],
  templateUrl: './leitos-landingpage.component.html',
  styleUrl: './leitos-landingpage.component.css'
})
export class LeitosLandingpageComponent {

  leitos: Leito[] = []
  // hospedesAlocados: 

  constructor(private leitoService: LeitosService) {}

  ngOnInit() {
    this.carregarLeitos();
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
}
