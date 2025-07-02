import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { EnvService } from './env.service';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class HospedesService {
  private apiUrl = '/hospedes'; // URL da sua API

  constructor(private http: HttpClient, private env: EnvService) { }

  postCadastroHospede(body: {
    nome: string,
    data_nascimento: string,
    cargo_ministerio: string,
    data_ordenacao: string,
    preside_regional: string,
    cidade: string,
    uf: string, 
    comum_congregacao: string,
    email: string,
    telefone: string,
    sexo: string
  }): Observable<any> {
    console.log(this.env.ip + this.apiUrl);
    const headers = new HttpHeaders({
    });
    return this.http.post<any>(this.env.ip + this.apiUrl, body, {headers: headers});
  }

  getAllHospedes(): Observable<any> {
    const headers = new HttpHeaders({
    });
    return this.http.get<any>(this.env.ip + this.apiUrl, {headers: headers});
  }

  getHospedesAlocado(): Observable<any> {
    const headers = new HttpHeaders({
    });
    return this.http.get<any>(this.env.ip + this.apiUrl + "?estado=ALOCADO", {headers: headers});
  }

  getHospedesDesalocados(): Observable<any> {
    const headers = new HttpHeaders({
    });
    return this.http.get<any>(this.env.ip + this.apiUrl + "?estado=DESALOCADO", {headers: headers});
  }

  deleteHospede(hospedeId: string): Observable<any> {
    const headers = new HttpHeaders({
    });
    return this.http.delete<any>(this.env.ip + this.apiUrl + "/" + hospedeId, {headers: headers})
  }
}
