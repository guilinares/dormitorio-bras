import { Component, OnInit, ViewChild } from '@angular/core';
import { ReservaService } from '../services/reserva.service';
import { RouterModule } from '@angular/router'; // Importa RouterModule
import { Reserva } from '../models/reserva.model';
import { AlocarLeitoComponent } from '../alocar-leito/alocar-leito.component';

@Component({
  selector: 'app-reservas',
  imports: [RouterModule, AlocarLeitoComponent],
  templateUrl: './reservas.component.html',
  styleUrl: './reservas.component.css'
})
export class ReservasComponent {
  @ViewChild(AlocarLeitoComponent) modal!: AlocarLeitoComponent;

  reservasRaw: Reserva[] = [];
  reservas: Reserva[] = [];
  filtrosAtivos: string[] = []; // Armazena a ordem dos filtros aplicados
  reservasOriginal: any[] = []; // Guarda a lista original
  isSelected: boolean = false;
  selectedReserva: string = "";
  parametroOrdenacao: string = "letra";
  orderBy: string = "nome";
  isOrdenadoIdade: boolean = false;
  isOrdenadoTempoMinisterio: boolean = false;
  isOrdenadoEnfermidade: boolean = false;
  
  constructor(private reservaService: ReservaService) {}

  ngOnInit(): void {
    this.carregarReservas();
  }

  carregarReservas() {
    this.reservaService.getReservas().subscribe(
      data => {
        console.log("Reservas recebidas:", data);
        this.reservasRaw = data.data;
        this.reservas = this.reservasRaw.sort((a, b) => a.nomeIrmao.localeCompare(b.nomeIrmao));
        console.log(this.reservasRaw[0]);
      },
      error => {
        console.error("Erro ao buscar reservas:", error);
    });
  }
  

  toggleSelection(codigoReserva: string) {
    this.isSelected = false;
    this.selectedReserva = codigoReserva;
    this.isSelected = !this.isSelected;
    window.scrollTo({ top: 0, behavior: 'smooth' });
  }

  ordenar(parametro: string) {
    if (this.reservasOriginal.length === 0) {
      this.reservasOriginal = [...this.reservas];
    }
  
    const index = this.filtrosAtivos.indexOf(parametro);
  
    if (index > -1) {
      // Se o filtro já está ativo, remove ele
      this.filtrosAtivos.splice(index, 1);
      if (parametro === "idade") {
        this.isOrdenadoIdade = false;
      } else if (parametro === "tdm") {
        this.isOrdenadoTempoMinisterio = false;
      } else if (parametro === "enfermidade") {
        this.isOrdenadoEnfermidade = false;
      }
    } else {
      // Adiciona o filtro ao final da lista (mantendo a ordem de ativação)
      this.filtrosAtivos.push(parametro);
    }
  
    this.aplicarFiltros();
  }
  
  aplicarFiltros() {
    if (this.filtrosAtivos.length === 0) {
      this.reservas = [...this.reservasOriginal]; // Sem filtros, volta ao original
      return;
    }
  
    // Ordenação sequencial por todos os critérios ativos
    this.reservas = [...this.reservasOriginal].sort((a, b) => {
      for (const filtro of this.filtrosAtivos) {
        let resultado = 0;
  
        if (filtro === "idade") {
          resultado = parseInt(b.idade) - parseInt(a.idade);
          this.isOrdenadoIdade = true;
        } 
        else if (filtro === "tdm") {
          resultado = parseInt(b.tempoDeMinisterio) - parseInt(a.tempoDeMinisterio);
          this.isOrdenadoTempoMinisterio = true;
        } 
        else if (filtro === "enfermidade") {
          resultado = Number(b.enfermidade) - Number(a.enfermidade);
          this.isOrdenadoEnfermidade = true;
        }
  
        // Se houve diferença, retorna a ordenação imediatamente
        if (resultado !== 0) return resultado;
      }
  
      return 0; // Se todos os critérios foram iguais, mantém a ordem original
    });
  }

  abrirModal() {
    this.modal.abrirModal();
  }
  
  onLeitoAlocado(alocado: boolean) {
    console.log(alocado)
    if (alocado) {
      this.carregarReservas();
    }
  }
}
