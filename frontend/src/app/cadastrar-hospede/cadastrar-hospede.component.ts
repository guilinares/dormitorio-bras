import { Component } from '@angular/core';
import { RouterModule } from '@angular/router';
import { CabecalhoComponent } from '../cabecalho/cabecalho.component';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { NgIf } from '@angular/common';

@Component({
  selector: 'app-cadastrar-hospede',
  imports: [RouterModule, CabecalhoComponent, NgIf, ReactiveFormsModule],
  templateUrl: './cadastrar-hospede.component.html',
  styleUrl: './cadastrar-hospede.component.css'
})
export class CadastrarHospedeComponent {
  hospedeForm: FormGroup;

  constructor(private fb: FormBuilder) {
    this.hospedeForm = this.fb.group({
      nome: ['', [Validators.required, Validators.minLength(3)]],
      email: ['', [Validators.required, Validators.email]],
      telefone: ['', [Validators.required, Validators.pattern(/^\d{10,11}$/)]],
      dataNascimento: ['', Validators.required],
      documento: ['', [Validators.required, Validators.minLength(5)]]
    });
  }

  onSubmit() {
    if (this.hospedeForm.valid) {
      console.log('Formulário enviado:', this.hospedeForm.value);
    }
  }
}
