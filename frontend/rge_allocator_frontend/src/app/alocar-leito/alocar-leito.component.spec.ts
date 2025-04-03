import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AlocarLeitoComponent } from './alocar-leito.component';

describe('AlocarLeitoComponent', () => {
  let component: AlocarLeitoComponent;
  let fixture: ComponentFixture<AlocarLeitoComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [AlocarLeitoComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(AlocarLeitoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
