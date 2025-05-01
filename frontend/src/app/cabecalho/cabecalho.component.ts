import { Component, inject } from '@angular/core';
import { Router, RouterModule } from '@angular/router';
import { AuthService } from '../services/auth.service';
import { Observable } from 'rxjs';
import { AsyncPipe, NgIf } from '@angular/common';

@Component({
  selector: 'app-cabecalho',
  imports: [RouterModule, NgIf, AsyncPipe],
  templateUrl: './cabecalho.component.html',
  styleUrl: './cabecalho.component.css'
})
export class CabecalhoComponent {
  private authService = inject(AuthService);
  private router = inject(Router);
  readonly userName$ = this.authService.userName$;

  async getName() {
    console.log(this.userName$);
    return this.userName$;
  }

  logout() {
    this.authService.logout();
    this.router.navigate(['/auth']);
  }
}
