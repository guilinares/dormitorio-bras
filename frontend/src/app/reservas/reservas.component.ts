import { Component, OnInit, ViewChild } from '@angular/core';
import { HospedesService } from '../services/hospedes.service';
import { RouterModule } from '@angular/router'; // Importa RouterModule
import { HospedeSimplificado } from '../models/hospede.model';
import { AlocarLeitoComponent } from '../alocar-leito/alocar-leito.component';
import { CabecalhoComponent } from '../cabecalho/cabecalho.component';

@Component({
  selector: 'app-reservas',
  imports: [RouterModule, AlocarLeitoComponent, CabecalhoComponent],
  templateUrl: './reservas.component.html',
  styleUrl: './reservas.component.css'
})
export class ReservasComponent {
  @ViewChild(AlocarLeitoComponent) modal!: AlocarLeitoComponent;

  hospedesRaw: HospedeSimplificado[] = [];
  hospedes: HospedeSimplificado[] = [];
  filtrosAtivos: string[] = []; // Armazena a ordem dos filtros aplicados
  hospedesOriginal: any[] = []; // Guarda a lista original
  isSelected: boolean = false;
  selectedReserva: string = "";
  parametroOrdenacao: string = "letra";
  orderBy: string = "nome";
  isOrdenadoIdade: boolean = false;
  isOrdenadoTempoMinisterio: boolean = false;
  isOrdenadoEnfermidade: boolean = false;
  
  constructor(private hospedesService: HospedesService) {}

  ngOnInit(): void {
    this.carregarHospedesSemLeito();
  }

  carregarHospedesSemLeito() {
    this.hospedesService.getHospedesDesalocados().subscribe(
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
  

  toggleSelection(codigoReserva: string) {
    this.isSelected = false;
    this.selectedReserva = codigoReserva;
    this.isSelected = !this.isSelected;
    window.scrollTo({ top: 0, behavior: 'smooth' });
  }

  ordenar(parametro: string) {
    if (this.hospedesOriginal.length === 0) {
      this.hospedesOriginal = [...this.hospedes];
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
      this.hospedes = [...this.hospedesOriginal]; // Sem filtros, volta ao original
      return;
    }
  
    // Ordenação sequencial por todos os critérios ativos
    this.hospedes = [...this.hospedesOriginal].sort((a, b) => {
      for (const filtro of this.filtrosAtivos) {
        let resultado = 0;
  
        if (filtro === "idade") {
          resultado = parseInt(b.idade) - parseInt(a.idade);
          this.isOrdenadoIdade = true;
        } 
        else if (filtro === "tdm") {
          resultado = parseInt(b.tempoOrdenacao) - parseInt(a.tempoOrdenacao);
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
    setTimeout(() => {
      if (alocado) {
        this.isSelected = false;
        this.carregarHospedesSemLeito();
      }
    }, 1000);
  }
}
