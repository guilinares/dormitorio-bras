import { Component } from '@angular/core';
import { RouterModule } from '@angular/router';
import { CabecalhoComponent } from '../cabecalho/cabecalho.component';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { NgIf } from '@angular/common';
import { HospedesService } from '../services/hospedes.service';

@Component({
  selector: 'app-cadastrar-hospede',
  imports: [RouterModule, CabecalhoComponent, NgIf, ReactiveFormsModule],
  templateUrl: './cadastrar-hospede.component.html',
  styleUrl: './cadastrar-hospede.component.css'
})
export class CadastrarHospedeComponent {
  hospedeForm: FormGroup;

  constructor(private fb: FormBuilder, private hospedesService: HospedesService) {
    this.hospedeForm = this.fb.group({
      nome: ['', [Validators.required, Validators.minLength(3)]],
      dataNascimento: ['', Validators.required],
      cargoMinisterio: ['', [Validators.required]],
      dataOrdenacao: [''],
      presideRegional: ['false'],
      cidade: ['', Validators.required],
      uf: ['', Validators.required],
      comumCongregacao: ['', [Validators.required]],
      email: ['', [Validators.email]],
      telefone: ['', [Validators.required, Validators.pattern(/^\d{10,11}$/)]],
      sexo: ['', [Validators.required]]
    });

    this.setupCargoMinisterioValidation();
  }

  private setupCargoMinisterioValidation() {
    const cargoMinisterioControl = this.hospedeForm.get('cargoMinisterio');
    const dataOrdenacaoControl = this.hospedeForm.get('dataOrdenacao');
    const presideRegionalControl = this.hospedeForm.get('presideRegional');

    cargoMinisterioControl?.valueChanges.subscribe(cargo => {

      // Atualiza validação para 'dataOrdenacao'
      if (cargo === 'Ancião') {
        dataOrdenacaoControl?.setValidators([Validators.required]);
        presideRegionalControl?.setValidators([Validators.required]);
      } else if (cargo === 'Diácono') {
        dataOrdenacaoControl?.clearValidators();
      }

      // Atualiza o estado de validação dos controles
      dataOrdenacaoControl?.updateValueAndValidity();
      presideRegionalControl?.updateValueAndValidity();
    });
  }

  onSubmit() {
    if (this.hospedeForm.valid) {
      console.log('Formulário enviado:', this.hospedeForm.value);
    }
    this.hospedesService.postCadastroHospede({
      nome: this.hospedeForm.get('nome')?.value || '',
      data_nascimento: this.hospedeForm.get('dataNascimento')?.value || '',
      cargo_ministerio: this.hospedeForm.get('cargoMinisterio')?.value || '',
      data_ordenacao: this.hospedeForm.get('dataOrdenacao')?.value || '',
      preside_regional: this.hospedeForm.get('presideRegional')?.value || '',
      cidade: this.hospedeForm.get('cidade')?.value || '',
      uf: this.hospedeForm.get('uf')?.value || '',
      comum_congregacao: this.hospedeForm.get('comumCongregacao')?.value || '',
      email: this.hospedeForm.get('email')?.value || '',
      telefone: this.hospedeForm.get('telefone')?.value || '',
      sexo: this.hospedeForm.get('sexo')?.value || ''
    }).subscribe(
      data => {
        console.log("response cadastro hospede: ", data);
      },
      error => {
        console.log("erro ao alocar hospede", error)
      }
    )
  }

  isIrmaoMinisterio() {
    return this.hospedeForm.get('cargoMinisterio')?.value == 'Ancião' ||
      this.hospedeForm.get('cargoMinisterio')?.value == 'Diácono' ||
      this.hospedeForm.get('cargoMinisterio')?.value == 'Cooperador do Ofício' ||
      this.hospedeForm.get('cargoMinisterio')?.value == 'Cooperador de Jovens'
  }
}
