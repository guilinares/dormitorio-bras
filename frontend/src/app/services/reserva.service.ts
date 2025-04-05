import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { EnvService } from './env.service';

@Injectable({
  providedIn: 'root'
})
export class ReservaService {
  private apiUrl = '/reservas'; // URL da sua API

  constructor(private http: HttpClient, private env: EnvService) { }

  getReservas(): Observable<any> {
    const headers = new HttpHeaders({
      'bypass-tunnel-reminder': 'bypass'
    });
    return this.http.get<any>(this.env.ip + this.apiUrl, {headers: headers});
  }
}
