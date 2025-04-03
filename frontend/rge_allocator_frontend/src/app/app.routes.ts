import { Routes } from '@angular/router';
import { ReservasComponent } from './reservas/reservas.component';
import { AlocarLeitoComponent } from './alocar-leito/alocar-leito.component';
import { LandingpageComponent } from './landingpage/landingpage.component';

export const routes: Routes = [
    { path: '', redirectTo: 'landingpage', pathMatch: 'full' }, // Redireciona a página inicial para /landingpage
    { path: 'landingpage', component: LandingpageComponent}, 
    { path: 'reservas', component: ReservasComponent },
    { path: 'alocar-leito', component: AlocarLeitoComponent}
  ];