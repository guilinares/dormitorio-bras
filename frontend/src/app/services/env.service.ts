import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class EnvService {
  public ip = 'http://' + ((window as any).__env?.ip || '') + ':8080';
  public static apiKeyFirebase = (window as any).__env?.apiKeyFirebase;
}