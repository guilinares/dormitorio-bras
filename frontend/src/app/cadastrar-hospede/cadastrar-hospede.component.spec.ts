import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CadastrarHospedeComponent } from './cadastrar-hospede.component';

describe('CadastrarHospedeComponent', () => {
  let component: CadastrarHospedeComponent;
  let fixture: ComponentFixture<CadastrarHospedeComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [CadastrarHospedeComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(CadastrarHospedeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
