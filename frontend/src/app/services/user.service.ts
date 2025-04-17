import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { EnvService } from './env.service';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class UserService {
  private apiUrl = '/api/users'

  constructor(private http: HttpClient, private env: EnvService) { }

  register(body: {
    firebaseUid: string,
    email: string
  }): Observable<any> {
    const headers = new HttpHeaders({
    });
    return this.http.post<any>(this.env.ip + this.apiUrl + "/register", body, {headers: headers});
  }

  getUserInfo(token: string): Observable<any> {
    const headers = new HttpHeaders({
      'Authorization': 'Bearer ' + token
    });
    const url = this.env.ip + this.apiUrl + "/me";
    console.log(url);
    return this.http.get<any>(url, {headers: headers});
  }
}
