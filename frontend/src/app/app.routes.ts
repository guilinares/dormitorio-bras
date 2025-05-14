import { Routes } from '@angular/router';
import { ReservasComponent } from './reservas/reservas.component';
import { AlocarLeitoComponent } from './alocar-leito/alocar-leito.component';
import { LandingpageComponent } from './landingpage/landingpage.component';
import { CabecalhoComponent } from './cabecalho/cabecalho.component';
import { ConsultarReservasComponent } from './consultar-reservas/consultar-reservas.component';
import { AuthComponent } from './auth/auth.component';
import { AuthGuard } from './services/guard.service';
import { AuthResolver } from './resolver/auth.resolver';
import { CadastrarHospedeComponent } from './cadastrar-hospede/cadastrar-hospede.component';

export const routes: Routes = [
    { path: '', redirectTo: 'auth', pathMatch: 'full' }, // Redireciona a página inicial para /landingpage
    { path: 'landingpage', component: LandingpageComponent, canActivate: [AuthGuard], resolve: { authReady: AuthResolver}}, 
    { path: 'reservas', component: ReservasComponent, canActivate: [AuthGuard], resolve: { authReady: AuthResolver}},
    { path: 'alocar-leito', component: AlocarLeitoComponent, canActivate: [AuthGuard], resolve: { authReady: AuthResolver}},
    { path: 'cabecalho', component: CabecalhoComponent, canActivate: [AuthGuard], resolve: { authReady: AuthResolver}},
    { path: 'consultar-reservas', component: ConsultarReservasComponent, canActivate: [AuthGuard], resolve: { authReady: AuthResolver}},
    { path: 'cadastrar-hospede', component: CadastrarHospedeComponent, canActivate: [AuthGuard], resolve: { authReady: AuthResolver}},
    { path: 'auth', component: AuthComponent, resolve: { authReady: AuthResolver}},
    { path: '*', redirectTo: 'auth', resolve: { authReady: AuthResolver}}
  ];