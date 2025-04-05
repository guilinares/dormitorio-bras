import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { EnvService } from './env.service';


@Injectable({
  providedIn: 'root'
})
export class LeitosService {
  
  constructor(private http: HttpClient,
    private env: EnvService
  ) { }

  codigoReserva: string = "";
  private apiUrl = '/leitos/disponiveis'; // URL da sua API
  private apiUrlAloca = '/reservas/';


  getLeitosDisponiveis(): Observable<any> {
    const headers = new HttpHeaders({
    });
    return this.http.get<any>(this.env.ip + this.apiUrl, {headers: headers});
  }

  postAlocaHospede(codigoReserva: string, body: {codigo_leito: string}): Observable<any> {
    const headers = new HttpHeaders({
      'bypass-tunnel-reminder': 'bypass'
    });
    return this.http.post<any>(this.env.ip + this.apiUrlAloca + codigoReserva + "/alocar-leito", body, {headers: headers});
  }
}
