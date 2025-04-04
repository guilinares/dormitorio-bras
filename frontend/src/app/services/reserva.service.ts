import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ReservaService {
  private apiUrl = 'http://localhost:8080/reservas'; // URL da sua API

  constructor(private http: HttpClient) { }

  getReservas(): Observable<any> {
    const headers = new HttpHeaders({
      'bypass-tunnel-reminder': 'bypass'
    });
    return this.http.get<any>(this.apiUrl, {headers: headers});
  }
}
