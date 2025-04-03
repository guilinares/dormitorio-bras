import { Component, EventEmitter, HostBinding, Input, Output, ViewEncapsulation } from '@angular/core';
import { RouterModule } from '@angular/router';
import { LeitosService } from '../services/leitos.service';
import { Leito } from '../models/leito.model';


@Component({
  selector: 'app-alocar-leito',
  imports: [RouterModule],
  templateUrl: './alocar-leito.component.html',
  styleUrl: './alocar-leito.component.css',
  encapsulation: ViewEncapsulation.None,
})
export class AlocarLeitoComponent {

  @HostBinding('class.active') isActive = false;
  @Input() selectedReserva!: string;
  @Output() alocar = new EventEmitter<boolean>();

  leitosRaw: Leito[] = [];
  leitos: Leito[] = [];
  leitoSelected: boolean = false;
  codigoLeitoAlocado: string = "";

  constructor(private leitosService: LeitosService) {}

  ngOnInit(): void {
    this.carregarLeitos();
  }

  modalAberto = false;

  abrirModal() {
    this.isActive = true;
    console.log("Alocar leito modal");
    this.modalAberto = true;
    document.body.classList.add('modal-open');
  }

  fecharModal() {
    this.isActive = false;
    this.modalAberto = false;
    document.body.classList.remove('modal-open');
  }

  toggleSelectionLeito(codigoLeito: string) {
    this.leitoSelected = false;
    this.codigoLeitoAlocado = codigoLeito;
    this.leitoSelected = !this.leitoSelected;
  }

  carregarLeitos() {
    this.leitosService.getLeitosDisponiveis().subscribe(
      data => {
        console.log("Leitos recebidas:", data);
        this.leitosRaw = data.data;
        this.leitos = this.leitosRaw.sort((a, b) => parseInt(a.codigoLeito) - parseInt(b.codigoLeito));
        console.log(this.leitosRaw[0]);
      },
      error => {
        console.error("Erro ao buscar reservas:", error);
    });
  }

  alocaHospede(codigoLeito: string) {
    console.log(codigoLeito);
    console.log(this.selectedReserva);
    this.leitosService.postAlocaHospede(this.selectedReserva, {codigo_leito: codigoLeito}).subscribe(
      data => {
        console.log("response alocar leito: ", data);
        this.carregarLeitos();
        this.fecharModal();
        this.alocar.emit(true);
      },
      error => {
        this.alocar.emit(false);
      }
    );
  }
}
