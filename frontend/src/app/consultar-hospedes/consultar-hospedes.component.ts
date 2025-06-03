import { Component } from '@angular/core';
import { RouterModule } from '@angular/router';
import { CabecalhoComponent } from '../cabecalho/cabecalho.component';
import { HospedesService } from '../services/hospedes.service';
import { HospedeSimplificado } from '../models/hospede.model';
import { NgIf } from '@angular/common';

@Component({
  selector: 'app-consultar-hospedes',
  imports: [RouterModule, CabecalhoComponent, NgIf],
  templateUrl: './consultar-hospedes.component.html',
  styleUrl: './consultar-hospedes.component.css'
})
export class ConsultarHospedesComponent {
  hospedes: HospedeSimplificado[] = [];

  // Estado do modal
  modalAberto: boolean = false;
  hospedeSelecionado: HospedeSimplificado | null = null;

  constructor(private hospedesService: HospedesService) {}

  ngOnInit() {
    this.getAllHospedes();
  }

  getAllHospedes() {
    this.hospedesService.getAllHospedes().subscribe(
      data => this.hospedes = data.data,
      error => console.error("Erro ao carregar hóspedes:", error)
    );
  }

  abrirModal(hospede: HospedeSimplificado) {
    this.hospedeSelecionado = hospede;
    this.modalAberto = true;
  }

  fecharModal() {
    this.modalAberto = false;
    this.hospedeSelecionado = null;
  }

  confirmarRemocao() {
    if (!this.hospedeSelecionado) return;

    this.hospedesService.deleteHospede(this.hospedeSelecionado.hospedeId).subscribe(
      () => {
        this.getAllHospedes();
        this.fecharModal();
      },
      error => console.error("Erro ao remover hóspede:", error)
    );
  }
}

