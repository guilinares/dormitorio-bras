import { Component, HostListener, inject, ViewEncapsulation } from '@angular/core';
import { Router, RouterModule } from '@angular/router';
import { AuthService } from '../services/auth.service';
import { Observable } from 'rxjs';
import { AsyncPipe, NgIf } from '@angular/common';

@Component({
  selector: 'app-cabecalho',
  imports: [RouterModule, NgIf, AsyncPipe],
  templateUrl: './cabecalho.component.html',
  styleUrl: './cabecalho.component.css',
  encapsulation: ViewEncapsulation.None // Adicione esta linha
})
export class CabecalhoComponent {
  private authService = inject(AuthService);
  private router = inject(Router);
  readonly userName$ = this.authService.userName$;
  isMobileMenuOpen = false;

  toggleMobileMenu() {
    this.isMobileMenuOpen = !this.isMobileMenuOpen;
  }

  async getName() {
    console.log(this.userName$);
    return this.userName$;
  }

  logout() {
    this.authService.logout();
    this.router.navigate(['/auth']);
  }

  @HostListener('document:click', ['$event'])
  onClick(event: MouseEvent) {
    const target = event.target as HTMLElement;
    if (!target.closest('.menu-toggle') && !target.closest('.nav-principal')) {
      this.isMobileMenuOpen = false;
    }
  }
}
