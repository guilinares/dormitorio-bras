import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ConsultarHospedesComponent } from './consultar-hospedes.component';

describe('ConsultarHospedesComponent', () => {
  let component: ConsultarHospedesComponent;
  let fixture: ComponentFixture<ConsultarHospedesComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ConsultarHospedesComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ConsultarHospedesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
