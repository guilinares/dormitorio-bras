import { Component, Inject } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { environment } from '../environments/environment';

@Component({
  selector: 'app-root',
  imports: [RouterOutlet],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css',
  providers: [{provide: 'HOST_ADDRESS', useValue: environment.apiUrl}]
})
export class AppComponent {
  title = 'rge_allocator_frontend';
  constructor(@Inject('HOST_ADDRESS') public apiUrl: string) {}
}
