import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ConsultarReservasComponent } from './consultar-reservas.component';

describe('ConsultarReservasComponent', () => {
  let component: ConsultarReservasComponent;
  let fixture: ComponentFixture<ConsultarReservasComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ConsultarReservasComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ConsultarReservasComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
