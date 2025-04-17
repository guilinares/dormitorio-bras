import { Component } from '@angular/core';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { AuthService } from '../services/auth.service';
import { RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';
import { UserService } from '../services/user.service';
import { user } from '@angular/fire/auth';

@Component({
  selector: 'app-auth',
  standalone: true,
  imports: [RouterModule, ReactiveFormsModule, CommonModule],
  templateUrl: './auth.component.html',
  styleUrl: './auth.component.css'
})
export class AuthComponent {
  authForm: FormGroup;
  isRegisterMode = false;
  errorMessage = '';

  constructor(private fb: FormBuilder, private authService: AuthService, private userService: UserService) {
    this.authForm = this.fb.group({
      email: ['', [Validators.required, Validators.email]],
      password: ['', [Validators.required, Validators.minLength(6)]],
    });
  }

  toggleMode() {
    this.isRegisterMode = !this.isRegisterMode; 
    this.errorMessage = '';
    this.authForm.reset();
  }

  submit() {
    const { email, password } = this.authForm.value;

    if (this.isRegisterMode) {  
      this.authService.register(email, password)
        .then(async (userCredential) => {
          const user = userCredential.user;
          console.log(user);
          const uid = userCredential.user.uid;
          sessionStorage.setItem("uid_user", uid);
          alert('Usuário cadastrado com sucesso!');
          return this.register(uid, email);
        })
        .catch(err => this.errorMessage = err.message);
    } else {
      this.authService.login(email, password)
        .then(async (userCredential) => {
          const user = userCredential.user;
          console.log(user);
          const uid = userCredential.user.uid;
          sessionStorage.setItem("uid_user", uid);
          const token = await user.getIdToken();
          sessionStorage.setItem("token", token);
          alert('Login realizado com sucesso!');
          return this.getUserInfo();
        })
        .catch(err => this.errorMessage = err.message);
    }

    console.log(sessionStorage);
  }

  getUserInfo() {
    const token = sessionStorage.getItem('token');
    if (token == null) {
      console.log("Não foi encontrado a sessão do usuário");
    } else {
      this.userService.getUserInfo(token).subscribe(
        data => {
          console.log("User info: ", data);
        },
        error => {
          console.error("Erro ao buscar usuário:", error);
        }
      );
    }
  }

  register(firebaseUid: string, email: string) {
    this.userService.register({firebaseUid: firebaseUid, email: email}).subscribe(
      data => {
        console.log("User registered: ", data);
      },
      error => {
        console.error("Erro ao registrar usuário:", error);
      }
    );
  }
}
