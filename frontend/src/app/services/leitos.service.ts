import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../../environments/environment';


@Injectable({
  providedIn: 'root'
})
export class LeitosService {
  codigoReserva: string = "";
  private apiUrl = environment.apiUrl + '/leitos/disponiveis'; // URL da sua API
  private apiUrlAloca = environment.apiUrl + '/reservas/';

  constructor(private http: HttpClient) { }

  getLeitosDisponiveis(): Observable<any> {
    const headers = new HttpHeaders({
    });
    return this.http.get<any>(this.apiUrl, {headers: headers});
  }

  postAlocaHospede(codigoReserva: string, body: {codigo_leito: string}): Observable<any> {
    const headers = new HttpHeaders({
      'bypass-tunnel-reminder': 'bypass'
    });
    return this.http.post<any>(this.apiUrlAloca + codigoReserva + "/alocar-leito", body, {headers: headers});
  }
}
